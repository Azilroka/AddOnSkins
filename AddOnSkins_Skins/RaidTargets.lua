local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RaidTargets') then return end

local name = 'RaidTargetsSkin'
function AS:SkinRaidTargets()
	AS:SkinFrame(RTFrame)
end

AS:RegisterSkin(name, AS.SkinRaidTargets)