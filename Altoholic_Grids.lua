local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c
local Altoholic = _G.Altoholic
local function LoadSkin()

AltoholicFrameGrids:CreateBackdrop("Transparent")

cSkinScrollBar(AltoholicFrameGridsScrollFrameScrollBar)
AltoholicFrameGridsScrollFrame:StripTextures()

cSkinDropDownBox(AltoholicTabGrids_SelectRealm)
cSkinDropDownBox(AltoholicTabGrids_SelectView)

for i = 1, 10 do
	_G["AltoholicFrameGridsEntry1Item"..i]:StripTextures()
	_G["AltoholicFrameGridsEntry2Item"..i]:StripTextures()
	_G["AltoholicFrameGridsEntry3Item"..i]:StripTextures()
	_G["AltoholicFrameGridsEntry4Item"..i]:StripTextures()
	_G["AltoholicFrameGridsEntry5Item"..i]:StripTextures()
	_G["AltoholicFrameGridsEntry6Item"..i]:StripTextures()
	_G["AltoholicFrameGridsEntry7Item"..i]:StripTextures()
	_G["AltoholicFrameGridsEntry8Item"..i]:StripTextures()
end

end

if (IsAddOnLoaded("Tukui") and IsAddOnLoaded("Altoholic")) then
	local SkinAltoholic = CreateFrame("Frame")
	SkinAltoholic:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinAltoholic:SetScript( "OnEvent", function(self)
	if (UISkinOptions.AltoholicSkin == "Disabled") then return end
	s.SkinFuncs["Altoholic_Grids"] = LoadSkin
	end)
end
if (IsAddOnLoaded("ElvUI") and IsAddOnLoaded("Altoholic")) then 
if IsAddOnLoaded("ElvUI_SLE") then return end --Repooc and Darth Predator has a modified skin to fit the UI
	c:GetModule('Skins')
	s:RegisterSkin('Altoholic_Grids', LoadSkin)
end