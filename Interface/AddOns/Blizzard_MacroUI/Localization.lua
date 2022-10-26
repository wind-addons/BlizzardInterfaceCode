-- This file is executed at the end of addon load

-- Adjust Macro text
MacroFrameCharLimitText:SetPoint("BOTTOM", "MacroFrame", "BOTTOM", -15, 30);

MacroFrameEnterMacroText:SetPoint("TOPLEFT", "MacroFrameSelectedMacroBackground", "BOTTOMLEFT", 8, 7);

-- Adjust Macro Name Input Box's Texture Width
MacroPopupFrame.BorderBox.IconSelectorEditBox.IconSelectorPopupNameMiddle:SetWidth(190);

-- Adjust MacroTab2 size
PanelTemplates_TabResize(MacroFrameTab2, -15, nil, 130);