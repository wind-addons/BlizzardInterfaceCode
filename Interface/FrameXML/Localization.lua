
-- This is a symbol available for people who need to know the locale (separate from GetLocale())
LOCALE_zhTW = true;
USE_IME = true;

CLOCK_TICKER_Y_OVERRIDE = 2;
GUILD_APPLICANT_LEVEL_TEXT_Y_OVERRIDE = 1;
FIRST_NUMBER_CAP_VALUE = 10000;
COLLAPSE_ORDER_HALL_FOLLOWER_ITEM_LEVEL_DISPLAY = true;

SMALLER_AURA_DURATION_FONT_MIN_THRESHOLD = 60 * 60; -- greater than 1 hour
SMALLER_AURA_DURATION_FONT_MAX_THRESHOLD = 24 * 60 * 60; -- less than 24 hours
SMALLER_AURA_DURATION_FONT = "GameFontHighlightSmall2";
SMALLER_AURA_DURATION_OFFSET_Y = -2;

function Localize()
	-- Put all locale specific string adjustments here
end

function GarrisonBuildingAlertFrame_AdjustTextPositions(frame)
	frame.Title:SetPoint("TOP", 18, -16);
	frame.Name:SetPoint("TOP", frame.Title, "BOTTOM", 0, -7);
end

function GarrisonFollowerAlertFrame_AdjustTextPositions(frame)
	frame.Title:SetPoint("TOP", 20, -15);
	frame.Name:SetPoint("TOP", frame.Title, "BOTTOM", 0, -8);
end

function GarrisonShipFollowerAlertFrame_AdjustTextPositions(frame)
	frame.Title:SetPoint("TOP", 45, -13);
	frame.Name:SetPoint("TOP", frame.Title, "BOTTOM", 0, -6);
	frame.Class:SetPoint("TOP", frame.Name, "BOTTOM", 0, -1);
end

function GarrisonTalentAlertFrame_AdjustTextPositions(frame)
	frame.Name:SetPoint("TOP", frame.Title, "BOTTOM", 0, -5);
end

function LocalizeFrames()
	-- Put all locale specific UI adjustments here

	-- Hide billing help option.  If the number of help options changes this will need to change also.
	CATEGORY_TO_NOT_DISPLAY = 9;

	-- Hide profanity checkbox
	-- UIOptionsFrameCheckButton5:Hide();

	-- Adjust text in character and friends frame tabs
	for i=1, (CharacterFrame.numTabs or 0) do
		local tabName = "CharacterFrameTab"..i;
		_G[tabName].Text:SetPoint("CENTER", tabName, "CENTER", 0, 5);
		tabName = "FriendsFrameTab"..i;
		_G[tabName].Text:SetPoint("CENTER", tabName, "CENTER", 0, 5);
	end

	--Fix the positioning of the dropdown list
	WhoFrameDropDown:SetPoint("TOPLEFT", WhoFrameColumnHeader2, "TOPLEFT", -15, 1);

	-- Mailframe tabs
	for i=1, (MailFrame.numTabs or 0) do
		local tabName = "MailFrameTab"..i;
		_G[tabName].Text:SetPoint("CENTER", tabName, "CENTER", 0, 5);
	end

	-- Mailbox Send Inputs
	SendMailNameEditBox:SetPoint("TOPLEFT", SendMailFrame, "TOPLEFT", 125, -30);
	SendMailNameEditBox:SetWidth(185);
	SendMailSubjectEditBoxMiddle:SetWidth(186);

	-- Chat Editbox
	ChatEdit_LanguageShow();

	-- Disable knowledge base (leaving this here, just in case we need to roll back quickly)
	--HelpMicroButton:SetScript("OnClick", ToggleHelpFrame);
	--HelpFrameHomeCancel:SetScript("OnClick", ToggleHelpFrame);

	-- Player Frame
	PlayerLevelText:SetPoint("TOPRIGHT", -24.5, -26);

	-- Target Frame
	local targetFrameContentMain = TargetFrame.TargetFrameContent.TargetFrameContentMain;
	targetFrameContentMain.LevelText:SetPoint("TOPLEFT", targetFrameContentMain.ReputationColor, "TOPRIGHT", -133, 1);
	targetFrameContentMain.Name:SetPoint("TOPLEFT", targetFrameContentMain.ReputationColor, "TOPRIGHT", -106, 2);
	targetFrameContentMain.HealthBar.DeadText:SetPoint("CENTER", 0, 2);
	targetFrameContentMain.HealthBar.UnconsciousText:SetPoint("CENTER", 0, 2);

	-- Trade Frame
	TradeFramePlayerEnchantText:SetPoint("TOPLEFT", TradeFrame, 26, -371);

	-- Fix money display everywhere
	MONEY_TEXT_VADJUST = 1;

	-- Equipment Manager
	GearManagerPopupFrame.BorderBox.EditBoxHeaderText:SetPoint("TOPLEFT", 24, -18);

	-- Combat log config
	CombatConfigColorsExampleTitle:Hide();
	CombatConfigColorsExampleString1:SetPoint("TOPLEFT", 25, -16);
	CombatConfigFormattingExampleTitle:Hide();
	CombatConfigFormattingExampleString1:SetPoint("TOPLEFT", 15, -16);

	MIN_CHARACTER_SEARCH = 1;

	-- add friend
	ADDFRIENDFRAME_WOWHEIGHT = 232;
	ADDFRIENDFRAME_BNETHEIGHT = 310;
	AddFriendNameEditBox:SetPoint("TOP", 0, -144);

	--TradeFrame
	TradeFramePlayerEnchantText:SetPoint("TOPLEFT", TradeFrame, 15, -357);

	-- GuildInviterFrame
	GuildInviteFrameInviterName:SetPoint("TOP", GuildInviteFrame, 0, -22);
	GuildInviteFrameInviteText:SetPoint("TOP", GuildInviteFrameInviterName, 0, -16);
	GuildInviteFrameGuildName:SetPoint("TOP", GuildInviteFrameInviteText, 0, -10);

	-- Garrison Alerts
	GarrisonBuildingAlertSystem:AddLocalizationHook(GarrisonBuildingAlertFrame_AdjustTextPositions);
	GarrisonFollowerAlertSystem:AddLocalizationHook(GarrisonFollowerAlertFrame_AdjustTextPositions);
	GarrisonShipFollowerAlertSystem:AddLocalizationHook(GarrisonShipFollowerAlertFrame_AdjustTextPositions);
	GarrisonTalentAlertSystem:AddLocalizationHook(GarrisonTalentAlertFrame_AdjustTextPositions);
end
