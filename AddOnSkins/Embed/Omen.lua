local AS, L, S, R = unpack(AddOnSkins)
if not AS:CheckAddOn('Omen') then return end

local _G = _G
local ES = AS.EmbedSystem

function ES:Omen()
	local EmbedParent = AS:CheckOption('EmbedSystemDual') and (AS:CheckOption('EmbedRight') == 'Omen' and ES.Right or ES.Left) or ES.Main

	_G.Omen.BarList.SetBackdrop = nil
	_G.Omen.BarList.SetBackdropColor = nil
	_G.Omen.BarList.SetBackdropBorderColor = nil

	S:SetTemplate(_G.Omen.BarList, AS:CheckOption('EmbedBackdrop') and (AS:CheckOption('EmbedBackdropTransparent') and 'Transparent' or 'Default') or 'NoBackdrop')

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
	S:SetTemplate(_G.OmenAnchor)
	_G.OmenAnchor:SetFrameLevel(AS:CheckOption('EmbedFrameLevel'))
	_G.OmenAnchor:SetBackdropColor(0, 0, 0, 0)
	_G.OmenAnchor:ClearAllPoints()
	_G.OmenAnchor:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	_G.OmenAnchor:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
end
