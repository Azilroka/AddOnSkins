local AS, L, S, R = unpack(AddOnSkins)

local _G, _ = _G
local tremove, unpack, next, ipairs, pairs = tremove, unpack, next, ipairs, pairs
local abs, min, max, floor = abs, min, max, floor
local strlower, strfind, type = strlower, strfind, type
local hooksecurefunc = hooksecurefunc

local GetPhysicalScreenSize = GetPhysicalScreenSize
local CopyTable = CopyTable
local CreateFrame = CreateFrame
local UIParent = UIParent
local ITEM_QUALITY_COLORS = ITEM_QUALITY_COLORS

local LibStub = _G.LibStub

S.Classic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
S.Retail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
S.TBC = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC
S.Wrath = WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC

S.Hider = CreateFrame('Frame')
S.Hider:Hide()

S.noop = function() end

local BlizzardRegions = { 'Left', 'Middle', 'Right', 'LeftDisabled', 'MiddleDisabled', 'RightDisabled', 'TopLeft', 'TopRight', 'BottomLeft', 'BottomRight', 'TopMiddle', 'MiddleLeft', 'MiddleRight', 'BottomMiddle', 'MiddleMiddle', 'Center', 'TopTex', 'TopLeftTex', 'TopRightTex', 'LeftTex', 'BottomTex', 'BottomLeftTex', 'BottomRightTex', 'RightTex', 'MiddleTex', 'TabSpacer', 'TabSpacer1', 'TabSpacer2', '_RightSeparator', '_LeftSeparator', 'Cover', 'Mid', 'Border', 'Background', 'Delimiter' }
local BlizzardFrames = { 'Inset', 'inset', 'InsetFrame', 'LeftInset', 'RightInset', 'NineSlice', 'BG', 'bgLeft', 'bgRight', 'border', 'Border', 'BorderFrame', 'bottomInset', 'BottomInset', 'FilligreeOverlay', 'PortraitOverlay', 'ArtOverlayFrame', 'Portrait', 'portrait', 'ScrollFrameBorder' }
local BlizzardTextureIDs = {
	[137056] = true, -- Interface\\Tooltips\\UI-Tooltip-Background
	[137057] = true, -- Interface\\Tooltips\\UI-Tooltip-Border
	[131080] = true, -- Interface\\DialogFrame\\UI-DialogBox-Header
	[130838] = true, -- Interface\\Buttons\\UI-PlusButton-UP
	[130836] = true, -- Interface\\Buttons\\UI-PlusButton-DOWN
	[130821] = true, -- Interface\\Buttons\\UI-MinusButton-UP
	[130820] = true, -- Interface\\Buttons\\UI-MinusButton-DOWN
	[251966] = true, -- Interface\\PaperDollInfoFrame\\UI-GearManager-Title-Background
	[251963] = true, -- Interface\\PaperDollInfoFrame\\UI-GearManager-Border
	[130843] = true, -- Interface\\Buttons\\UI-RadioButton
	[130755] = true, -- Interface\\Buttons\\UI-CheckBox-Up
	[130751] = true, -- Interface\\Buttons\\UI-CheckBox-Check
	[130753] = true, -- Interface\\Buttons\\UI-CheckBox-Highlight
}

-- Depends on the arrow texture to be up by default.
S.ArrowRotation = {
	up = 0,
	down = 3.14,
	left = 1.57,
	right = -1.57,
}

S.Media = {
	valueColor = { 1, 1, 1, 1 },
	borderColor = { 0, 0, 0, 1 },
	defaultBackdrop = { 0, 0, 0, 1 },
	transparentBackdrop = { 0, 0, 0, .8 },
	barTexture = 'Solid',
	TexCoords = { .075, .925, .075, .925 },
	ClearTexture = S.Retail and 0 or '',

	Blank = AS.Libs.LSM:Fetch('statusbar', 'Solid'),
	StatusBar = AS.Libs.LSM:Fetch('statusbar', 'Solid'),
	Close = [[Interface\AddOns\AddOnSkins\Media\Textures\Close]],
	Plus = [[Interface\AddOns\AddOnSkins\Media\Textures\Plus]],
	Minus = [[Interface\AddOns\AddOnSkins\Media\Textures\Minus]],
	QuestBang = [[Interface\AddOns\AddOnSkins\Media\Textures\UI-Icon-QuestBang]],
	Arrow = [[Interface\AddOns\AddOnSkins\Media\Textures\Arrow]],
}

S.Templates = {}
S.Shadows = {}
S.Backdrops = {}
S.StatusBars = {}
S.Texts = {}

function AS:UpdateSettings()
	for Frame in pairs(S.Templates) do
		S:SetTemplate(Frame)
	end
end

local shadowTemplate = { edgeFile = [[Interface\AddOns\AddOnSkins\Media\Textures\Shadows]], edgeSize = 3 }

local Media = S.Media

-- Toolkit API
S.mult = 1
S.border = 1
S.PixelMode = false
_, S.ScreenHeight = GetPhysicalScreenSize()
S.UIScale = 1

function S:Scale(number)
	return S.mult * floor(number/S.mult + .5)
end

function S:GetPixelScale()
	S.mult = max(0.4, min(1.15, 768 / S.ScreenHeight)) / UIParent:GetEffectiveScale()
	S.border = S.mult * (AS:CheckOption('Theme') == 'ThickBorder' and 3 or AS:CheckOption('Theme') == 'TwoPixel' and 2 or 1)
	S.PixelMode = AS:CheckOption('Theme') == 'PixelPerfect'
	S.UIScale = UIParent:GetEffectiveScale()
end

function S:ColorGradient(perc, ...)
	local value = select('#', ...)
	if perc >= 1 then
		return select(value - 2, ...)
	elseif perc <= 0 then
		return ...
	end

	local num = value / 3
	local segment, relperc = math.modf(perc*(num-1))
	local r1, g1, b1, r2, g2, b2 = select((segment*3)+1, ...)

	return r1+(r2-r1)*relperc, g1+(g2-g1)*relperc, b1+(b2-b1)*relperc
end

function S:Kill(Object)
	if Object.UnregisterAllEvents then
		Object:UnregisterAllEvents()
		Object:SetParent(S.Hider)
	else
		Object.Show = Object.Hide
	end

	Object:Hide()
end

function S:AdjustForTheme(number, offset)
	local Theme = AS:CheckOption('Theme')
	local isNegative = number < 0

	number = abs(number)

	if Theme == 'TwoPixel' then
		number = number + (offset or 1)
	elseif Theme == 'ThickBorder' then
		number = number + (offset or 2)
	end

	return isNegative and -number or number
end

-- 8.2 restricted frame check
function S:SetPointsRestricted(frame)
	if frame and not pcall(frame.GetPoint, frame) then
		return true
	end
end

function S:SafeGetPoint(frame)
	if frame and frame.GetPoint and not S:SetPointsRestricted(frame) then
		return frame:GetPoint()
	end
end

function S:WatchPixelSnap(frame, snap)
	if (frame and not frame:IsForbidden()) and frame.PixelSnapDisabled and snap then
		frame.PixelSnapDisabled = nil
	end
end

function S:DisablePixelSnap(frame)
	if (frame and not frame:IsForbidden()) and not frame.PixelSnapDisabled then
		if frame.SetSnapToPixelGrid then
			frame:SetSnapToPixelGrid(false)
			frame:SetTexelSnappingBias(0)
		elseif frame.GetStatusBarTexture then
			local texture = frame:GetStatusBarTexture()
			if type(texture) == 'table' and texture.SetSnapToPixelGrid then
				texture:SetSnapToPixelGrid(false)
				texture:SetTexelSnappingBias(0)
			end
		end

		frame.PixelSnapDisabled = true
	end
end

function S:BackdropFrameLevel(frame, level)
	frame:SetFrameLevel(level)

	if frame.oborder then frame.oborder:SetFrameLevel(level) end
	if frame.iborder then frame.iborder:SetFrameLevel(level) end
end

function S:BackdropFrameLower(backdrop, parent)
	local level = parent:GetFrameLevel()
	local minus = level and (level - 1)
	if minus and (minus >= 0) then
		S:BackdropFrameLevel(backdrop, minus)
	else
		S:BackdropFrameLevel(backdrop, 0)
	end
end

function S:Size(frame, width, height, ...)
	local w = S:Scale(width)
	frame:SetSize(w, (height and S:Scale(height)) or w, ...)
end

function S:Width(frame, width, ...)
	frame:SetWidth(S:Scale(width), ...)
end

function S:Height(frame, height, ...)
	frame:SetHeight(S:Scale(height), ...)
end

function S:Point(obj, arg1, arg2, arg3, arg4, arg5, ...)
	if not arg2 then arg2 = obj:GetParent() end

	if type(arg2) == 'number' then arg2 = S:Scale(arg2) end
	if type(arg3) == 'number' then arg3 = S:Scale(arg3) end
	if type(arg4) == 'number' then arg4 = S:Scale(arg4) end
	if type(arg5) == 'number' then arg5 = S:Scale(arg5) end

	obj:SetPoint(arg1, arg2, arg3, arg4, arg5, ...)
end

function S:GetAnchorOffsets(obj, xOffset, yOffset, noScale)
	if not xOffset then xOffset = S.border end
	if not yOffset then yOffset = S.border end
	local x = (noScale and xOffset) or S:Scale(xOffset)
	local y = (noScale and yOffset) or S:Scale(yOffset)

	if S:SetPointsRestricted(obj) or obj:GetPoint() then
		obj:ClearAllPoints()
	end

	S:DisablePixelSnap(obj)

	return x, y
end

function S:SetOutside(obj, anchor, xOffset, yOffset, anchor2, noScale)
	local x, y = S:GetAnchorOffsets(obj, xOffset, yOffset, noScale)
	anchor = anchor or obj:GetParent()

	obj:SetPoint('TOPLEFT', anchor, 'TOPLEFT', -x, y)
	obj:SetPoint('BOTTOMRIGHT', anchor2 or anchor, 'BOTTOMRIGHT', x, -y)
end

function S:SetInside(obj, anchor, xOffset, yOffset, anchor2, noScale)
	local x, y = S:GetAnchorOffsets(obj, xOffset, yOffset, noScale)
	anchor = anchor or obj:GetParent()

	obj:SetPoint('TOPLEFT', anchor, 'TOPLEFT', x, -y)
	obj:SetPoint('BOTTOMRIGHT', anchor2 or anchor, 'BOTTOMRIGHT', -x, y)
end

