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
	hooksecurefunc("ZoneAbilityFrame_Update", function(self) self.SpellButton.Style:SetTexture(nil) end)
end

AS:RegisterSkin('Blizzard_AbilityButton', AS.Blizzard_AbilityButton)

function AS:Blizzard_ExtraActionButton()
	ExtraActionButton1:SetNormalTexture('')
	AS:SetTemplate(ExtraActionButton1)
	AS:StyleButton(ExtraActionButton1)
	AS:SkinTexture(ExtraActionButton1.icon)
	ExtraActionButton1.icon:SetDrawLayer('ARTWORK')
	ExtraActionButton1.icon:SetInside()
	hooksecurefunc("ExtraActionBar_Update", function() ExtraActionBarFrame.button.style:SetTexture(nil) end)
end

AS:RegisterSkin('Blizzard_ExtraActionButton', AS.Blizzard_ExtraActionButton)