local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Omen') then return end

local Omen = Omen

local _G = _G

function AS:Embed_Omen()
	local EmbedParent = _G.EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Omen' and _G.EmbedSystem_RightWindow or _G.EmbedSystem_LeftWindow end
	EmbedParent.FrameName = "OmenAnchor"

	Omen.BarList.SetBackdrop = nil
	Omen.BarList.SetBackdropColor = nil
	Omen.BarList.SetBackdropBorderColor = nil

	if AS:CheckOption('OmenBackdrop') then
		AS:SkinFrame(Omen.BarList, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	else
		AS:StripTextures(Omen.BarList)
	end

	Omen.BarList.SetBackdrop = AS.Noop
	Omen.BarList.SetBackdropColor = AS.Noop
	Omen.BarList.SetBackdropBorderColor = AS.Noop

	local db = Omen.db
	db.profile.Scale = 1
	db.profile.Bar.Spacing = 1
	db.profile.Background.EdgeSize = 1
	db.profile.Background.BarInset = 2
	db.profile.TitleBar.UseSameBG = true
	db.profile.ShowWith.UseShowWith = false
	db.profile.Locked = true
	db.profile.TitleBar.ShowTitleBar = true
	db.profile.FrameStrata = AS:CheckOption('EmbedFrameStrata')
	Omen:OnProfileChanged(nil, db)

	_G.OmenAnchor:SetParent(EmbedParent)
	_G.OmenAnchor:SetTemplate()
	_G.OmenAnchor:SetFrameLevel(AS:CheckOption('EmbedFrameLevel'))
	_G.OmenAnchor:SetBackdropColor(0,0,0,0)
	_G.OmenAnchor:ClearAllPoints()
	_G.OmenAnchor:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	_G.OmenAnchor:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
end