do
	local borders = { 'iborder', 'oborder' }
	local borderBackdrop = { edgeFile = Media.Blank }
	local backdrop = { edgeFile = Media.Blank }
	local blank = { 0, 0, 0, 0 }

	function S:GetTemplate(template)
		if template == 'Custom' then
			return AS:CheckOption('CustomBorderColor'), AS:CheckOption('CustomBackdropColor')
		end
		return Media.borderColor, template == 'Transparent' and Media.transparentBackdrop or Media.defaultBackdrop
	end

	function S:ToggleBorders(frame, enabled)
		for _, which in pairs(borders) do
			if frame[which] then
				frame[which]:SetShown(enabled)
			end
		end
	end

	function S:SetTemplate(frame, template, glossTex, ignoreUpdates, _, _, _, noScale, noHook)
		frame.template = template or AS:CheckOption('SkinTemplate')
		frame.glossTex = glossTex and (type(glossTex) == 'string' and glossTex or AS.Libs.LSM:Fetch('statusbar', AS:CheckOption('StatusBarTexture')))
		frame.forcedBorderColors = frame.template == 'NoBorder' and blank or frame.forcedBorderColors
		frame.ignoreUpdates = ignoreUpdates

		local borderColor, backdropColor = S:GetTemplate(frame.template)

		if not frame.SetBackdrop then
			_G.Mixin(frame, _G.BackdropTemplateMixin)
			if not noHook then
				frame:HookScript('OnSizeChanged', frame.OnBackdropSizeChanged)
			end
		end

		if frame.template == 'NoBackdrop' then
			frame:SetBackdrop()
			S.Templates[frame] = nil

			if frame.iborder then
				frame.iborder:SetShown(false)
				frame.oborder:SetShown(false)
			end
		else
			local level = frame:GetFrameLevel()
			local edgeSize = AS:CheckOption('Theme') == 'TwoPixel' and 2 or 1

			backdrop.bgFile = frame.glossTex or Media.Blank
			backdrop.edgeSize = noScale and edgeSize or S:Scale(edgeSize)

			frame:SetBackdrop(backdrop)

			if frame.callbackBackdropColor then
				frame:callbackBackdropColor()
			else
				local r, g, b, a = unpack(backdropColor)
				frame:SetBackdropColor(r, g, b, frame.customBackdropAlpha or a)
			end

			borderBackdrop.edgeSize = noScale and 1 or S:Scale(1)

			for _, which in pairs(borders) do
				local border = CreateFrame('Frame', nil, frame, 'BackdropTemplate')
				border:SetBackdrop(borderBackdrop)
				border:SetBackdropBorderColor(0, 0, 0, 1)
				border:SetFrameLevel(level)
				frame[which] = border
			end

			S:SetInside(frame.iborder, frame, 1, 1, nil, noScale)
			S:SetOutside(frame.oborder, frame, 1, 1, nil, noScale)

			frame.iborder:SetShown(frame.template == 'NoBorder' or AS:CheckOption('Theme') == 'TwoPixel')
			frame.oborder:SetShown(frame.template == 'NoBorder' or AS:CheckOption('Theme') == 'TwoPixel')

			if frame.forcedBorderColors then
				borderColor = frame.forcedBorderColors
			end

			if frame.template ~= 'NoBorder' then
				frame:SetBackdropBorderColor(unpack(borderColor))
			end

			S.Templates[frame] = not frame.ignoreUpdates and true
		end
	end
end

function S:CreateBackdrop(frame, template, glossTex, ignoreUpdates, _, _, _, noScale, allPoints, frameLevel)
	local parent = (frame.IsObjectType and frame:IsObjectType('Texture') and frame:GetParent()) or frame
	local backdrop = frame.backdrop or CreateFrame('Frame', nil, parent)
	if not frame.backdrop then frame.backdrop = backdrop end

	S:SetTemplate(backdrop, template, glossTex, ignoreUpdates, _, _, _, noScale)

	if allPoints then
		if allPoints == true then
			backdrop:SetAllPoints()
		else
			backdrop:SetAllPoints(allPoints)
		end
	else
		S:SetOutside(backdrop, frame, nil, nil, nil, noScale)
	end

	if frameLevel then
		if frameLevel == true then
			S:BackdropFrameLevel(backdrop, parent:GetFrameLevel())
		else
			S:BackdropFrameLevel(backdrop, frameLevel)
		end
	else
		S:BackdropFrameLower(backdrop, parent)
	end
end

function S:CreateShadow(frame, size, pass)
	if not pass and frame.shadow then return end
	if not size then size = 3 end

	local offset = (S.PixelMode and size) or (size + 1)
	local shadow = CreateFrame('Frame', nil, frame, 'BackdropTemplate')
	shadow:SetFrameLevel(1)
	shadow:SetFrameStrata(frame:GetFrameStrata())
	S:SetOutside(shadow, frame, offset, offset, nil, true)
	shadow:SetBackdrop(shadowTemplate)
	shadow:SetBackdropColor(0, 0, 0, 0)
	shadow:SetBackdropBorderColor(0, 0, 0, 0.9)

	S.Shadows[shadow] = true

	if pass then
		return shadow
	else
		frame.shadow = shadow
	end
end

local STRIP_TEX = 'Texture'
local STRIP_FONT = 'FontString'
local function StripRegion(which, object, kill, zero)
	if kill then
		object:Kill()
	elseif zero then
		object:SetAlpha(0)
	elseif which == STRIP_TEX then
		object:SetTexture('')
		object:SetAtlas('')
	elseif which == STRIP_FONT then
		object:SetText('')
	end
end

local function StripType(which, object, kill, zero)
	if object:IsObjectType(which) then
		StripRegion(which, object, kill, zero)
	else
		if which == STRIP_TEX then
			local FrameName = object.GetName and object:GetName()
			for _, Blizzard in pairs(BlizzardFrames) do
				local BlizzFrame = object[Blizzard] or (FrameName and _G[FrameName..Blizzard])
				if BlizzFrame and BlizzFrame.StripTextures then
					S:StripTextures(BlizzFrame, kill, zero)
				end
			end
		end

		if object.GetNumRegions then
			for _, region in next, { object:GetRegions() } do
				if region and region.IsObjectType and region:IsObjectType(which) then
					StripRegion(which, region, kill, zero)
				end
			end
		end
	end
end

function S:StripTextures(object, kill, zero)
	StripType(STRIP_TEX, object, kill, zero)
end

function S:StripTexts(object, kill, zero)
	StripType(STRIP_FONT, object, kill, zero)
end

function S:FontTemplate(fs, font, size, style, skip)
	if not skip then -- ignore updates from UpdateFontTemplates
		fs.font, fs.fontSize, fs.fontStyle = font, size, style
	end

	-- grab values from profile before conversion
	if not style then style = AS:CheckOption('FontStyle') end
	if not size then size = AS:CheckOption('FontSize') end

	-- shadow mode when using 'NONE'
	if style == 'NONE' then
		fs:SetShadowOffset(1, -0.5)
		fs:SetShadowColor(0, 0, 0, 1)
	else
		fs:SetShadowOffset(0, 0)
		fs:SetShadowColor(0, 0, 0, 0)
	end

	-- convert because of bad values between versions
	if style == 'NONE' and not S.Classic then
		style = ''
	elseif style == '' and S.Classic then
		style = 'NONE'
	end

	fs:SetFont(font or AS.Libs.LSM:Fetch('font', AS:CheckOption('Font')), size, style)

	S.Texts[fs] = true
end

function S:StyleButton(button, noHover, noPushed, noChecked)
	if button.SetHighlightTexture and button.CreateTexture and not button.hover and not noHover then
		local hover = button:CreateTexture()
		S:SetInside(hover)
		hover:SetBlendMode('ADD')
		hover:SetColorTexture(1, 1, 1, 0.3)
		button:SetHighlightTexture(hover)
		button.hover = hover
	end

	if button.SetPushedTexture and button.CreateTexture and not button.pushed and not noPushed then
		local pushed = button:CreateTexture()
		S:SetInside(pushed)
		pushed:SetBlendMode('ADD')
		pushed:SetColorTexture(0.9, 0.8, 0.1, 0.3)
		button:SetPushedTexture(pushed)
		button.pushed = pushed
	end

	if button.SetCheckedTexture and button.CreateTexture and not button.checked and not noChecked then
		local checked = button:CreateTexture()
		S:SetInside(checked)
		checked:SetBlendMode('ADD')
		checked:SetColorTexture(1, 1, 1, 0.3)
		button:SetCheckedTexture(checked)
		button.checked = checked
	end

	if button.cooldown then
		button.cooldown:SetDrawEdge(false)
		S:SetInside(button.cooldown, button, 0, 0)
	end
end

do
	local function HighlightOnEnter(button)
		local r, g, b = unpack(Media.valueColor)
		button.HighlightTexture:SetVertexColor(r, g, b, 0.50)
		button.HighlightTexture:Show()
	end

	local function HighlightOnLeave(button)
		button.HighlightTexture:SetVertexColor(0, 0, 0, 0)
		button.HighlightTexture:Hide()
	end

	function S:HandleCategoriesButtons(button, strip)
		if button.isSkinned then return end

		if button.SetNormalTexture then button:SetNormalTexture(Media.ClearTexture) end
		if button.SetHighlightTexture then button:SetHighlightTexture(Media.ClearTexture) end
		if button.SetPushedTexture then button:SetPushedTexture(Media.ClearTexture) end
		if button.SetDisabledTexture then button:SetDisabledTexture(Media.ClearTexture) end

		if strip then button:StripTextures() end
		S:HandleBlizzardRegions(button)

		button.HighlightTexture = button:CreateTexture(nil, "BACKGROUND") -- Try HIGHLIGHT
		button.HighlightTexture:SetBlendMode("BLEND")
		button.HighlightTexture:SetSize(button:GetSize())
		S:Point(button.HighlightTexture, 'CENTER', button, 0, 2)
		button.HighlightTexture:SetTexture(Media.Blank)
		button.HighlightTexture:Hide()

		button:HookScript('OnEnter', HighlightOnEnter)
		button:HookScript('OnLeave', HighlightOnLeave)

		button.isSkinned = true
	end
end

do
	local gradients = { 'leftGrad', 'rightGrad' }
	function S:HandleButtonHighlight(frame, layer, color)
		if frame.SetHighlightTexture then
			frame:SetHighlightTexture(S.Media.ClearTexture)
		end

		local r, g, b = 0.9, 0.9, 0.9
		if color then
			r, g, b = color.r or color[1], color.g or color[2], color.b or color[3]
		end

		if not frame.leftGrad then
			for _, which in pairs(gradients) do
				local grad = frame:CreateTexture(nil, layer or 'HIGHLIGHT')
				S:Height(grad, frame:GetHeight() * 0.95)
				grad:SetTexture(Media.barTexture)
				frame[which] = grad
			end
		end

		S:Point(frame.leftGrad, 'LEFT', frame, 'CENTER')
		S:Point(frame.rightGrad, 'RIGHT', frame, 'CENTER')

		if S.Retail or S.Wrath then
			frame.leftGrad:SetGradient("Horizontal", { r, g, b, 0.35 }, { r, g, b, 0 })
			frame.rightGrad:SetGradient("Horizontal", { r, g, b, 0 }, { r, g, b, 0.35 })
		else
			frame.leftGrad:SetGradientAlpha("Horizontal", r, g, b, 0.35, r, g, b, 0)
			frame.rightGrad:SetGradientAlpha("Horizontal", r, g, b, 0, r, g, b, 0.35)
		end
	end
