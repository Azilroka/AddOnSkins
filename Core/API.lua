local AS = unpack(AddOnSkins)

local _G, CreateFrame = _G, CreateFrame
local unpack, pairs, select, type, assert, next = unpack, pairs, select, type, assert, next
local strlower, strfind = strlower, strfind
local CopyTable, tremove = CopyTable, tremove
local EnumerateFrames = EnumerateFrames

function AS:SetTemplate(Frame, Template, UseTexture, TextureFile)
	local Texture = AS.Blank

	if UseTexture then
		Texture = TextureFile or AS.NormTex
	end

	if AS.PixelPerfect then
		Frame:SetBackdrop({
			bgFile = Texture,
			edgeFile = AS.Blank,
			tile = false, tileSize = 0, edgeSize = AS.Mult,
			insets = {left = 0, right = 0, top = 0, bottom = 0},
		})
	else
		Frame:SetBackdrop({
			bgFile = Texture,
			edgeFile = AS.Blank,
			tile = false, tileSize = 0, edgeSize = AS.Mult,
			insets = { left = -AS.Mult, right = -AS.Mult, top = -AS.Mult, bottom = -AS.Mult},
		})

		local Backdrop = { edgeFile = Texture, edgeSize = AS.Mult, insets = { left = AS.Mult, right = AS.Mult, top = AS.Mult, bottom = AS.Mult } }

		Frame.InsideBorder = CreateFrame("Frame", nil, Frame)
		Frame.InsideBorder:SetInside(Frame, AS.Mult, AS.Mult)
		Frame.InsideBorder:SetBackdrop(Backdrop)
		Frame.InsideBorder:SetFrameLevel(Frame:GetFrameLevel() + 1)
		Frame.InsideBorder:SetBackdropBorderColor(0, 0, 0, 1)

		Frame.OutsideBorder = CreateFrame("Frame", nil, Frame)
		Frame.OutsideBorder:SetOutside(Frame, AS.Mult, AS.Mult)
		Frame.OutsideBorder:SetBackdrop(Backdrop)
		Frame.OutsideBorder:SetBackdropBorderColor(0, 0, 0, 1)
	end

	local R, G, B = unpack(AS.BackdropColor)
	local Alpha = (Template == "Transparent" and .8 or 1)

	if AS:CheckAddOn('ElvUI') then
		if Template == "Transparent" then
			R, G, B, Alpha = unpack(ElvUI[1]["media"].backdropfadecolor)
		else
			R, G, B = unpack(ElvUI[1]["media"].backdropcolor)
		end

		Frame.template = Template
		ElvUI[1]["frames"][Frame] = true
	end

	Frame:SetBackdropBorderColor(unpack(AS.BorderColor))
	Frame:SetBackdropColor(R, G, B, Alpha)
end

local Insets = {
	'InsideBorder',
	'OutsideBorder',
}

function AS:HideInset(Frame)
	for _, Inset in pairs(Insets) do
		Frame[Inset]:Hide()
	end
end

function AS:CreateBackdrop(Frame, Template, UseTexture, TextureFile)
	if Frame.Backdrop then return end
	if not Template then Template = AS:CheckOption('SkinTemplate') end

	local Backdrop = CreateFrame("Frame", nil, Frame)
	Backdrop:SetOutside()
	AS:SetTemplate(Backdrop, Template, UseTexture, TextureFile)

	if Frame:GetFrameLevel() - 1 >= 0 then
		Backdrop:SetFrameLevel(Frame:GetFrameLevel() - 1)
	else
		Backdrop:SetFrameLevel(0)
	end

	Frame.Backdrop = Backdrop
end

function AS:StripTextures(Object, Kill, Alpha)
	for i = 1, Object:GetNumRegions() do
		local Region = select(i, Object:GetRegions())
		if Region and Region:GetObjectType() == "Texture" then
			if Kill then
				Region:Kill()
				--Region:SetParent(AS.Hider)
			elseif Alpha then
				Region:SetAlpha(0)
			else
				Region:SetTexture(nil)
			end
		end
	end
