local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MageNuggets') then return end

function AS:MageNuggets()
	local Frames = {
		'MNSpellSteal_Frame',
		'MNSpellStealFocus_Frame',
		'MageNugPolyFrame',
		'MageNugFoFProcFrame',
		'MageNugMBProcFrame',
		'MageNugImpactProcFrame',
		'MageNugBFProcFrame',
		'MageNugProcFrame',
		'MageNugProcHUFrame',
		'MageNugSSProcFrame',
		'MageNugMoonkin_Frame',
		'MageNugHordeFrame',
		'MageNugAlliFrame',
		'MageNugCauterizeFrame',
		'MageNugClearcast_Frame',
		'MageNugAB_Frame',
		'MageNugIgnite_Frame',
		'MageNugSP_Frame',
		'MNabCast_Frame',
		'MageNugFrostBomb_Frame',
	}

	for _, object in pairs(Frames) do
		if _G[object] then
			_G[object]:SetBackdrop(nil)
			AS:SkinBackdropFrame(_G[object], nil, true)
			if _G[object..'_ProcBar'] then
				_G[object..'_ProcBar']:SetStatusBarTexture(AS.NormTex)
			end
			if _G[object..'Texture'] then
				AS:SkinTexture(_G[object..'Texture'])
			end
		end
	end

	local SmallIcons = {
		'MNcritMass_Frame',
		'MNcombust_Frame',
		'MNicyveins_Frame',
		'MNarcanepower_Frame',
		'MNimpGem_Frame',
		'MNlust_Frame',
		'MNmoonFire_Frame',
		'MNinsectSwarm_Frame',
		'MNstarSurge_Frame',
	}

	for _, object in pairs(SmallIcons) do
		if _G[object] then
			_G[object]:SetBackdrop(nil)
		end
	end

	local LBF = {
		'MageNugLB1_Frame',
		'MageNugLB2_Frame',
		'MageNugLB3_Frame',
		'MageNugLB4_Frame',
	}

	for _, object in pairs(LBF) do
		if _G[object] then
			_G[object]:ClearAllPoints()
			_G[object]:SetBackdrop(nil)
			_G[object..'_Text']:SetDrawLayer('OVERLAY', 8)
			_G[object..'_Text2']:SetDrawLayer('OVERLAY', 8)
			_G[object..'_Bar']:SetStatusBarTexture(AS.NormTex)
			AS:CreateBackdrop(_G[object..'_Bar'])
		end
	end

	local StatusBars = {
		MageNugCauterize_Frame_Bar,
		MageNugMI_Frame_MiBar,
		MageNugInvokers_Frame_Bar,
		MageNugIgnite_Frame_Bar,
		MageNugAB_Frame_ABBar,
		MageNugClearcast_Frame_Bar,
	}

	for _, StatusBar in pairs(StatusBars) do
		AS:SkinStatusBar(StatusBar)
	end

	MageNugLB1_Frame:SetPoint('BOTTOMLEFT', MageNugLB_Frame, 'BOTTOMRIGHT', 6, -1)
	MageNugLB2_Frame:SetPoint('BOTTOM', MageNugLB1_Frame, 'TOP', 0, 4)
	MageNugLB3_Frame:SetPoint('BOTTOM', MageNugLB2_Frame, 'TOP', 0, 4)
	MageNugLB4_Frame:SetPoint('BOTTOM', MageNugLB3_Frame, 'TOP', 0, 4)

	for _, object in pairs({MageNugMI_Frame, MageNugCauterize_Frame, MageNugInvokers_Frame}) do
		AS:CreateBackdrop(object)
		object.Backdrop:SetOutside(_G[object:GetName()..'Texture1'])
		AS:SkinTexture(_G[object:GetName()..'Texture1'])
	end

	MageNugMI_Frame_MiBar:SetPoint('LEFT', MageNugMI_FrameTexture1, 'LEFT', 20, 0)
	MageNugCauterize_Frame_Bar:SetPoint('LEFT', MageNugCauterize_FrameTexture1, 'LEFT', 20, 0)
	MageNugInvokers_Frame_Bar:SetPoint('LEFT', MageNugInvokers_FrameTexture1, 'LEFT', 20, 0)
	MageNugIgnite_FrameText2:ClearAllPoints()
	MageNugIgnite_FrameText2:SetPoint('CENTER', MageNugIgnite_Frame_Bar, 'CENTER', 0, 0)
	MageNugIgnite_FrameText2:SetFont('Fonts\\FRIZQT__.TTF', 8)
	MageNugClearcast_FrameText2:ClearAllPoints()
	MageNugClearcast_FrameText2:SetPoint('CENTER', MageNugClearcast_Frame_Bar, 'CENTER', 0, 0)
	MageNugClearcast_FrameText2:SetFont('Fonts\\FRIZQT__.TTF', 8)
	MageNugAB_FrameText2:ClearAllPoints()
	MageNugAB_FrameText2:SetPoint('CENTER', MageNugAB_Frame_ABBar, 'CENTER', 0, 0)
	MageNugAB_FrameText2:SetFont('Fonts\\FRIZQT__.TTF', 8)
	AS:SkinButton(MageNugHordeFrameClose)
	AS:SkinButton(MageNugHordeFrameShowOptions)
	AS:SkinButton(MageNugAlliFrameClose)
	AS:SkinButton(MageNugAlliFrameShowOptions)
	MNabCast_Frame:ClearAllPoints()
	MNabCast_Frame:Point('BOTTOM', MageNugAB_Frame, 'TOP', 0, 6)
end

AS:RegisterSkin('MageNuggets', AS.MageNuggets)