local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "OmenSkin"
function AS:SkinOmen()
	local borderWidth = 2

	Omen.UpdateTitleBar_ = Omen.UpdateTitleBar
	Omen.UpdateTitleBar = function(self)
		Omen.db.profile.Scale = 1
		Omen.db.profile.Background.EdgeSize = 1
		Omen.db.profile.Background.BarInset = borderWidth
		Omen.db.profile.TitleBar.UseSameBG = true
		self:UpdateTitleBar_()

		self.BarList:SetPoint("TOPLEFT", self.Title, "BOTTOMLEFT", 0, 1)
	end

	Omen.UpdateBackdrop_ = Omen.UpdateBackdrop
	Omen.UpdateBackdrop = function(self)
		Omen.db.profile.Scale = 1
		Omen.db.profile.Background.EdgeSize = 1
		Omen.db.profile.Background.BarInset = borderWidth
		self:UpdateBackdrop_()
		if not (AS:CheckOption("EmbedOmen")) then
			self.BarList:SetTemplate("Default")
			self.Title:SetTemplate("Default", True)
		end
		self.BarList:SetPoint("TOPLEFT", self.Title, "BOTTOMLEFT", 0, 1)
	end

	Omen.db.profile.Bar.Spacing = 1
	Omen.db.profile.Background.Texture = "ElvUI Blank"

	Omen:UpdateTitleBar()
	Omen:UpdateBackdrop()
	Omen:ReAnchorBars()
	Omen:ResizeBars()
end

AS:RegisterSkin(name, AS.SkinOmen)