end

local BlizzardRegions = {
	'Left',
	'Middle',
	'Right',
	'Mid',
	'LeftDisabled',
	'MiddleDisabled',
	'RightDisabled',
}

function AS:SkinButton(Button, Strip)
	if Button.isSkinned then return end

	local ButtonName = Button:GetName()

	for _, Region in pairs(BlizzardRegions) do
		if ButtonName and _G[ButtonName..Region] then
			_G[ButtonName..Region]:SetAlpha(0)
		end
		if Button[Region] then
			Button[Region]:SetAlpha(0)
		end
	end

	if Button.SetNormalTexture then Button:SetNormalTexture("") end
	if Button.SetHighlightTexture then Button:SetHighlightTexture("") end
	if Button.SetPushedTexture then Button:SetPushedTexture("") end
	if Button.SetDisabledTexture then Button:SetDisabledTexture("") end

	AS:SkinFrame(Button, nil, not Strip)

	if AS:CheckAddOn('ElvUI') and AS:CheckOption('ElvUISkinModule') then
		AS:SetTemplate(Button, 'Default', true)
	end

	Button:HookScript("OnEnter", function(self)
		self:SetBackdropBorderColor(unpack(AS.ValueColor or AS.ClassColor))
	end)

	Button:HookScript("OnLeave", function(self)
		self:SetBackdropBorderColor(unpack(AS.BorderColor))
	end)

	if Button.Flash then
		Button.Flash:SetTexture(0, 0, 0, 0)
	--[[
		AS:CreateBackdrop(Button)
		Button.Backdrop:SetAllPoints()
		Button.Backdrop:SetBackdropBorderColor(1, 0, 0, 1)
		Button.Backdrop:SetBackdropColor(0, 0, 0, 0)
		Button.Backdrop:SetFrameStrata(Button:GetFrameStrata())
		Button.Backdrop:SetFrameLevel(Button:GetFrameLevel() + 4)

		Button.Backdrop:SetScript('OnUpdate', function(self)
			if Button.Flash:IsShown() then
				self:SetAlpha(Button.Flash:GetAlpha())
			else
				self:SetAlpha(0)
			end
		end)
	]]
	end
end

function AS:CreateShadow(Frame)
	if Frame.Shadow then return end

	local Shadow = CreateFrame("Frame", nil, Frame)
	Shadow:SetFrameLevel(1)
	Shadow:SetFrameStrata(Frame:GetFrameStrata())
	Shadow:SetOutside(Frame, AS:Scale(3), AS:Scale(3))

	Shadow:SetBackdrop({ edgeFile = [[Interface\AddOns\AddOnSkins\Media\Textures\Shadows]], edgeSize = AS:Scale(3) })
	Shadow:SetBackdropColor(0, 0, 0, 0)
	Shadow:SetBackdropBorderColor(0, 0, 0, 0.8)

	if AS.ES then
		AS.ES:RegisterShadow(Shadow)
	end

	Frame.Shadow = Shadow
end

function AS:StyleButton(Button)
	if Button.HasStyle then return end

	if Button.SetHighlightTexture then
		local Hover = Button:CreateTexture()
		Hover:SetColorTexture(1, 1, 1, 0.3)
		Hover:SetInside()

		Button:SetHighlightTexture(Hover)
	end

	if Button.SetPushedTexture then
		local Pushed = Button:CreateTexture()
		Pushed:SetColorTexture(0.9, 0.8, 0.1, 0.3)
		Pushed:SetInside()

		Button:SetPushedTexture(Pushed)
	end

	if Button.SetCheckedTexture then
		local Checked = Button:CreateTexture()
		Checked:SetColorTexture(0,1,0,.3)
		Checked:SetInside()

		Button:SetCheckedTexture(Checked)
	end

	local Cooldown = Button:GetName() and _G[Button:GetName().."Cooldown"]

	if Cooldown then
		Cooldown:ClearAllPoints()
		Cooldown:SetInside()
		Cooldown:SetSwipeColor(0, 0, 0, 1)
	end

	Button.HasStyle = true
