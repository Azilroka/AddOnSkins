local AS, L, S, R = unpack(AddOnSkins)

function R:Quartz()
	local Quartz3 = LibStub("AceAddon-3.0"):GetAddon("Quartz3")
	local GCD = Quartz3:GetModule("GCD")
	local CastBar = Quartz3.CastBarTemplate.template

	local function SkinQuartzBar(self)
		if not self.isSkinned then
			self.IconBorder = CreateFrame("Frame", nil, self)
			S:HandleFrame(self.IconBorder)
			self.IconBorder:SetFrameLevel(0)
			S:SetOutside(self.IconBorder, self.Icon)
			S:HandleFrame(self.Bar, true)
			self.isSkinned = true
		end
		if self.config.hideicon then
			self.IconBorder:Hide()
		else
			self.IconBorder:Show()
		end
		if Quartz3GCDBar and not Quartz3GCDBar.isSkinned then S:HandleFrame(Quartz3GCDBar, true) Quartz3GCDBar.isSkinned = true end
	end

	hooksecurefunc(CastBar, 'UNIT_SPELLCAST_START', SkinQuartzBar)
	hooksecurefunc(CastBar, 'UNIT_SPELLCAST_CHANNEL_START', SkinQuartzBar)
end

AS:RegisterSkin('Quartz')
