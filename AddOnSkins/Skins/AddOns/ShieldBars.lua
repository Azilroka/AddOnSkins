local AS, L, S, R = unpack(AddOnSkins)

function R:ShieldBars()
	hooksecurefunc(ShieldBars, 'DisplayShields', function()
		local i = 1
		while _G['ShieldBarsStatusBar'..i..'Frame'] do
			S:HandleFrame(_G['ShieldBarsStatusBar'..i..'Frame'], false, true)
			i = i + 1
		end
	end)
end

AS:RegisterSkin('ShieldBars')
