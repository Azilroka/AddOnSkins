local AS = unpack(AddOnSkins)
local format, pairs, print, GetAddOnInfo = format, pairs, print, GetAddOnInfo

local Conflicts = {
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

for _, AddOnName in pairs(Conflicts) do
	local _, Title, _, Enabled, _, Reason = GetAddOnInfo(AddOnName)
	if Reason ~= "MISSING" then
		AS:Print(format("Conflict System: Please remove '%s' from your 'World of Warcraft\\Interface\\AddOns\\' directory.", AddOnName))
		if Enabled then
			DisableAddOn(AddOnName)
		end
	end
end