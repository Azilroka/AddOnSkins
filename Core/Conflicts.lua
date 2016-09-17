local AS, ASL = unpack(AddOnSkins)
local format, pairs, GetAddOnInfo = format, pairs, GetAddOnInfo

local Conflicts = {
	'AddOnSkins_ElvUI',
	'AddOnSkins_Tukui',
	'AddOnSkins_AsphyxiaUI',
	'AddOnSkins_DuffedUI',
	'DecUI_BagSync_Skin',
	'DecUI_Dresser_Skin',
	'DecUI_Examiner_Skin',
	'DecUI_GupPet_Skin',
	'DecUI_MogIt_Skin',
	'DecUI_Numeration_Skin',
	'DecUI_OneClickEnchantScroll_Skin',
	'DecUI_xMerchant_Skin',
	'ElvUI_AtlasLoot_Skin',
	'ElvUI_BGDefender_Skin',
	'ElvUI_CB_Skin',
	'ElvUI_CoolLine',
	'ElvUI_EasyMail_Skin',
	'ElvUI_Factionizer_Skin',
	'ElvUI_Lightheaded_Skin',
	'ElvUI_MasterLootManagerRemix_Skin',
	'ElvUI_TitanPanel_Skin',
	'Tukui_ACP_Skin',
	'Tukui_ElvUI_Skins',
	'Tukui_LinkWrangler_Skin',
	'Tukui_UIPackages_Skins',
	'Tukui_Skins',
}

for i = 1, GetNumAddOns() do
	local Name, Title, _, _, Reason = GetAddOnInfo(i)
	for _, AddOnName in pairs(Conflicts) do
		if Name == AddOnName and Reason ~= "MISSING" then
			if GetAddOnEnableState(AS.MyName, Name) > 0 then
				DisableAddOn(AddOnName)
			end
		end
	end
end