end

function S:HandlePointXY(frame, x, y)
	local a, b, c, d, e = frame:GetPoint()
	frame:SetPoint(a, b, c, x or d, y or e)
end

function S:HandleFrame(frame, setBackdrop, template, x1, y1, x2, y2)
	local name = frame and frame.GetName and frame:GetName()
	local insetFrame = frame.Inset or name and _G[name..'Inset']
	local portraitFrame = frame.Portrait or frame.portrait or name and _G[name..'Portrait']
	local portraitFrameOverlay = frame.PortraitOverlay or name and _G[name..'PortraitOverlay']
	local artFrameOverlay = frame.ArtOverlayFrame or name and _G[name..'ArtOverlayFrame']
	local closeButton = frame.CloseButton or name and _G[name..'CloseButton']

	S:StripTextures(frame)

	if portraitFrame then portraitFrame:SetAlpha(0) end
	if portraitFrameOverlay then portraitFrameOverlay:SetAlpha(0) end
	if artFrameOverlay then artFrameOverlay:SetAlpha(0) end

	if insetFrame then
		S:HandleInsetFrame(insetFrame)
	end

	if closeButton then
		S:HandleCloseButton(closeButton)
	end

	if setBackdrop then
		S:CreateBackdrop(frame, template or 'Transparent')
	else
		S:SetTemplate(frame, template or 'Transparent')
	end

	if frame.backdrop then
		S:Point(frame.backdrop, 'TOPLEFT', x1 or 0, y1 or 0)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', x2 or 0, y2 or 0)
	end
end

function S:HandleInsetFrame(frame)
	if frame.InsetBorderTop then frame.InsetBorderTop:Hide() end
	if frame.InsetBorderTopLeft then frame.InsetBorderTopLeft:Hide() end
	if frame.InsetBorderTopRight then frame.InsetBorderTopRight:Hide() end
	if frame.InsetBorderBottom then frame.InsetBorderBottom:Hide() end
	if frame.InsetBorderBottomLeft then frame.InsetBorderBottomLeft:Hide() end
	if frame.InsetBorderBottomRight then frame.InsetBorderBottomRight:Hide() end
	if frame.InsetBorderLeft then frame.InsetBorderLeft:Hide() end
	if frame.InsetBorderRight then frame.InsetBorderRight:Hide() end
	if frame.Bg then frame.Bg:Hide() end
end

-- All frames that have a Portrait
function S:HandlePortraitFrame(frame, createBackdrop, noStrip)
	local name = frame and frame.GetName and frame:GetName()
	local insetFrame = frame.Inset or name and _G[name..'Inset']
	local portraitFrame = frame.Portrait or frame.portrait or name and _G[name..'Portrait']
	local portraitFrameOverlay = frame.PortraitOverlay or name and _G[name..'PortraitOverlay']
	local artFrameOverlay = frame.ArtOverlayFrame or name and _G[name..'ArtOverlayFrame']
	local closeButton = frame.CloseButton or name and _G[name..'CloseButton']

	if not noStrip then
		S:StripTextures(frame)

		if portraitFrame then portraitFrame:SetAlpha(0) end
		if portraitFrameOverlay then portraitFrameOverlay:SetAlpha(0) end
		if artFrameOverlay then artFrameOverlay:SetAlpha(0) end

		if insetFrame then
			S:HandleInsetFrame(insetFrame)
		end
	end

	if closeButton then
		S:HandleCloseButton(closeButton)
	end

	if createBackdrop then
		S:CreateBackdrop(frame, 'Transparent', nil, nil, nil, nil, nil, nil, true)
	else
		S:SetTemplate(frame, 'Transparent')
	end
end

function S:SetBackdropBorderColor(frame, script)
	if frame.backdrop then frame = frame.backdrop end
	if frame.SetBackdropBorderColor then
		frame:SetBackdropBorderColor(unpack(script == 'OnEnter' and Media.valueColor or Media.borderColor))
	end
end

function S:SetModifiedBackdrop()
	if self:IsEnabled() then
		S:SetBackdropBorderColor(self, 'OnEnter')
	end
end

function S:SetOriginalBackdrop()
	if self:IsEnabled() then
		S:SetBackdropBorderColor(self, 'OnLeave')
	end
end

function S:SetDisabledBackdrop()
	if self.GetFontString and self:GetFontString() ~= nil then
		self:GetFontString():SetTextColor(.5, .5, .5)
	end
	if self:IsMouseOver() then
		S:SetBackdropBorderColor(self, 'OnDisable')
	end
end

function S:SetEnabledBackdrop()
	if self.GetFontString and self:GetFontString() ~= nil then
		self:GetFontString():SetTextColor(.5, .5, .5)
	end
end

-- function to handle the recap button script
function S:UpdateRecapButton()
	-- when UpdateRecapButton runs and enables the button, it unsets OnEnter
	-- we need to reset it with ours. blizzard will replace it when the button
	-- is disabled. so, we don't have to worry about anything else.
	if self and self.button4 and self.button4:IsEnabled() then
		self.button4:SetScript('OnEnter', S.SetModifiedBackdrop)
		self.button4:SetScript('OnLeave', S.SetOriginalBackdrop)
	end
end

do -- We need to test this for the BGScore frame
	S.PVPHonorXPBarFrames = {}
	S.PVPHonorXPBarSkinned = false

	local function SetNextAvailable(XPBar)
		if not S.PVPHonorXPBarFrames[XPBar:GetParent():GetName()] then return end

		S:StripTextures(XPBar)

		if XPBar.Bar and not XPBar.Bar.backdrop then
			S:CreateBackdrop(XPBar.Bar)

			if XPBar.Bar.Background then
				S:SetInside(XPBar.Bar.Background, XPBar.Bar.backdrop)
			end
			if XPBar.Bar.Spark then
				XPBar.Bar.Spark:SetAlpha(0)
			end
			if XPBar.Bar.OverlayFrame and XPBar.Bar.OverlayFrame.Text then
				XPBar.Bar.OverlayFrame.Text:ClearAllPoints()
				S:Point(XPBar.Bar.OverlayFrame.Text, 'CENTER', XPBar.Bar)
			end
		end

		if XPBar.PrestigeReward and XPBar.PrestigeReward.Accept then
			XPBar.PrestigeReward.Accept:ClearAllPoints()
			S:Point(XPBar.PrestigeReward.Accept, 'TOP', XPBar.PrestigeReward, 'BOTTOM', 0, 0)
			if not XPBar.PrestigeReward.Accept.template then
				S:HandleButton(XPBar.PrestigeReward.Accept)
			end
		end

		if XPBar.NextAvailable then
			if XPBar.Bar then
				XPBar.NextAvailable:ClearAllPoints()
				S:Point(XPBar.NextAvailable, 'LEFT', XPBar.Bar, 'RIGHT', 0, -2)
			end

			if not XPBar.NextAvailable.backdrop then
				S:StripTextures(XPBar.NextAvailable)
				S:CreateBackdrop(XPBar.NextAvailable)

				if XPBar.NextAvailable.Icon then
					local x = S.PixelMode and 1 or 2
					S:Point(XPBar.NextAvailable.backdrop, 'TOPLEFT', XPBar.NextAvailable.Icon, -x, x)
					S:Point(XPBar.NextAvailable.backdrop, 'BOTTOMRIGHT', XPBar.NextAvailable.Icon, x, -x)
				end
			end

			if XPBar.NextAvailable.Icon then
				S:HandleIcon(XPBar.NextAvailable.Icon)
			end
		end
	end

	function S:SkinPVPHonorXPBar(frame)
		S.PVPHonorXPBarFrames[frame] = true

		if S.PVPHonorXPBarSkinned then return end
		S.PVPHonorXPBarSkinned = true

		hooksecurefunc('PVPHonorXPBar_SetNextAvailable', SetNextAvailable)
	end
end

function S:StatusBarColorGradient(bar, value, maxValue, backdrop)
	if not (bar and value) then return end

	local current = (not maxValue and value) or (value and maxValue and maxValue ~= 0 and value/maxValue)
	if not current then return end

	local r, g, b = S:ColorGradient(current, 0.8,0,0, 0.8,0.8,0, 0,0.8,0)
	bar:SetStatusBarColor(r, g, b)

	if not backdrop then
		backdrop = bar.backdrop
	end

	if backdrop then
		backdrop:SetBackdropColor(r * 0.25, g * 0.25, b * 0.25)
	end
end

-- DropDownMenu library support
function S:SkinLibDropDownMenu(prefix)
	if S[prefix..'_UIDropDownMenuSkinned'] then return end

	local key = (prefix == 'L4' or prefix == 'L3') and 'L' or prefix

	local bd = _G[key..'_DropDownList1Backdrop']
	local mbd = _G[key..'_DropDownList1MenuBackdrop']
	if bd and not bd.template then S:SetTemplate(bd) end
	if mbd and not mbd.template then S:SetTemplate(mbd) end

	S[prefix..'_UIDropDownMenuSkinned'] = true

	local lib = prefix == 'L4' and LibStub.libs['LibUIDropDownMenu-4.0']
	if (lib and lib.UIDropDownMenu_CreateFrames) or _G[key..'_UIDropDownMenu_CreateFrames'] then
		hooksecurefunc(lib or _G, (lib and '' or key..'_') .. 'UIDropDownMenu_CreateFrames', function()
			local lvls = _G[(key == 'Lib' and 'LIB' or key)..'_UIDROPDOWNMENU_MAXLEVELS']
			local ddbd = lvls and _G[key..'_DropDownList'..lvls..'Backdrop']
			local ddmbd = lvls and _G[key..'_DropDownList'..lvls..'MenuBackdrop']
			if ddbd and not ddbd.template then S:SetTemplate(ddbd) end
			if ddmbd and not ddmbd.template then S:SetTemplate(ddmbd) end
		end)
	end
end

function S:SkinTalentListButtons(frame)
	local name = frame and frame:GetName()
	if name then
		local bcl = _G[name..'BtnCornerLeft']
		local bcr = _G[name..'BtnCornerRight']
		local bbb = _G[name..'ButtonBottomBorder']
		if bcl then bcl:SetTexture() end
		if bcr then bcr:SetTexture() end
		if bbb then bbb:SetTexture() end
	end

	if frame.Inset then
		S:HandleInsetFrame(frame.Inset)

		S:Point(frame.Inset, 'TOPLEFT', 4, -60)
		S:Point(frame.Inset, 'BOTTOMRIGHT', -6, 26)
	end
