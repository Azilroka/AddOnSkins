local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Omen') then return end

local name = 'OmenSkin'
function AS:SkinOmen()
	Omen.db.profile.Scale = 1
	Omen.db.profile.Bar.Spacing = 1
	Omen.db.profile.Background.EdgeSize = 2
	Omen.db.profile.Background.BarInset = 2
	Omen.db.profile.TitleBar.UseSameBG = true

	hooksecurefunc(Omen, 'UpdateBackdrop', function(self)
		if not AS:CheckEmbed('Omen') then
			AS:SkinFrame(self.BarList, 'Default')
			AS:SkinTitleBar(self.Title, 'Default')
		end
		self.BarList:SetPoint('TOPLEFT', self.Title, 'BOTTOMLEFT', 0, 1)
	end)

	hooksecurefunc(Omen, 'Toggle', function(self)
		if not AS:CheckEmbed('Omen') then return end
		if self.Anchor:IsShown() then
			EmbedSystem_MainWindow:Show()
		else
			EmbedSystem_MainWindow:Hide()
		end
	end)

	Omen:UpdateBackdrop()
	Omen:ReAnchorBars()
	Omen:ResizeBars()
end

AS:RegisterSkin(name, AS.SkinOmen)