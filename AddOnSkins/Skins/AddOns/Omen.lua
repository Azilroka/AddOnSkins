local AS, L, S, R = unpack(AddOnSkins)

function R:Omen()
	S:HandleFrame(_G.Omen.BarList)
	S:HandleFrame(_G.Omen.Title)

	_G.Omen.db.profile.Scale = 1
	_G.Omen.db.profile.Bar.Spacing = 1
	_G.Omen.db.profile.Background.EdgeSize = 1
	_G.Omen.db.profile.Background.BarInset = 2
	_G.Omen.db.profile.TitleBar.UseSameBG = true

	_G.Omen.BarList.SetBackdrop = S.noop
	_G.Omen.BarList.SetBackdropColor = S.noop
	_G.Omen.BarList.SetBackdropBorderColor = S.noop
	_G.Omen.Title.SetBackdrop = S.noop
	_G.Omen.Title.SetBackdropColor = S.noop
	_G.Omen.Title.SetBackdropBorderColor = S.noop

	_G.Omen:ReAnchorBars()
	_G.Omen:ResizeBars()
end

AS:RegisterSkin('Omen')
