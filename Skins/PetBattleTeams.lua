local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('PetBattleTeams') then return end

function AS:PetBattleTeams()
	LoadAddOn('Blizzard_PetJournal')
	local PBT = LibStub("AceAddon-3.0"):GetAddon("PetBattleTeams"):GetModule("GUI")

	local function SkinPBT()
		AS:SkinFrame(PBT.mainFrame)
--[[
		AS:SkinButton(PBT.mainFrame.addTeamButton)
		PBT.mainFrame.addTeamButton.icon:SetInside()
		AS:SkinTexture(PBT.mainFrame.addTeamButton.icon)

		for _, object in pairs({'reviveButton', 'bandageButton'}) do
			AS:SkinButton(PBT.mainFrame[object])
			AS:SkinTexture(PBT.mainFrame[object].Icon)
			PBT.mainFrame[object].Icon:SetInside()
			PBT.mainFrame[object].Border:SetTexture(nil)
		end

		AS:StyleButton(PBT.menuButton)
		PBT.menuButton:GetHighlightTexture():SetAllPoints(PBT.menuButton.icon)
		PBT.menuButton:GetPushedTexture():SetAllPoints(PBT.menuButton.icon)
		PBT.menuButton.overlay:Kill()
		AS:SkinFrame(PBT.mainFrame.rosterFrame.scrollFrame.ScrollBar)]]
	end

	PetBattleTeamsTooltip:HookScript('OnShow', function(self)
		AS:SkinTexture(self.Icon)
		self.Border:SetTexture(nil)
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

	if PBT.mainFrame then
		SkinPBT()
	end
end

AS:RegisterSkin('PetBattleTeams', AS.PetBattleTeams)