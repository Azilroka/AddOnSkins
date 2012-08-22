if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Quartz") then return end
local Q3 = LibStub("AceAddon-3.0"):GetAddon("Quartz3")
local SkinQuartz = CreateFrame("Frame")
	SkinQuartz:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinQuartz:SetScript("OnEvent", function(self)
	if (UISkinOptions.QuartzSkin ~= "Enabled") then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")

	SkinQuartzBar = function(self, bar)
		Quartz3CastBarPlayer:SetTemplate("Transparent")
		Quartz3CastBarPlayer.IconBorder = CreateFrame("Frame", nil, Quartz3CastBarPlayer)
		Quartz3CastBarPlayer.IconBorder:SetTemplate("Transparent")
		Quartz3CastBarPlayer.IconBorder:SetPoint("TOPLEFT",Quartz3CastBarPlayer.Icon, "TOPLEFT", -2, 2)
		Quartz3CastBarPlayer.IconBorder:SetPoint("BOTTOMRIGHT", Quartz3CastBarPlayer.Icon, "BOTTOMRIGHT", 2, -2)
		Quartz3CastBarPlayer.IconBorder:SetFrameStrata("LOW")

		Quartz3CastBarFocus:SetTemplate("Transparent")
		Quartz3CastBarFocus.IconBorder = CreateFrame("Frame", nil, Quartz3CastBarFocus)
		Quartz3CastBarFocus.IconBorder:SetTemplate("Transparent")
		Quartz3CastBarFocus.IconBorder:SetPoint("TOPLEFT",Quartz3CastBarFocus.Icon, "TOPLEFT", -2, 2)
		Quartz3CastBarFocus.IconBorder:SetPoint("BOTTOMRIGHT", Quartz3CastBarFocus.Icon, "BOTTOMRIGHT", 2, -2)
		Quartz3CastBarFocus.IconBorder:SetFrameStrata("LOW")

		Quartz3CastBarTarget:SetTemplate("Transparent")
		Quartz3CastBarTarget.IconBorder = CreateFrame("Frame", nil, Quartz3CastBarTarget)
		Quartz3CastBarTarget.IconBorder:SetTemplate("Transparent")
		Quartz3CastBarTarget.IconBorder:SetPoint("TOPLEFT",Quartz3CastBarTarget.Icon, "TOPLEFT", -2, 2)
		Quartz3CastBarTarget.IconBorder:SetPoint("BOTTOMRIGHT", Quartz3CastBarTarget.Icon, "BOTTOMRIGHT", 2, -2)
		Quartz3CastBarTarget.IconBorder:SetFrameStrata("LOW")

		Quartz3CastBarPet:SetTemplate("Transparent")
		Quartz3CastBarPet.IconBorder = CreateFrame("Frame", nil, Quartz3CastBarPet)
		Quartz3CastBarPet.IconBorder:SetTemplate("Transparent")
		Quartz3CastBarPet.IconBorder:SetPoint("TOPLEFT",Quartz3CastBarPet.Icon, "TOPLEFT", -2, 2)
		Quartz3CastBarPet.IconBorder:SetPoint("BOTTOMRIGHT", Quartz3CastBarPet.Icon, "BOTTOMRIGHT", 2, -2)
		Quartz3CastBarPet.IconBorder:SetFrameStrata("LOW")
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