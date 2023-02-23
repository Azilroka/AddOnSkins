local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('XPBarNone') then return end

function AS:XPBarNone(event, addon)
	S:CreateBackdrop(XPBarNoneXPBar)
end

AS:RegisterSkin('XPBarNone', AS.XPBarNone)
