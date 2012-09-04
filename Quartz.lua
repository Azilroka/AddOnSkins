if not (IsAddOnLoaded( "ElvUI" ) or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("Quartz") then return end
local Q3 = LibStub("AceAddon-3.0"):GetAddon("Quartz3")
if not Q3 then return end
local SkinQuartz = CreateFrame("Frame")
	SkinQuartz:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinQuartz:SetScript("OnEvent", function(self)
	if (UISkinOptions.QuartzSkin ~= "Enabled") then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c
	if IsAddOnLoaded("Tukui") then UIFont = [[Interface\AddOns\Tukui\medias\fonts\normal_font.ttf]] UIFontSize = 12 end
	if IsAddOnLoaded("ElvUI") then UIFont = [[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]] UIFontSize = 12 end

	SkinQuartzBar = function(self, bar)
		self:SetTemplate("Transparent")
		if not self.IconBorder then
			self.IconBorder = CreateFrame("Frame", nil, self)
			self.IconBorder:SetTemplate("Transparent")
			self.IconBorder:SetPoint("TOPLEFT",self.Icon, "TOPLEFT", -2, 2)
			self.IconBorder:SetPoint("BOTTOMRIGHT", self.Icon, "BOTTOMRIGHT", 2, -2)
			self.IconBorder:SetFrameStrata("LOW")
		end
		if self.config.hideicon then
			self.IconBorder:Hide()
		else
			self.IconBorder:Show()
		end
		self.Text:SetFont(UIFont,UIFontSize)
		self.TimeText:SetFont(UIFont,UIFontSize)
		self.Bar:SetStatusBarTexture(c["media"].normTex)
	end

	local template = Q3.CastBarTemplate.template
	
	template.ApplySettings_ = template.ApplySettings
	template.ApplySettings = function (self)
		self:ApplySettings_()
		self:SetWidth(self.config.w + 2 * 2)
		self:SetHeight(self.config.h + 2 * 2)

		self.Bar:SetFrameStrata("HIGH")
		self:SetFrameStrata("HIGH")
	end
	template.UNIT_SPELLCAST_NOT_INTERRUPTIBLE_ = template.UNIT_SPELLCAST_NOT_INTERRUPTIBLE
	template.UNIT_SPELLCAST_NOT_INTERRUPTIBLE = function(self, event, unit)
		self:UNIT_SPELLCAST_NOT_INTERRUPTIBLE_(event, unit)
		SkinQuartzBar(self)
	end
	template.UNIT_SPELLCAST_START_ = template.UNIT_SPELLCAST_START
	template.UNIT_SPELLCAST_START = function(self, event, unit)
		self:UNIT_SPELLCAST_START_(event, unit)
		SkinQuartzBar(self)
	end
	template.UNIT_SPELLCAST_CHANNEL_START_ = template.UNIT_SPELLCAST_CHANNEL_START
	template.UNIT_SPELLCAST_CHANNEL_START = function(self, event, unit)
		self:UNIT_SPELLCAST_CHANNEL_START_(event, unit)
		SkinQuartzBar(self)
	end

	Q3:ApplySettings()
end)
