local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('REPorter') then return end

function AS:REPorter()
	AS:StripTextures(REPorterFrameBorder)
	AS:SkinBackdropFrame(REPorterFrameBG, 'Transparent')
	REPorterFrameBG:SetOutside(nil, 2, 2)
	REPorterFrameBorderResize:Point('BOTTOMRIGHT', REPorterFrameBorder, 'BOTTOMRIGHT', 2, -2)

	AS:SkinFrame(REPorterBar)
	for _, i in pairs({'B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'B7', 'B8'}) do
		AS:SkinButton(_G['REPorterBar'..i])
	end
end

AS:RegisterSkin('REPorter', AS.REPorter)
