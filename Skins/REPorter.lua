local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('REPorter') then return end

function AS:REPorter()
	AS:SkinBackdropFrame(REPorterFrameBorder, 'Transparent')
	AS:SkinFrame(REPorterFrameTab)
	for _, i in pairs({'SB1', 'SB2', 'SB3', 'SB4', 'SB5', 'SB6', 'BB1', 'BB2'}) do
		AS:SkinButton(_G['REPorterFrameTab_'..i])
	end
	REPorterFrameTab_SB1:SetPoint("TOPLEFT", REPorterFrameTab, "TOPLEFT", 3, -3)
	REPorterFrameTab:SetWidth(31)
	REPorterFrameTab:SetHeight(206)
	REPorterFrameBorder:SetFrameLevel(2)
end

AS:RegisterSkin('REPorter', AS.REPorter)