end

function AS:SkinCloseButton(CloseButton, Reposition)
	if CloseButton.isSkinned then return end

	AS:SkinBackdropFrame(CloseButton)

	CloseButton.Backdrop:Point('TOPLEFT', 7, -8)
	CloseButton.Backdrop:Point('BOTTOMRIGHT', -8, 8)

	CloseButton:SetHitRectInsets(6, 6, 7, 7)

	CloseButton:HookScript("OnEnter", function(self)
		self.Text:SetTextColor(1, .2, .2)
		if AS:CheckAddOn('ElvUI') and AS:CheckOption('ElvUISkinModule') then
			self.Backdrop:SetBackdropBorderColor(unpack(AS.ValueColor))
		else
			self.Backdrop:SetBackdropBorderColor(1, .2, .2)
		end
	end)

	CloseButton:HookScript("OnLeave", function(self)
		self.Text:SetTextColor(1, 1, 1)
		self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
	end)

	CloseButton.Text = CloseButton:CreateFontString(nil, "OVERLAY")
	CloseButton.Text:SetFont([[Interface\AddOns\AddOnSkins\Media\Fonts\PTSansNarrow.TTF]], 16, 'OUTLINE')
	CloseButton.Text:SetPoint("CENTER", CloseButton, 'CENTER')
	CloseButton.Text:SetJustifyH('CENTER')
	CloseButton.Text:SetText('x')

	if Reposition then
		CloseButton:Point("TOPRIGHT", Reposition, "TOPRIGHT", 2, 2)
	end

	CloseButton.isSkinned = true
end

function AS:SkinEditBox(EditBox, Width, Height)
	if EditBox.isSkinned then return end

	local EditBoxName = EditBox:GetName()
	if EditBoxName then
		for _, Region in pairs(BlizzardRegions) do
			if _G[EditBoxName..Region] then
				_G[EditBoxName..Region]:Kill()
			end
		end
	end

	for _, Region in pairs(BlizzardRegions) do
		if EditBox[Region] then
			EditBox[Region]:Kill()
		end
	end

	AS:CreateBackdrop(EditBox)

	if EditBox.SetTextInsets then
		EditBox:SetTextInsets(1, 1, 3, 3)
	end

	if AS:CheckAddOn('ElvUI') and AS:CheckOption('ElvUISkinModule') then
		AS:SetTemplate(EditBox.Backdrop, 'Default')
	end

	if Width then EditBox:Width(Width) end
	if Height then EditBox:Height(Height) end

	if EditBoxName and (EditBoxName:find("Silver") or EditBoxName:find("Copper")) then
		EditBox.Backdrop:Point("BOTTOMRIGHT", -12, -2)
	end

	EditBox.isSkinned = true
end

function AS:SkinCheckBox(CheckBox)
	if CheckBox.isSkinned then return end
	AS:StripTextures(CheckBox)
	AS:CreateBackdrop(CheckBox)

	if AS:CheckAddOn('ElvUI') and AS:CheckOption('ElvUISkinModule') then
		AS:SetTemplate(CheckBox.Backdrop, 'Default')
	end

	CheckBox.Backdrop:SetInside(CheckBox, 4, 4)

	if CheckBox.SetCheckedTexture then
		CheckBox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
	end

	if CheckBox.SetDisabledCheckedTexture then
		CheckBox:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
	end

	CheckBox:HookScript("OnDisable", function(self)
		if not self.SetDisabledTexture then return end

		if self:GetChecked() then
			self:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
		else
			self:SetDisabledTexture("")
		end
	end)

	CheckBox.SetNormalTexture = AS.Noop
	CheckBox.SetPushedTexture = AS.Noop
	CheckBox.SetHighlightTexture = AS.Noop
	CheckBox.isSkinned = true
end