end

do
	local quality = Enum.ItemQuality
	local iconColors = {
		['auctionhouse-itemicon-border-gray']		= ITEM_QUALITY_COLORS[quality.Poor],
		['auctionhouse-itemicon-border-white']		= ITEM_QUALITY_COLORS[quality.Common or quality.Standard],
		['auctionhouse-itemicon-border-green']		= ITEM_QUALITY_COLORS[quality.Uncommon or quality.Good],
		['auctionhouse-itemicon-border-blue']		= ITEM_QUALITY_COLORS[quality.Rare],
		['auctionhouse-itemicon-border-purple']		= ITEM_QUALITY_COLORS[quality.Epic],
		['auctionhouse-itemicon-border-orange']		= ITEM_QUALITY_COLORS[quality.Legendary],
		['auctionhouse-itemicon-border-artifact']	= ITEM_QUALITY_COLORS[quality.Artifact],
		['auctionhouse-itemicon-border-account']	= ITEM_QUALITY_COLORS[quality.Heirloom]
	}

	local function hideBorder(border)
		border:SetAlpha(0)
		S:StripTextures(border)
	end

	local function colorAtlas(border, atlas)
		local color = iconColors[atlas]
		if not color then return end

		hideBorder(border)

		if border.customFunc then
			local br, bg, bb = unpack(Media.borderColor)
			border.customFunc(border, color.r, color.g, color.b, 1, br, bg, bb)
		elseif border.customBackdrop then
			border.customBackdrop:SetBackdropBorderColor(color.r, color.g, color.b)
		end
	end

	local function colorVertex(border, r, g, b, a)
		hideBorder(border)

		if border.customFunc then
			local br, bg, bb = unpack(Media.borderColor)
			border.customFunc(border, r, g, b, a, br, bg, bb)
		elseif border.customBackdrop then
			border.customBackdrop:SetBackdropBorderColor(r, g, b)
		end
	end

	local function borderHide(border)
		local br, bg, bb = unpack(Media.borderColor)
		if border.customFunc then
			local r, g, b, a = border:GetVertexColor()
			border.customFunc(border, r, g, b, a, br, bg, bb)
		elseif border.customBackdrop then
			border.customBackdrop:SetBackdropBorderColor(br, bg, bb)
		end
	end

	local function borderShown(border, show)
		if not show then
			borderHide(border)
		end
	end

	function S:HandleIconBorder(border, backdrop, customFunc)
		if not backdrop then
			local parent = border:GetParent()
			backdrop = parent.backdrop or parent
		end

		border.customBackdrop = backdrop

		if not border.IconBorderHooked then
			hideBorder(border)

			hooksecurefunc(border, 'SetAtlas', colorAtlas)
			hooksecurefunc(border, 'SetVertexColor', colorVertex)
			hooksecurefunc(border, 'SetShown', borderShown)
			hooksecurefunc(border, 'Hide', borderHide)

			border.IconBorderHooked = true
		end

		local r, g, b, a = border:GetVertexColor()
		local atlas = iconColors[border.GetAtlas and border:GetAtlas()]
		if customFunc then
			border.customFunc = customFunc
			local br, bg, bb = unpack(Media.borderColor)
			customFunc(border, r, g, b, a, br, bg, bb)
		elseif atlas then
			backdrop:SetBackdropBorderColor(atlas.r, atlas.g, atlas.b, 1)
		elseif r then
			backdrop:SetBackdropBorderColor(r, g, b, a)
		else
			local br, bg, bb = unpack(Media.borderColor)
			backdrop:SetBackdropBorderColor(br, bg, bb)
		end
	end
end

function S:HandleButton(button, strip, isDecline, noStyle, createBackdrop, template, noGlossTex, overrideTex, frameLevel, regionsKill, regionsZero)
	if button.isSkinned then return end

	if button.SetNormalTexture and not overrideTex then button:SetNormalTexture(S.Media.ClearTexture) end
	if button.SetHighlightTexture then button:SetHighlightTexture(S.Media.ClearTexture) end
	if button.SetPushedTexture then button:SetPushedTexture(S.Media.ClearTexture) end
	if button.SetDisabledTexture then button:SetDisabledTexture(S.Media.ClearTexture) end

	if strip then S:StripTextures(button) end

	S:HandleBlizzardRegions(button, nil, regionsKill, regionsZero)

	if button.Icon then
		local Texture = button.Icon:GetTexture()
		if Texture and (type(Texture) == 'string' and strfind(Texture, [[Interface\ChatFrame\ChatFrameExpandArrow]])) then
			button.Icon:SetTexture(Media.Arrow)
			button.Icon:SetRotation(S.ArrowRotation.right)
			button.Icon:SetVertexColor(1, 1, 1)
		end
	end

	if isDecline and button.Icon then
		button.Icon:SetTexture(Media.Close)
	end

	if not noStyle then
		if createBackdrop then
			S:CreateBackdrop(button, AS:CheckOption('ElvUIStyle', 'ElvUI') and 'Default' or template, not noGlossTex, nil, nil, nil, nil, nil, true, frameLevel)
		else
			S:SetTemplate(button, AS:CheckOption('ElvUIStyle', 'ElvUI') and 'Default' or template, not noGlossTex)
		end

		button:HookScript('OnEnter', S.SetModifiedBackdrop)
		button:HookScript('OnLeave', S.SetOriginalBackdrop)
		button:HookScript('OnEnable', S.SetEnabledBackdrop)
		button:HookScript('OnDisable', S.SetDisabledBackdrop)
	end

	button.isSkinned = true
end

do
	local function GetElement(frame, element, useParent)
		if useParent then frame = frame:GetParent() end

		local child = frame[element]
		if child then return child end

		local name = frame:GetName()
		if name then return _G[name..element] end
	end

	local function GetButton(frame, buttons)
		for _, data in ipairs(buttons) do
			if type(data) == 'string' then
				local found = GetElement(frame, data)
				if found then return found end
			else -- has useParent
				local found = GetElement(frame, data[1], data[2])
				if found then return found end
			end
		end
	end

	local function ThumbStatus(frame)
		if not frame.Thumb then
			return
		elseif not frame:IsEnabled() then
			frame.Thumb.backdrop:SetBackdropColor(0.3, 0.3, 0.3)
			return
		end

		local _, maxValue = frame:GetMinMaxValues()
		if maxValue == 0 then
			frame.Thumb.backdrop:SetBackdropColor(0.3, 0.3, 0.3)
		else
			frame.Thumb.backdrop:SetBackdropColor(unpack(Media.valueColor))
		end
	end

	local function ThumbWatcher(frame)
		hooksecurefunc(frame, 'Enable', ThumbStatus)
		hooksecurefunc(frame, 'Disable', ThumbStatus)
		hooksecurefunc(frame, 'SetEnabled', ThumbStatus)
		hooksecurefunc(frame, 'SetMinMaxValues', ThumbStatus)
		ThumbStatus(frame)
	end

	local upButtons = {'ScrollUpButton', 'UpButton', 'ScrollUp', {'scrollUp', true}, 'Back'}
	local downButtons = {'ScrollDownButton', 'DownButton', 'ScrollDown', {'scrollDown', true}, 'Forward'}
	local thumbButtons = {'ThumbTexture', 'thumbTexture', 'Thumb'}

	function S:HandleScrollBar(scrollBar, thumbY, thumbX, template)
		if scrollBar.backdrop then return end

		local upButton, downButton = GetButton(scrollBar, upButtons), GetButton(scrollBar, downButtons)
		local thumb = GetButton(scrollBar, thumbButtons) or (scrollBar.GetThumbTexture and scrollBar:GetThumbTexture())

		S:StripTextures(scrollBar)
		S:CreateBackdrop(scrollBar, template or 'Transparent', nil, nil, nil, nil, nil, nil, nil, true)
		S:Point(scrollBar.backdrop, 'TOPLEFT', upButton or scrollBar, upButton and 'BOTTOMLEFT' or 'TOPLEFT', 0, 1)
		S:Point(scrollBar.backdrop, 'BOTTOMRIGHT', downButton or scrollBar, upButton and 'TOPRIGHT' or 'BOTTOMRIGHT', 0, -1)

		if scrollBar.Background then scrollBar.Background:Hide() end
		if scrollBar.ScrollUpBorder then scrollBar.ScrollUpBorder:Hide() end
		if scrollBar.ScrollDownBorder then scrollBar.ScrollDownBorder:Hide() end

		local frameLevel = scrollBar:GetFrameLevel()
		if upButton then
			S:HandleNextPrevButton(upButton, 'up')
			upButton:SetFrameLevel(frameLevel + 2)
		end
		if downButton then
			S:HandleNextPrevButton(downButton, 'down')
			downButton:SetFrameLevel(frameLevel + 2)
		end
		if thumb and not thumb.backdrop then
			thumb:SetTexture()
			S:CreateBackdrop(thumb, nil, true, true, nil, nil, nil, nil, nil, frameLevel + 1)

			if not scrollBar.Thumb then
				scrollBar.Thumb = thumb
			end

			if thumb.backdrop then
				if not thumbX then thumbX = 0 end
				if not thumbY then thumbY = 0 end

				S:Point(thumb.backdrop, 'TOPLEFT', thumb, thumbX, -thumbY)
				S:Point(thumb.backdrop, 'BOTTOMRIGHT', thumb, -thumbX, thumbY)

				if scrollBar.SetEnabled then
					ThumbWatcher(scrollBar)
				else
					thumb.backdrop:SetBackdropColor(unpack(Media.valueColor))
				end
			end
		end
	end

	-- WoWTrimScrollBar
	local function ReskinScrollBarArrow(frame, direction)
		S:HandleNextPrevButton(frame, direction)

		if frame.Texture then
			frame.Texture:SetAlpha(0)

			if frame.Overlay then
				frame.Overlay:SetAlpha(0)
			end
		else
			S:StripTextures(frame)
		end
	end

	local function ThumbOnEnter(frame)
		local r, g, b = unpack(Media.valueColor)
		local thumb = frame.thumb or frame
		if thumb.backdrop then
			thumb.backdrop:SetBackdropColor(r, g, b, .75)
		end
	end

	local function ThumbOnLeave(frame)
		local r, g, b = unpack(Media.valueColor)
		local thumb = frame.thumb or frame

		if thumb.backdrop and not thumb.__isActive then
			thumb.backdrop:SetBackdropColor(r, g, b, .25)
		end
	end

	local function ThumbOnMouseDown(frame)
		local r, g, b = unpack(Media.valueColor)
		local thumb = frame.thumb or frame
		thumb.__isActive = true

		if thumb.backdrop then
			thumb.backdrop:SetBackdropColor(r, g, b, .75)
		end
	end

	local function ThumbOnMouseUp(frame)
		local r, g, b = unpack(Media.valueColor)
		local thumb = frame.thumb or frame
		thumb.__isActive = nil

		if thumb.backdrop then
			thumb.backdrop:SetBackdropColor(r, g, b, .25)
		end
	end

	function S:HandleTrimScrollBar(scrollBar, small)
		S:StripTextures(scrollBar)

		ReskinScrollBarArrow(scrollBar.Back, 'up')
		ReskinScrollBarArrow(scrollBar.Forward, 'down')

		if scrollBar.Background then
			scrollBar.Background:Hide()
		end

		local track = scrollBar.Track
		if track then
			track:DisableDrawLayer('ARTWORK')
		end

		local thumb = scrollBar:GetThumb()
		if thumb then
			thumb:DisableDrawLayer('BACKGROUND')
			S:CreateBackdrop(thumb)
			thumb.backdrop:SetFrameLevel(thumb:GetFrameLevel()+1)

			local r, g, b = unpack(Media.valueColor)
			thumb.backdrop:SetBackdropColor(r, g, b, .25)

			if not small then
				S:Point(thumb.backdrop, 'TOPLEFT', 4, -1)
				S:Point(thumb.backdrop, 'BOTTOMRIGHT', -4, 1)
			end

			thumb:HookScript('OnEnter', ThumbOnEnter)
			thumb:HookScript('OnLeave', ThumbOnLeave)
			thumb:HookScript('OnMouseUp', ThumbOnMouseUp)
			thumb:HookScript('OnMouseDown', ThumbOnMouseDown)
		end
	end
