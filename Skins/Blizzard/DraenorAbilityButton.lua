local AS = unpack(AddOnSkins)

function AS:DraenorAbilityButton_DisableTexture(texture)
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
	hooksecurefunc(DraenorZoneAbilityFrame.SpellButton.Style, 'SetTexture', self.DraenorAbilityButton_DisableTexture)
end

AS:RegisterSkin('Blizzard_DraenorAbilityButton', AS.Blizzard_DraenorAbilityButton)