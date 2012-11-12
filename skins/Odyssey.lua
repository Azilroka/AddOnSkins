if not IsAddOnLoaded("Odyssey") then return end
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "OdysseySkin"
local function SkinOdyssey(self)
	OdysseyFrameQuestDBScrollFrame:StripTextures(True)
	OdysseyMapsMenuScrollFrame:StripTextures(True)
	OdysseyFrameQuestDetailsSeries:StripTextures(True)
	OdysseyFrameSearchScrollFrame:StripTextures(True)

	OdysseyFramePortrait:Kill()

	AS:SkinFrame(OdysseyFrame)
	AS:SkinFrame(OdysseyFrameRealmSummaryScrollFrame)
	OdysseyFrameQuestDB:SetTemplate("Transparent")
	OdysseyFrameQuestDBScrollFrame:SetTemplate("Transparent")
	OdysseyFrameQuestDetails:SetTemplate("Transparent")
	OdysseyFrameZoneMaps:SetTemplate("Transparent")

	AS:SkinScrollBar(OdysseyFrameQuestDBScrollFrameScrollBar)
	AS:SkinScrollBar(OdysseyFrameRealmSummaryScrollFrameScrollBar)
	AS:SkinScrollBar(OdysseyMapsMenuScrollFrameScrollBar)
	AS:SkinEditBox(OdysseyFrame_SearchEditBox)
	AS:SkinEditBox(OdysseyFrameQuestDB_MinLevel)
	AS:SkinEditBox(OdysseyFrameQuestDB_MaxLevel)
	
	OdysseyFrame_ResetButton:Point("TOPLEFT", OdysseyFrame, "TOPLEFT", 55, -77)
	OdysseyFrameTab1:Point("TOPLEFT", OdysseyFrame, "BOTTOMLEFT", -5, 2)
	AS:SkinButton(OdysseyFrame_ResetButton)
	AS:SkinButton(OdysseyFrame_SearchButton)
	AS:SkinButton(OdysseyFrameQuestDB_GetHistory)
	AS:SkinCloseButton(OdysseyFrameCloseButton)
	AS:SkinNextPrevButton(OdysseyFrameQuestDetailsGoBack)
	AS:SkinNextPrevButton(OdysseyFrameQuestDetailsGoForward)
	AS:SkinDropDownBox(OdysseyFrameRealmSummary_SelectContinent)
	AS:SkinScrollBar(OdysseyFrameSearchScrollFrameScrollBar)

	for i = 1, 3 do
		AS:SkinTab(_G["OdysseyFrameTab"..i])
		AS:SkinFrame(_G["OdysseyTabQuestsMenuItem"..i])
	end

	for i = 1, 5 do
		AS:SkinFrame(_G["OdysseyTabQuests_Sort"..i])
	end

	for i = 1, 15 do
		AS:SkinFrame(_G["OdysseyTabMapsMenuItem"..i])
	end

	for i = 1, 4 do
		AS:SkinFrame(_G["OdysseyTabSearchMenuItem"..i])
	end

	for i = 1, 10 do
		_G["OdysseyFrameRealmSummaryEntry1Item"..i]:StripTextures(True)
		_G["OdysseyFrameRealmSummaryEntry2Item"..i]:StripTextures(True)
		_G["OdysseyFrameRealmSummaryEntry3Item"..i]:StripTextures(True)
		_G["OdysseyFrameRealmSummaryEntry4Item"..i]:StripTextures(True)
		_G["OdysseyFrameRealmSummaryEntry5Item"..i]:StripTextures(True)
		_G["OdysseyFrameRealmSummaryEntry6Item"..i]:StripTextures(True)
		_G["OdysseyFrameRealmSummaryEntry7Item"..i]:StripTextures(True)
		_G["OdysseyFrameRealmSummaryEntry8Item"..i]:StripTextures(True)
	end

	OdyTooltip:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)

end

AS:RegisterSkin(name,SkinOdyssey)