function AS:SkinTab(Tab, Strip)
	if Tab.isSkinned then return end
	local TabName = Tab:GetName()

	if TabName then
		for _, Region in pairs(BlizzardRegions) do
			if _G[TabName..Region] then
				_G[TabName..Region]:SetTexture(nil)
			end
		end
	end

	for _, Region in pairs(BlizzardRegions) do
		if Tab[Region] then
			Tab[Region]:SetAlpha(0)
		end
	end

	if Tab.GetHighlightTexture and Tab:GetHighlightTexture() then
		Tab:GetHighlightTexture():SetTexture(nil)
	else
		Strip = true
	end

	if Strip then
		AS:StripTextures(Tab)
	end

	AS:CreateBackdrop(Tab)

	if AS:CheckAddOn('ElvUI') and AS:CheckOption('ElvUISkinModule') then
		-- Check if ElvUI already provides the backdrop. Otherwise we have two backdrops (e.g. Auctionhouse)
		if Tab.backdrop then
			Tab.Backdrop:Hide()
		else
			AS:SetTemplate(Tab.Backdrop, 'Default')
		end
	end

	Tab.Backdrop:Point("TOPLEFT", 10, AS.PixelPerfect and -1 or -3)
	Tab.Backdrop:Point("BOTTOMRIGHT", -10, 3)

	Tab.isSkinned = true
end

local ScrollBarElements = {
	'BG',
	'Track',
	'Top',
	'Bottom',
	'Middle',
	'trackBG',
	'ScrollBarTop',
	'ScrollBarBottom',
	'ScrollBarMiddle',
	'thumbTexture',
}

