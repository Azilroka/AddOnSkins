local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('EssenceSetManager') then return end

function AS:EssenceSetManager(event, addon)
	if addon == 'Blizzard_AzeriteEssenceUI' or IsAddOnLoaded('Blizzard_AzeriteEssenceUI') then
		AzeriteEssenceUI:HookScript('OnShow', function(self)
			local esm = ESSENCE_SET_MANAGER_ADDON
			AS:SkinEditBox(esm.input)
			AS:SkinButton(esm.save)
			AS:SkinButton(esm.itemBtn)
		end)
	end
end

AS:RegisterSkin('EssenceSetManager', AS.EssenceSetManager, 'ADDON_LOADED')
