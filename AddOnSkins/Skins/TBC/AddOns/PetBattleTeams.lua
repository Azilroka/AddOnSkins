local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('PetBattleTeams') then return end

function AS:PetBattleTeams()
	LoadAddOn('Blizzard_PetJournal')
	local PBT = LibStub("AceAddon-3.0"):GetAddon("PetBattleTeams"):GetModule("GUI")

	local function SkinPBT()
		AS:SkinFrame(PBT.mainFrame)
--[[
		AS:SkinButton(PBT.mainFrame.addTeamButton)
		AS:SetInside(PBT.mainFrame.addTeamButton.icon)
		AS:SkinTexture(PBT.mainFrame.addTeamButton.icon)

		for _, object in pairs({'reviveButton', 'bandageButton'}) do
			AS:SkinButton(PBT.mainFrame[object])
			AS:SkinTexture(PBT.mainFrame[object].Icon)
			AS:SetInside(PBT.mainFrame[object].Icon)
			PBT.mainFrame[object].Border:SetTexture()
		end

		AS:StyleButton(PBT.menuButton)
		PBT.menuButton:GetHighlightTexture():SetAllPoints(PBT.menuButton.icon)
		PBT.menuButton:GetPushedTexture():SetAllPoints(PBT.menuButton.icon)
		AS:Kill(PBT.menuButton.overlay)
		AS:SkinFrame(PBT.mainFrame.rosterFrame.scrollFrame.ScrollBar)]]
	end

	PetBattleTeamsTooltip:HookScript('OnShow', function(self)
		AS:SkinTexture(self.Icon)
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
		AS:SkinFrame(self, false, true)
	end)

	if PBT.mainFrame then
		SkinPBT()
	end
end

AS:RegisterSkin('PetBattleTeams', AS.PetBattleTeams)
