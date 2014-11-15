local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('PetJournalEnhanced') then return end

function AS:PetJournalEnhanced(event, addon)
	if addon == 'Blizzard_PetJournal' or IsAddOnLoaded('Blizzard_PetJournal') then
		PetJournal:HookScript('OnShow', function()
            AS:StripTextures(PJEUniquePetCount)
            AS:SkinScrollBar(PetJournalEnhancedListScrollFrameScrollBar)
            AS:SkinButton(PetJournalEnhancedFilterButton)
        end)
		AS:UnregisterSkinEvent('PetJournalEnhanced', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('PetJournalEnhanced', AS.PetJournalEnhanced, 'ADDON_LOADED')