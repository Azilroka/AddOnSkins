local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "AffDotsSkin"
function AS:SkinAffDots()
	AS:SkinBackdropFrame(AffDotsTarget)
	hooksecurefunc(AffDots, 'Box', function()
		for k,v in pairs(AffDots.track) do
			local c = AffDots.track[k]
			if not c.f.cd.isRegistered then
				ElvUI[1]:RegisterCooldown(c.f.cd)
				c.f.cd.isRegistered = true
			end
		end
	end)
	for k,v in pairs(AffDots.track) do
		local c = AffDots.track[k]
		if not c.f.cd.isRegistered then
			ElvUI[1]:RegisterCooldown(c.f.cd)
			c.f.cd.isRegistered = true
		end
	end
end

AS:RegisterSkin(name, AS.SkinAffDots)