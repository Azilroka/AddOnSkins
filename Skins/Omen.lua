local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Omen') then return end

function AS:Omen()
	AS:SkinFrame(_G.Omen.BarList, 'Default')
	AS:SkinFrame(_G.Omen.Title, 'Default')

	local db = _G.Omen.db
	db.profile.Scale = 1
	db.profile.Bar.Spacing = 1
	db.profile.Background.EdgeSize = 1
	db.profile.Background.BarInset = 2
	db.profile.TitleBar.UseSameBG = true

	_G.Omen.BarList.SetBackdrop = AS.Noop
	_G.Omen.BarList.SetBackdropColor = AS.Noop
	_G.Omen.BarList.SetBackdropBorderColor = AS.Noop
	_G.Omen.Title.SetBackdrop = AS.Noop
	_G.Omen.Title.SetBackdropColor = AS.Noop
	_G.Omen.Title.SetBackdropBorderColor = AS.Noop

	_G.Omen:ReAnchorBars()
	_G.Omen:ResizeBars()
end

AS:RegisterSkin('Omen', AS.Omen)
