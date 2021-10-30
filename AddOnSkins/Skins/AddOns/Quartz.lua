local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Quartz') then return end

function AS:Quartz()
	local Quartz3 = LibStub("AceAddon-3.0"):GetAddon("Quartz3")
	local GCD = Quartz3:GetModule("GCD")
	local CastBar = Quartz3.CastBarTemplate.template

	local function SkinQuartzBar(self)
		if not self.isSkinned then
			self.IconBorder = CreateFrame("Frame", nil, self)
			AS:SkinFrame(self.IconBorder)
			self.IconBorder:SetFrameLevel(0)
			AS:SetOutside(self.IconBorder, self.Icon)
			AS:SkinBackdropFrame(self.Bar, nil, true)
			self.isSkinned = true
		end
		if self.config.hideicon then
			self.IconBorder:Hide()
		else
			self.IconBorder:Show()
		end
		if Quartz3GCDBar and not Quartz3GCDBar.isSkinned then AS:SkinBackdropFrame(Quartz3GCDBar, nil, true) Quartz3GCDBar.isSkinned = true end
	end

	hooksecurefunc(CastBar, 'UNIT_SPELLCAST_START', SkinQuartzBar)
	hooksecurefunc(CastBar, 'UNIT_SPELLCAST_CHANNEL_START', SkinQuartzBar)
end

AS:RegisterSkin('Quartz', AS.Quartz)
