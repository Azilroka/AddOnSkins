local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RaidTargets') then return end

function AS:RaidTargets()
	AS:SkinFrame(RTFrame)
end

AS:RegisterSkin('RaidTargets', AS.RaidTargets)