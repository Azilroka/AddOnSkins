local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AffDots') then return end

function AS:AffDots()
	AS:SkinBackdropFrame(AffDotsTarget)
	AS:RegisterForPetBattleHide(AffDotsTarget)
end

AS:RegisterSkin('AffDots', AS.AffDots)
