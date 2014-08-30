local AS = unpack(AddOnSkins)

local name = 'TellMeWhenSkin'
function AS:SkinTellMeWhen(event, addon)
	AS:SkinFrame(TellMeWhen_IconEditor)
	AS:SkinFrame(TellMeWhen_IconEditorMainOptions)
	TellMeWhen_IconEditorMain:StripTextures()
	TellMeWhen_IconEditorConditions:StripTextures()

	AS:SkinButton(TellMeWhen_IconEditorReset)
	AS:SkinButton(TellMeWhen_IconEditorUndo)
	AS:SkinButton(TellMeWhen_IconEditorRedo)

	AS:SkinButton(TellMeWhen_IconEditorOkay)
	AS:SkinCloseButton(TellMeWhen_IconEditorClose)

	AS:SkinFrame(TellMeWhen_ConfigWarning)
	AS:SkinButton(TellMeWhen_ConfigWarningExit)
	AS:SkinButton(TellMeWhen_ConfigWarningNeverAgain)

	TellMeWhen_IconEditorSuggest:ClearAllPoints()
	TellMeWhen_IconEditorSuggestItem1:ClearAllPoints()
	TellMeWhen_IconEditorSuggestItem1:SetSize(200, 20)
	TellMeWhen_IconEditorSuggest:SetSize(210, 400)
	TellMeWhen_IconEditorSuggest:SetTemplate('Transparent')
	TellMeWhen_IconEditorSuggest:Point('LEFT', TellMeWhen_IconEditorMain, 'RIGHT', 1, 0)
	TellMeWhen_IconEditorSuggestItem1:Point('TOPLEFT', TellMeWhen_IconEditorSuggest, 'TOPLEFT', 5, -38)

	for i = 1, 5 do
		AS:SkinTab(_G['TellMeWhen_IconEditorTab'..i])
		_G['TellMeWhen_IconEditorTab'..i]:ClearAllPoints()
		if i == 1 then
			_G['TellMeWhen_IconEditorTab'..i]:Point('TOPLEFT', TellMeWhen_IconEditorMain, 'BOTTOMLEFT', 0, -24)
		else
			_G['TellMeWhen_IconEditorTab'..i]:Point('LEFT', _G['TellMeWhen_IconEditorTab'..i-1], 'RIGHT', -19, 0)
		end
	end

	--AS:SkinScrollBar(TellMeWhen_IconEditorEventsSoundSoundsScrollBar)
	AS:SkinCheckBox(TellMeWhen_IconEditorEventsEventSettingsPassThrough)
	AS:SkinCheckBox(TellMeWhen_IconEditorEventsEventSettingsOnlyShown)
end

AS:RegisterSkin(name, AS.SkinTellMeWhen, 'ADDON_LOADED')