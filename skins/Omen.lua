local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'OmenSkin'
function AS:SkinOmen()
	if TukuiThreatBar then TukuiThreatBar:Kill() end
	Omen.db.profile.Scale = 1
	Omen.db.profile.Bar.Spacing = 1
	Omen.db.profile.Background.EdgeSize = 2
	Omen.db.profile.Background.BarInset = 2
	Omen.db.profile.TitleBar.UseSameBG = true

	hooksecurefunc(Omen, 'UpdateBackdrop', function(self)
		AS:SkinFrame(self.BarList, 'Default')
		AS:SkinFrame(self.Title, 'Default')
		self.BarList:SetPoint('TOPLEFT', self.Title, 'BOTTOMLEFT', 0, 1)
	end)

	Omen:UpdateBackdrop()
	Omen:ReAnchorBars()
	Omen:ResizeBars()
end

AS:RegisterSkin(name, AS.SkinOmen)