local AS = unpack(AddOnSkins)

local function DisableTexture(self, texture)
	if texture ~= "" then
		self:SetTexture("")
	end
end

function AS:Blizzard_AbilityButton()
	ZoneAbilityFrame.SpellButton:SetNormalTexture('')
	AS:SetTemplate(ZoneAbilityFrame.SpellButton)
	AS:StyleButton(ZoneAbilityFrame.SpellButton)
	AS:SkinTexture(ZoneAbilityFrame.SpellButton.Icon)
	ZoneAbilityFrame.SpellButton.Icon:SetDrawLayer('ARTWORK')
	ZoneAbilityFrame.SpellButton.Icon:SetInside()
	ZoneAbilityFrame.SpellButton.Cooldown:SetInside()
	ZoneAbilityFrame.SpellButton.Cooldown:SetSwipeColor(0, 0, 0, 1)
	ZoneAbilityFrame.SpellButton.Cooldown:SetDrawBling(false)
	hooksecurefunc(ZoneAbilityFrame.SpellButton.Style, 'SetTexture', DisableTexture)
end

AS:RegisterSkin('Blizzard_AbilityButton', AS.Blizzard_AbilityButton)

function AS:Blizzard_ExtraActionButton()
	ExtraActionButton1:SetNormalTexture('')
	AS:SetTemplate(ExtraActionButton1)
	AS:StyleButton(ExtraActionButton1)
	AS:SkinTexture(ExtraActionButton1.icon)
	ExtraActionButton1.icon:SetDrawLayer('ARTWORK')
	ExtraActionButton1.icon:SetInside()
	hooksecurefunc(ExtraActionButton1.style, 'SetTexture', DisableTexture)
end

AS:RegisterSkin('Blizzard_ExtraActionButton', AS.Blizzard_ExtraActionButton)