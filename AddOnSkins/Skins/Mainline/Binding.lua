local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local next = next
local hooksecurefunc = hooksecurefunc

local function updateNewGlow(self)
	self.backdrop:SetBackdropBorderColor(0, self.NewOutline:IsShown() and 0.8 or 0, 0)
end

local function HandleScrollChild(self)
	for _, child in next, { self.ScrollTarget:GetChildren() } do
		local icon = child.Icon
		if icon and not icon.IsSkinned then
			S:HandleIcon(icon)
			S:Point(icon, 'LEFT', 3, 0)

			child.Background:Hide()
			S:CreateBackdrop(child, nil, nil, nil, true, nil, nil, nil, true)

			S:HandleButton(child.DeleteButton)
			S:Size(child.DeleteButton, 20)
			S:SetInside(child.FrameHighlight, child.bg)
			child.FrameHighlight:SetColorTexture(1, 1, 1, .20)

			child.NewOutline:SetTexture('')
			S:FontTemplate(child.BindingText)
			hooksecurefunc(child, 'Init', updateNewGlow)

			icon.IsSkinned = true
		end
	end
end

local function UpdateButtonColor(button, isSelected)
	if isSelected then
		button.Portrait.backdrop:SetBackdropBorderColor(1, .8, 0)
	else
		button.Portrait.backdrop:SetBackdropBorderColor(0, 0, 0)
	end
end

local function HandlePortraitIcon(button, texture)
	S:StripTextures(button)
	button.Portrait:SetTexture(texture)
	S:HandleIcon(button.Portrait, true)
	button.Portrait.backdrop:SetBackdropColor(0, 0, 0)
	button.Highlight:SetColorTexture(1, 1, 1, .25)
	S:SetInside(button.Highlight, button.Portrait.backdrop)
	hooksecurefunc(button, 'SetSelectedState', UpdateButtonColor)
end

function S:Blizzard_ClickBindingUI()
	if not AS:IsSkinEnabled('Blizzard_ClickBindingUI', 'binding') then return end

	local frame = _G.ClickBindingFrame
	S:HandlePortraitFrame(frame)

	frame.TutorialButton.Ring:Hide()
	S:Point(frame.TutorialButton, 'TOPLEFT', frame, 'TOPLEFT', -12, 12)

	for _, v in next, { 'ResetButton', 'AddBindingButton', 'SaveButton' } do
		S:HandleButton(frame[v])
	end

	S:HandleTrimScrollBar(frame.ScrollBar)
	frame.ScrollBoxBackground:Hide()
	hooksecurefunc(frame.ScrollBox, 'Update', HandleScrollChild)

	-- Tutorial Frame ugly af WIP
	local tutorial = frame.TutorialFrame
	S:StripTextures(tutorial.NineSlice)
	S:SetTemplate(tutorial)

	local titleBG = tutorial.TitleBg or tutorial.Bg
	if titleBG then
		titleBG:Hide()
	end

	HandlePortraitIcon(frame.SpellbookPortrait, 136830)
	HandlePortraitIcon(frame.MacrosPortrait, 136377)

	if frame.EnableMouseoverCastCheckbox then
		S:HandleCheckBox(frame.EnableMouseoverCastCheckbox)
	end
end

AS:RegisterSkin('Blizzard_ClickBindingUI', nil, 'ADDON_LOADED')
