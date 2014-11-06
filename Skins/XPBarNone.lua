local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('XPBarNone') then return end

function AS:XPBarNone(event, addon)
	XPBarNoneXPBar:CreateBackdrop('Transparent')
end

AS:RegisterSkin('XPBarNone', AS.XPBarNone)