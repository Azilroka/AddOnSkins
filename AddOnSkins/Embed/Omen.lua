local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('Omen') then return end

-- Cache global variables
--Lua functions
local _G = _G
--WoW API / Variables
-- GLOBALS:

function AS:Embed_Omen()
	local EmbedParent = _G.EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Omen' and _G.EmbedSystem_RightWindow or _G.EmbedSystem_LeftWindow end

	_G.Omen.BarList.SetBackdrop = nil
	_G.Omen.BarList.SetBackdropColor = nil
	_G.Omen.BarList.SetBackdropBorderColor = nil

	if AS:CheckOption('EmbedBackdrop') then
		AS:SkinFrame(_G.Omen.BarList, AS:CheckOption('EmbedBackdropTransparent') and 'Transparent')
	else
		AS:StripTextures(_G.Omen.BarList)
	end

	_G.Omen.BarList.SetBackdrop = AS.Noop
	_G.Omen.BarList.SetBackdropColor = AS.Noop
	_G.Omen.BarList.SetBackdropBorderColor = AS.Noop

	_G.Omen.db.profile.Scale = 1
	_G.Omen.db.profile.Bar.Spacing = 1
	_G.Omen.db.profile.Background.EdgeSize = 1
	_G.Omen.db.profile.Background.BarInset = 2
	_G.Omen.db.profile.TitleBar.UseSameBG = true
	_G.Omen.db.profile.ShowWith.UseShowWith = false
	_G.Omen.db.profile.Locked = true
	_G.Omen.db.profile.TitleBar.ShowTitleBar = true
	_G.Omen.db.profile.FrameStrata = AS:CheckOption('EmbedFrameStrata')
	_G.Omen:OnProfileChanged(nil, _G.Omen.db)

	_G.OmenAnchor:SetParent(EmbedParent)
	AS:SetTemplate(_G.OmenAnchor)
	_G.OmenAnchor:SetFrameLevel(AS:CheckOption('EmbedFrameLevel'))
	_G.OmenAnchor:SetBackdropColor(0, 0, 0, 0)
	_G.OmenAnchor:ClearAllPoints()
	_G.OmenAnchor:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	_G.OmenAnchor:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
end