function AS:SkinScrollBar(Frame)
	local ScrollUpButton = Frame:GetName() and _G[Frame:GetName().."ScrollUpButton"] or Frame.ScrollUpButton or Frame.UpButton
	local ScrollDownButton = Frame:GetName() and _G[Frame:GetName().."ScrollDownButton"] or Frame.ScrollDownButton or Frame.DownButton

	if ScrollUpButton and ScrollDownButton then
		for _, object in pairs(ScrollBarElements) do
			if Frame:GetName() and _G[Frame:GetName()..object] then
				_G[Frame:GetName()..object]:SetTexture(nil)
			end
			if Frame[object] then
				Frame[object]:SetTexture(nil)
			end
		end

		AS:StripTextures(ScrollUpButton)
		AS:SetTemplate(ScrollUpButton, "Default", true)

		AS:StripTextures(ScrollDownButton)
		AS:SetTemplate(ScrollDownButton, "Default", true)

		if not ScrollUpButton.Text then
			ScrollUpButton.Text = ScrollUpButton:CreateFontString(nil, "OVERLAY")
			ScrollUpButton.Text:SetFont([[Interface\AddOns\AddOnSkins\Media\Fonts\Arial.TTF]], 12)
			ScrollUpButton.Text:SetText("▲")
			ScrollUpButton.Text:SetPoint("CENTER", 0, 0)

			ScrollUpButton:HookScript('OnShow', function(self)
				if not self:IsEnabled() then
					self.Text:SetTextColor(.3, .3, .3)
				end
			end)

			ScrollUpButton:HookScript('OnDisable', function(self)
				self.Text:SetTextColor(.3, .3, .3)
			end)

			ScrollUpButton:HookScript('OnEnable', function(self)
				self.Text:SetTextColor(1, 1, 1)
			end)

			ScrollUpButton:HookScript('OnEnter', function(self)
				self:SetBackdropBorderColor(unpack(AS.ValueColor or AS.ClassColor))
				self.Text:SetTextColor(unpack(AS.ValueColor or AS.ClassColor))
			end)
			ScrollUpButton:HookScript('OnLeave', function(self)
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.Text:SetTextColor(1, 1, 1)
			end)
		end

		if not ScrollDownButton.Text then
			ScrollDownButton.Text = ScrollDownButton:CreateFontString(nil, "OVERLAY")
			ScrollDownButton.Text:SetFont([[Interface\AddOns\AddOnSkins\Media\Fonts\Arial.TTF]], 12)
			ScrollDownButton.Text:SetText("▼")
			ScrollDownButton.Text:SetPoint("CENTER", 0, 0)

			ScrollDownButton:HookScript('OnShow', function(self)
				if not self:IsEnabled() then
					self.Text:SetTextColor(.3, .3, .3)
				end
			end)

			ScrollDownButton:HookScript('OnDisable', function(self)
				self.Text:SetTextColor(.3, .3, .3)
			end)

			ScrollDownButton:HookScript('OnEnable', function(self)
				self.Text:SetTextColor(1, 1, 1)
			end)

			ScrollDownButton:HookScript('OnEnter', function(self)
				self:SetBackdropBorderColor(unpack(AS.ValueColor or AS.ClassColor))
				self.Text:SetTextColor(unpack(AS.ValueColor or AS.ClassColor))
			end)

			ScrollDownButton:HookScript('OnLeave', function(self)
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.Text:SetTextColor(1, 1, 1)
			end)
		end

		if not Frame.TrackBG then
			Frame.TrackBG = CreateFrame("Frame", nil, Frame)
			Frame.TrackBG:Point("TOPLEFT", ScrollUpButton, "BOTTOMLEFT", 0, -1)
			Frame.TrackBG:Point("BOTTOMRIGHT", ScrollDownButton, "TOPRIGHT", 0, 1)
			AS:SetTemplate(Frame.TrackBG, "Transparent")
		end

		if Frame:GetThumbTexture() then
			Frame:GetThumbTexture():SetTexture(nil)
			if not Frame.ThumbBG then
				Frame.ThumbBG = CreateFrame("Frame", nil, Frame)
				Frame.ThumbBG:SetPoint("TOPLEFT", Frame:GetThumbTexture(), "TOPLEFT", 2, -3)
				Frame.ThumbBG:SetPoint("BOTTOMRIGHT", Frame:GetThumbTexture(), "BOTTOMRIGHT", -2, 3)
				AS:SetTemplate(Frame.ThumbBG, "Default")
				Frame.ThumbBG:HookScript('OnEnter', function(self)
					self:SetBackdropBorderColor(unpack(AS.ValueColor or AS.ClassColor))
				end)
				Frame.ThumbBG:HookScript('OnLeave', function(self)
					self:SetBackdropBorderColor(unpack(AS.BorderColor))
				end)

				if AS:CheckAddOn('ElvUI') then
					Frame.ThumbBG:SetBackdropColor(0.6, 0.6, 0.6)
				else
					Frame.ThumbBG:SetBackdropColor(unpack(AS.BorderColor))
				end

				if Frame.ThumbBG then
					Frame.ThumbBG:SetFrameLevel(Frame.TrackBG:GetFrameLevel())
				end
			end
		end
	end
end

function AS:SkinNextPrevButton(Button, Vertical, Inverse)
	local ButtonName = Button:GetName() and Button:GetName():lower()
	Inverse = Inverse or ButtonName and (strfind(ButtonName, 'left') or strfind(ButtonName, 'prev') or strfind(ButtonName, 'decrement') or strfind(ButtonName, 'back'))

	AS:SkinButton(Button)
	Button:SetSize(Button:GetWidth() - 7, Button:GetHeight() - 7)

	if not Button.icon then
		Button.icon = Button:CreateTexture(nil, 'ARTWORK')
		Button.icon:SetSize(13, 13)
		Button.icon:SetPoint('CENTER')
		Button.icon:SetTexture([[Interface\Buttons\SquareButtonTextures]])
		Button.icon:SetTexCoord(0.01562500, 0.20312500, 0.01562500, 0.20312500)

		Button:HookScript('OnMouseDown', function(self)
			if self:IsEnabled() then
				self.icon:SetPoint("CENTER", -1, -1)
			end
		end)

		Button:HookScript('OnMouseUp', function(self)
			self.icon:SetPoint("CENTER", 0, 0)
		end)

		Button:HookScript('OnDisable', function(self)
			SetDesaturation(self.icon, true)
			self.icon:SetAlpha(0.5)
		end)

		Button:HookScript('OnEnable', function(self)
			SetDesaturation(self.icon, false)
			self.icon:SetAlpha(1.0)
		end)

		if not Button:IsEnabled() then
			Button:GetScript('OnDisable')(Button)
		end
	end

	SquareButton_SetIcon(Button, Vertical and (Inverse and 'UP' or 'DOWN') or (Inverse and 'LEFT' or 'RIGHT'))
