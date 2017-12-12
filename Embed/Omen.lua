local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Omen') then return end

local _G = _G

function AS:Embed_Omen()
	local EmbedParent = _G.EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = strlower(AS:CheckOption('EmbedRight')) == 'omen' and _G.EmbedSystem_RightWindow or _G.EmbedSystem_LeftWindow end

	_G.Omen.BarList.SetBackdrop = nil
	_G.Omen.BarList.SetBackdropColor = nil
	_G.Omen.BarList.SetBackdropBorderColor = nil

	if AS:CheckOption('OmenBackdrop') then
		AS:SkinFrame(_G.Omen.BarList, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	else
		AS:StripTextures(_G.Omen.BarList)
	end

	_G.Omen.BarList.SetBackdrop = AS.Noop
	_G.Omen.BarList.SetBackdropColor = AS.Noop
	_G.Omen.BarList.SetBackdropBorderColor = AS.Noop

	local db = _G.Omen.db
	db.profile.Scale = 1
	db.profile.Bar.Spacing = 1
	db.profile.Background.EdgeSize = 1
	db.profile.Background.BarInset = 2
	db.profile.TitleBar.UseSameBG = true
	db.profile.ShowWith.UseShowWith = false
	db.profile.Locked = true
	db.profile.TitleBar.ShowTitleBar = true
	db.profile.FrameStrata = AS:CheckOption('EmbedFrameStrata')
	_G.Omen:OnProfileChanged(nil, db)

	_G.OmenAnchor:SetParent(EmbedParent)
	_G.OmenAnchor:SetTemplate()
	_G.OmenAnchor:SetFrameLevel(AS:CheckOption('EmbedFrameLevel'))
	_G.OmenAnchor:SetBackdropColor(0,0,0,0)
	_G.OmenAnchor:ClearAllPoints()
	_G.OmenAnchor:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	_G.OmenAnchor:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
end
