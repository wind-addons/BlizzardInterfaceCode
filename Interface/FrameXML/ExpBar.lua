ExpBarMixin = CreateFromMixins(StatusTrackingBarMixin);

function ExpBarMixin:GetPriority()
	return self.priority;
end

function ExpBarMixin:ShouldBeVisible()
	return not IsPlayerAtEffectiveMaxLevel() and not IsXPUserDisabled();
end

function ExpBarMixin:IsCapped()
	if GameLimitedMode_IsBankedXPActive() then
		local restrictedLevel = GameLimitedMode_GetLevelLimit();
		return UnitLevel("player") >= restrictedLevel;
	end

	return false;
end

function ExpBarMixin:GetLevelData()
	local currXP = self:IsCapped() and UnitTrialXP("player") or UnitXP("player");
	local nextXP = UnitXPMax("player");
	local level = UnitLevel("player");
	local bankedLevels = UnitTrialBankedLevels("player");

	return currXP, nextXP, level, bankedLevels;
end

function ExpBarMixin:Update()
	local currXP, nextXP, level = self:GetLevelData();
	local minBar, maxBar = 0, nextXP;

	if self:IsCapped() then
		self:SetBarValues(1, 0, 1, level);
		self.StatusBar:ProcessChangesInstantly();
		self.StatusBar:SetStatusBarTexture("UI-HUD-ExperienceBar-Fill-Experience");
	else
		self:SetBarValues(currXP, minBar, maxBar, level);
	end

	self.currXP = currXP;
	self.maxBar = maxBar;

	self:UpdateCurrentText();
end

function ExpBarMixin:UpdateCurrentText()
	self:SetBarText(XP_STATUS_BAR_TEXT:format(self.currXP, self.maxBar));
end

function ExpBarMixin:OnLoad()
	TextStatusBar_Initialize(self);

	self:Update();

	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("PLAYER_XP_UPDATE");
	self:RegisterEvent("CVAR_UPDATE");
	self.priority = 3;
end

function ExpBarMixin:OnEvent(event, ...)
	if( event == "CVAR_UPDATE") then
		local cvar = ...;
		if( cvar == "xpBarText" ) then
			self:UpdateTextVisibility();
		end
	elseif ( event == "PLAYER_XP_UPDATE" or event == "PLAYER_ENTERING_WORLD" ) then
		self:Update();
	end
end

function ExpBarMixin:OnShow()
	self:UpdateTextVisibility();
end

function ExpBarMixin:OnEnter()
	TextStatusBar_UpdateTextString(self);
	self:ShowText(self);
	self:UpdateCurrentText();

	if GameLimitedMode_IsBankedXPActive() then
		local rLevel = GetRestrictedAccountData();
		if UnitLevel("player") >= rLevel then
			local trialXP = UnitTrialXP("player");
			if trialXP > 0 and IsTrialAccount() then
				MicroButtonPulse(StoreMicroButton);
			end
		end
	end

	self.ExhaustionTick:ExhaustionToolTipText();
end

function ExpBarMixin:OnLeave()
	self:HideText();
	GameTooltip:Hide();
	self.ExhaustionTick.timer = nil;
end

function ExpBarMixin:OnUpdate(elapsed)
	self.ExhaustionTick:OnUpdate(elapsed);
end

function ExpBarMixin:OnValueChanged()
	if ( not self:IsShown() ) then
		return;
	end
	self:Update();
end

function ExpBarMixin:UpdateTick()
	self.ExhaustionTick:UpdateTickPosition();
	self.ExhaustionTick:UpdateExhaustionColor();
end

ExhaustionTickMixin = { }
function ExhaustionTickMixin:ExhaustionToolTipText()
	local exhaustionStateID, exhaustionStateName, exhaustionStateMultiplier = GetRestState();
	if(not exhaustionStateID) then
		return;
	end

	local currXP, nextXP = self:GetParent():GetLevelData();
	local percentXP = math.ceil(currXP/nextXP*100);

	local tooltip = GetAppropriateTooltip();
	GameTooltip_SetDefaultAnchor(tooltip, UIParent);
	GameTooltip_SetTitle(tooltip, XP_TEXT:format(BreakUpLargeNumbers(currXP), BreakUpLargeNumbers(nextXP), percentXP));
	GameTooltip_AddHighlightLine(tooltip, EXHAUST_TOOLTIP1:format(exhaustionStateName, exhaustionStateMultiplier * 100));

	if not IsResting() and (exhaustionStateID == 4 or exhaustionStateID == 5) then
		GameTooltip_AddHighlightLine(tooltip, EXHAUST_TOOLTIP2);
	end

	if GameLimitedMode_IsBankedXPActive() then
		local bankedLevels = UnitTrialBankedLevels("player");
		local bankedXP = UnitTrialXP("player");

		if bankedLevels > 0 or bankedXP > 0 then
			GameTooltip_AddBlankLineToTooltip(tooltip);
			GameTooltip_AddNormalLine(tooltip, XP_TEXT_BANKED_XP_HEADER);
		end

		if bankedLevels > 0 then
			GameTooltip_AddHighlightLine(tooltip, TRIAL_CAP_BANKED_LEVELS_TOOLTIP:format(bankedLevels));
		elseif bankedXP > 0 then
			GameTooltip_AddHighlightLine(tooltip, TRIAL_CAP_BANKED_XP_TOOLTIP);
		end
	end

	GameTooltip:Show();
