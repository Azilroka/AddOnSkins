local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('KeepingTabs') then return end

function AS:ProfessionTabs(event, addon)
	local function SkinTabs(self)
		for i = 1, self:GetNumChildren() do
			local Child = select(i, self:GetChildren())
			if Child:IsObjectType('CheckButton') and Child:GetNormalTexture("Interface\\ICONS\\Achievement_Dungeon_Outland_Dungeon_Hero") and not Child.IsSkinned then
				AS:SkinIconButton(Child)
				Child:SetNormalTexture("Interface\\ICONS\\Achievement_Dungeon_Outland_Dungeon_Hero")
				for k = 1, Child:GetNumChildren() do
					local SubChild = select(k, Child:GetChildren())
					if SubChild:IsObjectType('CheckButton') and SubChild:GetNormalTexture("Interface\\PVPFrame\\RandomPVPIcon") then
						AS:SkinIconButton(SubChild)
						SubChild:SetNormalTexture("Interface\\PVPFrame\\RandomPVPIcon")
					end
				end
				Child.IsSkinned = true
			end
		end
	end

	PVEFrame:HookScript('OnShow', SkinTabs)
	PVPUIFrame:HookScript('OnShow', SkinTabs)
end

AS:RegisterSkin('KeepingTabs', AS.ProfessionTabs)