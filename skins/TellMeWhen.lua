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
	
	TellMeWhen_IconEditor:SetTemplate()
	TellMeWhen_IconEditorMainOptions:SetTemplate("Transparent")
	
	S:HandleButton(TellMeWhen_IconEditorReset, true)
	S:HandleButton(TellMeWhen_IconEditorUndo, true)
	S:HandleButton(TellMeWhen_IconEditorRedo, true)

	S:HandleTab(TellMeWhen_IconEditorTab1)
	S:HandleTab(TellMeWhen_IconEditorTab2)
	S:HandleTab(TellMeWhen_IconEditorTab3)
	S:HandleTab(TellMeWhen_IconEditorTab4)
	S:HandleTab(TellMeWhen_IconEditorTab5)

	S:HandleButton(TellMeWhen_IconEditorOkay, true)
	S:HandleCloseButton(TellMeWhen_IconEditorClose, true)
	
	TellMeWhen_ConfigWarning:StripTextures()
	TellMeWhen_ConfigWarning:SetTemplate("Transparent")
	S:HandleButton(TellMeWhen_ConfigWarningExit, true)
	S:HandleButton(TellMeWhen_ConfigWarningNeverAgain, true)

	TellMeWhen_IconEditorSuggest:StripTextures()
	TellMeWhen_IconEditorSuggest:SetTemplate()
	
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
	
	--S:HandleScrollBar(TellMeWhen_IconEditorEventsSoundSoundsScrollBar)
	S:HandleCheckBox(TellMeWhen_IconEditorEventsEventSettingsPassThrough)
	S:HandleCheckBox(TellMeWhen_IconEditorEventsEventSettingsOnlyShown)
end

S:RegisterSkin('TellMeWhen_Options', LoadSkin)

