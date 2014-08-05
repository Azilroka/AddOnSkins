local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('XPBarNone') then return end

local name = 'XPBarNoneSkin'
function AS:SkinXPBarNone(event, addon)
	XPBarNoneXPBar:CreateBackdrop('Transparent')
end

AS:RegisterSkin(name, AS.SkinXPBarNone)