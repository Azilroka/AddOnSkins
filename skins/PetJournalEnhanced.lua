local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('PetJournalEnhanced') then return end

local name = 'PetJournalEnhancedSkin'
function AS:SkinPetJournalEnhanced(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
	end
	if addon == 'Blizzard_PetJournal' then
		PetJournal:HookScript('OnShow', function() PJEUniquePetCount:StripTextures() end)
	end
end

AS:RegisterSkin(name, AS.SkinPetJournalEnhanced, 'ADDON_LOADED')