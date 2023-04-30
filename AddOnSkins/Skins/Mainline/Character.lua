local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local pairs, ipairs = pairs, ipairs
local unpack, next = unpack, next
local hooksecurefunc = hooksecurefunc
local CreateColor = CreateColor
local CharacterStatsPane = _G.CharacterStatsPane

local FLYOUT_LOCATIONS = {
	[0xFFFFFFFF] = 'PLACEINBAGS',
	[0xFFFFFFFE] = 'IGNORESLOT',
	[0xFFFFFFFD] = 'UNIGNORESLOT'
}

local showInsetBackdrop = {
	ReputationFrame = true,
	TokenFrame = true
}

local function UpdateCharacterInset(name)
	_G.CharacterFrameInset.backdrop:SetShown(showInsetBackdrop[name])
end

local function UpdateAzeriteItem(item)
	if not item.IsSkinned then
		item.IsSkinned = true

		item.AzeriteTexture:SetAlpha(0)
		item.RankFrame.Texture:SetTexture()
		S:FontTemplate(item.RankFrame.Label, nil, nil, 'OUTLINE')
	end
end

local function UpdateAzeriteEmpoweredItem(item)
	item.AzeriteTexture:SetAtlas('AzeriteIconFrame')
	S:SetInside(item.AzeriteTexture)
	item.AzeriteTexture:SetTexCoord(unpack(S.Media.TexCoords))
	item.AzeriteTexture:SetDrawLayer('BORDER', 1)
end

local gradientFrom, gradientTo = CreateColor(0.8, 0.8, 0.8, 0.25), CreateColor(0.8, 0.8, 0.8, 0)
local function ColorizeStatPane(frame)
	frame.Background:SetAlpha(0)

	frame.leftGrad = frame:CreateTexture(nil, 'BORDER')
	S:Size(frame.leftGrad, 80, frame:GetHeight())
	S:Point(frame.leftGrad, 'LEFT', frame, 'CENTER')
	frame.leftGrad:SetTexture(S.Media.Blank)
	frame.leftGrad:SetGradient('Horizontal', gradientFrom, gradientTo)

	frame.rightGrad = frame:CreateTexture(nil, 'BORDER')
	S:Size(frame.rightGrad, 80, frame:GetHeight())
	S:Point(frame.rightGrad, 'RIGHT', frame, 'CENTER')
	frame.rightGrad:SetTexture(S.Media.Blank)
	frame.rightGrad:SetGradient('Horizontal', gradientTo, gradientFrom)
end

local function StatsPane(which)
	local stat = CharacterStatsPane[which]
	S:StripTextures(stat)
	S:CreateBackdrop(stat)
	stat.backdrop:ClearAllPoints()
	S:Point(stat.backdrop, 'CENTER')
	S:Size(stat.backdrop, 150, 18)
end

local function EquipmentDisplayButton(button)
	if not button.isHooked then
		button:SetNormalTexture(S.Media.ClearTexture)
		button:SetPushedTexture(S.Media.ClearTexture)
		S:SetTemplate(button)
		S:StyleButton(button)

		S:SetInside(button.icon)
		button.icon:SetTexCoord(unpack(S.Media.TexCoords))

		S:HandleIconBorder(button.IconBorder)

		button.isHooked = true
	end

	if FLYOUT_LOCATIONS[button.location] then -- special slots
		button:SetBackdropBorderColor(unpack(S.Media.borderColor))
	end
end

local function EquipmentUpdateItems()
	local frame = _G.EquipmentFlyoutFrame.buttonFrame
	if not frame.template then
		S:HandleFrame(frame)
	end

	local width, height = frame:GetSize()
	S:Size(frame, width+3, height)

	for _, button in ipairs(_G.EquipmentFlyoutFrame.buttons) do
		EquipmentDisplayButton(button)
	end
end

local function EquipmentUpdateNavigation()
	local navi = _G.EquipmentFlyoutFrame.NavigationFrame
	if not navi then return end

	navi:ClearAllPoints()
	S:Point(navi, 'TOPLEFT', _G.EquipmentFlyoutFrameButtons, 'BOTTOMLEFT', 0, -S.border)
	S:Point(navi, 'TOPRIGHT', _G.EquipmentFlyoutFrameButtons, 'BOTTOMRIGHT', 0, -S.border)

	S:HandleFrame(navi)
