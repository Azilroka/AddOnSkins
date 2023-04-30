local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local hooksecurefunc = hooksecurefunc

local FrameTexs = {
	'TopLeft',
	'TopRight',
	'Top',
	'BottomLeft',
	'BottomRight',
	'Bottom',
	'Left',
	'Right',
	'TitleBG',
	'DialogBG',
}

local function SkinOnShow()
	local ScriptErrorsFrame = _G.ScriptErrorsFrame
	S:SetTemplate(ScriptErrorsFrame)
	S:HandleScrollBar(_G.ScriptErrorsFrameScrollBar)
	S:HandleCloseButton(_G.ScriptErrorsFrameClose)

	S:SetTemplate(ScriptErrorsFrame.ScrollFrame)
	S:FontTemplate(ScriptErrorsFrame.ScrollFrame.Text, nil, 13)
	ScriptErrorsFrame.ScrollFrame:SetFrameLevel(ScriptErrorsFrame.ScrollFrame:GetFrameLevel() + 2)

	for i = 1, #FrameTexs do
		_G['ScriptErrorsFrame'..FrameTexs[i]]:SetTexture()
	end

	-- Our Buttons
	if ScriptErrorsFrame.firstButton then
		S:HandleButton(ScriptErrorsFrame.firstButton)
	end
	if ScriptErrorsFrame.lastButton then
		S:HandleButton(ScriptErrorsFrame.lastButton)
	end

	-- Default Buttons
	S:HandleButton(ScriptErrorsFrame.Reload)
	S:HandleButton(ScriptErrorsFrame.Close)
	S:HandleNextPrevButton(ScriptErrorsFrame.PreviousError)
	S:HandleNextPrevButton(ScriptErrorsFrame.NextError)

	S:Unhook(ScriptErrorsFrame, 'OnShow')
end

local function SkinTableAttributeDisplay(frame)
	S:StripTextures(frame)
	S:SetTemplate(frame)
	S:SetTemplate(frame.ScrollFrameArt.NineSlice)
	S:HandleCloseButton(frame.CloseButton)
	frame.OpenParentButton:ClearAllPoints()
	S:Point(frame.OpenParentButton, 'TOPLEFT', frame, 'TOPLEFT', 2, -2)
	S:HandleNextPrevButton(frame.OpenParentButton, 'up')
	S:Size(frame.OpenParentButton, 17)
	frame.DuplicateButton:ClearAllPoints()
	S:Point(frame.DuplicateButton, 'LEFT', frame.NavigateForwardButton, 'RIGHT')
	S:HandleCheckBox(frame.VisibilityButton)
	S:Size(frame.VisibilityButton, 28)
	S:HandleCheckBox(frame.HighlightButton)
	S:Size(frame.HighlightButton, 28)
	S:HandleCheckBox(frame.DynamicUpdateButton)
	S:Size(frame.DynamicUpdateButton, 28)
	frame.NavigateBackwardButton:ClearAllPoints()
	S:Point(frame.NavigateBackwardButton, 'LEFT', frame.OpenParentButton, 'RIGHT', 2, 0)
	frame.NavigateForwardButton:ClearAllPoints()
	S:Point(frame.NavigateForwardButton, 'LEFT', frame.NavigateBackwardButton, 'RIGHT', 2, 0)
	frame.DuplicateButton:ClearAllPoints()
	S:Point(frame.DuplicateButton, 'LEFT', frame.NavigateForwardButton, 'RIGHT', 2, 0)
	S:HandleNextPrevButton(frame.DuplicateButton)
	S:Size(frame.DuplicateButton, 17)
	S:HandleNextPrevButton(frame.NavigateBackwardButton)
	S:HandleNextPrevButton(frame.NavigateForwardButton)
	S:HandleEditBox(frame.FilterBox)
	S:HandleScrollBar(frame.LinesScrollFrame.ScrollBar)

	frame.isSkinned = true
end

function R:Blizzard_ScriptErrorsFrame()
	if not AS:IsSkinEnabled('Blizzard_ScriptErrorsFrame', 'debug') then return end

	S:SecureHookScript(_G.ScriptErrorsFrame, 'OnShow', SkinOnShow)
end

function R:Blizzard_DebugTools()
	if not AS:IsSkinEnabled('Blizzard_DebugTools', 'debug') then return end

	-- Tooltips
	S:HandleTooltip(_G.FrameStackTooltip)

	--New Table Attribute Display: mouse over frame and (/tableinspect or [/fstack -> then Ctrl])
	SkinTableAttributeDisplay(_G.TableAttributeDisplay)
	hooksecurefunc(_G.TableInspectorMixin, 'OnLoad', function(frame)
		if frame.ScrollFrameArt and not frame.isSkinned then
			SkinTableAttributeDisplay(frame)
		end
	end)
end

AS:RegisterSkin('Blizzard_ScriptErrorsFrame')
AS:RegisterSkin('Blizzard_DebugTools', nil, 'ADDON_LOADED')
