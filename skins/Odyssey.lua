if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Odyssey") then return end
local U = unpack(select(2,...))
local name = "OdysseySkin"
local function SkinOdyssey(self)
	local s = U.s
	local c = U.c

	OdysseyFrameQuestDBScrollFrame:StripTextures(True)
	OdysseyMapsMenuScrollFrame:StripTextures(True)
	OdysseyFrameQuestDetailsSeries:StripTextures(True)
	OdysseyFrameSearchScrollFrame:StripTextures(True)

	OdysseyFramePortrait:Kill()

	U.SkinFrame(OdysseyFrame)
	U.SkinFrame(OdysseyFrameRealmSummaryScrollFrame)
	OdysseyFrameQuestDB:SetTemplate("Transparent")
	OdysseyFrameQuestDBScrollFrame:SetTemplate("Transparent")
	OdysseyFrameQuestDetails:SetTemplate("Transparent")
	OdysseyFrameZoneMaps:SetTemplate("Transparent")

	U.SkinScrollBar(OdysseyFrameQuestDBScrollFrameScrollBar)
	U.SkinScrollBar(OdysseyFrameRealmSummaryScrollFrameScrollBar)
	U.SkinScrollBar(OdysseyMapsMenuScrollFrameScrollBar)
	U.SkinEditBox(OdysseyFrame_SearchEditBox)
	U.SkinEditBox(OdysseyFrameQuestDB_MinLevel)
	U.SkinEditBox(OdysseyFrameQuestDB_MaxLevel)
	
	OdysseyFrame_ResetButton:Point("TOPLEFT", OdysseyFrame, "TOPLEFT", 55, -77)
	OdysseyFrameTab1:Point("TOPLEFT", OdysseyFrame, "BOTTOMLEFT", -5, 2)
	U.SkinButton(OdysseyFrame_ResetButton)
	U.SkinButton(OdysseyFrame_SearchButton)
	U.SkinButton(OdysseyFrameQuestDB_GetHistory)
	U.SkinCloseButton(OdysseyFrameCloseButton)
	U.SkinNextPrevButton(OdysseyFrameQuestDetailsGoBack)
	U.SkinNextPrevButton(OdysseyFrameQuestDetailsGoForward)
	U.SkinDropDownBox(OdysseyFrameRealmSummary_SelectContinent)
	U.SkinScrollBar(OdysseyFrameSearchScrollFrameScrollBar)

	for i = 1, 3 do
		U.SkinTab(_G["OdysseyFrameTab"..i])
		U.SkinFrame(_G["OdysseyTabQuestsMenuItem"..i])
	end

	for i = 1, 5 do
		U.SkinFrame(_G["OdysseyTabQuests_Sort"..i])
	end

	for i = 1, 15 do
		U.SkinFrame(_G["OdysseyTabMapsMenuItem"..i])
	end

	for i = 1, 4 do
		U.SkinFrame(_G["OdysseyTabSearchMenuItem"..i])
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

U.RegisterSkin(name,SkinOdyssey)
