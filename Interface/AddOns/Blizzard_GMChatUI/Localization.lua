-- This file is executed at the end of addon load

GMChatStatusFrameDescription:SetWidth(190);
GMChatStatusFrameTitleText:SetPoint("TOPLEFT", GMChatStatusFrameBorderLeft, "TOPRIGHT", 0, -15);
GMChatStatusFrameDescription:SetPoint("TOPLEFT", GMChatStatusFrameTitleText, "BOTTOMLEFT", 0, 2);