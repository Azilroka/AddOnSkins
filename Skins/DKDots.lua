local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('DKDots') then return end

local name = 'DKDotsSkin'
function AS:SkinDKDots()
	AS:SkinBackdropFrame(DKDotsTarget)
end

AS:RegisterSkin(name, AS.SkinDKDots)