local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WorldQuestGroupFinder') then return end

function AS:WorldQuestGroupFinder()
	AS:SkinFrame(WQGFManualActionsFrameTitleFrame)
	AS:SkinFrame(WQGFManualActionsFrame)
	AS:SkinButton(WQGFManualActionsFrameNextButton)
	AS:SkinCloseButton(WQGFManualActionsFrameCloseButton)
	AS:Desaturate(WQGFManualActionsFrameLockButton)
	WQGFManualActionsFrameCloseButton:Size(30, 30)
	WQGFManualActionsFrameCloseButton:ClearAllPoints()
	WQGFManualActionsFrameCloseButton:Point('LEFT', WQGFManualActionsFrameTitleFrame, 'RIGHT', -27, 0)
end

AS:RegisterSkin('WorldQuestGroupFinder', AS.WorldQuestGroupFinder)