local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ShieldBars') then return end

local name = 'ShieldBarsSkin'
function AS:SkinShieldBars()
	hooksecurefunc(ShieldBars, 'DisplayShields', function()
		local i = 1
		while _G['ShieldBarsStatusBar'..i..'Frame'] do
			AS:SkinFrame(_G['ShieldBarsStatusBar'..i..'Frame'], false, true)
			i = i + 1
		end
	end)
end

AS:RegisterSkin(name, AS.SkinShieldBars)	