end

function AS:SkinRotateButton(Button)
	AS:SetTemplate(Button, "Default")
	Button:Size(Button:GetWidth() - 14, Button:GetHeight() - 14)

	Button:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)
	Button:GetPushedTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)

	Button:GetHighlightTexture():SetColorTexture(1, 1, 1, 0.3)

	Button:GetNormalTexture():ClearAllPoints()
	Button:GetNormalTexture():SetInside()
	Button:GetPushedTexture():SetAllPoints(Button:GetNormalTexture())
	Button:GetHighlightTexture():SetAllPoints(Button:GetNormalTexture())
end

function AS:SkinDropDownBox(Frame, Width)
	local FrameName = Frame:GetName()

	local Button = FrameName and _G[FrameName.."Button"] or Frame.Button
	local Text = FrameName and _G[FrameName.."Text"] or Frame.Text

	if Button and Text then
		AS:StripTextures(Frame)
		Frame:Width(Width or 155)

		Text:ClearAllPoints()
		Text:Point("RIGHT", Button, "LEFT", -2, 0)

		Button:ClearAllPoints()
		Button:Point("RIGHT", Frame, "RIGHT", -10, 3)
		Button.SetPoint = AS.Noop

		AS:SkinNextPrevButton(Button, true)

		AS:CreateBackdrop(Frame)

		if AS:CheckAddOn('ElvUI') and AS:CheckOption('ElvUISkinModule') then
			AS:SetTemplate(Frame.Backdrop, 'Default')
		end

		Frame.Backdrop:Point("TOPLEFT", 20, -2)
		Frame.Backdrop:Point("BOTTOMRIGHT", Button, "BOTTOMRIGHT", 2, -2)
	end
end

function AS:SkinSlideBar(Frame, Height, MoveText)
	AS:StripTextures(Frame)
	AS:CreateBackdrop(Frame)
	Frame.Backdrop:SetAllPoints()

	if AS:CheckAddOn('ElvUI') and AS:CheckOption('ElvUISkinModule') then
		AS:SetTemplate(Frame.Backdrop, 'Default')
	end

	if not Height then
		Height = Frame:GetHeight()
	end

	if MoveText then
		for i = 1, Frame:GetNumRegions() do
			local Region = select(i, Frame:GetRegions())
			if Region:IsObjectType('FontString') then
				local a, b, c, d, e = Region:GetPoint()
				Region:SetPoint(a, b, c, d, e - 6)
			end
		end
		if _G[Frame:GetName().."Text"] then _G[Frame:GetName().."Text"]:Point("TOP", 0, 19) end
	end

	Frame.ThumbBG = CreateFrame("Frame", nil, Frame)
	Frame.ThumbBG:Point("TOPLEFT", Frame:GetThumbTexture(), "TOPLEFT", 2, -3)
	Frame.ThumbBG:Point("BOTTOMRIGHT", Frame:GetThumbTexture(), "BOTTOMRIGHT", -2, 3)
	AS:SetTemplate(Frame.ThumbBG, "Default", true)

	if (Frame:GetWidth() < Frame:GetHeight()) then
		Frame:Width(Height)
		Frame:GetThumbTexture():Size(Frame:GetWidth(), Frame:GetWidth() + 4)
	else
		Frame:Height(Height)
		Frame:GetThumbTexture():Size(Height + 4, Height)
	end
