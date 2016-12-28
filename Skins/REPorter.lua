local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('REPorter') then return end

function AS:REPorter()
	AS:SkinBackdropFrame(REPorterBorder, 'Transparent')
	AS:SkinFrame(REPorterTab)
	for _, i in pairs({'SB1', 'SB2', 'SB3', 'SB4', 'SB5', 'SB6', 'BB1', 'BB2'}) do
		AS:SkinButton(_G['REPorterTab_'..i])
	end
	REPorterTab_SB1:SetPoint("TOPLEFT", REPorterTab, "TOPLEFT", 3, -3)
	REPorterTab:SetWidth(31)
	REPorterTab:SetHeight(206)
	REPorterBorder:SetFrameLevel(2)
end

AS:RegisterSkin('REPorter', AS.REPorter)
