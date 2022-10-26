-- This file is executed at the end of addon load

function AchievementFrameSummary_LocalizeButton (button)
	button.DateCompleted:SetWidth(150);
	button.DateCompleted:SetPoint("TOPRIGHT", -63, -6);
	button.Label:SetPoint("TOP", 0, -4);
	button.Description:SetPoint("TOP", 0, -27);
	button.Description:SetFontObject("AchievementFont_Small");
	button.Shield.Points:SetPoint("CENTER", -1, 4);
end
	
function AchievementButton_LocalizeMiniAchievement (frame)
	frame.Points:SetFontObject("GameFontWhite");
end

function AchievementButton_LocalizeProgressBar (frame)
	frame.Text:SetPoint("TOP", 0, 1);
end

function AchievementButton_LocalizeMetaAchievement (frame)
	frame.Label:SetFontObject("AchievementFont_Small");
end

function AchievementFrame_LocalizeCriteria (frame)
	frame.Name:SetFontObject("AchievementFont_Small");
end

function AchievementButton_Localize (button)
	button.DateCompleted:SetWidth(80);
	button.DateCompleted:SetPoint("TOP", "$parent", "BOTTOM", -2, 6);
	button.DateCompleted:SetJustifyH("CENTER");
	button.Description:SetFontObject("AchievementFont_Small");
	button.HiddenDescription:SetFontObject("AchievementFont_Small");
	button.Shield:SetPoint("TOPRIGHT", -10, 0);
	button.Tabard:SetPoint("TOPRIGHT", -7, -4);
end

ACHIEVEMENTCOMPARISON_FRIENDSHIELDFONT1 = GameFontBlack;
ACHIEVEMENTCOMPARISON_FRIENDSHIELDFONT2 = GameFontBlack;

function AchievementComparisonButton_Localize (button)
	button.Player.Label:SetPoint("TOP", 0, -4);
	button.Player.Description:SetPoint("TOP", 0, -27);
	button.Player.Description:SetFontObject("AchievementFont_Small");
	button.Friend.Status:SetFontObject("GameFontBlack");
	button.Friend.Status:SetPoint("BOTTOM", 20, 4);
	button.Friend.Shield.Points:SetFontObject("GameFontBlack");
end

function AchievementCategoryButton_Localize(button)
	button.Label:SetPoint("TOPRIGHT", -8, -6);
	button.Label:SetPoint("BOTTOMLEFT", 16, 2);
end