end

function AS:SkinIconButton(Button)
	if Button.isSkinned then return end

	local ButtonName = Button:GetName()
	local Icon, Texture = Button.icon or Button.Icon or ButtonName and (_G[ButtonName.."Icon"] or _G[ButtonName.."IconTexture"])

	if Icon then
		Texture = Icon:GetTexture()
		AS:SkinFrame(Button)
		AS:StyleButton(Button)
		Icon:SetTexture(Texture)
		AS:SkinTexture(Icon)
		Icon:SetInside(Button)
		Button.isSkinned = true
	end
end

function AS:SkinFrame(frame, template, override, kill)
	if not template then template = AS:CheckOption('SkinTemplate') end
	if not override then AS:StripTextures(frame, kill) end
	AS:SetTemplate(frame, template)
end

function AS:SkinBackdropFrame(frame, template, override, kill, setpoints)
	if not template then template = AS:CheckOption('SkinTemplate') end
	if not override then AS:StripTextures(frame, kill) end
	AS:CreateBackdrop(frame, template)
	if setpoints then
		frame.Backdrop:SetAllPoints()
	end
end

function AS:SkinTitleBar(frame, template, override, kill)
	if not template then template = AS:CheckOption('SkinTemplate') end
	if not override then AS:StripTextures(frame, kill) end
	AS:SetTemplate(frame, template, true)
end

function AS:SkinStatusBar(frame, ClassColor)
	AS:SkinBackdropFrame(frame)
	frame:SetStatusBarTexture(AS.NormTex)
	if ClassColor then
		frame:SetStatusBarColor(unpack(AS.ClassColor))
	end
	if AS:CheckAddOn('ElvUI') then
		ElvUI[1]:RegisterStatusBar(frame)
	end
end

function AS:SkinTooltip(tooltip, scale)
	tooltip:HookScript('OnShow', function(self)
		AS:SkinFrame(self, nil, true)
		if scale then self:SetScale(AS.UIScale) end
	end)
end

function AS:SkinTexture(frame)
	frame:SetTexCoord(unpack(AS.TexCoords))
end

function AS:Desaturate(frame)
	for i = 1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:IsObjectType('Texture') then
			local Texture = region:GetTexture()
			if type(Texture) == 'string' and strlower(Texture) == 'interface\\dialogframe\\ui-dialogbox-corner' then
				region:SetTexture(nil)
				region:Kill()
			else
				region:SetDesaturated(true)
			end
		end
	end
	frame:HookScript('OnUpdate', function(self)
		if self:GetNormalTexture() then
			self:GetNormalTexture():SetDesaturated(true)
		end
		if self:GetPushedTexture() then
			self:GetPushedTexture():SetDesaturated(true)
		end
		if self:GetHighlightTexture() then
			self:GetHighlightTexture():SetDesaturated(true)
		end
	end)
end

function AS:SkinMaxMinFrame(frame)
	AS:StripTextures(frame, true)

	for _, name in pairs({"MaximizeButton", "MinimizeButton"}) do
		local button = frame[name]

		if button then
			button:SetSize(16, 16)
			button:ClearAllPoints()
			button:SetPoint("CENTER")
			button:SetHitRectInsets(1, 1, 1, 1)
			AS:StripTextures(button, nil, true)
			AS:SetTemplate(button)

			button.Text = button:CreateFontString(nil, "OVERLAY")
			button.Text:SetFont([[Interface\AddOns\AddOnSkins\Media\Fonts\Arial.TTF]], 12)
			button.Text:SetText(name == "MaximizeButton" and "▲" or "▼")
			button.Text:SetPoint("CENTER", 0, 0)

			button:HookScript('OnShow', function(self)
				if not self:IsEnabled() then
					self.Text:SetTextColor(.3, .3, .3)
				end
			end)

			button:HookScript('OnEnter', function(self)
				self:SetBackdropBorderColor(unpack(AS.ValueColor or AS.ClassColor))
				self.Text:SetTextColor(unpack(AS.ValueColor or AS.ClassColor))
			end)

			button:HookScript('OnLeave', function(self)
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.Text:SetTextColor(1, 1, 1)
			end)
		end
	end