end

local function TabTextureCoords(tex, x1)
	if x1 ~= 0.16001 then
		tex:SetTexCoord(0.16001, 0.86, 0.16, 0.86)
	end
end

local function FixSidebarTabCoords()
	for i=1, #_G.PAPERDOLL_SIDEBARS do
		local tab = _G['PaperDollSidebarTab'..i]

		if tab and not tab.backdrop then
			S:CreateBackdrop(tab)
			tab.Icon:SetAllPoints()
			tab.Highlight:SetColorTexture(1, 1, 1, 0.3)
			tab.Highlight:SetAllPoints()

			-- Check for DejaCharacterStats. Lets hide the Texture if the AddOn is loaded.
			if AS:CheckAddOn('DejaCharacterStats') then
				tab.Hider:SetTexture()
			else
				tab.Hider:SetColorTexture(0, 0, 0, 0.8)
			end

			tab.Hider:SetAllPoints(tab.backdrop)
			S:Kill(tab.TabBg)

			if i == 1 then
				for _, region in next, { tab:GetRegions() } do
					region:SetTexCoord(0.16, 0.86, 0.16, 0.86)

					hooksecurefunc(region, 'SetTexCoord', TabTextureCoords)
				end
			end
		end
	end
end

local function UpdateFactionSkins(frame)
	for _, child in next, { frame.ScrollTarget:GetChildren() } do
		local container = child.Container
		if container and not container.IsSkinned then
			container.IsSkinned = true

			S:StripTextures(container)

			if container.ExpandOrCollapseButton then
				S:HandleCollapseTexture(container.ExpandOrCollapseButton)
			end

			if container.ReputationBar then
				S:HandleStatusBar(container.ReputationBar)
			end
		end
	end
end

local function PaperDollUpdateStats()
	local _, stats = _G.CharacterStatsPane.statsFramePool:EnumerateActive()
	if not stats then return end

	for frame in pairs(stats) do
		if not frame.leftGrad then
			ColorizeStatPane(frame)
		end

		local shown = frame.Background:IsShown()
		frame.leftGrad:SetShown(shown)
		frame.rightGrad:SetShown(shown)
	end
end

local function BackdropDesaturated(background, value)
	if value and background.ignoreDesaturated then
		background:SetDesaturated(false)
	end
end

