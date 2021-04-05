local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('XPBarNone') then return end

function AS:XPBarNone(event, addon)
	AS:CreateBackdrop(XPBarNoneXPBar)
end

AS:RegisterSkin('XPBarNone', AS.XPBarNone)