local AS = ElvUI[1]:GetModule('AddOnSkins')
local format, pairs, GetAddOnInfo = format, pairs, GetAddOnInfo

function AS:CheckConflicts()
	local Disabled

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
		'ElvUI_EasyMail_Skin',
		'ElvUI_Factionizer_Skin',
		'ElvUI_Lightheaded_Skin',
		'ElvUI_MasterLootManagerRemix_Skin',
		'ElvUI_TitanPanel_Skin',
		'Tukui_ACP_Skin',
		'Tukui_ElvUI_Skins',
		'Tukui_LinkWrangler_Skin',
		'Tukui_UIPackages_Skins',
	}

	for _, AddOnName in pairs(Conflicts) do
		local _, Title, _, Enabled, _, Reason = GetAddOnInfo(AddOnName)
		if Reason ~= "MISSING" then
			AS:Print(format("Conflict System: Please remove '%s' from your 'World of Warcraft\\Interface\\AddOns\\' directory. It will create conflicts when Enabled.", AddOnName))
			if Enabled then
				DisableAddOn(AddOnName)
				Disabled = true
			end
		end
	end

	if Disabled then
		AS:Print("Conflict System: Disabled Conflict's. If you received ANY lua error's. You will have to reload. To reload type '/rl'.")
	end
end