end

do --Tab Regions
	local tabs = { 'LeftDisabled', 'MiddleDisabled', 'RightDisabled', 'Left', 'Middle', 'Right' }

	function S:HandleTab(tab, noBackdrop, template)
		if not tab or (tab.backdrop and not noBackdrop) then return end

		for _, object in pairs(tabs) do
			if tab[object] then
				tab[object]:SetTexture()
			else
				local textureName = tab:GetName() and _G[tab:GetName()..object]
				if textureName then
					textureName:SetTexture()
				end
			end
		end

		local highlightTex = tab.GetHighlightTexture and tab:GetHighlightTexture()
		if highlightTex then
			highlightTex:SetTexture()
		else
			S:StripTextures(tab)
		end

		if not noBackdrop then
			S:CreateBackdrop(tab, AS:CheckOption('ElvUIStyle', 'ElvUI') and 'Default' or template)

			local spacing = S.Retail and 3 or 10
			S:Point(tab.backdrop, 'TOPLEFT', spacing, S.PixelMode and -1 or -3)
			S:Point(tab.backdrop, 'BOTTOMRIGHT', -spacing, 3)
		end
	end
end

function S:HandleRotateButton(button)
	if button.isSkinned then return end

	S:SetTemplate(button)
	S:Size(button, button:GetWidth() - 14, button:GetHeight() - 14)

	local normTex = button:GetNormalTexture()
	local pushTex = button:GetPushedTexture()
	local highlightTex = button:GetHighlightTexture()

	S:SetInside(normTex)
	normTex:SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)

	pushTex:SetAllPoints(normTex)
	pushTex:SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)

	highlightTex:SetAllPoints(normTex)
	highlightTex:SetColorTexture(1, 1, 1, 0.3)

	button.isSkinned = true
end

do
	local btns = { MaximizeButton = 'up', MinimizeButton = 'down' }

	local function buttonOnEnter(button)
		local r,g,b = unpack(Media.valueColor)
		button:GetNormalTexture():SetVertexColor(r,g,b)
		button:GetPushedTexture():SetVertexColor(r,g,b)
	end
	local function buttonOnLeave(button)
		button:GetNormalTexture():SetVertexColor(1, 1, 1)
		button:GetPushedTexture():SetVertexColor(1, 1, 1)
	end

	function S:HandleMaxMinFrame(frame)
		if frame.isSkinned then return end

		S:StripTextures(frame, true)

		for name, direction in pairs(btns) do
			local button = frame[name]
			if button then
				S:Size(button, 14, 14)
				button:ClearAllPoints()
				S:Point(button, 'CENTER')
				button:SetHitRectInsets(1, 1, 1, 1)
				S:Kill(button:GetHighlightTexture())

				button:SetScript('OnEnter', buttonOnEnter)
				button:SetScript('OnLeave', buttonOnLeave)

				button:SetNormalTexture(Media.Arrow)
				button:GetNormalTexture():SetRotation(S.ArrowRotation[direction])

				button:SetPushedTexture(Media.Arrow)
				button:GetPushedTexture():SetRotation(S.ArrowRotation[direction])
			end
		end

		frame.isSkinned = true
	end
end

function S:HandleBlizzardRegions(frame, name, kill, zero)
	if not name then name = frame.GetName and frame:GetName() end
	for _, area in pairs(BlizzardRegions) do
		local object = (name and _G[name..area]) or frame[area]
		if object then
			if kill then
				S:Kill(object)
			elseif zero then
				object:SetAlpha(0)
			else
				object:Hide()
			end
		end
	end
end

function S:HandleEditBox(editBox, template)
	if editBox.backdrop then return end

	S:CreateBackdrop(editBox, AS:CheckOption('ElvUIStyle', 'ElvUI') and 'Default' or template, nil, nil, nil, nil, nil, nil, nil, true)
	editBox.backdrop:SetPoint('TOPLEFT', -2, 0)
	editBox.backdrop:SetPoint('BOTTOMRIGHT')
	S:HandleBlizzardRegions(editBox)

	local EditBoxName = editBox:GetName()
	if EditBoxName and (strfind(EditBoxName, 'Silver') or strfind(EditBoxName, 'Copper')) then
		S:Point(editBox.backdrop, 'BOTTOMRIGHT', -12, -2)
	end
end

function S:HandleDropDownBox(dropDown, width, pos, template)
	local frameName = dropDown.GetName and dropDown:GetName()
	local button = dropDown.Button or frameName and (_G[frameName..'Button'] or _G[frameName..'_Button'])
	local text = frameName and _G[frameName..'Text'] or dropDown.Text
	local icon = dropDown.Icon

	if not width then
		width = 155
	end

	S:Width(dropDown, width)
	S:StripTextures(dropDown)
	S:CreateBackdrop(dropDown, template)
	dropDown:SetFrameLevel(dropDown:GetFrameLevel() + 2)
	S:Point(dropDown.backdrop, 'TOPLEFT', 20, -2)
	S:Point(dropDown.backdrop, 'BOTTOMRIGHT', button, 'BOTTOMRIGHT', 2, -2)

	button:ClearAllPoints()

	if pos then
		S:Point(button, 'TOPRIGHT', dropDown.Right, -20, -21)
	else
		S:Point(button, 'RIGHT', dropDown, 'RIGHT', -10, 3)
	end

	button.SetPoint = S.noop
	S:HandleNextPrevButton(button, 'down')

	if text then
		text:ClearAllPoints()
		S:Point(text, 'RIGHT', button, 'LEFT', -2, 0)
	end

	if icon then
		S:Point(icon, 'LEFT', 23, 0)
	end
end

function S:HandleStatusBar(statusBar, color, template)
	statusBar:SetFrameLevel(statusBar:GetFrameLevel() + 1)
	S:StripTextures(statusBar)
	S:CreateBackdrop(statusBar, template or 'Transparent')
	statusBar:SetStatusBarTexture(Media.barTexture)
	statusBar:SetStatusBarColor(unpack(color or AS:CheckOption('StatusBarColor')))

	S.StatusBars[statusBar] = true
end

do
	local function checkNormalTexture(checkBox, texture) if texture ~= S.Media.ClearTexture then checkBox:SetNormalTexture(S.Media.ClearTexture) end end
	local function checkPushedTexture(checkBox, texture) if texture ~= S.Media.ClearTexture then checkBox:SetPushedTexture(S.Media.ClearTexture) end end
	local function checkHighlightTexture(checkBox, texture) if texture ~= S.Media.ClearTexture then checkBox:SetHighlightTexture(S.Media.ClearTexture) end end
	local function checkCheckedTexture(checkBox, texture)
		if texture == Media.StatusBar then return end
		checkBox:SetCheckedTexture(Media.StatusBar)
	end
	local function checkOnDisable(checkBox)
		if not checkBox.SetDisabledTexture then return end
		checkBox:SetDisabledTexture(checkBox:GetChecked() and Media.StatusBar or '')
	end

	function S:HandleCheckBox(checkBox, noBackdrop, noReplaceTextures, frameLevel, template)
		if checkBox.isSkinned then return end

		S:StripTextures(checkBox)

		if noBackdrop then
			S:Size(checkBox, 16)
		else
			S:CreateBackdrop(checkBox, AS:CheckOption('ElvUIStyle', 'ElvUI') and 'Default' or template, nil, nil, nil, nil, nil, nil, nil, frameLevel)
			S:SetInside(checkBox.backdrop, nil, 4, 4)
		end

		if not noReplaceTextures then
			if checkBox.SetCheckedTexture then
				checkBox:SetCheckedTexture(Media.StatusBar)

				local checkedTexture = checkBox:GetCheckedTexture()
				checkedTexture:SetVertexColor(1, .82, 0, 0.8)
				S:SetInside(checkedTexture, checkBox.backdrop)
			end

			if checkBox.SetDisabledTexture then
				checkBox:SetDisabledTexture(Media.StatusBar)

				local disabledTexture = checkBox:GetDisabledTexture()
				disabledTexture:SetVertexColor(.6, .6, .6, .8)
				S:SetInside(disabledTexture, checkBox.backdrop)
			end

			checkBox:HookScript('OnDisable', checkOnDisable)

			hooksecurefunc(checkBox, 'SetNormalTexture', checkNormalTexture)
			hooksecurefunc(checkBox, 'SetPushedTexture', checkPushedTexture)
			hooksecurefunc(checkBox, 'SetCheckedTexture', checkCheckedTexture)
			hooksecurefunc(checkBox, 'SetHighlightTexture', checkHighlightTexture)
		end

		checkBox.isSkinned = true
	end
end

