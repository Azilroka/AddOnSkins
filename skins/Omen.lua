local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

function AS:EmbedOmen()
	if not IsAddOnLoaded("Omen") then AS:DisableOption("EmbedOmen") return end
	if (AS:CheckOption("EmbedOoC")) then
		if (AS:CheckOption("EmbedOmen")) then
			OmenBarList:Hide()
		end
	end
		Omen.db.profile.Locked = true
		Omen:UpdateGrips()
		Omen.UpdateGrips = function(...)
			local db = Omen.db.profile
				Omen.VGrip1:ClearAllPoints()
				Omen.VGrip1:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip1, 0)
				Omen.VGrip1:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip1, 0)
				Omen.VGrip2:ClearAllPoints()
				Omen.VGrip2:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip2, 0)
				Omen.VGrip2:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip2, 0)
				Omen.Grip:Hide()
				if db.Locked then
					Omen.VGrip1:Hide()
					Omen.VGrip2:Hide()
				else
					Omen.VGrip1:Show()
					if db.Bar.ShowTPS then
						Omen.VGrip2:Show()
					else
						Omen.VGrip2:Hide()
					end
				end
		end
		OmenTitle:Kill()
		OmenBarList:StripTextures()
		OmenBarList:SetTemplate("Default")
		OmenAnchor:ClearAllPoints()
		OmenBarList:SetPoint("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 0)
		OmenBarList:SetPoint("BOTTOMRIGHT", EmbeddingWindow, "BOTTOMRIGHT", 0, 2)
		if (AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel) then OmenBarList:SetParent((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel)) end
		OmenBarList:SetFrameStrata("HIGH")
end

local name = "OmenSkin"
local function SkinOmen(self)
	local borderWidth = 2

	Omen.UpdateBarTextureSettings_ = Omen.UpdateBarTextureSettings
	Omen.UpdateBarTextureSettings = function(self)
		for i, v in ipairs(self.Bars) do
			v.texture:SetTexture(AS.LSM:Fetch("statusbar",E.private.general.normTex))
		end
	end

	Omen.UpdateBarLabelSettings_ = Omen.UpdateBarLabelSettings
	Omen.UpdateBarLabelSettings = function(self)
		self:UpdateBarLabelSettings_()
		for i, v in ipairs(self.Bars) do
			v.Text1:FontTemplate(nil, self.db.profile.Bar.FontSize)
			v.Text2:FontTemplate(nil, self.db.profile.Bar.FontSize)
			v.Text3:FontTemplate(nil, self.db.profile.Bar.FontSize)
		end
	end

	Omen.UpdateTitleBar_ = Omen.UpdateTitleBar
	Omen.UpdateTitleBar = function(self)
		Omen.db.profile.Scale = 1
		Omen.db.profile.Background.EdgeSize = 1
		Omen.db.profile.Background.BarInset = borderWidth
		Omen.db.profile.TitleBar.UseSameBG = true
		self:UpdateTitleBar_()

		self.TitleText:FontTemplate(nil, self.db.profile.TitleBar.FontSize)
		self.BarList:SetPoint("TOPLEFT", self.Title, "BOTTOMLEFT", 0, 1)
	end

	Omen.UpdateBackdrop_ = Omen.UpdateBackdrop
	Omen.UpdateBackdrop = function(self)
		Omen.db.profile.Scale = 1
		Omen.db.profile.Background.EdgeSize = 1
		Omen.db.profile.Background.BarInset = borderWidth
		self:UpdateBackdrop_()
		self.BarList:SetTemplate("Default")
		self.Title:SetTemplate("Default", True)
		self.BarList:SetPoint("TOPLEFT", self.Title, "BOTTOMLEFT", 0, 1)
	end

	local omen_mt = getmetatable(Omen.Bars)
	local oldidx = omen_mt.__index
	omen_mt.__index = function(self, barID)
		local bar = oldidx(self, barID)
		Omen:UpdateBarTextureSettings()
		Omen:UpdateBarLabelSettings()
		return bar
	end

	Omen.db.profile.Bar.Spacing = 1

	Omen.db.profile.Background.Texture = "ElvUI Blank"

	Omen:UpdateBarTextureSettings()
	Omen:UpdateBarLabelSettings()
	Omen:UpdateTitleBar()
	Omen:UpdateBackdrop()
	Omen:ReAnchorBars()
	Omen:ResizeBars()
end

AS:RegisterSkin(name,SkinOmen)