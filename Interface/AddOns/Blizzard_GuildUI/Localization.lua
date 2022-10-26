-- This file is executed at the end of addon load

-- make class column a little wider
local columnData = GUILD_ROSTER_COLUMN_DATA;
columnData["class"]["width"] = 44;
columnData["zone"]["width"] = 132;
columnData["weeklyxp"]["width"] = 132;
columnData["totalxp"]["width"] = 132;
columnData["achievement"]["width"] = 125;

local buttons = GuildRosterContainer.buttons;
for i = 1, #buttons do
	buttons[i].barTexture:SetPoint("LEFT", 72, 0);
end

GuildRoster_SetView("playerStatus");

-- more room for the strings
GUILD_ROSTER_STRING_OFFSET = 4;
GUILD_ROSTER_STRING_WIDTH_ADJ =  8;

-- Guild Member Detail Window Custom Sizing
GUILD_DETAIL_NORM_HEIGHT = 206
GUILD_DETAIL_OFFICER_HEIGHT = 264

-- smaller icon for rewards list because of larger font
GUILD_REWARDS_ACHIEVEMENT_ICON = " |TInterface\\AchievementFrame\\UI-Achievement-Guild:12:11:0:1:512:512:324:344:67:85|t ";

-- labels
GuildFactionFrameHeader:SetPoint("TOPLEFT", 0, 16);

-- more room for rewards
GUILD_REWARDS_BUTTON_HEIGHT = 57;
for _, button in pairs(GuildRewardsContainer.buttons) do
	button:SetHeight(GUILD_REWARDS_BUTTON_HEIGHT);
end
GuildRewardsContainer.buttonHeight = GUILD_REWARDS_BUTTON_HEIGHT;