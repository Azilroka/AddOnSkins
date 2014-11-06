local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('SpineCounter') then return end

function AS:SpineCounter()
	AS:SkinFrame(SCOutput)
end

AS:RegisterSkin('SpineCounter', AS.SpineCounter)