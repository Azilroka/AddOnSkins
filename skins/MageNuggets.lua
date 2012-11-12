if not IsAddOnLoaded("MageNuggets") then return end
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "MageNuggetsSkin"
local function SkinMageNuggets(self)
	local frames = {
		"MNSpellSteal_Frame",
		"MNSpellStealFocus_Frame",
		"MageNugPolyFrame",
		"MageNugFoFProcFrame",
		"MageNugMBProcFrame",
		"MageNugImpactProcFrame",
		"MageNugBFProcFrame",
		"MageNugProcFrame",
		"MageNugSSProcFrame",
		"MageNugBFProcFrame",
		"MageNugMoonkin_Frame",
		"MageNugHordeFrame",
		"MageNugAlliFrame",
		"MageNugManaGem_Frame",
		"MageNugCauterizeFrame",
		"MageNugClearcast_Frame",
		"MageNugAB_Frame",
		"MageNugIgnite_Frame",
		"MageNugLB_Frame",
		"MageNugSP_Frame",
		"MNabCast_Frame",
	}

	for i = 1, #frames do
		_G[frames[i]]:SetBackdrop({bgFile = nil, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
		_G[frames[i]]:CreateBackdrop("Transparent")
	end
	local sframes = {
		"MNcritMass_Frame",
		"MNcombust_Frame",
		"MNicyveins_Frame",
		"MNarcanepower_Frame",
		"MNimpGem_Frame",
		"MNlust_Frame",
		"MNmoonFire_Frame",
		"MNinsectSwarm_Frame",
		"MNstarSurge_Frame",
	}
	for i = 1, #sframes do
		_G[sframes[i]]:SetBackdrop({bgFile = nil, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	end

	MageNugCauterize_Frame_Bar:SetStatusBarTexture(E["media"].normTex)
	MageNugMI_Frame_MiBar:SetStatusBarTexture(E["media"].normTex)
	MageNugManaGem_Frame_Bar:SetStatusBarTexture(E["media"].normTex)
	MageNugIgnite_Frame_Bar:SetStatusBarTexture(E["media"].normTex)
	MageNugAB_Frame_ABBar:SetStatusBarTexture(E["media"].normTex)
	MageNugMBProcFrame_ProcBar:SetStatusBarTexture(E["media"].normTex)
	MageNugProcFrame_ProcBar:SetStatusBarTexture(E["media"].normTex)
	MageNugPolyFrame_Bar:SetStatusBarTexture(E["media"].normTex)
	MageNugImpactProcFrame_ProcBar:SetStatusBarTexture(E["media"].normTex)
	MageNugBFProcFrame_ProcBar:SetStatusBarTexture(E["media"].normTex)
	MageNugFoFProcFrame_ProcBar:SetStatusBarTexture(E["media"].normTex)
	MageNugLB1_Frame_Bar:SetStatusBarTexture(E["media"].normTex)
	MageNugLB2_Frame_Bar:SetStatusBarTexture(E["media"].normTex)
	MageNugLB3_Frame_Bar:SetStatusBarTexture(E["media"].normTex)
	MageNugLB4_Frame_Bar:SetStatusBarTexture(E["media"].normTex)
	MageNugMI_Frame_MiBar:CreateBackdrop("Transparent")
	MageNugCauterize_Frame_Bar:CreateBackdrop("Transparent")

	AS:SkinButton(MageNugHordeFrameClose)
	AS:SkinButton(MageNugHordeFrameShowOptions)
	AS:SkinButton(MageNugAlliFrameClose)
	AS:SkinButton(MageNugAlliFrameShowOptions)

	MageNugAB_Frame_ABBar:CreateBackdrop("Transparent")
	MageNugAB_Frame_ABBar:ClearAllPoints()
	MageNugAB_Frame_ABBar:Point("TOPLEFT", MageNugAB_Frame, "TOPLEFT", 1, -42)
	MageNugIgnite_Frame_Bar:CreateBackdrop("Transparent")
	MageNugIgnite_Frame_Bar:ClearAllPoints()
	MageNugIgnite_Frame_Bar:Point("TOPLEFT", MageNugIgnite_Frame, "TOPLEFT", 1, -42)
	MageNugManaGem_Frame_Bar:CreateBackdrop("Transparent")
	MageNugManaGem_Frame_Bar:ClearAllPoints()
	MageNugManaGem_Frame_Bar:Point("TOPLEFT", MageNugManaGem_Frame, "TOPLEFT", 1, -42)
	MageNugClearcast_Frame_Bar:CreateBackdrop("Transparent")
	MageNugClearcast_Frame_Bar:ClearAllPoints()
	MageNugClearcast_Frame_Bar:Point("TOPLEFT", MageNugClearcast_Frame, "TOPLEFT", 1, -42)
	MNabCast_Frame:Point("TOPLEFT", MageNugAB_Frame, "TOPLEFT", 0, 18)

end

AS:RegisterSkin(name,SkinMageNuggets)