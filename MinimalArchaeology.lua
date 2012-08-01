if not (IsAddOnLoaded( "ElvUI" ) or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("MinimalArchaelogy") then return end
MinArchMain:SetTemplate("Transparent")
MinArchMainSkillBar:StripTextures()
MinArchMainSkillBar:CreateBackdrop()
MinArchMainSkillBar:SetStatusBarTexture(c["media"].normTex)
MinArchMainSkillBar:Point("TOP", MinArchMain, "TOP", 2, -24)
MinArchMainSkillBar:Width(253)

cDesaturate(MinArchMainButtonOpenADI)
cDesaturate(MinArchMainButtonOpenHist)
cDesaturate(MinArchMainButtonOpenArch)
cSkinCloseButton(MinArchMainButtonClose)
MinArchMainButtonOpenADI:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", -66, -1)
MinArchMainButtonOpenHist:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", -46, -1)
MinArchMainButtonOpenArch:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", -26, -1)
MinArchMainButtonClose:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", 2, 2)

MinArchDigsites:SetTemplate("Transparent")
cSkinCloseButton(MinArchDigsitesButtonClose)

MinArchHist:SetTemplate("Transparent")
cSkinCloseButton(MinArchHistButtonClose)

for i = 1, 10 do
	_G["MinArchMainArtifactBar"..i]:StripTextures()
	_G["MinArchMainArtifactBar"..i]:CreateBackdrop()
	_G["MinArchMainArtifactBar"..i]:SetStatusBarTexture(c["media"].normTex)
	_G["MinArchMainArtifactBar"..i]:SetStatusBarColor(1.0, 0.4, 0)
	cSkinButton(_G["MinArchMainArtifactBar"..i.."ButtonSolve"])
end