function R:Blizzard_CharacterFrame()
	if not AS:IsSkinEnabled('Blizzard_CharacterFrame', 'character') then return end

	-- General
	local CharacterFrame = _G.CharacterFrame
	S:HandlePortraitFrame(CharacterFrame)

	S:HandleTrimScrollBar(_G.ReputationFrame.ScrollBar)
	S:HandleTrimScrollBar(_G.TokenFrame.ScrollBar)

	for _, Slot in pairs({_G.PaperDollItemsFrame:GetChildren()}) do
		if Slot:IsObjectType('Button') or Slot:IsObjectType('ItemButton') then
			S:HandleIcon(Slot.icon)
			S:StripTextures(Slot)
			S:SetTemplate(Slot)
			S:StyleButton(Slot)
			S:SetInside(Slot.icon)
			Slot.ignoreTexture:SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-LeaveItem-Transparent]])

			S:HandleIconBorder(Slot.IconBorder)

			if Slot.popoutButton:GetPoint() == 'TOP' then
				Slot.popoutButton:Point('TOP', Slot, 'BOTTOM', 0, 2)
			else
				Slot.popoutButton:Point('LEFT', Slot, 'RIGHT', -2, 0)
			end

			hooksecurefunc(Slot, 'DisplayAsAzeriteItem', UpdateAzeriteItem)
			hooksecurefunc(Slot, 'DisplayAsAzeriteEmpoweredItem', UpdateAzeriteEmpoweredItem)
		end
	end

	hooksecurefunc('PaperDollItemSlotButton_Update', function(slot)
		local highlight = slot:GetHighlightTexture()
		highlight:SetTexture(S.Media.Blank)
		highlight:SetVertexColor(1, 1, 1, .25)
		S:SetInside(highlight)
	end)

	--Give character frame model backdrop it's color back
	for _, corner in pairs({'TopLeft','TopRight','BotLeft','BotRight'}) do
		local bg = _G['CharacterModelFrameBackground'..corner]
		if bg then
			bg:SetDesaturated(false)
			bg.ignoreDesaturated = true -- so plugins can prevent this if they want.

			hooksecurefunc(bg, 'SetDesaturated', BackdropDesaturated)
		end
	end

	S:FontTemplate(_G.CharacterLevelText)
	S:FontTemplate(_G.CharacterStatsPane.ItemLevelFrame.Value, nil, 20)
	ColorizeStatPane(_G.CharacterStatsPane.ItemLevelFrame)

	if not AS:CheckAddOn('DejaCharacterStats') then
		hooksecurefunc('PaperDollFrame_UpdateStats', PaperDollUpdateStats)

		StatsPane('EnhancementsCategory')
		StatsPane('ItemLevelCategory')
		StatsPane('AttributesCategory')
	end

	--Strip Textures
	local charframe = {
		'CharacterModelScene',
		'CharacterStatsPane',
		'CharacterFrameInset',
		'CharacterFrameInsetRight',
		'PaperDollSidebarTabs',
	}

	S:StripTextures(_G.EquipmentFlyoutFrameHighlight)
	_G.EquipmentFlyoutFrameButtons.bg1:SetAlpha(0)
	_G.EquipmentFlyoutFrameButtons:DisableDrawLayer('ARTWORK')

	S:HandleNextPrevButton(_G.EquipmentFlyoutFrame.NavigationFrame.PrevButton)
	S:HandleNextPrevButton(_G.EquipmentFlyoutFrame.NavigationFrame.NextButton)

	hooksecurefunc('EquipmentFlyout_SetBackgroundTexture', EquipmentUpdateNavigation)
	hooksecurefunc('EquipmentFlyout_UpdateItems', EquipmentUpdateItems) -- Swap item flyout frame (shown when holding alt over a slot)

	-- Icon in upper right corner of character frame
	S:Kill(_G.CharacterFramePortrait)

	for _, scrollbar in pairs({ _G.PaperDollFrame.EquipmentManagerPane.ScrollBar, _G.PaperDollFrame.TitleManagerPane.ScrollBar }) do
		S:HandleTrimScrollBar(scrollbar)
	end

	for _, object in pairs(charframe) do
		S:StripTextures(_G[object])
	end

	--Re-add the overlay texture which was removed right above via StripTextures
	_G.CharacterModelFrameBackgroundOverlay:SetColorTexture(0, 0, 0)
	S:CreateBackdrop(_G.CharacterModelScene)
	S:Point(_G.CharacterModelScene.backdrop, 'TOPLEFT', S.PixelMode and -1 or -2, S.PixelMode and 1 or 2)
	S:Point(_G.CharacterModelScene.backdrop, 'BOTTOMRIGHT', S.PixelMode and 1 or 2, S.PixelMode and -2 or -3)

	S:CreateBackdrop(_G.CharacterFrameInset, nil, nil, nil, nil, nil, nil, nil, true)

	for _, button in pairs({
		'CharacterModelSceneZoomInButton',
		'CharacterModelSceneZoomOutButton',
		'CharacterModelSceneRotateLeftButton',
		'CharacterModelSceneRotateRightButton',
		'CharacterModelSceneRotateResetButton',
	}) do
		S:HandleButton(_G[button])
	end

	--Titles
	hooksecurefunc(_G.PaperDollFrame.TitleManagerPane.ScrollBox, 'Update', function(frame)
		for _, child in next, { frame.ScrollTarget:GetChildren() } do
			if not child.isSkinned then
				child:DisableDrawLayer('BACKGROUND')
				child.isSkinned = true
			end
		end
	end)

	--Equipement Manager
	S:HandleButton(_G.PaperDollFrameEquipSet)
	S:HandleButton(_G.PaperDollFrameSaveSet)

	hooksecurefunc(_G.PaperDollFrame.EquipmentManagerPane.ScrollBox, 'Update', function(frame)
		for _, child in next, { frame.ScrollTarget:GetChildren() } do
			if child.icon and not child.isSkinned then
				child.BgTop:SetTexture('')
				child.BgMiddle:SetTexture('')
				child.BgBottom:SetTexture('')
				S:HandleIcon(child.icon)
				child.HighlightBar:SetColorTexture(1, 1, 1, .25)
				child.HighlightBar:SetDrawLayer('BACKGROUND')
				child.SelectedBar:SetColorTexture(0.8, 0.8, 0.8, .25)
				child.SelectedBar:SetDrawLayer('BACKGROUND')

				child.isSkinned = true
			end
		end
	end)

	-- Icon selection frame
	_G.GearManagerPopupFrame:HookScript('OnShow', function(frame)
		if frame.isSkinned then return end
		S:HandleIconSelectionFrame(frame)
	end)

	-- Reposition Tabs
	_G.CharacterFrameTab1:ClearAllPoints()
	_G.CharacterFrameTab2:ClearAllPoints()
	_G.CharacterFrameTab3:ClearAllPoints()
	S:Point(_G.CharacterFrameTab1, 'TOPLEFT', _G.CharacterFrame, 'BOTTOMLEFT', -3, 0)
	S:Point(_G.CharacterFrameTab2, 'TOPLEFT', _G.CharacterFrameTab1, 'TOPRIGHT', -5, 0)
	S:Point(_G.CharacterFrameTab3, 'TOPLEFT', _G.CharacterFrameTab2, 'TOPRIGHT', -5, 0)

	do --Handle Tabs at bottom of character frame
		local i = 1
		local tab = _G['CharacterFrameTab'..i]
		while tab do
			S:HandleTab(tab)

			i = i + 1
			tab = _G['CharacterFrameTab'..i]
		end
	end

	-- Reputation Frame
	S:HandleFrame(_G.ReputationDetailFrame)
	S:HandleCloseButton(_G.ReputationDetailCloseButton)
	S:HandleCheckBox(_G.ReputationDetailAtWarCheckBox)
	S:HandleCheckBox(_G.ReputationDetailMainScreenCheckBox)
	S:HandleCheckBox(_G.ReputationDetailInactiveCheckBox)
	S:HandleButton(_G.ReputationDetailViewRenownButton)

	hooksecurefunc(_G.ReputationFrame.ScrollBox, 'Update', UpdateFactionSkins)

	-- Currency Frame
	S:HandleFrame(_G.TokenFramePopup)
	S:Point(_G.TokenFramePopup, 'TOPLEFT', _G.TokenFrame, 'TOPRIGHT', 3, -28)
	S:HandleCheckBox(_G.TokenFramePopup.InactiveCheckBox)
	S:HandleCheckBox(_G.TokenFramePopup.BackpackCheckBox)

	hooksecurefunc(_G.TokenFrame.ScrollBox, 'Update', function(frame)
		for _, child in next, { frame.ScrollTarget:GetChildren() } do
			if child.Highlight and not child.IsSkinned then
				child.CategoryLeft:SetAlpha(0)
				child.CategoryRight:SetAlpha(0)
				child.CategoryMiddle:SetAlpha(0)

				S:SetInside(child.Highlight)
				child.Highlight.SetPoint = S.noop
				child.Highlight:SetColorTexture(1, 1, 1, .25)
				child.Highlight.SetTexture = S.noop

				S:HandleIcon(child.Icon)

				if child.ExpandIcon then
					S:CreateBackdrop(child.ExpandIcon)
					S:SetInside(child.ExpandIcon.backdrop, 3, 3)
				end

				child.IsSkinned = true
			end

			child.ExpandIcon.backdrop:SetShown(child.isHeader)
		end
	end)

	--Buttons used to toggle between equipment manager, titles, and character stats
	hooksecurefunc('PaperDollFrame_UpdateSidebarTabs', FixSidebarTabCoords)

	hooksecurefunc('CharacterFrame_ShowSubFrame', UpdateCharacterInset)
end

AS:RegisterSkin('Blizzard_CharacterFrame')
