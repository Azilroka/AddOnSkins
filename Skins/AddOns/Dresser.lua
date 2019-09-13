local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Dresser') then return end

function AS:Dresser()

	for i = 1, 4 do
		local Button = _G['DressUpFrameLegacyDresser'..i]
		AS:SkinButton(Button)
		Button:SetSize(38, 22)
	end

	DressUpFrameLegacyDresser1:SetPoint('RIGHT', DressUpFrameResetButton, 'LEFT', -2, 0)
	DressUpFrameLegacyDresser2:SetPoint('RIGHT', DressUpFrameLegacyDresser1, 'LEFT', -2, 0)
	DressUpFrameLegacyDresser3:SetPoint('RIGHT', DressUpFrameLegacyDresser2, 'LEFT', -2, 0)
	DressUpFrameLegacyDresser4:SetPoint('RIGHT', DressUpFrameLegacyDresser3, 'LEFT', -2, 0)
end

AS:RegisterSkin('Dresser', AS.Dresser)