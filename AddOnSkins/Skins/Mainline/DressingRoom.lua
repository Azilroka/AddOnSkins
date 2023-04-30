local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local unpack = unpack
local hooksecurefunc = hooksecurefunc

local function SetToggleIcon(button, texture)
	local icon = button:CreateTexture()
	icon:SetTexCoord(unpack(S.Media.TexCoords))
	icon:SetInside()
	icon:SetTexture(texture)

	button:StyleButton()
end

local function SetItemQuality(slot)
	if not slot.slotState and not slot.isHiddenVisual and slot.transmogID then
		slot.backdrop:SetBackdropBorderColor(slot.Name:GetTextColor())
	else
		slot.backdrop:SetBackdropBorderColor(unpack(S.Media.borderColor))
	end
end

local function DetailsPanelRefresh(panel)
	if not panel.slotPool then return end

	for slot in panel.slotPool:EnumerateActive() do
		if not slot.backdrop then
			slot.IconBorder:SetAlpha(0)
			S:HandleIcon(slot.Icon, true)
		end

		SetItemQuality(slot)
	end
end

local function DressUpConfigureSize(frame, isMinimized)
	frame.OutfitDetailsPanel:ClearAllPoints()
	S:Point(frame.OutfitDetailsPanel, 'TOPLEFT', frame, 'TOPRIGHT', 4, 0)

	frame.OutfitDropDown:ClearAllPoints()
	S:Point(frame.OutfitDropDown, 'TOP', -(isMinimized and 42 or 28), -32)
	S:Width(frame.OutfitDropDown, isMinimized and 140 or 190)
end

function R:Blizzard_DressUpFrame()
	if not AS:IsSkinEnabled('Blizzard_DressUpFrame', 'dressingroom') then return end

	local DressUpFrame = _G.DressUpFrame
	S:HandlePortraitFrame(DressUpFrame)
	S:HandleMaxMinFrame(DressUpFrame.MaximizeMinimizeFrame)
	S:HandleButton(_G.DressUpFrameResetButton)
	S:HandleButton(_G.DressUpFrameCancelButton)
	S:HandleButton(DressUpFrame.LinkButton)
	S:HandleButton(DressUpFrame.ToggleOutfitDetailsButton)
	SetToggleIcon(DressUpFrame.ToggleOutfitDetailsButton, 1392954)

	DressUpFrame.ModelBackground:SetDrawLayer('BACKGROUND', 1)
	S:Size(DressUpFrame.LinkButton, 110, 22)
	DressUpFrame.LinkButton:ClearAllPoints()
	S:Point(DressUpFrame.LinkButton, 'BOTTOMLEFT', 4, 4)

	S:Point(_G.DressUpFrameCancelButton, 'BOTTOMRIGHT', -4, 4)
	S:Point(_G.DressUpFrameResetButton, 'RIGHT', _G.DressUpFrameCancelButton, 'LEFT', -3, 0)

	local OutfitDropDown = DressUpFrame.OutfitDropDown
	S:HandleDropDownBox(OutfitDropDown)
	S:HandleButton(OutfitDropDown.SaveButton)
	S:Size(OutfitDropDown.SaveButton, 80, 22)
	S:Point(OutfitDropDown.SaveButton, 'LEFT', OutfitDropDown, 'RIGHT', -7, 3)
	OutfitDropDown.Text:ClearAllPoints()
	S:Point(OutfitDropDown.Text, 'LEFT', OutfitDropDown.backdrop, 4, 0)
	S:Point(OutfitDropDown.Text, 'RIGHT', OutfitDropDown.backdrop, -4, 0)
	S:Point(OutfitDropDown.backdrop, 'TOPLEFT', 3, 3)

	-- 9.1.5 Outfit DetailPanel | Dont use StripTextures on the DetailsPanel, plx
	DressUpFrame.OutfitDetailsPanel:DisableDrawLayer('BACKGROUND')
	DressUpFrame.OutfitDetailsPanel:DisableDrawLayer('OVERLAY') -- to keep Artwork on the frame
	S:CreateBackdrop(DressUpFrame.OutfitDetailsPanel)
	--DressUpFrame.OutfitDetailsPanel.ClassBackground:SetAllPoints()
	hooksecurefunc(DressUpFrame.OutfitDetailsPanel, 'Refresh', DetailsPanelRefresh)
	hooksecurefunc(DressUpFrame, 'ConfigureSize', DressUpConfigureSize)

	local WardrobeOutfitFrame = _G.WardrobeOutfitFrame
	S:StripTextures(WardrobeOutfitFrame, true)
	S:SetTemplate(WardrobeOutfitFrame)

	local WardrobeOutfitEditFrame = _G.WardrobeOutfitEditFrame
	S:StripTextures(WardrobeOutfitEditFrame, true)
	S:SetTemplate(WardrobeOutfitEditFrame)
	S:StripTextures(WardrobeOutfitEditFrame.EditBox)
	S:HandleEditBox(WardrobeOutfitEditFrame.EditBox)
	S:Point(WardrobeOutfitEditFrame.EditBox.backdrop, 'TOPLEFT', WardrobeOutfitEditFrame.EditBox, 'TOPLEFT', -5, -5)
	S:Point(WardrobeOutfitEditFrame.EditBox.backdrop, 'BOTTOMRIGHT', WardrobeOutfitEditFrame.EditBox, 'BOTTOMRIGHT', 0, 5)
	S:HandleButton(WardrobeOutfitEditFrame.AcceptButton)
	S:HandleButton(WardrobeOutfitEditFrame.CancelButton)
	S:HandleButton(WardrobeOutfitEditFrame.DeleteButton)
end

AS:RegisterSkin('Blizzard_DressUpFrame')
