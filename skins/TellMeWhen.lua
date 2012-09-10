if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("TellMeWhen") then return end

local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c

local function LoadSkin()
	LoadAddOn("TellMeWhen_Options")
	if (UISkinOptions.TellMeWhenSkin ~= "Enabled") then return end
	TellMeWhen_IconEditorMain:StripTextures()
	TellMeWhen_IconEditorConditions:StripTextures()
	TellMeWhen_IconEditor:StripTextures()
	TellMeWhen_IconEditorMainOptions:StripTextures()
	
	TellMeWhen_IconEditor:SetTemplate("Transparent")
	TellMeWhen_IconEditorMainOptions:SetTemplate("Transparent")
	
	cSkinButton(TellMeWhen_IconEditorReset, true)
	cSkinButton(TellMeWhen_IconEditorUndo, true)
	cSkinButton(TellMeWhen_IconEditorRedo, true)

	cSkinTab(TellMeWhen_IconEditorTab1)
	cSkinTab(TellMeWhen_IconEditorTab2)
	cSkinTab(TellMeWhen_IconEditorTab3)
	cSkinTab(TellMeWhen_IconEditorTab4)
	cSkinTab(TellMeWhen_IconEditorTab5)

	cSkinButton(TellMeWhen_IconEditorOkay, true)
	cSkinCloseButton(TellMeWhen_IconEditorClose, true)
	
	TellMeWhen_ConfigWarning:StripTextures()
	TellMeWhen_ConfigWarning:SetTemplate("Transparent")
	cSkinButton(TellMeWhen_ConfigWarningExit, true)
	cSkinButton(TellMeWhen_ConfigWarningNeverAgain, true)
	
	
	TellMeWhen_IconEditorSuggest:ClearAllPoints()
	TellMeWhen_IconEditorSuggestItem1:ClearAllPoints()
	TellMeWhen_IconEditorSuggestItem1:SetSize(200, 20)
	TellMeWhen_IconEditorSuggest:SetSize(210, 400)
	TellMeWhen_IconEditorSuggest:SetTemplate("Transparent")
	TellMeWhen_IconEditorSuggest:Point("LEFT", TellMeWhen_IconEditorMain, "RIGHT", 1, 0)
	TellMeWhen_IconEditorSuggestItem1:Point("TOPLEFT", TellMeWhen_IconEditorSuggest, "TOPLEFT", 5, -38)
	
	TellMeWhen_IconEditorTab1:ClearAllPoints()
	TellMeWhen_IconEditorTab2:ClearAllPoints()
	TellMeWhen_IconEditorTab3:ClearAllPoints()
	TellMeWhen_IconEditorTab4:ClearAllPoints()
	TellMeWhen_IconEditorTab5:ClearAllPoints()
	
	TellMeWhen_IconEditorTab1:Point("TOPLEFT", TellMeWhen_IconEditorMain, "BOTTOMLEFT", 0, -24)
	TellMeWhen_IconEditorTab2:Point("LEFT", TellMeWhen_IconEditorTab1, "RIGHT", -19, 0)
	TellMeWhen_IconEditorTab3:Point("LEFT", TellMeWhen_IconEditorTab2, "RIGHT", -19, 0)
	TellMeWhen_IconEditorTab4:Point("LEFT", TellMeWhen_IconEditorTab3, "RIGHT", -19, 0)
	TellMeWhen_IconEditorTab5:Point("LEFT", TellMeWhen_IconEditorTab4, "RIGHT", -19, 0)
	
	--cSkinScrollBar(TellMeWhen_IconEditorEventsSoundSoundsScrollBar)
	cSkinCheckBox(TellMeWhen_IconEditorEventsEventSettingsPassThrough)
	cSkinCheckBox(TellMeWhen_IconEditorEventsEventSettingsOnlyShown)
end

if IsAddOnLoaded("Tukui") then
	s.SkinFuncs["TellMeWhen_Options"] = LoadSkin
end
if IsAddOnLoaded("ElvUI") then 
	c:GetModule('Skins')
	s:RegisterSkin('TellMeWhen_Options', LoadSkin)
end
