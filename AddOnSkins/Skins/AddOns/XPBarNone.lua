local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('XPBarNone') then return end

function R:XPBarNone(event, addon)
	S:CreateBackdrop(XPBarNoneXPBar)
end

AS:RegisterSkin('XPBarNone', R.XPBarNone)
