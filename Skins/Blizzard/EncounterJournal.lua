 local AS = unpack(AddOnSkins)

function AS:Blizzard_EncounterJournal(event, addon)
	if addon ~= 'Blizzard_EncounterJournal' then return end
	AS:SkinBackdropFrame(EncounterJournal)

	AS:SkinBackdropFrame(EncounterJournalNavBar, nil, nil, true)
	EncounterJournalNavBar.Backdrop:SetPoint("TOPLEFT", -2, 0)
	EncounterJournalNavBar.Backdrop:SetPoint("BOTTOMRIGHT")

	AS:StripTextures(EncounterJournalNavBarOverlay, true)
	
	AS:SkinEditBox(EncounterJournalSearchBox)
	AS:SkinCloseButton(EncounterJournalCloseButton)
	
	AS:StripTextures(EncounterJournalInset, true)
	AS:CreateBackdrop(EncounterJournalEncounterFrameInfo)

	AS:SkinScrollBar(EncounterJournalInstanceSelectScrollFrameScrollBar)

	AS:SkinButton(EncounterJournalNavBarHomeButton, true)
	EncounterJournalNavBarHomeButton.xoffset = 1
	EncounterJournalNavBarHomeButton.isSkinned = true

	local Tabs = {
		EncounterJournalEncounterFrameInfoBossTab,
		EncounterJournalEncounterFrameInfoLootTab,
		EncounterJournalEncounterFrameInfoModelTab,
		EncounterJournalEncounterFrameInfoOverviewTab,
	}

	for _, Tab in pairs(Tabs) do
		Tab:GetNormalTexture():SetTexture(nil)
		Tab:GetPushedTexture():SetTexture(nil)
		Tab:GetDisabledTexture():SetTexture(nil)
		Tab:GetHighlightTexture():SetTexture(nil)
		AS:SkinBackdropFrame(Tab, nil, true)
		Tab.Backdrop:SetPoint('TOPLEFT', 11, -8)
		Tab.Backdrop:SetPoint('BOTTOMRIGHT', -6, 8)
	end

	EncounterJournalEncounterFrameInfoOverviewTab:SetPoint('TOPLEFT', EncounterJournalEncounterFrameInfo, 'TOPRIGHT', AS.PixelMode and -3 or 0, -35)
	hooksecurefunc(EncounterJournalEncounterFrameInfoOverviewTab, "SetPoint", function(self, point, attachTo, anchorPoint, xOffset, yOffset)
		if point ~= "TOPLEFT" or attachTo ~= EncounterJournalEncounterFrameInfo or anchorPoint ~= "TOPRIGHT" or xOffset ~= (AS.PixelMode and -3 or 0) or yOffset ~= -35 then
			EncounterJournalEncounterFrameInfoOverviewTab:SetPoint('TOPLEFT', EncounterJournalEncounterFrameInfo, 'TOPRIGHT', AS.PixelMode and -3 or 0, -35)
		end
	end)

	AS:StripTextures(EncounterJournalInstanceSelect)
	AS:SkinFrame(EncounterJournalInstanceSelectScrollFrame)
	AS:SkinTab(EncounterJournalInstanceSelectDungeonTab)
	EncounterJournalInstanceSelectDungeonTab.Backdrop:SetPoint('BOTTOMRIGHT', 0, -3)
	AS:SkinTab(EncounterJournalInstanceSelectRaidTab)
	EncounterJournalInstanceSelectRaidTab.Backdrop:SetPoint('BOTTOMRIGHT', 0, -3)
	AS:SkinTab(EncounterJournalInstanceSelectSuggestTab)
	EncounterJournalInstanceSelectSuggestTab.Backdrop:SetPoint('TOPLEFT', -3, -7)
	EncounterJournalInstanceSelectSuggestTab.Backdrop:SetPoint('BOTTOMRIGHT', 0, -3)
	AS:SkinTab(EncounterJournalInstanceSelectLootJournalTab)
	EncounterJournalInstanceSelectLootJournalTab.Backdrop:SetPoint('BOTTOMRIGHT', 0, -3)

	EncounterJournal.instanceSelect.bg:SetAlpha(0)

	AS:SkinDropDownBox(EncounterJournalInstanceSelectTierDropDown)
	-- EncounterJournalInstanceSelectTierDropDownButton:SetScript('OnClick', function(self)
		-- PlaySound("igMainMenuOptionCheckBoxOn")
		-- ToggleDropDownMenu(1, nil, EJTierDropDown, self:GetName(), 0, -2)
	-- end)

	local function SkinDungeons()
		local b1 = EncounterJournalInstanceSelectScrollFrameScrollChildInstanceButton1
		if b1 and not b1.isSkinned then 
			AS:SkinButton(b1)
			b1.bgImage:SetInside()
			b1.bgImage:SetTexCoord(.08, .6, .08, .6)
			b1.bgImage:SetDrawLayer("ARTWORK")
			b1.isSkinned = true
		end

		for i = 1, 100 do
			local b = _G["EncounterJournalInstanceSelectScrollFrameinstance"..i]
			if b and not b.isSkinned then
				AS:SkinButton(b)
				b.bgImage:SetInside()
				b.bgImage:SetTexCoord(0.08,.6,0.08,.6)
				b.bgImage:SetDrawLayer("ARTWORK")
				b.isSkinned = true
			end
		end
	end

	hooksecurefunc("EncounterJournal_ListInstances", SkinDungeons)
	EncounterJournal_ListInstances()

	AS:SkinScrollBar(EncounterJournalEncounterFrameInfoLootScrollFrameScrollBar)
	AS:SkinScrollBar(EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollBar)
	AS:SkinScrollBar(EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollBar)
	AS:SkinScrollBar(EncounterJournalEncounterFrameInfoBossesScrollFrameScrollBar)
	
	EncounterJournalScrollBar:SkinScrollBar()
	AS:StripTextures(EncounterJournal.LootJournal)
	AS:SkinButton(EncounterJournal.LootJournal.LegendariesFrame.ClassButton, true)
	AS:SkinButton(EncounterJournal.LootJournal.LegendariesFrame.SlotButton, true)
	AS:StripTextures(EncounterJournal.LootJournal.ItemSetsFrame.ClassButton)
	AS:SkinButton(EncounterJournal.LootJournal.ItemSetsFrame.ClassButton, true)
	AS:SkinDropDownBox(LootJournalViewDropDown)
end

AS:RegisterSkin("Blizzard_EncounterJournal", AS.Blizzard_EncounterJournal, 'ADDON_LOADED')