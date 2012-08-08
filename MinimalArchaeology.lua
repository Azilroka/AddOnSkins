if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("MinimalArchaeology") then return end
	cSkinFrame(MinArchMain)
	cSkinStatusBar(MinArchMainSkillBar)
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

	cSkinFrame(MinArchDigsites)
	cSkinCloseButton(MinArchDigsitesButtonClose)

	cSkinFrame(MinArchHist)
	cSkinCloseButton(MinArchHistButtonClose)

	for i = 1, 10 do
		cSkinStatusBar(_G["MinArchMainArtifactBar"..i])
		_G["MinArchMainArtifactBar"..i]:SetStatusBarColor(1.0, 0.4, 0)
		cSkinButton(_G["MinArchMainArtifactBar"..i.."ButtonSolve"])
	end