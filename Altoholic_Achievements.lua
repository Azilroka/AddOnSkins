local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c
local Altoholic = _G.Altoholic
local function LoadSkin()

AltoholicFrameAchievements:StripTextures()
AltoholicFrameAchievements:CreateBackdrop("Transparent")
AltoholicFrameAchievementsScrollFrame:StripTextures()
cSkinScrollBar(AltoholicFrameAchievementsScrollFrameScrollBar)
AltoholicAchievementsMenuScrollFrame:StripTextures()
cSkinScrollBar(AltoholicAchievementsMenuScrollFrameScrollBar)
cSkinDropDownBox(AltoholicTabAchievements_SelectRealm)
AltoholicTabAchievements_SelectRealm:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 205, -57)

for i = 1, 15 do
	_G["AltoholicTabAchievementsMenuItem"..i]:StripTextures()
	_G["AltoholicTabAchievementsMenuItem"..i]:SetTemplate("Transparent")
end
for i = 1, 10 do
	_G["AltoholicFrameAchievementsEntry1Item"..i]:StripTextures()
	_G["AltoholicFrameAchievementsEntry2Item"..i]:StripTextures()
	_G["AltoholicFrameAchievementsEntry3Item"..i]:StripTextures()
	_G["AltoholicFrameAchievementsEntry4Item"..i]:StripTextures()
	_G["AltoholicFrameAchievementsEntry5Item"..i]:StripTextures()
	_G["AltoholicFrameAchievementsEntry6Item"..i]:StripTextures()
	_G["AltoholicFrameAchievementsEntry7Item"..i]:StripTextures()
	_G["AltoholicFrameAchievementsEntry8Item"..i]:StripTextures()
end

end

if (IsAddOnLoaded("Tukui") and IsAddOnLoaded("Altoholic")) then 
	local SkinAltoholic = CreateFrame("Frame")
	SkinAltoholic:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinAltoholic:SetScript( "OnEvent", function(self)
	if (UISkinOptions.AltoholicSkin == "Disabled") then return end
	s.SkinFuncs["Altoholic_Achievements"] = LoadSkin
	end)
end
if (IsAddOnLoaded("ElvUI") and IsAddOnLoaded("Altoholic")) then 
if IsAddOnLoaded("ElvUI_SLE") then return end --Repooc and Darth Predator has a modified skin to fit the UI
	c:GetModule('Skins')
	s:RegisterSkin('Altoholic_Achievements', LoadSkin)
end
