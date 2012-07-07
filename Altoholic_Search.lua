local Altoholic = _G.Altoholic
local function LoadSkin()

AltoholicFrameSearch:StripTextures()
AltoholicFrameSearch:SetTemplate("Default")
AltoholicFrameSearchScrollFrame:StripTextures()
cSkinScrollBar(AltoholicFrameSearchScrollFrameScrollBar)
AltoholicSearchMenuScrollFrame:StripTextures()
cSkinScrollBar(AltoholicSearchMenuScrollFrameScrollBar)

--Menu Items
for i = 1, 15 do
	_G["AltoholicTabSearchMenuItem"..i]:StripTextures()
	_G["AltoholicTabSearchMenuItem"..i]:SetTemplate("Default")
end

--Sorts
for i = 1, 8 do
	_G["AltoholicTabSearch_Sort"..i]:StripTextures()
	_G["AltoholicTabSearch_Sort"..i]:SetTemplate("Default")
end

--Drop Downs
cSkinDropDownBox(AltoholicTabSearch_SelectRarity)
cSkinDropDownBox(AltoholicTabSearch_SelectSlot)
cSkinDropDownBox(AltoholicTabSearch_SelectLocation)
AltoholicTabSearch_SelectRarity:Size(125, 32)
AltoholicTabSearch_SelectSlot:Size(125, 32)
AltoholicTabSearch_SelectLocation:Size(175, 32)

--Edit Boxs
cSkinEditBox(_G["AltoholicTabSearch_MinLevel"])
cSkinEditBox(_G["AltoholicTabSearch_MaxLevel"])

end
if (IsAddOnLoaded("Tukui") and IsAddOnLoaded("Altoholic")) then 
	s.SkinFuncs["Altoholic_Search"] = LoadSkin
end
if (IsAddOnLoaded("ElvUI") and IsAddOnLoaded("Altoholic")) then 
	c:GetModule('Skins')
	s:RegisterSkin('Altoholic_Search', LoadSkin)
end