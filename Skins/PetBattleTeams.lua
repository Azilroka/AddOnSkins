local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('PetBattleTeams') then return end

local name = 'PetBattleTeamsSkin'
function AS:SkinPetBattleTeams()
	local PBT = LibStub("AceAddon-3.0"):GetAddon("PetBattleTeams"):GetModule("GUI")

	local function SkinPBT()
		AS:SkinFrame(PBT.mainFrame)
		AS:SkinIconButton(PBT.mainFrame.addTeamButton)
		PBT.mainFrame.reviveButton.icon = PBT.mainFrame.reviveButton.Icon -- Don't ask.
		AS:SkinIconButton(PBT.mainFrame.reviveButton)
		PBT.mainFrame.bandageButton.icon = PBT.mainFrame.bandageButton.Icon
		AS:SkinIconButton(PBT.mainFrame.bandageButton)
		AS:SkinIconButton(PBT.menuButton)
		PBT.menuButton:GetHighlightTexture():SetAllPoints(PBT.menuButton.icon)
		PBT.menuButton:GetPushedTexture():SetAllPoints(PBT.menuButton.icon)
		PBT.menuButton.overlay:Kill()
	end

	if PBT.mainFrame then
		SkinPBT()
	else
		hooksecurefunc(PBT, 'CreateMainFrame', SkinPBT)
	end
end

AS:RegisterSkin(name, AS.SkinPetBattleTeams)