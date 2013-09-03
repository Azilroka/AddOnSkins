local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "QuartzSkin"
function AS:SkinQuartz()
	local Quartz3 = LibStub("AceAddon-3.0"):GetAddon("Quartz3")
	local GCD = Quartz3:GetModule("GCD")
	local CastBar = Quartz3.CastBarTemplate.template

	local function SkinQuartzBar(self)
		if not self.isSkinned then
			self.IconBorder = CreateFrame("Frame", nil, self.Icon)
			AS:SkinFrame(self.IconBorder)
			self.IconBorder:SetFrameLevel(0)
			self.IconBorder:SetOutside(self.Icon)
			AS:SkinBackdropFrame(self.Bar, nil, true)
			self.isSkinned = true
		end
		if not Quartz3GCDBar.backdrop then
			AS:SkinBackdropFrame(Quartz3GCDBar, nil, true)
		end
	end

	hooksecurefunc(CastBar, 'ApplySettings', SkinQuartzBar)
	--[[hooksecurefunc(GCD, 'ApplySettings', function()
		if not Quartz3GCDBar.backdrop then
			AS:SkinBackdropFrame(Quartz3GCDBar, nil, true)
		end
	end)]]
end

AS:RegisterSkin(name, AS.SkinQuartz)