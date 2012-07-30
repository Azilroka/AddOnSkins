if not (IsAddOnLoaded( "ElvUI" ) or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("Altoholic") then return end

local SkinAltoholic = CreateFrame("Frame")
SkinAltoholic:RegisterEvent( "PLAYER_ENTERING_WORLD" )
SkinAltoholic:SetScript( "OnEvent", function(self)
if (UISkinOptions.AltoholicSkin == "Disabled") then return end
local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c

local Altoholic = _G.Altoholic
LoadAddOn("Altoholic_Characters")

AltoholicFrameContainers:StripTextures()
AltoholicFrameContainers:SetTemplate("Transparent")
AltoholicFrameRecipes:SetTemplate("Transparent")
AltoholicFrameQuests:SetTemplate("Transparent")
AltoholicFrameTalents:SetTemplate("Transparent")
AltoholicFrameGlyphs:SetTemplate("Transparent")
AltoholicFrameMail:SetTemplate("Transparent")
AltoholicFrameSpellbook:SetTemplate("Transparent")
AltoholicFramePets:SetTemplate("Transparent")
AltoholicFrameAuctions:SetTemplate("Transparent")

cSkinScrollBar(AltoholicFrameContainersScrollFrameScrollBar)
AltoholicFrameContainersScrollFrame:StripTextures()
cSkinScrollBar(AltoholicFrameQuestsScrollFrameScrollBar)
AltoholicFrameQuestsScrollFrame:StripTextures()
cSkinScrollBar(AltoholicFrameRecipesScrollFrameScrollBar)
AltoholicFrameRecipesScrollFrame:StripTextures()

cSkinDropDownBox(AltoholicFrameTalents_SelectMember)
cSkinDropDownBox(AltoholicTabCharacters_SelectRealm)

cSkinNextPrevButton(AltoholicFrameSpellbookPrevPage)
cSkinNextPrevButton(AltoholicFrameSpellbookNextPage)
cSkinRotateButton(AltoholicFramePetsNormal_ModelFrameRotateLeftButton)
cSkinRotateButton(AltoholicFramePetsNormal_ModelFrameRotateRightButton)
cSkinNextPrevButton(AltoholicFramePetsNormalPrevPage)
cSkinNextPrevButton(AltoholicFramePetsNormalNextPage)
cSkinButton(AltoholicTabCharacters_Sort1)
cSkinButton(AltoholicTabCharacters_Sort2)
cSkinButton(AltoholicTabCharacters_Sort3)

for i = 1, 14 do
	_G["AltoholicFrameContainersEntry1Item"..i]:StripTextures()
	_G["AltoholicFrameContainersEntry2Item"..i]:StripTextures()
	_G["AltoholicFrameContainersEntry3Item"..i]:StripTextures()
	_G["AltoholicFrameContainersEntry4Item"..i]:StripTextures()
	_G["AltoholicFrameContainersEntry5Item"..i]:StripTextures()
	_G["AltoholicFrameContainersEntry6Item"..i]:StripTextures()
	_G["AltoholicFrameContainersEntry7Item"..i]:StripTextures()
end
end)