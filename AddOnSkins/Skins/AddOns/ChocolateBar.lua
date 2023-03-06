local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('ChocolateBar') then return end

function R:ChocolateBar()
	for i = 1, 20 do
		local f = _G['ChocolateBar'..i]
		if f then
			S:HandleFrame(f, 'Default')
		end
	end
end

AS:RegisterSkin('ChocolateBar', R.ChocolateBar)
