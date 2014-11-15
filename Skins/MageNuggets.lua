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
		'MageNugManaGem_Frame',
		'MageNugCauterizeFrame',
		'MageNugClearcast_Frame',
		'MageNugAB_Frame',
		'MageNugIgnite_Frame',
		'MageNugLB_Frame',
		'MageNugSP_Frame',
		'MNabCast_Frame',
		'MageNugFrostBomb_Frame',
	}

	for _, object in pairs(Frames) do
		if _G[object] then
			_G[object]:SetBackdrop(nil)
			AS:SkinBackdropFrame(_G[object], nil, true)
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

	MageNugLB1_Frame:SetPoint('BOTTOMLEFT', MageNugLB_Frame, 'BOTTOMRIGHT', 6, -1)
	MageNugLB2_Frame:SetPoint('BOTTOM', MageNugLB1_Frame, 'TOP', 0, 4)
	MageNugLB3_Frame:SetPoint('BOTTOM', MageNugLB2_Frame, 'TOP', 0, 4)
	MageNugLB4_Frame:SetPoint('BOTTOM', MageNugLB3_Frame, 'TOP', 0, 4)
	AS:SkinStatusBar(MageNugCauterize_Frame_Bar)
	AS:SkinStatusBar(MageNugMI_Frame_MiBar)
	AS:SkinStatusBar(MageNugInvokers_Frame_Bar)
	AS:SkinStatusBar(MageNugManaGem_Frame_Bar)
	AS:SkinStatusBar(MageNugIgnite_Frame_Bar)
	AS:SkinStatusBar(MageNugAB_Frame_ABBar)
	AS:SkinStatusBar(MageNugClearcast_Frame_Bar)
	MageNugMBProcFrame_ProcBar:SetStatusBarTexture(AS.NormTex)
	MageNugProcFrame_ProcBar:SetStatusBarTexture(AS.NormTex)
	MageNugProcHUFrame_ProcBar:SetStatusBarTexture(AS.NormTex)
	MageNugPolyFrame_Bar:SetStatusBarTexture(AS.NormTex)
	MageNugImpactProcFrame_ProcBar:SetStatusBarTexture(AS.NormTex)
	MageNugBFProcFrame_ProcBar:SetStatusBarTexture(AS.NormTex)
	MageNugFoFProcFrame_ProcBar:SetStatusBarTexture(AS.NormTex)

	MageNugMI_FrameTexture1BG = CreateFrame('Frame', nil, MageNugMI_Frame)
	AS:SetTemplate(MageNugMI_FrameTexture1BG, 'Default')
	MageNugMI_FrameTexture1BG:SetOutside(MageNugMI_FrameTexture1)
	MageNugMI_FrameTexture1BG:SetFrameLevel(MageNugMI_Frame:GetFrameLevel() + 1)
	MageNugMI_FrameTexture1:SetDrawLayer('OVERLAY')
	AS:SkinTexture(MageNugMI_FrameTexture1)
	MageNugMI_Frame_MiBar:SetPoint('LEFT', MageNugMI_FrameTexture1, 'LEFT', 20, 0)

	MageNugCauterize_FrameTexture1BG = CreateFrame('Frame', nil, MageNugCauterize_Frame)
	AS:SetTemplate(MageNugCauterize_FrameTexture1BG, 'Default')
	MageNugCauterize_FrameTexture1BG:SetOutside(MageNugCauterize_FrameTexture1)
	MageNugCauterize_FrameTexture1BG:SetFrameLevel(MageNugMI_Frame:GetFrameLevel() + 1)
	MageNugCauterize_FrameTexture1:SetDrawLayer('OVERLAY')
	AS:SkinTexture(MageNugCauterize_FrameTexture1)
	MageNugCauterize_Frame_Bar:SetPoint('LEFT', MageNugCauterize_FrameTexture1, 'LEFT', 20, 0)

	MageNugInvokers_FrameTexture1BG = CreateFrame('Frame', nil, MageNugInvokers_Frame)
	AS:SetTemplate(MageNugInvokers_FrameTexture1BG, 'Default')
	MageNugInvokers_FrameTexture1BG:SetOutside(MageNugInvokers_FrameTexture1)
	MageNugInvokers_FrameTexture1BG:SetFrameLevel(MageNugMI_Frame:GetFrameLevel() + 1)
	MageNugInvokers_FrameTexture1:SetDrawLayer('OVERLAY')
	AS:SkinTexture(MageNugInvokers_FrameTexture1)

	MageNugInvokers_Frame_Bar:SetPoint('LEFT', MageNugInvokers_FrameTexture1, 'LEFT', 20, 0)
	AS:SkinTexture(MageNugAB_FrameTexture)
	AS:SkinTexture(MageNugLB_FrameTexture)
	AS:SkinTexture(MageNugIgnite_FrameTexture)
	AS:SkinTexture(MageNugManaGem_FrameTexture)
	AS:SkinTexture(MageNugClearcast_FrameTexture)
	MageNugManaGem_Frame_Text2:ClearAllPoints()
	MageNugManaGem_Frame_Text2:SetPoint('CENTER', MageNugManaGem_Frame_Bar, 'CENTER', 0, 0)
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
	MageNugAB_Frame_ABBar:ClearAllPoints()
	MageNugAB_Frame_ABBar:SetWidth(MageNugAB_Frame:GetWidth())
	MageNugAB_Frame_ABBar:Point('TOP', MageNugAB_Frame, 'BOTTOM', 0, -6)
	MageNugIgnite_Frame_Bar:ClearAllPoints()
	MageNugIgnite_Frame_Bar:SetWidth(MageNugIgnite_Frame:GetWidth())
	MageNugIgnite_Frame_Bar:Point('TOP', MageNugIgnite_Frame, 'BOTTOM', 0, -6)
	MageNugManaGem_Frame_Bar:ClearAllPoints()
	MageNugManaGem_Frame_Bar:SetWidth(MageNugManaGem_Frame:GetWidth())
	MageNugManaGem_Frame_Bar:Point('TOP', MageNugManaGem_Frame, 'BOTTOM', 0, -6)
	MageNugClearcast_Frame_Bar:ClearAllPoints()
	MageNugClearcast_Frame_Bar:SetWidth(MageNugClearcast_Frame:GetWidth())
	MageNugClearcast_Frame_Bar:Point('TOP', MageNugClearcast_Frame, 'BOTTOM', 0, -6)
	MNabCast_Frame:ClearAllPoints()
	MNabCast_Frame:Point('BOTTOM', MageNugAB_Frame, 'TOP', 0, 6)

	local checkbuttons = {
		MageNugOptionsFrame_CheckButtonCC,
		MageNugOptionsFrame_CheckButton6,
		MageNugOptionsFrame_CheckButtonMG,
		MageNugOptionsFrame_CheckButton7,
		MageNugOptionsFrame_CheckButton8,
		MageNugOptionsFrame_CheckButtonMGcombat,
		MageNugOptionsFrame_CheckButtonFB,
		MageNugOptionsFrame_CheckButtonIE,
		MageNugOptionsFrame_CheckButton14,
		MageNugOptionsFrame_CheckButton9,
		MageNugOptionsFrame_CheckButton13,
		MageNugOptionsFrame_ABcastCheckButton,
		MageNugOptionsFrame_CheckButton2,
		MageNugOptionsFrame_CheckButton11,
		MageNugOptionsFrame_CheckButton3,
		MageNugOptionsFrame_IgniteCheckButton,
		CauterizeCheckButton,
		MageNugStatMonOptionFrame_CheckButton0,
		MageNugStatMonOptionFrame_CheckButton1,
		MageNugStatMonOptionFrame_CheckButton2,
		MageNugMsgOptionFrame_CheckButton,
		MageNugMsgOptionFrame_CheckButton2,
		MageNugMsgOptionFrame_CheckButton3,
		MageNugMsgOptionFrame_CheckButton4,
		MageNugMsgOptionFrame_CheckButton5,
		MageNugMsgOptionFrame_CheckButton6,
		MageNugSoundOptionFrame_MICheckButton,
		MageNugSoundOptionFrame_ProcCheckButton,
		MageNugSoundOptionFrame_PolyCheckButton,
		MageNugSoundOptionFrame_HotStreakCheckButton,
		MageNugSoundOptionFrame_ImpactCheckButton,
		MageNugSoundOptionFrame_FoFCheckButton,
		MageNugSoundOptionFrame_BrainFreezeCheckButton,
		MageNugSoundOptionFrame_CauterizeCheckButton,
		MageNugSoundOptionFrame_TimeWarpCheckButton,
		MageNugPriestOptionFrame_CheckButton3,
		MageNugPriestOptionFrame_CheckButton2,
		MageNugPriestOptionFrame_CheckButton0,
		MageNugMoonkinOptionFrame_CheckButton,
		MageNugMoonkinOptionFrame_CheckButton0,
		MageNugMoonkinOptionFrame_CheckButton1,
		MageNugMoonkinOptionFrame_CheckButtonMin,
		MageNugMoonkinOptionFrame_CheckButton3,
		MageNugMoonkinOptionFrame_CheckButtonAnchor,
		MageNugMoonkinOptionFrame_CastCheckButton,
		MageNugMoonkinOptionFrame_ProcCheckButton,
		MageNugMoonkinOptionFrame_CheckButton2,
		MageNugOption2Frame_MinimapCheckButton,
		MageNugOption2Frame_CameraCheckButton,
		MageNugOption2Frame_ConsoleTextCheckButton,
		MageNugOption2Frame_LockFramesCheckButton,
		MageNugOption2Frame_CheckButtonTT,
		MageNugOption2Frame_ClickThruCheckButton,
		MageNugCooldownFrame_apButton,
		MageNugCooldownFrame_bwButton,
		MageNugCooldownFrame_cbButton,
		MageNugCooldownFrame_csButton,
		MageNugCooldownFrame_dfButton,
		MageNugCooldownFrame_dbButton,
		MageNugCooldownFrame_mwButton,
		MageNugCooldownFrame_frzButton,
		MageNugCooldownFrame_msButton,
		MageNugCooldownFrame_ibrButton,
		MageNugCooldownFrame_evoButton,
		MageNugCooldownFrame_ivButton,
		MageNugCooldownFrame_cdButton,
		MageNugCooldownFrame_starfallButton,
		MageNugCooldownFrame_treantButton,
		MageNugCooldownFrame_miButton,
	}

	for _, b in pairs(checkbuttons) do
		AS:SkinCheckBox(b)
	end

	local sliders = {
		MageNugOptionsFrame_Slider5,
		MageNugOptionsFrame_InvokersSlider,
		MageNugOptionsFrame_Slider1,
		MageNugOptionsFrame_Slider3,
		MageNugOptionsFrame_Slider2,
		MageNugOptionsFrame_Slider4,
		MageNugStatMonOptionFrame_SPSizeSlider,
		MageNugStatMonOptionFrame_BorderSlider,
		MageNugStatMonOptionFrame_TransparencySlider,
		MageNugMoonkinOptionFrame_Slider,
		MageNugMoonkinOptionFrame_Slider1,
		MageNugCooldownFrame_Slider1,
	}

	for _, s in pairs(sliders) do
		AS:SkinSlideBar(s, 8, true)
	end

	local editbox = {
		SlowFallMsgEditBox,
		SlowFallMsgEditBox2,
		SlowFallMsgEditBox3,
		FocMagNotifyEditBox,
		FocMagNotifyEditBox2,
		FocMagNotifyEditBox3,
		FocMagThankEditBox,
		FocMagThankEditBox2,
		InnervThankEditBox,
		InnervThankEditBox2,
		PowerInfusionEditBox,
		DarkIntentEditBox,
		MageNugSoundOptionFrame_MISoundEditBox,
		MageNugSoundOptionFrame_ProcSoundEditBox,
		MageNugSoundOptionFrame_PolySoundEditBox,
		MageNugSoundOptionFrame_HotStreakSoundEditBox,
		MageNugSoundOptionFrame_ImpactSoundEditBox,
		MageNugSoundOptionFrame_FoFSoundEditBox,
		MageNugSoundOptionFrame_BrainFreezeSoundEditBox,
		MageNugSoundOptionFrame_CauterizeSoundEditBox,
		MageNugSoundOptionFrame_TimeWarpSoundEditBox,
		MageNugPriestOptionFrame_EditBox3,
		MageNugPriestOptionFrame_EditBox2,
		MageNugPriestOptionFrame_EditBox1,
		MageNugMoonkinOptionFrame_SoundEditBox,
		MageNugMoonkinOptionFrame_InnervateEditBox,
	}

	for _, f in pairs(editbox) do
		AS:SkinEditBox(f, false, 15)
	end
	
	AS:SkinButton(MageNugStatMonOptionFrameBlackBackdropButton)
	AS:SkinButton(MageNugMoonkinOptionFrame_Button)
	AS:SkinButton(MageNugOption2FrameButton1)
	AS:SkinButton(MageNugOption2FrameButton2)
	AS:SkinButton(MageNugOption2FrameButton3)
end

AS:RegisterSkin('MageNuggets', AS.MageNuggets)