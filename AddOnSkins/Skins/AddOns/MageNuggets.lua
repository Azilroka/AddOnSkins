local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MageNuggets') then return end

function AS:MageNuggets()
	local Frames = {
		'MNSpellSteal_Frame',
		'MNSpellStealFocus_Frame',
		'MageNugPolyFrame',
		'MageNugFoFProcFrame',
		'MageNugMBProcFrame',
		'MageNugBFProcFrame',
		'MageNugProcFrame',
		'MageNugProcHUFrame',
		'MageNugMoonkin_Frame',
		'MageNugHordeFrame',
		'MageNugAlliFrame',
		'MageNugCauterizeFrame',
		'MageNugAB_Frame',
		'MageNugIgnite_Frame',
		'MageNugSP_Frame',
		'MNabCast_Frame',
		'MageNugNova_Frame'
	}

	for _, object in pairs(Frames) do
		if _G[object] then
			AS:SkinBackdropFrame(_G[object], nil, true)
			if _G[object].SetBackdrop then _G[object]:SetBackdrop(nil) end
			if _G[object..'_ProcBar'] then
				_G[object..'_ProcBar']:SetStatusBarTexture(AS.NormTex)
			end
			if _G[object..'Texture'] then
				AS:SkinTexture(_G[object..'Texture'])
			end
		end
	end

	local SmallIcons = {
		'MNmoonFire_Frame',
		'MNinsectSwarm_Frame',
		'MNstarSurge_Frame',
	}

	for _, object in pairs(SmallIcons) do
		if _G[object].SetBackdrop then
			_G[object]:SetBackdrop(nil)
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

	for _, object in pairs({MageNugMI_Frame, MageNugCauterize_Frame, MageNugInvokers_Frame}) do
		AS:CreateBackdrop(object)
		AS:SetOutside(object.Backdrop, _G[object:GetName()..'Texture1'])
		AS:SkinTexture(_G[object:GetName()..'Texture1'])
	end

	MageNugMI_Frame_MiBar:SetPoint('LEFT', MageNugMI_FrameTexture1, 'LEFT', 20, 0)
	MageNugCauterize_Frame_Bar:SetPoint('LEFT', MageNugCauterize_FrameTexture1, 'LEFT', 20, 0)
	AS:SkinButton(MageNugHordeFrameClose)
	AS:SkinButton(MageNugHordeFrameShowOptions)
	AS:SkinButton(MageNugAlliFrameClose)
	AS:SkinButton(MageNugAlliFrameShowOptions)
	MNabCast_Frame:ClearAllPoints()
	MNabCast_Frame:SetPoint('BOTTOM', MageNugAB_Frame, 'TOP', 0, 6)
end

AS:RegisterSkin('MageNuggets', AS.MageNuggets)
