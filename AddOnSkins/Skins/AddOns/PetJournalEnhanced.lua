local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('PetJournalEnhanced') then return end

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

AS:RegisterSkin('PetJournalEnhanced', R.PetJournalEnhanced, 'ADDON_LOADED')
