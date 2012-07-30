local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c
local Altoholic = _G.Altoholic
local function LoadSkin()

AltoholicFrameSearch:StripTextures()
AltoholicFrameSearch:CreateBackdrop("Transparent")
AltoholicFrameSearchScrollFrame:StripTextures()
cSkinScrollBar(AltoholicFrameSearchScrollFrameScrollBar)
AltoholicSearchMenuScrollFrame:StripTextures()
cSkinScrollBar(AltoholicSearchMenuScrollFrameScrollBar)

--Menu Items
for i = 1, 15 do
	_G["AltoholicTabSearchMenuItem"..i]:StripTextures()
	_G["AltoholicTabSearchMenuItem"..i]:SetTemplate("Transparent")
end

--Sorts
for i = 1, 8 do
	_G["AltoholicTabSearch_Sort"..i]:StripTextures()
	_G["AltoholicTabSearch_Sort"..i]:SetTemplate("Transparent")
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
	local SkinAltoholic = CreateFrame("Frame")
	SkinAltoholic:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinAltoholic:SetScript( "OnEvent", function(self)
	if (UISkinOptions.AltoholicSkin == "Disabled") then return end
	s.SkinFuncs["Altoholic_Search"] = LoadSkin
	end)
end
if (IsAddOnLoaded("ElvUI") and IsAddOnLoaded("Altoholic")) then 
if IsAddOnLoaded("ElvUI_SLE") then return end --Repooc and Darth Predator has a modified skin to fit the UI
	c:GetModule('Skins')
	s:RegisterSkin('Altoholic_Search', LoadSkin)
end