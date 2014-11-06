local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Omen') then return end

function AS:Omen()
	Omen.db.profile.Scale = 1
	Omen.db.profile.Bar.Spacing = 1
	Omen.db.profile.Background.EdgeSize = 1
	Omen.db.profile.Background.BarInset = 2
	Omen.db.profile.TitleBar.UseSameBG = true

	AS:SkinFrame(Omen.BarList, 'Default')
	AS:SkinTitleBar(Omen.Title, 'Default')
	Omen.BarList.SetBackdrop = AS.Noop
	Omen.BarList.SetBackdropColor = AS.Noop
	Omen.BarList.SetBackdropBorderColor = AS.Noop
	Omen.Title.SetBackdrop = AS.Noop
	Omen.Title.SetBackdropColor = AS.Noop
	Omen.Title.SetBackdropBorderColor = AS.Noop

	hooksecurefunc(Omen, 'Toggle', function(self)
		if not AS:CheckEmbed('Omen') then return end
		if self.Anchor:IsShown() then
			EmbedSystem_MainWindow:Show()
		else
			EmbedSystem_MainWindow:Hide()
		end
	end)

	Omen:ReAnchorBars()
	Omen:ResizeBars()
end

AS:RegisterSkin('Omen', AS.Omen)