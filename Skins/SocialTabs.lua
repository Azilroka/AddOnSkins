local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('SocialTabs') then return end

function AS:SocialTabs(event, addon)
	local SocialTabs = {
		'FriendsFrame',
		'GuildFrame',
		'PVEFrame',
		'RaidBrowserFrame',
		'PVPUIFrame',
		'LookingForGuildFrame',
	}

	for _, object in pairs(SocialTabs) do
		local Frame = _G[object]
		if Frame and not Frame.IsSkinned then
			Frame:HookScript('OnShow', function(self)
				AS:SkinFrame(_G[object..'_st_FriendsFrame'])
				_G[object..'_st_FriendsFrame']:SetNormalTexture("Interface\\FriendsFrame\\Battlenet-Portrait")
				AS:SkinFrame(_G[object..'_st_GuildFrame'])
				if GetGuildTabardFileNames() then
					_G[object..'_st_GuildFrame']:SetNormalTexture("Interface\\SpellBook\\GuildSpellbooktabBG")
					SetLargeGuildTabardTextures("player", _G[object..'_st_GuildFrame'].TabardEmblem, _G[object..'_st_GuildFrame']:GetNormalTexture(), _G[object..'_st_GuildFrame'].TabardIconFrame)
				else
					_G[object..'_st_GuildFrame']:SetNormalTexture("Interface\\GuildFrame\\GuildLogo-NoLogo")
				end
				AS:SkinFrame(_G[object..'_st_PVEFrame'])
				_G[object..'_st_PVEFrame']:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-PORTRAIT")
				AS:SkinFrame(_G[object..'_st_RaidBrowserFrame'])
				_G[object..'_st_RaidBrowserFrame']:SetNormalTexture("Interface\\LFGFrame\\UI-LFR-PORTRAIT")
				AS:SkinFrame(_G[object..'_st_PVPUIFrame'])
				_G[object..'_st_PVPUIFrame']:SetNormalTexture("Interface\\BattlefieldFrame\\UI-Battlefield-Icon")
				AS:SkinFrame(_G[object..'_st_LookingForGuildFrame'])
				_G[object..'_st_LookingForGuildFrame']:SetNormalTexture("Interface\\GuildFrame\\GuildLogo-NoLogo.blp")
			end)
			Frame.IsSkinned = true
		end
	end
end

AS:RegisterSkin('SocialTabs', AS.SocialTabs, 'ADDON_LOADED')