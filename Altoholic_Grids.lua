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

if IsAddOnLoaded("Altoholic") then 
	local SkinAltoholic = CreateFrame("Frame")
	SkinAltoholic:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinAltoholic:SetScript( "OnEvent", function(self)
	if (UISkinOptions.AltoholicSkin == "Disabled") then return end
	if IsAddOnLoaded("Tukui") then s.SkinFuncs["Altoholic_Grids"] = LoadSkin end
	if (IsAddOnLoaded("ElvUI") then c:GetModule('Skins') s:RegisterSkin('Altoholic_Grids', LoadSkin) end
	end)
end
