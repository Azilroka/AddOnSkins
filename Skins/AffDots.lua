local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AffDots') then return end

local name = 'AffDotsSkin'
function AS:SkinAffDots()
	AS:SkinBackdropFrame(AffDotsTarget)
end

AS:RegisterSkin(name, AS.SkinAffDots)