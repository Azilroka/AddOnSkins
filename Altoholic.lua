if not IsAddOnLoaded("Altoholic") then return end

AltoMsgBox:StripTextures()
AltoMsgBox:SetTemplate("Transparent")
cSkinButton(AltoMsgBoxYesButton)
cSkinButton(AltoMsgBoxNoButton)

AltoholicFrame:StripTextures()
AltoholicFrame:SetTemplate("Transparent")
AltoholicFrameActivity:StripTextures()
AltoholicFrameActivity:SetTemplate("Transparent")
AltoholicFrameBagUsage:StripTextures()
AltoholicFrameBagUsage:SetTemplate("Transparent")
AltoholicFrameSkills:StripTextures()
AltoholicFrameSkills:SetTemplate("Transparent")
AltoholicFrameSummary:StripTextures()
AltoholicFrameSummary:SetTemplate("Transparent")
AltoholicFramePortrait:Kill()
--Buttons
cSkinButton(AltoholicFrame_ResetButton)
AltoholicFrame_ResetButton:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 25, -77)
cSkinButton(AltoholicFrame_SearchButton)
AltoholicFrame_ResetButton:Size(85, 24)
AltoholicFrame_SearchButton:Size(85, 24)

--Summary
for i = 1, 4 do
	_G["AltoholicTabSummaryMenuItem"..i]:StripTextures()
	_G["AltoholicTabSummaryMenuItem"..i]:SetTemplate("Default")	
end

--Sorts
for i = 1, 8 do
	_G["AltoholicTabSummary_Sort"..i]:StripTextures()
	_G["AltoholicTabSummary_Sort"..i]:SetTemplate("Default")
end

-- Buttons
cSkinCloseButton(AltoholicFrameCloseButton)

--Tabs
for i = 1, 7 do
	cSkinTab(_G["AltoholicFrameTab"..i])
end

-- Drop Downs
cSkinDropDownBox(AltoholicTabSummary_SelectLocation)
AltoholicTabSummary_SelectLocation:Size(200, 15)

--Edit Boxs
cSkinEditBox(AltoholicFrame_SearchEditBox)
AltoholicFrame_SearchEditBox:Size(175, 15)
AltoholicFrame_SearchEditBox:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 37, -56)

cSkinScrollBar(AltoholicFrameSummaryScrollFrameScrollBar)
AltoholicFrameSummaryScrollFrame:StripTextures()
cSkinScrollBar(AltoholicFrameBagUsageScrollFrameScrollBar)
AltoholicFrameBagUsageScrollFrame:StripTextures()
cSkinScrollBar(AltoholicFrameSkillsScrollFrameScrollBar)
AltoholicFrameSkillsScrollFrame:StripTextures()
cSkinScrollBar(AltoholicFrameActivityScrollFrameScrollBar)
AltoholicFrameActivityScrollFrame:StripTextures()

AltoholicFrameTab1:Point("TOPLEFT", AltoholicFrame, "BOTTOMLEFT", -5, 2)

AltoTooltip:HookScript( "OnShow", function( self ) self:SetTemplate( "Transparent" ) end )
