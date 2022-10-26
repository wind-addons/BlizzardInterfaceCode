function Localize()
	-- Put all locale specific string adjustments here
end

function LocalizeFrames()
	CharacterCreateFrame.NameChoiceFrame.EditBox:SetMaxLetters(12);
	
	-- Defined variable to show gameroom billing messages
	SHOW_GAMEROOM_BILLING_FRAME = 1;

	-- Hide save username button
	HIDE_SAVE_ACCOUNT_NAME_CHECKBUTTON = true;
end