end

function ExhaustionTickMixin:OnLoad()
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("PLAYER_XP_UPDATE");
	self:RegisterEvent("UPDATE_EXHAUSTION");
	self:RegisterEvent("PLAYER_LEVEL_UP");
	self:RegisterEvent("PLAYER_UPDATE_RESTING");
end

function ExhaustionTickMixin:UpdateTickPosition()
	local playerCurrXP = UnitXP("player");
	local playerMaxXP = UnitXPMax("player");
	local exhaustionThreshold = GetXPExhaustion();
	local exhaustionStateID = GetRestState();

	if ( exhaustionStateID and exhaustionStateID >= 3 ) then
		self:SetPoint("CENTER", self:GetParent() , "RIGHT", 0, 0);
	end

	if ( not exhaustionThreshold or exhaustionThreshold <= 0 or IsPlayerAtEffectiveMaxLevel() or IsXPUserDisabled() ) then
		-- Hide exhaustion if player has no exhaustion, player is max level, or XP is turned off
		self:Hide();
		self:GetParent().ExhaustionLevelFillBar:Hide();
	else
		local widthRatio = max((playerCurrXP + exhaustionThreshold) / playerMaxXP, 0);
		self:SetShown(widthRatio >= 0.01 and widthRatio <= 0.99); -- Hide pip at edges of bar since it doesn't look good at edges

		local exhaustionTickSet = max(widthRatio * (self:GetParent():GetWidth()), 0);
		self:ClearAllPoints();

		if ( exhaustionTickSet > self:GetParent():GetWidth() ) then
			self:GetParent().ExhaustionLevelFillBar:Hide();
		else
			self:SetPoint("CENTER", self:GetParent(), "LEFT", exhaustionTickSet, 2);
			self:GetParent().ExhaustionLevelFillBar:Show();
			self:GetParent().ExhaustionLevelFillBar:SetWidth(exhaustionTickSet);
			self:GetParent().ExhaustionLevelFillBar:SetTexCoord(0, widthRatio, 0, 1);
		end
	end
end

function ExhaustionTickMixin:UpdateExhaustionColor()
	local exhaustionStateID = GetRestState();
	if ( exhaustionStateID == 1 ) then
		self:GetParent().StatusBar:SetStatusBarTexture("UI-HUD-ExperienceBar-Fill-Rested");
	elseif ( exhaustionStateID == 2 ) then
		self:GetParent().StatusBar:SetStatusBarTexture("UI-HUD-ExperienceBar-Fill-Experience");
	end
end

function ExhaustionTickMixin:OnEvent(event, ...)
	if (IsRestrictedAccount()) then
		local rlevel = GetRestrictedAccountData();
		if (UnitLevel("player") >= rlevel) then
			self:GetParent().StatusBar:SetStatusBarTexture("UI-HUD-ExperienceBar-Fill-Rested");
			self:Hide();
			self:GetParent().ExhaustionLevelFillBar:Hide();
			self:UnregisterAllEvents();
			return;
		end
	end
	if ( event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_XP_UPDATE" or event == "UPDATE_EXHAUSTION" or event == "PLAYER_LEVEL_UP" ) then
		self:UpdateTickPosition();
	end

	if ( event == "PLAYER_ENTERING_WORLD" or event == "UPDATE_EXHAUSTION" ) then
		self:UpdateExhaustionColor();
	end

	if ( not self:IsShown() ) then
		self:Hide();
	end
end

function ExhaustionTickMixin:OnUpdate(elapsed)
	if ( self.timer ) then
		if ( self.timer < 0 ) then
			self:ExhaustionToolTipText();
			self.timer = nil;
		else
			self.timer = self.timer - elapsed;
		end
	end
end