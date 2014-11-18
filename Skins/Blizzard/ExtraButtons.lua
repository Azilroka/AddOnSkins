local AS = unpack(AddOnSkins)

local function DisableTexture(self, texture)
	if (string.sub(texture, 1, 9) == "Interface" or string.sub(texture, 1, 9) == "INTERFACE") then
		self:SetTexture("")
	end
end

function AS:Blizzard_DraenorAbilityButton()
	AS:SetTemplate(DraenorZoneAbilityFrame.SpellButton)
	AS:StyleButton(DraenorZoneAbilityFrame.SpellButton)
	DraenorZoneAbilityFrame.SpellButton.Icon:SetDrawLayer('ARTWORK')
	DraenorZoneAbilityFrame.SpellButton.Icon:SetInside()
	AS:SkinTexture(DraenorZoneAbilityFrame.SpellButton.Icon)
	hooksecurefunc(DraenorZoneAbilityFrame.SpellButton.Style, 'SetTexture', DisableTexture)
end

AS:RegisterSkin('Blizzard_DraenorAbilityButton', AS.Blizzard_DraenorAbilityButton)

function AS:Blizzard_ExtraActionButton()
	AS:SetTemplate(ExtraActionButton1)
	AS:StyleButton(ExtraActionButton1)
	ExtraActionButton1.icon:SetDrawLayer('ARTWORK')
	ExtraActionButton1.icon:SetInside()
	AS:SkinTexture(ExtraActionButton1.icon)
	hooksecurefunc(ExtraActionButton1.style, 'SetTexture', DisableTexture)
end

AS:RegisterSkin('Blizzard_ExtraActionButton', AS.Blizzard_ExtraActionButton)