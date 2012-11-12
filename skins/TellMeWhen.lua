if not IsAddOnLoaded("TellMeWhen") then return end
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local function LoadSkin()
	LoadAddOn("TellMeWhen_Options")
	if (not AS:CheckOption("TellMeWhenSkin")) then return end
	TellMeWhen_IconEditorMain:StripTextures()
	TellMeWhen_IconEditorConditions:StripTextures()
	TellMeWhen_IconEditor:StripTextures()
	TellMeWhen_IconEditorMainOptions:StripTextures()
	
	TellMeWhen_IconEditor:SetTemplate("Transparent")
	TellMeWhen_IconEditorMainOptions:SetTemplate("Transparent")
	
	AS:SkinButton(TellMeWhen_IconEditorReset, true)
	AS:SkinButton(TellMeWhen_IconEditorUndo, true)
	AS:SkinButton(TellMeWhen_IconEditorRedo, true)

	AS:SkinTab(TellMeWhen_IconEditorTab1)
	AS:SkinTab(TellMeWhen_IconEditorTab2)
	AS:SkinTab(TellMeWhen_IconEditorTab3)
	AS:SkinTab(TellMeWhen_IconEditorTab4)
	AS:SkinTab(TellMeWhen_IconEditorTab5)

	AS:SkinButton(TellMeWhen_IconEditorOkay, true)
	AS:SkinCloseButton(TellMeWhen_IconEditorClose, true)
	
	TellMeWhen_ConfigWarning:StripTextures()
	TellMeWhen_ConfigWarning:SetTemplate("Transparent")
	AS:SkinButton(TellMeWhen_ConfigWarningExit, true)
	AS:SkinButton(TellMeWhen_ConfigWarningNeverAgain, true)
	
	
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
	
	--AS:SkinScrollBar(TellMeWhen_IconEditorEventsSoundSoundsScrollBar)
	AS:SkinCheckBox(TellMeWhen_IconEditorEventsEventSettingsPassThrough)
	AS:SkinCheckBox(TellMeWhen_IconEditorEventsEventSettingsOnlyShown)
end

S:RegisterSkin('TellMeWhen_Options', LoadSkin)

