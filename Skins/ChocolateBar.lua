local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ChocolateBar') then return end

function AS:ChocolateBar()
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

AS:RegisterSkin('ChocolateBar', AS.ChocolateBar)