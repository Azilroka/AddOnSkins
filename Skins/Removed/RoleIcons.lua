local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RoleIcons') then return end

function AS:RoleIcons(event, addon)
	if (event == 'PLAYER_ENTERING_WORLD' and IsAddOnLoaded('Blizzard_RaidUI')) or addon == "Blizzard_RaidUI" then
		AS:Delay(1, function() --Skin()
			local icon, idx, role, button, i, class
			for idx,role in pairs({"TANK", "HEALER", "DAMAGER"}) do
				button = _G["RoleIconsRoleButton"..role]
				AS:SkinIconButton(button)
				icon = _G[button:GetName().."IconTexture"];
				icon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
				icon:SetTexCoord(GetTexCoordsForRole(role))
			end
			
			for i, class in ipairs(CLASS_SORT_ORDER) do
				local button = _G["RoleIconsRaidClassButton"..i]
				AS:StripTextures(button)
				AS:CreateBackdrop(button, 'Default')
				
				local tcoords = CLASS_ICON_TCOORDS[class]
				local buttonIcon = button:GetNormalTexture()
				buttonIcon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
				buttonIcon:SetTexCoord(tcoords[1] + 0.015, tcoords[2] - 0.02, tcoords[3] + 0.018, tcoords[4] - 0.02)
			end

			AS:SkinButton(_G["RaidIconsRoleCheckBtn"])
		end)
	end
end

AS:RegisterSkin('RoleIcons', AS.RoleIcons, 'ADDON_LOADED')