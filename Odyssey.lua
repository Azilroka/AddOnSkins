if not (IsAddOnLoaded( "ElvUI" ) or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("Odyssey") then return end
local SkinOdyssey = CreateFrame("Frame")
	SkinOdyssey:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinOdyssey:SetScript( "OnEvent", function(self)
	if (UISkinOptions.OdysseySkin == "Disabled") then return end
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c

	OdysseyFrame:StripTextures()
	OdysseyFrameQuestDBScrollFrame:StripTextures()
	OdysseyFrameRealmSummaryScrollFrame:StripTextures()
	OdysseyMapsMenuScrollFrame:StripTextures()
	OdysseyFrameQuestDetailsSeries:StripTextures()
	OdysseyFrameSearchScrollFrame:StripTextures()

	OdysseyFramePortrait:Kill()

	OdysseyFrame:SetTemplate("Transparent")
	OdysseyFrameRealmSummaryScrollFrame:SetTemplate("Transparent")
	OdysseyFrameQuestDB:SetTemplate("Transparent")
	OdysseyFrameQuestDBScrollFrame:SetTemplate("Transparent")
	OdysseyFrameQuestDetails:SetTemplate("Transparent")
	OdysseyFrameZoneMaps:SetTemplate("Transparent")

	cSkinScrollBar(OdysseyFrameQuestDBScrollFrameScrollBar)
	cSkinScrollBar(OdysseyFrameRealmSummaryScrollFrameScrollBar)
	cSkinScrollBar(OdysseyMapsMenuScrollFrameScrollBar)
	cSkinEditBox(OdysseyFrame_SearchEditBox)
	cSkinEditBox(OdysseyFrameQuestDB_MinLevel)
	cSkinEditBox(OdysseyFrameQuestDB_MaxLevel)
	
	OdysseyFrame_ResetButton:Point("TOPLEFT", OdysseyFrame, "TOPLEFT", 55, -77)
	OdysseyFrameTab1:Point("TOPLEFT", OdysseyFrame, "BOTTOMLEFT", -5, 2)
	cSkinButton(OdysseyFrame_ResetButton)
	cSkinButton(OdysseyFrame_SearchButton)
	cSkinButton(OdysseyFrameQuestDB_GetHistory)
	cSkinCloseButton(OdysseyFrameCloseButton)
	cSkinNextPrevButton(OdysseyFrameQuestDetailsGoBack)
	cSkinNextPrevButton(OdysseyFrameQuestDetailsGoForward)
	cSkinDropDownBox(OdysseyFrameRealmSummary_SelectContinent)
	cSkinScrollBar(OdysseyFrameSearchScrollFrameScrollBar)

for i = 1, 3 do
	cSkinTab(_G["OdysseyFrameTab"..i])
	_G["OdysseyTabQuestsMenuItem"..i]:StripTextures()
	cSkinButton(_G["OdysseyTabQuestsMenuItem"..i])
end
for i = 1, 5 do
	cSkinButton(_G["OdysseyTabQuests_Sort"..i])
end
for i = 1, 15 do
	_G["OdysseyTabMapsMenuItem"..i]:StripTextures()
	cSkinButton(_G["OdysseyTabMapsMenuItem"..i])
end
for i = 1, 4 do
	_G["OdysseyTabSearchMenuItem"..i]:StripTextures()
	cSkinButton(_G["OdysseyTabSearchMenuItem"..i])
end
for i = 1, 10 do
	_G["OdysseyFrameRealmSummaryEntry1Item"..i]:StripTextures()
	_G["OdysseyFrameRealmSummaryEntry2Item"..i]:StripTextures()
	_G["OdysseyFrameRealmSummaryEntry3Item"..i]:StripTextures()
	_G["OdysseyFrameRealmSummaryEntry4Item"..i]:StripTextures()
	_G["OdysseyFrameRealmSummaryEntry5Item"..i]:StripTextures()
	_G["OdysseyFrameRealmSummaryEntry6Item"..i]:StripTextures()
	_G["OdysseyFrameRealmSummaryEntry7Item"..i]:StripTextures()
	_G["OdysseyFrameRealmSummaryEntry8Item"..i]:StripTextures()
end
	OdyTooltip:HookScript( "OnShow", function( self ) self:SetTemplate( "Transparent" ) end )

end)
