local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('DKDots') then return end

function AS:DKDots()
	AS:SkinBackdropFrame(DKDotsTarget)
end

AS:RegisterSkin('DKDots', AS.DKDots)