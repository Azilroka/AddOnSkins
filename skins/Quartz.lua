local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "QuartzSkin"
function AS:SkinQuartz()
	local Q3 = LibStub("AceAddon-3.0"):GetAddon("Quartz3")
	local Q3CastBar = Q3.CastBarTemplate.template

	local function SkinQuartzBar(self)
		if not self.IconBorder then
			self.IconBorder = CreateFrame("Frame", nil, self)
			AS:SkinFrame(self.IconBorder)
			self.IconBorder:SetFrameLevel(0)
			self.IconBorder:SetOutside(self.Icon, 2, 2)
		end
		if self.config.hideicon then
			self.IconBorder:Hide()
		else
			self.IconBorder:Show()
		end
		if not self.Bar.backdrop then AS:SkinBackdropFrame(self.Bar, nil, true) end
		if not Quartz3GCDBar.backdrop then AS:SkinBackdropFrame(Quartz3GCDBar, nil, true) end
	end

	hooksecurefunc(Q3CastBar, 'UNIT_SPELLCAST_NOT_INTERRUPTIBLE', SkinQuartzBar)
	hooksecurefunc(Q3CastBar, 'UNIT_SPELLCAST_START', SkinQuartzBar)
	hooksecurefunc(Q3CastBar, 'UNIT_SPELLCAST_CHANNEL_START', SkinQuartzBar)

	Q3:ApplySettings()
end

AS:RegisterSkin(name, AS.SkinQuartz)