do
	local background = [[Interface\Minimap\UI-Minimap-Background]]

	local function buttonNormalTexture(button, texture) if texture ~= Media.ClearTexture then button:SetNormalTexture(Media.ClearTexture) end end
	local function buttonPushedTexture(button, texture) if texture ~= Media.ClearTexture then button:SetPushedTexture(Media.ClearTexture) end end
	local function buttonDisabledTexture(button, texture) if texture ~= Media.ClearTexture then button:SetDisabledTexture(Media.ClearTexture) end end
	local function buttonHighlightTexture(button, texture) if texture ~= Media.ClearTexture then button:SetHighlightTexture(Media.ClearTexture) end end

	function S:HandleRadioButton(button)
		if button.isSkinned then return end

		local InsideMask = button:CreateMaskTexture()
		InsideMask:SetTexture(background, 'CLAMPTOBLACKADDITIVE', 'CLAMPTOBLACKADDITIVE')
		S:Size(InsideMask, 10, 10)
		S:Point(InsideMask, 'CENTER')
		button.InsideMask = InsideMask

		local OutsideMask = button:CreateMaskTexture()
		OutsideMask:SetTexture(background, 'CLAMPTOBLACKADDITIVE', 'CLAMPTOBLACKADDITIVE')
		S:Size(OutsideMask, 13, 13)
		S:Point(OutsideMask, 'CENTER')
		button.OutsideMask = OutsideMask

		button:SetCheckedTexture(Media.StatusBar)
		button:SetNormalTexture(Media.StatusBar)
		button:SetHighlightTexture(Media.StatusBar)
		button:SetDisabledTexture(Media.StatusBar)

		local Check = button:GetCheckedTexture()
		Check:SetVertexColor(unpack(Media.valueColor))
		Check:SetTexCoord(0, 1, 0, 1)
		S:SetInside(Check)
		Check:AddMaskTexture(InsideMask)

		local Highlight = button:GetHighlightTexture()
		Highlight:SetTexCoord(0, 1, 0, 1)
		Highlight:SetVertexColor(1, 1, 1)
		Highlight:AddMaskTexture(InsideMask)

		local Normal = button:GetNormalTexture()
		S:SetOutside(Normal)
		Normal:SetTexCoord(0, 1, 0, 1)
		Normal:SetVertexColor(unpack(Media.borderColor))
		Normal:AddMaskTexture(OutsideMask)

		local Disabled = button:GetDisabledTexture()
		Disabled:SetVertexColor(.3, .3, .3)
		Disabled:AddMaskTexture(OutsideMask)

		hooksecurefunc(button, 'SetNormalTexture', buttonNormalTexture)
		hooksecurefunc(button, 'SetPushedTexture', buttonPushedTexture)
		hooksecurefunc(button, 'SetDisabledTexture', buttonDisabledTexture)
		hooksecurefunc(button, 'SetHighlightTexture', buttonHighlightTexture)

		button.isSkinned = true
	end
end

function S:HandleIcon(icon, backdrop, frameLevel)
	icon:SetTexCoord(unpack(Media.TexCoords))

	if icon:GetDrawLayer() ~= 'ARTWORK' then
		icon:SetDrawLayer('ARTWORK')
	end

	S:DisablePixelSnap(icon)

	if backdrop and not icon.backdrop then
		S:CreateBackdrop(icon, nil, nil, nil, nil, nil, nil, nil, nil, frameLevel)
	end
end

function S:HandleItemButton(button, setInside)
	if button.isSkinned then return end

	local name = button:GetName()
	local icon = button.icon or button.Icon or button.IconTexture or button.iconTexture or (name and (_G[name..'IconTexture'] or _G[name..'Icon']))
	local texture = icon and icon.GetTexture and icon:GetTexture()

	S:StripTextures(button)
	S:CreateBackdrop(button, nil, true, nil, nil, nil, nil, nil, true)
	S:StyleButton(button)

	if icon then
		S:HandleIcon(icon)

		if setInside then
			S:SetInside(icon, button)
		else
			S:SetOutside(button.backdrop, icon, 1, 1)
		end

		icon:SetParent(button.backdrop)

		if texture then
			icon:SetTexture(texture)
		end
	end

	button.isSkinned = true
end

do
	local closeOnEnter = function(btn) if btn.Texture then btn.Texture:SetVertexColor(unpack(Media.valueColor)) end end
	local closeOnLeave = function(btn) if btn.Texture then btn.Texture:SetVertexColor(1, 1, 1) end end

	function S:HandleCloseButton(button, point, x, y)
		S:StripTextures(button)

		if not button.Texture then
			button.Texture = button:CreateTexture(nil, 'OVERLAY')
			S:Point(button.Texture, 'CENTER')
			button.Texture:SetTexture(Media.Close)
			S:Size(button.Texture, 12, 12)
			button:HookScript('OnEnter', closeOnEnter)
			button:HookScript('OnLeave', closeOnLeave)
			button:SetHitRectInsets(6, 6, 7, 7)
		end

		if point then
			S:Point(button, 'TOPRIGHT', point, 'TOPRIGHT', x or 2, y or 2)
		end
	end

	function S:HandleNextPrevButton(button, arrowDir, color, noBackdrop, stripTexts, frameLevel)
		if button.isSkinned then return end

		if not arrowDir then
			arrowDir = 'down'

			local name = button:GetDebugName()
			local ButtonName = name and name:lower()
			if ButtonName then
				if strfind(ButtonName, 'left') or strfind(ButtonName, 'prev') or strfind(ButtonName, 'decrement') or strfind(ButtonName, 'backward') or strfind(ButtonName, 'back') then
					arrowDir = 'left'
				elseif strfind(ButtonName, 'right') or strfind(ButtonName, 'next') or strfind(ButtonName, 'increment') or strfind(ButtonName, 'forward') then
					arrowDir = 'right'
				elseif strfind(ButtonName, 'scrollup') or strfind(ButtonName, 'upbutton') or strfind(ButtonName, 'top') or strfind(ButtonName, 'asc') or strfind(ButtonName, 'home') or strfind(ButtonName, 'maximize') then
					arrowDir = 'up'
				end
			end
		end

		S:StripTextures(button)

		if button.Texture then
			button.Texture:SetAlpha(0)
		end

		if not noBackdrop then
			S:HandleButton(button, nil, nil, true, nil, nil, nil, nil, frameLevel)
		end

		if stripTexts then
			S:StripTexts(button)
		end

		button:SetNormalTexture(Media.Arrow)
		button:SetPushedTexture(Media.Arrow)
		button:SetDisabledTexture(Media.Arrow)

		local Normal, Disabled, Pushed = button:GetNormalTexture(), button:GetDisabledTexture(), button:GetPushedTexture()

		if noBackdrop then
			S:Size(button, 20, 20)
			Disabled:SetVertexColor(.5, .5, .5)
			button.Texture = Normal

			if not color then
				button:HookScript('OnEnter', closeOnEnter)
				button:HookScript('OnLeave', closeOnLeave)
			end
		else
			S:Size(button, 18, 18)
			Disabled:SetVertexColor(.3, .3, .3)
		end

		S:SetInside(Normal)
		S:SetInside(Pushed)
		S:SetInside(Disabled)

		Normal:SetTexCoord(0, 1, 0, 1)
		Pushed:SetTexCoord(0, 1, 0, 1)
		Disabled:SetTexCoord(0, 1, 0, 1)

		local rotation = S.ArrowRotation[arrowDir]
		if rotation then
			Normal:SetRotation(rotation)
			Pushed:SetRotation(rotation)
			Disabled:SetRotation(rotation)
		end

		if color then
			Normal:SetVertexColor(color.r, color.g, color.b)
		else
			Normal:SetVertexColor(1, 1, 1)
		end

		button.isSkinned = true
	end
end

function S:HandleSliderFrame(frame, template, frameLevel)
	local orientation = frame:GetOrientation()
	local size = 12

	if frame.SetBackdrop then
		frame:SetBackdrop()
	end

	S:StripTextures(frame)
	frame:SetThumbTexture(Media.StatusBar)

	if not frame.backdrop then
		S:CreateBackdrop(frame, AS:CheckOption('ElvUIStyle', 'ElvUI') and 'Default' or template, nil, nil, nil, nil, nil, nil, true, frameLevel)
	end

	local thumb = frame:GetThumbTexture()
	thumb:SetVertexColor(1, .82, 0, 0.8)
	S:Size(thumb, size - 2)

	if orientation == 'VERTICAL' then
		S:Width(frame, size)
	else
		S:Height(frame, size)

		for _, region in next, { frame:GetRegions() } do
			if region:IsObjectType('FontString') then
				local point, anchor, anchorPoint, x, y = region:GetPoint()
				if strfind(anchorPoint, 'BOTTOM') then
					S:Point(region, point, anchor, anchorPoint, x, y - 4)
				end
			end
		end
	end
end

-- Needs Redone
function S:CleanTexture(Object, Kill, Alpha)
	if Kill then
		S:Kill(Object)
	elseif Alpha then
		Object:SetAlpha(0)
	else
		Object:SetTexture('')
	end
end

function S:StripTexture(Object, Texture, Kill, Alpha)
	if Object:IsObjectType('Texture') and type(Object:GetTexture()) == 'string' and strlower(Object:GetTexture()) == strlower(Texture) then
		S:CleanTexture(Object, Kill, Alpha)
	else
		if Object.GetNumRegions then
			for _, Region in next, { Object:GetRegions() } do
				if Region and Region:IsObjectType('Texture') and type(Region:GetTexture()) == 'string' and strlower(Region:GetTexture()) == strlower(Texture) then
					S:CleanTexture(Region, Kill, Alpha)
				end
			end
		end
	end
end

local function Desaturate(self, value)
	if value ~= true then self:SetDesaturated(true) end
end

function S:Desaturate(frame)
	if frame.IsObjectType and (frame:IsObjectType('Button') or frame:IsObjectType('CheckButton')) then
		local Normal, Pushed, Highlight = frame:GetNormalTexture(), frame:GetPushedTexture(), frame:GetHighlightTexture()

		if Normal then
			Normal:SetDesaturated(true)
			hooksecurefunc(Normal, 'SetDesaturated', Desaturate)
		end

		if Pushed then
			Pushed:SetDesaturated(true)
			hooksecurefunc(Pushed, 'SetDesaturated', Desaturate)
		end

		if Highlight then
			Highlight:SetDesaturated(true)
			hooksecurefunc(Highlight, 'SetDesaturated', Desaturate)
		end
	end
end

function S:HandleTooltip(tooltip, scale, showHook)
	S:HandleBlizzardRegions(tooltip)
	S:SetTemplate(tooltip, nil, nil, nil, nil, nil, nil, nil, true)

	if showHook then
		tooltip:HookScript('OnShow', function(tt) S:SetTemplate(tt) end)
	end

	if scale then
		tooltip:SetScale(S.UIScale)
	end
end

