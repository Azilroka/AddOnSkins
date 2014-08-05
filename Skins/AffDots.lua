local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AffDots') then return end

local name = 'AffDotsSkin'
function AS:SkinAffDots()
	AS:SkinBackdropFrame(AffDotsTarget)
	if IsAddOnLoaded('ElvUI') then
		for k,v in pairs(AffDots.track) do
			local c = AffDots.track[k]
			ElvUI[1]:RegisterCooldown(c.f.cd)
		end
	end
end

AS:RegisterSkin(name, AS.SkinAffDots)