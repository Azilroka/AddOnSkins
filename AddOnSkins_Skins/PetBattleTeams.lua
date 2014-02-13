local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('PetBattleTeams') then return end

local name = 'PetBattleTeamsSkin'
function AS:SkinPetBattleTeams()
	AS:Delay(6, function()
		AS:SkinFrame(PetBattleTeamFrame)
		AS:SkinScrollBar(PetBattleTeamsScrollFrameScrollBar)

		PetBattleTeamsTooltip:HookScript('OnShow', function(self)
			AS:SkinTexture(self.Icon)
			self.rarityGlow:SetTexture(nil)
			self.Background:SetTexture(nil)
			self.BorderTop:SetTexture(nil)
			self.BorderTopLeft:SetTexture(nil)
			self.BorderTopRight:SetTexture(nil)
			self.BorderLeft:SetTexture(nil)
			self.BorderRight:SetTexture(nil)
			self.BorderBottom:SetTexture(nil)
			self.BorderBottomRight:SetTexture(nil)
			self.BorderBottomLeft:SetTexture(nil)
			AS:SkinFrame(self, false, true)
		end)
	end)
end

AS:RegisterSkin(name, AS.SkinPetBattleTeams)