local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('ChocolateBar') then return end

local name = "ChocolateBarSkin"
function AS:SkinChocolateBar()
	for i = 1, 20 do 	
		local f = _G["ChocolateBar"..i]
		if f then
			AS:SkinFrame(f, "Default")
		end
	end
end

AS:RegisterSkin(name, AS.SkinChocolateBar)