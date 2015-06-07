local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('KeepingTabs') then return end

function AS:ProfessionTabs(event, addon)
	local function SkinTabs(self)
		for i = 1, self:GetNumChildren() do
			local Child = select(i, self:GetChildren())
			if Child:IsObjectType('CheckButton') and not Child.IsSkinned then
				Child:DisableDrawLayer('BACKGROUND')
				AS:SkinFrame(Child, nil, true)
				AS:StyleButton(Child)
				AS:SkinTexture(Child:GetNormalTexture())
				Child:GetNormalTexture():SetInside()
				for k = 1, Child:GetNumChildren() do
					local SubChild = select(k, Child:GetChildren())
					if SubChild:IsObjectType('CheckButton') then
						SubChild:DisableDrawLayer('BACKGROUND')
						AS:SkinFrame(SubChild, nil, true)
						AS:StyleButton(SubChild)
						AS:SkinTexture(SubChild:GetNormalTexture())
						SubChild:GetNormalTexture():SetInside()
					end
				end
				Child.IsSkinned = true
			end
		end
	end

	if event == 'PLAYER_ENTERING_WORLD' then
		FriendsFrame:HookScript('OnShow', SkinTabs)
	elseif addon == 'Blizzard_GuildUI' then
		GuildFrame:HookScript('OnShow', SkinTabs)
		AS:UnregisterSkinEvent('KeepingTabs', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('KeepingTabs', AS.ProfessionTabs, 'ADDON_LOADED')