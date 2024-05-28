local GossipConstants =
{
	Tables =
	{
		{
			Name = "GossipNpcOption",
			Type = "Enumeration",
			NumValues = 56,
			MinValue = 0,
			MaxValue = 55,
			Fields =
			{
				{ Name = "None", Type = "GossipNpcOption", EnumValue = 0 },
				{ Name = "Vendor", Type = "GossipNpcOption", EnumValue = 1 },
				{ Name = "Taxinode", Type = "GossipNpcOption", EnumValue = 2 },
				{ Name = "Trainer", Type = "GossipNpcOption", EnumValue = 3 },
				{ Name = "SpiritHealer", Type = "GossipNpcOption", EnumValue = 4 },
				{ Name = "Binder", Type = "GossipNpcOption", EnumValue = 5 },
				{ Name = "Banker", Type = "GossipNpcOption", EnumValue = 6 },
				{ Name = "PetitionVendor", Type = "GossipNpcOption", EnumValue = 7 },
				{ Name = "GuildTabardVendor", Type = "GossipNpcOption", EnumValue = 8 },
				{ Name = "Battlemaster", Type = "GossipNpcOption", EnumValue = 9 },
				{ Name = "Auctioneer", Type = "GossipNpcOption", EnumValue = 10 },
				{ Name = "TalentMaster", Type = "GossipNpcOption", EnumValue = 11 },
				{ Name = "Stablemaster", Type = "GossipNpcOption", EnumValue = 12 },
				{ Name = "PetSpecializationMaster", Type = "GossipNpcOption", EnumValue = 13 },
				{ Name = "GuildBanker", Type = "GossipNpcOption", EnumValue = 14 },
				{ Name = "Spellclick", Type = "GossipNpcOption", EnumValue = 15 },
				{ Name = "DisableXPGain", Type = "GossipNpcOption", EnumValue = 16 },
				{ Name = "EnableXPGain", Type = "GossipNpcOption", EnumValue = 17 },
				{ Name = "Mailbox", Type = "GossipNpcOption", EnumValue = 18 },
				{ Name = "WorldPvPQueue", Type = "GossipNpcOption", EnumValue = 19 },
				{ Name = "LFGDungeon", Type = "GossipNpcOption", EnumValue = 20 },
				{ Name = "ArtifactRespec", Type = "GossipNpcOption", EnumValue = 21 },
				{ Name = "CemeterySelect", Type = "GossipNpcOption", EnumValue = 22 },
				{ Name = "SpecializationMaster", Type = "GossipNpcOption", EnumValue = 23 },
				{ Name = "GlyphMaster", Type = "GossipNpcOption", EnumValue = 24 },
				{ Name = "QueueScenario", Type = "GossipNpcOption", EnumValue = 25 },
				{ Name = "GarrisonArchitect", Type = "GossipNpcOption", EnumValue = 26 },
				{ Name = "GarrisonMissionNpc", Type = "GossipNpcOption", EnumValue = 27 },
				{ Name = "ShipmentCrafter", Type = "GossipNpcOption", EnumValue = 28 },
				{ Name = "GarrisonTradeskillNpc", Type = "GossipNpcOption", EnumValue = 29 },
				{ Name = "GarrisonRecruitment", Type = "GossipNpcOption", EnumValue = 30 },
				{ Name = "AdventureMap", Type = "GossipNpcOption", EnumValue = 31 },
				{ Name = "GarrisonTalent", Type = "GossipNpcOption", EnumValue = 32 },
				{ Name = "ContributionCollector", Type = "GossipNpcOption", EnumValue = 33 },
				{ Name = "Transmogrify", Type = "GossipNpcOption", EnumValue = 34 },
				{ Name = "AzeriteRespec", Type = "GossipNpcOption", EnumValue = 35 },
				{ Name = "IslandsMissionNpc", Type = "GossipNpcOption", EnumValue = 36 },
				{ Name = "UIItemInteraction", Type = "GossipNpcOption", EnumValue = 37 },
				{ Name = "WorldMap", Type = "GossipNpcOption", EnumValue = 38 },
				{ Name = "Soulbind", Type = "GossipNpcOption", EnumValue = 39 },
				{ Name = "ChromieTimeNpc", Type = "GossipNpcOption", EnumValue = 40 },
				{ Name = "CovenantPreviewNpc", Type = "GossipNpcOption", EnumValue = 41 },
				{ Name = "RuneforgeLegendaryCrafting", Type = "GossipNpcOption", EnumValue = 42 },
				{ Name = "NewPlayerGuide", Type = "GossipNpcOption", EnumValue = 43 },
				{ Name = "RuneforgeLegendaryUpgrade", Type = "GossipNpcOption", EnumValue = 44 },
				{ Name = "CovenantRenownNpc", Type = "GossipNpcOption", EnumValue = 45 },
				{ Name = "BlackMarketAuctionHouse", Type = "GossipNpcOption", EnumValue = 46 },
				{ Name = "PerksProgramVendor", Type = "GossipNpcOption", EnumValue = 47 },
				{ Name = "ProfessionsCraftingOrder", Type = "GossipNpcOption", EnumValue = 48 },
				{ Name = "ProfessionsOpen", Type = "GossipNpcOption", EnumValue = 49 },
				{ Name = "ProfessionsCustomerOrder", Type = "GossipNpcOption", EnumValue = 50 },
				{ Name = "TraitSystem", Type = "GossipNpcOption", EnumValue = 51 },
				{ Name = "BarbersChoice", Type = "GossipNpcOption", EnumValue = 52 },
				{ Name = "MajorFactionRenown", Type = "GossipNpcOption", EnumValue = 53 },
				{ Name = "PersonalTabardVendor", Type = "GossipNpcOption", EnumValue = 54 },
				{ Name = "ForgeMaster", Type = "GossipNpcOption", EnumValue = 55 },
			},
		},
		{
			Name = "GossipNpcOptionDisplayFlags",
			Type = "Enumeration",
			NumValues = 1,
			MinValue = 1,
			MaxValue = 1,
			Fields =
			{
				{ Name = "ForceInteractionOnSingleChoice", Type = "GossipNpcOptionDisplayFlags", EnumValue = 1 },
			},
		},
		{
			Name = "GossipOptionRecFlags",
			Type = "Enumeration",
			NumValues = 2,
			MinValue = 1,
			MaxValue = 2,
			Fields =
			{
				{ Name = "QuestLabelPrepend", Type = "GossipOptionRecFlags", EnumValue = 1 },
				{ Name = "HideOptionIDFromClient", Type = "GossipOptionRecFlags", EnumValue = 2 },
			},
		},
	},
};

APIDocumentation:AddDocumentationTable(GossipConstants);