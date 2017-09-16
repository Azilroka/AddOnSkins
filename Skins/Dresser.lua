local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Dresser') then return end

function AS:Dresser()

	for i = 1, 4 do
		local Button = _G['DressUpFrameLegacyDresser'..i]
		AS:SkinButton(Button)
		Button:SetSize(38, 22)
		Button:ClearAllPoints()
		if i == 1 then
			Button:SetPoint('BOTTOMLEFT', DressUpFrame, 'BOTTOMLEFT', 138, 79)
		elseif i == 2 then
			Button:SetPoint('BOTTOMLEFT', DressUpFrame, 'BOTTOMLEFT', 96, 79)
		elseif i == 3 then
			Button:SetPoint('BOTTOMLEFT', DressUpFrame, 'BOTTOMLEFT', 54, 79)
		elseif i == 4 then
			Button:SetPoint('BOTTOMLEFT', DressUpFrame, 'BOTTOMLEFT', 12, 79)
		end
	end
end

AS:RegisterSkin('Dresser', AS.Dresser)