end

function AS:AdjustForPixelPerfect(number)
	if AS.PixelPerfect then
		number = number - 1
	end

	return number
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

function AS:EnumObjects(enumFuncs, yieldFunc)
	if (type(enumFuncs) == "function") then
		enumFuncs = {enumFuncs}
	end

	EnumObjectsHelper(enumFuncs, yieldFunc)
end

function AS:FindChildFrameByPoint(parent, objType, point1, relativeTo, point2, x, y)
	if not parent then return end

	local frame, childID
	local childPoint1, childParent, childPoint2, childX, childY
	local childs = {parent:GetChildren()}

	x = AS:Round(x)
	y = AS:Round(y)

	for id, child in pairs(childs) do
		if not child:GetName() then
			if not objType or (objType and child:IsObjectType(objType)) then
				childPoint1, childParent, childPoint2, childX, childY = child:GetPoint()
				childX = childX and AS:Round(childX) or 0
				childY = childY and AS:Round(childY) or 0

				if childPoint1 == point1
				and childParent == relativeTo
				and (not point2 or (childPoint2 == point2))
				and x == childX
				and y == childY
				then
					frame, childID = child, id
					break
				end
			end
		end
	end

	return frame, childID
end

function AS:FindChildFrameBySize(parent, objType, width, height)
	if not parent then return end

	local frame, childID
	local childs = {parent:GetChildren()}

	width = AS:Round(width)
	height = AS:Round(height)

	for id, child in pairs(childs) do
		if not child:GetName() then
			if not objType or (objType and child:IsObjectType(objType)) then
				if AS:Round(child:GetWidth()) == width and AS:Round(child:GetHeight()) == width then
					frame, childID = child, id
					break
				end
			end
		end
	end

	return frame, childID
end

function AS:FindFrameBySizeChild(childTypes, width, height)
	if not childTypes then return end

	local frame
	local obj = EnumerateFrames()

	width = AS:Round(width)
	height = AS:Round(height)

	while obj do
		if obj.IsObjectType and obj:IsObjectType("Frame") then
			if not (obj:GetName() and obj:GetParent()) then
				if AS:Round(obj:GetWidth()) == width and AS:Round(obj:GetHeight()) == height then
					local childs = {}
					for _, child in pairs({obj:GetChildren()}) do
						childs[#childs + 1] = child:GetObjectType()
					end

					local matched = 0
					for _, cType in pairs(childTypes) do
						for _, type in pairs(childs) do
							if cType == type then
								matched = matched + 1
							end
						end
					end

					if matched == #childTypes then
						frame = obj
						break
					end
				end
			end
		end

		obj = EnumerateFrames(obj)
	end

	return frame
end

function AS:FindFrameByPoint(point1, relativeTo, point2, x, y, multipleFrames)
	if not relativeTo then return end

	local frame
	if multipleFrames then
		frame = {}
	end

	local childPoint1, childParent, childPoint2, childX, childY
	local obj = EnumerateFrames()

	x = AS:Round(x)
	y = AS:Round(y)

	while obj do
		if obj.IsObjectType and obj:IsObjectType("Frame") then
			if not (obj:GetName() and obj:GetParent()) then
				childPoint1, childParent, childPoint2, childX, childY = obj:GetPoint()
				childX = childX and AS:Round(childX) or 0
				childY = childY and AS:Round(childY) or 0

				if childPoint1 == point1
				and childParent == relativeTo
				and (not point2 or (childPoint2 == point2))
				and x == childX
				and y == childY
				then
					if multipleFrames then
						frame[#frame + 1] = obj
					else
						frame = obj
						break
					end
				end
			end
		end

		obj = EnumerateFrames(obj)
	end

	return frame
end