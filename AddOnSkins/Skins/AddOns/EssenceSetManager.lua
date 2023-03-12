local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('EssenceSetManager') then return end

function R:EssenceSetManager(event, addon)
	if addon == 'Blizzard_AzeriteEssenceUI' or IsAddOnLoaded('Blizzard_AzeriteEssenceUI') then
		AzeriteEssenceUI:HookScript('OnShow', function(self)
			local esm = ESSENCE_SET_MANAGER_ADDON
			S:HandleEditBox(esm.input)
			S:HandleButton(esm.save)
			S:HandleButton(esm.itemBtn)
		end)
	end
end

AS:RegisterSkin('EssenceSetManager', R.EssenceSetManager, 'ADDON_LOADED')
