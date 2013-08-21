local AS = ElvUI[1]:GetModule('AddOnSkins')
local format, pairs, print, GetAddOnInfo = format, pairs, print, GetAddOnInfo

function AS:CheckConflicts()
	local Disabled

	local Conflicts = {
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
		'Tukui_UIPackages_Skins',
	}

	for _, AddOnName in pairs(Conflicts) do
		local _, Title, _, Enabled, _, Reason = GetAddOnInfo(AddOnName)
		if Reason ~= "MISSING" then
			print(format("%s: Please remove '%s' from your 'World of Warcraft\\Interface\\AddOns\\' directory. As it will create conflicts if enabled.", AS.Title, AddOnName))
			if Enabled then
				DisableAddOn(AddOnName)
				Disabled = true
			end
		end
	end

	if Disabled then
		print(format("%s: Disabled conflicting AddOn's. If you recieved any lua error's. You will have to reload. To reload type '/rl'.", AS.Title))
	end
end