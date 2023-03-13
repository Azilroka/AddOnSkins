local AS, L, S, R = unpack(AddOnSkins)

function R:PetBattleTeams()
	LoadAddOn('Blizzard_PetJournal')
	local PBT = LibStub("AceAddon-3.0"):GetAddon("PetBattleTeams"):GetModule("GUI")

	local function SkinPBT()
		S:HandleFrame(PBT.mainFrame)
--[[
		S:HandleButton(PBT.mainFrame.addTeamButton)
		S:SetInside(PBT.mainFrame.addTeamButton.icon)
		S:HandleIcon(PBT.mainFrame.addTeamButton.icon)

		for _, object in pairs({'reviveButton', 'bandageButton'}) do
			S:HandleButton(PBT.mainFrame[object])
			S:HandleIcon(PBT.mainFrame[object].Icon)
			S:SetInside(PBT.mainFrame[object].Icon)
			PBT.mainFrame[object].Border:SetTexture()
		end

		S:StyleButton(PBT.menuButton)
		PBT.menuButton:GetHighlightTexture():SetAllPoints(PBT.menuButton.icon)
		PBT.menuButton:GetPushedTexture():SetAllPoints(PBT.menuButton.icon)
		S:Kill(PBT.menuButton.overlay)
		S:HandleFrame(PBT.mainFrame.rosterFrame.scrollFrame.ScrollBar)]]
	end

	PetBattleTeamsTooltip:HookScript('OnShow', function(self)
		S:HandleIcon(self.Icon)
		self.Border:SetTexture()
		self.rarityGlow:SetTexture()
		self.Background:SetTexture()
		self.BorderTop:SetTexture()
		self.BorderTopLeft:SetTexture()
		self.BorderTopRight:SetTexture()
		self.BorderLeft:SetTexture()
		self.BorderRight:SetTexture()
		self.BorderBottom:SetTexture()
		self.BorderBottomRight:SetTexture()
		self.BorderBottomLeft:SetTexture()
		S:HandleFrame(self, false, true)
	end)

	if PBT.mainFrame then
		SkinPBT()
	end
end

AS:RegisterSkin('PetBattleTeams')
