local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ChocolateBar') then return end

local name = 'ChocolateBarSkin'
function AS:SkinChocolateBar()
	for i = 1, 20 do 	
		local f = _G['ChocolateBar'..i]
		if f then
			AS:SkinFrame(f, 'Default')
		end
	end
	if RaidUtility_ShowButton then
		RaidUtility_ShowButton:SetFrameStrata('TOOLTIP')
	end
end

AS:RegisterSkin(name, AS.SkinChocolateBar)