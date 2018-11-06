local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Omen') then return end

function AS:Omen()
	AS:SkinFrame(_G.Omen.BarList)
	AS:SkinFrame(_G.Omen.Title)

	_G.Omen.db.profile.Scale = 1
	_G.Omen.db.profile.Bar.Spacing = 1
	_G.Omen.db.profile.Background.EdgeSize = 1
	_G.Omen.db.profile.Background.BarInset = 2
	_G.Omen.db.profile.TitleBar.UseSameBG = true

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