local function EnumObjectsHelper(enumFuncs, yieldFunc, iobj)
	local depth = #enumFuncs
	local i = 1
	local obj
	repeat
		if (iobj) then
			obj = enumFuncs[1](iobj, i)
		else
			obj = enumFuncs[1](i)
		end
		if (obj) then
			if (depth == 1) then
				yieldFunc(obj)
			else
				local innerEnumFuncs = CopyTable(enumFuncs)
				tremove(innerEnumFuncs, 1)
				EnumObjectsHelper(innerEnumFuncs, yieldFunc, obj)
			end
		end
		i = i + 1
	until not obj
end

function S:EnumObjects(enumFuncs, yieldFunc)
	if (type(enumFuncs) == 'function') then
		enumFuncs = {enumFuncs}
	end

	EnumObjectsHelper(enumFuncs, yieldFunc)
end

-- ToDO: DF => UpdateME => Credits: NDUI
local sparkTexture = [[Interface\CastingBar\UI-CastingBar-Spark]]
function S:HandleStepSlider(frame, minimal)
	local slider = frame.Slider
	if not slider then return end
	S:StripTextures(frame)

	slider:DisableDrawLayer('ARTWORK')

	local thumb = slider.Thumb
	if thumb then
		thumb:SetTexture(sparkTexture)
		thumb:SetBlendMode('ADD')
		thumb:SetSize(20, 30)
	end

	local offset = minimal and 10 or 13
	S:CreateBackdrop(slider)
	slider.backdrop:SetPoint('TOPLEFT', 10, -offset)
	slider.backdrop:SetPoint('BOTTOMRIGHT', -10, offset)

	if not slider.barStep then
		local step = CreateFrame('StatusBar', nil, slider.backdrop)
		S:HandleStatusBar(step, {1, .8, 0, .5})
		step:SetPoint('TOPLEFT', slider.backdrop, S.mult, -S.mult)
		step:SetPoint('BOTTOMLEFT', slider.backdrop, S.mult, S.mult)
		step:SetPoint('RIGHT', thumb, 'CENTER')

		slider.barStep = step
	end
end

-- TODO: Update the function for BFA/Shadowlands
function S:HandleFollowerAbilities(followerList)
	local followerTab = followerList and followerList.followerTab
	local abilityFrame = followerTab.AbilitiesFrame
	if not abilityFrame then return end

	local abilities = abilityFrame.Abilities
	if abilities then
		for i = 1, #abilities do
			local iconButton = abilities[i].IconButton
			local icon = iconButton and iconButton.Icon
			if icon then
				iconButton.Border:SetAlpha(0)
				S:HandleIcon(icon, true)
			end
		end
	end

	local equipment = abilityFrame.Equipment
	if equipment then
		for i = 1, #equipment do
			local equip = equipment[i]
			if equip then
				equip.Border:SetAlpha(0)
				equip.BG:SetAlpha(0)

				S:HandleIcon(equip.Icon, true)
				equip.Icon.backdrop:SetBackdropColor(1, 1, 1, .15)
			end
		end
	end

	local combatAllySpell = abilityFrame.CombatAllySpell
	if combatAllySpell then
		for i = 1, #combatAllySpell do
			local icon = combatAllySpell[i].iconTexture
			if icon then
				S:HandleIcon(icon, true)
			end
		end
	end

	local xpbar = followerTab.XPBar
	if xpbar and not xpbar.backdrop then
		S:StripTextures(xpbar)
		S:HandleStatusBar(xpbar)
	end
end

function S:HandleShipFollowerPage(followerTab)
	local traits = followerTab.Traits
	for i = 1, #traits do
		local icon = traits[i].Portrait
		local border = traits[i].Border
		border:SetTexture() -- I think the default border looks nice, not sure if we want to replace that
		-- The landing page icons display inner borders
		if followerTab.isLandingPage then
			S:HandleIcon(icon)
		end
	end

	local equipment = followerTab.EquipmentFrame.Equipment
	for i = 1, #equipment do
		local icon = equipment[i].Icon
		local border = equipment[i].Border
		border:SetAtlas('ShipMission_ShipFollower-TypeFrame') -- This border is ugly though, use the traits border instead
		-- The landing page icons display inner borders
		if followerTab.isLandingPage then
			S:HandleIcon(icon)
		end
	end
end

local function UpdateFollowerQuality(self, followerInfo)
	if followerInfo then
		local color = S.QualityColors[followerInfo.quality or 1]
		self.Portrait.backdrop:SetBackdropBorderColor(color.r, color.g, color.b)
	end
end

