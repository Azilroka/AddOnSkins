local AS, L, S, R = unpack(AddOnSkins)

function R:PetJournalEnhanced(event, addon)
	if addon == 'Blizzard_PetJournal' or IsAddOnLoaded('Blizzard_PetJournal') then
		PetJournal:HookScript('OnShow', function()
			S:StripTextures(PJEUniquePetCount)
			S:HandleScrollBar(PetJournalEnhancedListScrollFrameScrollBar)
			S:HandleButton(PetJournalEnhancedFilterButton)
		end)

		AS:UnregisterSkinEvent('PetJournalEnhanced', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('PetJournalEnhanced', nil, 'ADDON_LOADED')
