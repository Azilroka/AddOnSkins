local AS, L, S, R = unpack(AddOnSkins)

function R:Quartz()
	local Quartz3 = LibStub("AceAddon-3.0"):GetAddon("Quartz3")
	local GCD = Quartz3:GetModule("GCD")
	local CastBar = Quartz3.CastBarTemplate.template

	local function SkinQuartzBar(self)
		if not self.isSkinned then
			local oldTex = self.Icon:GetTexture()
			S:StripTextures(self)
			S:HandleIcon(self.Icon, true)
			S:HandleStatusBar(self.Bar, nil, nil, true)
			self.Icon:SetTexture(oldTex)
			self.isSkinned = true
		end
		if Quartz3GCDBar and not Quartz3GCDBar.isSkinned then S:HandleFrame(Quartz3GCDBar, true) Quartz3GCDBar.isSkinned = true end
	end

	hooksecurefunc(CastBar, 'UNIT_SPELLCAST_START', SkinQuartzBar)
	hooksecurefunc(CastBar, 'UNIT_SPELLCAST_CHANNEL_START', SkinQuartzBar)
end

AS:RegisterSkin('Quartz')