do
	S.FollowerListUpdateDataFrames = {}

	local function UpdateFollower(button)
		if not S.Retail then
			S:SetTemplate(button, button.mode == 'CATEGORY' and 'NoBackdrop' or 'Transparent')
		end

		local category = button.Category
		if category then
			category:ClearAllPoints()
			S:Point(category, 'TOP', button, 'TOP', 0, -4)
		end

		local follower = button.Follower
		if follower then
			if not follower.template then
				S:SetTemplate(follower)
				follower.Name:SetWordWrap(false)
				follower.Selection:SetTexture()
				follower.AbilitiesBG:SetTexture()
				follower.BusyFrame:SetAllPoints()
				follower.BG:Hide()

				local hl = follower:GetHighlightTexture()
				hl:SetColorTexture(0.9, 0.9, 0.9, 0.25)
				S:SetInside(hl)
			end

			local counters = follower.Counters
			if counters then
				for _, counter in next, counters do
					if not counter.template then
						S:SetTemplate(counter)

						if counter.Border then
							counter.Border:SetTexture()
						end

						if counter.Icon then
							S:HandleIcon(counter.Icon)
							S:SetInside(counter.Icon)
						end
					end
				end
			end

			local portrait = follower.PortraitFrame
			if portrait then
				S:HandleGarrisonPortrait(portrait, true)

				portrait:ClearAllPoints()
				S:Point(portrait, 'TOPLEFT', 3, -3)

				if not follower.PortraitFrameStyled then
					hooksecurefunc(portrait, 'SetupPortrait', UpdateFollowerQuality)
					follower.PortraitFrameStyled = true
				end

				local quality = portrait.quality or (follower.info and follower.info.quality)
				local color = portrait.backdrop and ITEM_QUALITY_COLORS[quality]
				if color then -- sometimes it doesn't have this data since DF
					portrait.backdrop:SetBackdropBorderColor(color.r, color.g, color.b)
				end
			end

			if follower.Selection then
				if follower.Selection:IsShown() then
					follower:SetBackdropColor(0.9, 0.8, 0.1, 0.25)
				else
					follower:SetBackdropColor(0, 0, 0, 0.5)
				end
			end
		end
	end

	function S:HandleFollowerListOnUpdateDataFunc(buttons, numButtons, offset, numFollowers)
		if not buttons or (not numButtons or numButtons == 0) or not offset or not numFollowers then return end

		for i = 1, numButtons do
			local button = buttons[i]
			if button then
				local index = offset + i -- adjust index
				if index <= numFollowers then
					UpdateFollower(button)
				end
			end
		end
	end

	local function UpdateListScroll(dataFrame)
		if not (dataFrame and dataFrame.listScroll) or not S.FollowerListUpdateDataFrames[dataFrame:GetName()] then return end

		local buttons = dataFrame.listScroll.buttons
		local offset = _G.HybridScrollFrame_GetOffset(dataFrame.listScroll)
		S:HandleFollowerListOnUpdateDataFunc(buttons, buttons and #buttons, offset, dataFrame.listScroll and #dataFrame.listScroll)
	end

	function S:HandleFollowerListOnUpdateData(frame)
		if frame == 'GarrisonLandingPageFollowerList' and (not AS:IsSkinEnabled(nil, 'orderhall') or not AS:IsSkinEnabled(nil, 'garrison')) then
			return -- Only hook this frame if both Garrison and Orderhall skins are enabled because it's shared.
		end

		if S.FollowerListUpdateDataFrames[frame] then return end -- make sure we don't double hook `GarrisonLandingPageFollowerList`
		S.FollowerListUpdateDataFrames[frame] = true

		if _G.GarrisonFollowerList_InitButton then
			hooksecurefunc(_G, 'GarrisonFollowerList_InitButton', UpdateFollower)
		else
			hooksecurefunc(_G[frame], 'UpdateData', UpdateListScroll) -- pre DF
		end
	end
end

-- Shared Template on LandingPage/Orderhall-/Garrison-FollowerList
local ReplacedRoleTex = {
	['Adventures-Tank'] = 'Soulbinds_Tree_Conduit_Icon_Protect',
	['Adventures-Healer'] = 'ui_adv_health',
	['Adventures-DPS'] = 'ui_adv_atk',
	['Adventures-DPS-Ranged'] = 'Soulbinds_Tree_Conduit_Icon_Utility',
}

local function HandleFollowerRole(roleIcon, atlas)
	local newAtlas = ReplacedRoleTex[atlas]
	if newAtlas then
		roleIcon:SetAtlas(newAtlas)
	end
end

function S:HandleGarrisonPortrait(portrait, updateAtlas)
	local main = portrait.Portrait
	if not main then return end

	if not main.backdrop then
		S:CreateBackdrop(main)
	end

	local level = portrait.Level or portrait.LevelText
	if level then
		level:ClearAllPoints()
		S:Point(level, 'BOTTOM', portrait, 0, 15)
		S:FontTemplate(level, nil, 14, 'OUTLINE')

		if portrait.LevelCircle then portrait.LevelCircle:Hide() end
		if portrait.LevelBorder then portrait.LevelBorder:SetScale(.0001) end
	end

	if portrait.PortraitRing then
		portrait.PortraitRing:Hide()
		portrait.PortraitRingQuality:SetTexture('')
		portrait.PortraitRingCover:SetColorTexture(0, 0, 0)
		portrait.PortraitRingCover:SetAllPoints(main.backdrop)
	end

	if portrait.Empty then
		portrait.Empty:SetColorTexture(0, 0, 0)
		portrait.Empty:SetAllPoints(main)
	end

	if portrait.Highlight then portrait.Highlight:Hide() end
	if portrait.PuckBorder then portrait.PuckBorder:SetAlpha(0) end
	if portrait.TroopStackBorder1 then portrait.TroopStackBorder1:SetAlpha(0) end
	if portrait.TroopStackBorder2 then portrait.TroopStackBorder2:SetAlpha(0) end

	if portrait.HealthBar then
		portrait.HealthBar.Border:Hide()

		local roleIcon = portrait.HealthBar.RoleIcon
		roleIcon:ClearAllPoints()
		S:Point(roleIcon, 'CENTER', main.backdrop, 'TOPRIGHT')

		if updateAtlas then
			HandleFollowerRole(roleIcon, roleIcon:GetAtlas())
		else
			hooksecurefunc(roleIcon, 'SetAtlas', HandleFollowerRole)
		end

		local background = portrait.HealthBar.Background
		background:SetAlpha(0)
		S:SetInside(background, main.backdrop, 2, 1) -- unsnap it
		S:Point(background, 'TOPLEFT', main.backdrop, 'BOTTOMLEFT', 2, 7)
		portrait.HealthBar.Health:SetTexture(S.Media.StatusBar)
	end
end

do
	local function selectionOffset(frame)
		local point, anchor, relativePoint, xOffset = frame:GetPoint()
		if xOffset <= 0 then
			local x = frame.BorderBox and 4 or 38 -- adjust values for wrath
			local y = frame.BorderBox and 0 or -10

			frame:ClearAllPoints()
			S:Point(frame, point, (frame == _G.MacroPopupFrame and _G.MacroFrame) or anchor, relativePoint, strfind(point, 'LEFT') and x or -x, y)
		end
	end

	local function handleButton(button, i, buttonNameTemplate)
		local icon, texture = button.Icon or _G[buttonNameTemplate..i..'Icon']
		if icon then
			S:HandleIcon(icon)
			S:SetInside(icon, button)
			texture = icon:GetTexture() -- keep this before strip textures
		end

		S:HandleFrame(button)
		S:StyleButton(button, nil, true)

		if texture then
			icon:SetTexture(texture)
		end
	end

	function S:HandleIconSelectionFrame(frame, numIcons, buttonNameTemplate, nameOverride, dontOffset)
		if frame.isSkinned then
			return
		elseif not S.Retail and (nameOverride and nameOverride ~= 'MacroPopup') then -- skip macros because it skins on show
			frame:Show() -- spawn the info so we can skin the buttons
			if frame.Update then frame:Update() end -- guild bank popup has update function
			frame:Hide() -- can hide it right away
		end

		if not dontOffset then -- place it off to the side of parent with correct offsets
			frame:HookScript('OnShow', selectionOffset)
			frame:Height(frame:GetHeight() + 10)
		end

		local borderBox = frame.BorderBox or _G.BorderBox -- it's a sub frame only on retail, on wrath it's a global?
		local frameName = nameOverride or frame:GetName() -- we need override in case Blizzard fucks up the naming (guild bank)
		local scrollFrame = frame.ScrollFrame or _G[frameName..'ScrollFrame']
		local editBox = (borderBox and borderBox.IconSelectorEditBox) or frame.EditBox or _G[frameName..'EditBox']
		local cancel = frame.CancelButton or (borderBox and borderBox.CancelButton) or _G[frameName..'Cancel']
		local okay = frame.OkayButton or (borderBox and borderBox.OkayButton) or _G[frameName..'Okay']

		S:HandleFrame(frame)

		if borderBox then
			S:StripTextures(borderBox)

			local button = borderBox.SelectedIconArea and borderBox.SelectedIconArea.SelectedIconButton
			if button then
				button:DisableDrawLayer('BACKGROUND')
				S:HandleItemButton(button, true)
			end
		end

		cancel:ClearAllPoints()
		cancel:SetPoint('BOTTOMRIGHT', frame, -4, 4)
		S:HandleButton(cancel)

		okay:ClearAllPoints()
		okay:SetPoint('RIGHT', cancel, 'LEFT', -10, 0)
		S:HandleButton(okay)

		if editBox then
			editBox:DisableDrawLayer('BACKGROUND')
			S:HandleEditBox(editBox)
		end

		if numIcons then
			S:StripTextures(scrollFrame)
			scrollFrame:Height(scrollFrame:GetHeight() + 10)
			S:HandleScrollBar(scrollFrame.ScrollBar)

			for i = 1, numIcons do
				local button = _G[buttonNameTemplate..i]
				if button then
					handleButton(button, i, buttonNameTemplate)
				end
			end
		else
			S:HandleTrimScrollBar(frame.IconSelector.ScrollBar)

			for _, button in next, { frame.IconSelector.ScrollBox.ScrollTarget:GetChildren() } do
				handleButton(button)
			end
		end

		frame.isSkinned = true
	end
end

do -- Handle collapse
	local function UpdateCollapseTexture(button, texture, skip)
		if skip then return end

		if type(texture) == 'number' then -- 130821 minus, 130838 plus
			button:SetNormalTexture(texture == 130838 and S.Media.Plus or S.Media.Minus, true)
		elseif strfind(texture, 'Plus') or strfind(texture, 'Closed') then
			button:SetNormalTexture(S.Media.Plus, true)
		elseif strfind(texture, 'Minus') or strfind(texture, 'Open') then
			button:SetNormalTexture(S.Media.Minus, true)
		end
	end

	local function syncPushTexture(button, _, skip)
		if skip then return end

		local normal = button:GetNormalTexture():GetTexture()
		button:SetPushedTexture(normal, true)
	end

	function S:HandleCollapseTexture(button, syncPushed)
		if syncPushed then -- not needed always
			hooksecurefunc(button, 'SetPushedTexture', syncPushTexture)
			syncPushTexture(button)
		else
			button:SetPushedTexture(S.Media.ClearTexture)
		end

		hooksecurefunc(button, 'SetNormalTexture', UpdateCollapseTexture)
		UpdateCollapseTexture(button, button:GetNormalTexture():GetTexture())
	end
end

-- World Map related Skinning functions used for WoW 8.0
function S:WorldMapMixin_AddOverlayFrame(frame, templateName)
	S[templateName](frame.overlayFrames[#frame.overlayFrames])
end

-- UIWidgets
function S:SkinIconAndTextWidget()
end

-- For now see the function below
function S:SkinCaptureBarWidget()
end

function S:SkinStatusBarWidget(widgetFrame)
	local bar = widgetFrame.Bar
	if not bar or bar.backdrop then return end

	S:CreateBackdrop(bar)
	bar:SetScale(0.99) -- lol yes, this will keep it placed correctly for Simpy

	if bar.BGLeft then bar.BGLeft:SetAlpha(0) end
	if bar.BGRight then bar.BGRight:SetAlpha(0) end
	if bar.BGCenter then bar.BGCenter:SetAlpha(0) end
	if bar.BorderLeft then bar.BorderLeft:SetAlpha(0) end
	if bar.BorderRight then bar.BorderRight:SetAlpha(0) end
	if bar.BorderCenter then bar.BorderCenter:SetAlpha(0) end
end

do
	local function handleBar(bar)
		if not bar or bar.backdrop then return end

		S:CreateBackdrop(bar)

		if bar.BG then bar.BG:SetAlpha(0) end
		if bar.Spark then bar.Spark:SetAlpha(0) end
		if bar.SparkGlow then bar.SparkGlow:SetAlpha(0) end
		if bar.BorderLeft then bar.BorderLeft:SetAlpha(0) end
		if bar.BorderRight then bar.BorderRight:SetAlpha(0) end
		if bar.BorderCenter then bar.BorderCenter:SetAlpha(0) end
		if bar.BorderGlow then bar.BorderGlow:SetAlpha(0) end
	end

	function S:SkinDoubleStatusBarWidget(widgetFrame)
		handleBar(widgetFrame.LeftBar)
		handleBar(widgetFrame.RightBar)
	end
end

function S:SkinIconTextAndBackgroundWidget()
end

function S:SkinDoubleIconAndTextWidget()
end

function S:SkinStackedResourceTrackerWidget()
end

function S:SkinIconTextAndCurrenciesWidget()
end

function S:SkinTextWithStateWidget(widgetFrame)
	local text = widgetFrame.Text
	if not text then return end

	text:SetTextColor(1, 1, 1)
end

function S:SkinHorizontalCurrenciesWidget()
end

function S:SkinBulletTextListWidget()
end

function S:SkinScenarioHeaderCurrenciesAndBackgroundWidget()
end

function S:SkinTextureAndTextWidget()
end

function S:SkinSpellDisplay(widgetFrame)
	local spell = widgetFrame.Spell
	if not spell then return end

	if spell.Border then
		spell.Border:Hide()
	end

	if spell.Text then
		spell.Text:SetTextColor(1, 1, 1)
	end

	if spell.Icon then
		S:HandleIcon(spell.Icon, true)
	end
end

function S:SkinDoubleStateIconRow()
end

function S:SkinTextureAndTextRowWidget()
end

function S:SkinZoneControl()
end

function S:SkinCaptureZone()
end

do
	local W = Enum.UIWidgetVisualizationType
	S.WidgetSkinningFuncs = {
		[W.IconAndText] = 'SkinIconAndTextWidget',
		[W.CaptureBar] = 'SkinCaptureBarWidget',
		[W.StatusBar] = 'SkinStatusBarWidget',
		[W.DoubleStatusBar] = 'SkinDoubleStatusBarWidget',
		[W.IconTextAndBackground] = 'SkinIconTextAndBackgroundWidget',
		[W.DoubleIconAndText] = 'SkinDoubleIconAndTextWidget',
		[W.StackedResourceTracker] = 'SkinStackedResourceTrackerWidget',
		[W.IconTextAndCurrencies] = 'SkinIconTextAndCurrenciesWidget',
		[W.TextWithState] = 'SkinTextWithStateWidget',
		[W.HorizontalCurrencies] = 'SkinHorizontalCurrenciesWidget',
		[W.BulletTextList] = 'SkinBulletTextListWidget',
		[W.ScenarioHeaderCurrenciesAndBackground] = 'SkinScenarioHeaderCurrenciesAndBackgroundWidget',
	}

	if S.Retail then
		S.WidgetSkinningFuncs[W.SpellDisplay] = 'SkinSpellDisplay'
		S.WidgetSkinningFuncs[W.TextureAndText] = 'SkinTextureAndTextWidget'
		S.WidgetSkinningFuncs[W.DoubleStateIconRow] = 'SkinDoubleStateIconRow'
		S.WidgetSkinningFuncs[W.TextureAndTextRow] = 'SkinTextureAndTextRowWidget'
		S.WidgetSkinningFuncs[W.ZoneControl] = 'SkinZoneControl'
		S.WidgetSkinningFuncs[W.CaptureZone] = 'SkinCaptureZone'
	end
end

function S:SkinWidgetContainer(widget)
	local typeFunc = S.WidgetSkinningFuncs[widget.widgetType]
	if typeFunc and S[typeFunc] then
		S[typeFunc](S, widget)
	end
end

function S:UpdateAllWidgets()
	for _, widget in pairs(_G.UIWidgetTopCenterContainerFrame.widgetFrames) do
		S:SkinWidgetContainer(widget)
	end
end

function S:PLAYER_LOGIN()
	S:GetPixelScale()

	if S.Retail then
		S:RegisterEvent('PLAYER_ENTERING_WORLD', 'UpdateAllWidgets')
		S:RegisterEvent('UPDATE_ALL_UI_WIDGETS', 'UpdateAllWidgets')
	end
end

S:RegisterEvent('PLAYER_LOGIN')
