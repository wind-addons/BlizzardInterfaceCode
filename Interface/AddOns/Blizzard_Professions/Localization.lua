-- This file is executed at the end of addon load

-- Replace instances of GameFontHighlightSmall2 with the larger GameFontHighlightSmall.
ProfessionsFrame.CraftingPage.SchematicForm.RequiredTools:SetFontObject("GameFontHighlightSmall");
ProfessionsFrame.CraftingPage.SchematicForm.RecraftingRequiredTools:SetFontObject("GameFontHighlightSmall");
ProfessionsFrame.CraftingPage.SchematicForm.Description:SetFontObject("GameFontHighlightSmall");

PROFESSIONS_SCHEMATIC_REAGENTS_Y_OFFSET = -12;