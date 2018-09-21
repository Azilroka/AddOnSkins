local AS = unpack(AddOnSkins)

local _G, CreateFrame = _G, CreateFrame
local unpack, pairs, select, type, assert, next = unpack, pairs, select, type, assert, next
local strlower, strfind = strlower, strfind
local CopyTable, tremove = CopyTable, tremove
local EnumerateFrames = EnumerateFrames

function AS:SetTemplate(Frame, Template, Texture)
	Texture = Texture or AS.NormTex
	Template = Template or AS:CheckOption('SkinTemplate')

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

		Frame.InsideBorder = CreateFrame('Frame', nil, Frame)
		Frame.InsideBorder:SetInside(Frame, AS.Mult, AS.Mult)
		Frame.InsideBorder:SetBackdrop(Backdrop)
		Frame.InsideBorder:SetFrameLevel(Frame:GetFrameLevel() + 1)
		Frame.InsideBorder:SetBackdropBorderColor(0, 0, 0, 1)

		Frame.OutsideBorder = CreateFrame('Frame', nil, Frame)
		Frame.OutsideBorder:SetOutside(Frame, AS.Mult, AS.Mult)
		Frame.OutsideBorder:SetBackdrop(Backdrop)
		Frame.OutsideBorder:SetBackdropBorderColor(0, 0, 0, 1)
	end

	local R, G, B = unpack(AS.BackdropColor)
	local Alpha = (Template == 'Transparent' and .8 or 1)

	if AS:CheckAddOn('ElvUI') then
		if Template == 'Transparent' then
			R, G, B, Alpha = unpack(ElvUI[1]['media'].backdropfadecolor)
		else
			R, G, B = unpack(ElvUI[1]['media'].backdropcolor)
		end

		Frame.template = Template
		ElvUI[1]['frames'][Frame] = true

		if AS:CheckOption('MerathilisUIStyling', 'ElvUI_MerathilisUI') then
			Frame:Styling()
		end
	end

	Frame:SetBackdropBorderColor(unpack(AS.BorderColor))
	Frame:SetBackdropColor(R, G, B, Alpha)
end

function AS:HideInset(Frame)
	for _, Inset in pairs({ 'InsideBorder', 'OutsideBorder' }) do
		Frame[Inset]:Hide()
	end
end

function AS:CreateBackdrop(Frame, Template, Texture)
	if Frame.Backdrop then return end

	local Parent = Frame.IsObjectType and Frame:IsObjectType('Texture') and Frame:GetParent() or Frame

	local Backdrop = CreateFrame('Frame', nil, Parent)
	Backdrop:SetOutside(Frame)
	AS:SetTemplate(Backdrop, Template, Texture)

	if (Parent:GetFrameLevel() - 1) >= 0 then
		Backdrop:SetFrameLevel(Parent:GetFrameLevel() - 1)
	else
		Backdrop:SetFrameLevel(0)
	end

	Frame.Backdrop = Backdrop
end

function AS:StripTextures(Object, Kill, Alpha)
	for i = 1, Object:GetNumRegions() do
		local Region = select(i, Object:GetRegions())
		if Region and Region:IsObjectType('Texture') then
			if Kill then
				Region:Hide()
				Region.Show = AS.Noop
			elseif Alpha then
				Region:SetAlpha(0)
			else
				Region:SetTexture(nil)
			end
		end
	end
end

local BlizzardRegions = { 'Left', 'Middle', 'Right', 'Mid', 'LeftDisabled', 'MiddleDisabled', 'RightDisabled', 'TopLeft', 'TopRight', 'BottomLeft', 'BottomRight', 'TopMiddle', 'MiddleLeft', 'MiddleRight', 'BottomMiddle', 'MiddleMiddle' }

function AS:SkinButton(Button, Strip)
	if Button.isSkinned then return end

	local ButtonName = Button:GetName()

	AS:SkinFrame(Button, AS:CheckOption('ElvUISkinModule', 'ElvUI') and 'Default' or nil, not Strip)

	for _, Region in pairs(BlizzardRegions) do
		if ButtonName and _G[ButtonName..Region] then
			_G[ButtonName..Region]:SetAlpha(0)
		end
		if Button[Region] then
			Button[Region]:SetAlpha(0)
		end
	end

	if Button.SetNormalTexture then Button:SetNormalTexture('') end
	if Button.SetHighlightTexture then Button:SetHighlightTexture('') end
	if Button.SetPushedTexture then Button:SetPushedTexture('') end
	if Button.SetDisabledTexture then Button:SetDisabledTexture('') end

	if Button.GetFontString and Button:GetFontString() ~= nil then
		if Button:IsEnabled() then
			Button:GetFontString():SetTextColor(1, 1, 1)
		else
			Button:GetFontString():SetTextColor(.5, .5, .5)
		end
	end

	Button:HookScript("OnEnable", function(self)
		if self.GetFontString and self:GetFontString() ~= nil then
			self:GetFontString():SetTextColor(1, 1, 1)
		end
	end)
	Button:HookScript("OnDisable", function(self) 
		if self.GetFontString and self:GetFontString() ~= nil then
			self:GetFontString():SetTextColor(.5, .5, .5)
		end
	end)
	Button:HookScript('OnEnter', function(self) self:SetBackdropBorderColor(unpack(AS.Color)) end)
	Button:HookScript('OnLeave', function(self) self:SetBackdropBorderColor(unpack(AS.BorderColor)) end)

	--if Button.Flash then
	--	Button.Flash:SetTexture(0, 0, 0, 0)
	--	AS:CreateBackdrop(Button.Flash)
	--	Button.Flash.Backdrop:SetBackdropBorderColor(1, 0, 0, 1)
	--	Button.Flash.Backdrop:SetBackdropColor(0, 0, 0, 0)
	--end
end

function AS:CreateShadow(Frame, NoRegister)
	if Frame.Shadow then return end

	local Shadow = CreateFrame('Frame', nil, Frame)
	Shadow:SetFrameLevel(1)
	Shadow:SetFrameStrata(Frame:GetFrameStrata())
	Shadow:SetOutside(Frame, AS:Scale(3), AS:Scale(3))

	Shadow:SetBackdrop({ edgeFile = [[Interface\AddOns\AddOnSkins\Media\Textures\Shadows]], edgeSize = AS:Scale(3) })
	Shadow:SetBackdropBorderColor(0, 0, 0, 0.8)

	if (not NoRegister) and AS.ES then
		AS.ES:RegisterShadow(Shadow)
	end

	Frame.Shadow = Shadow
end

function AS:CreateInvertedShadow(Frame)
	if Frame.Shadow then return end

	local Shadow = CreateFrame('Frame', nil, Frame)
	Shadow:SetFrameLevel(Frame:GetFrameLevel() + 2)
	Shadow:SetFrameStrata(Frame:GetFrameStrata())
	Shadow:SetInside(Frame)
	Shadow:SetBackdrop({
		bgFile = [[Interface\AddOns\AddOnSkins\Media\Textures\InvertedShadow]],
	})
	Shadow:SetBackdropColor(0, 0, 0, .8)

	Shadow.Inverted = true

	if AS.ES then
		AS.ES:RegisterShadow(Shadow)
	end

	Frame.Shadow = Shadow
end

function AS:StyleButton(Button)
	if Button.HasStyle then return end

	if Button.SetHighlightTexture then
		Button:SetHighlightTexture(AS.Blank)
		Button:GetHighlightTexture():SetVertexColor(1, 1, 1, .5)
		Button:GetHighlightTexture():SetInside()
	end

	if Button.SetPushedTexture then
		Button:SetPushedTexture(AS.Blank)
		Button:GetPushedTexture():SetVertexColor(.9, .8, .1, .5)
		Button:GetPushedTexture():SetInside()
	end

	if Button.GetCheckedTexture then
		Button:SetPushedTexture(AS.Blank)
		Button:GetCheckedTexture():SetVertexColor(0, 1, 0, .5)
		Button:GetCheckedTexture():SetInside()
	end

	local Cooldown = Button:GetName() and _G[Button:GetName()..'Cooldown'] or Button.Cooldown or Button.cooldown or nil

	if Cooldown then
		Cooldown:SetInside()
		if Cooldown.SetSwipeColor then
			Cooldown:SetSwipeColor(0, 0, 0, 1)
		end
	end

	Button.HasStyle = true
end

function AS:SkinCloseButton(Button, Reposition)
	if Button.Backdrop then return end

	AS:SkinBackdropFrame(Button)

	Button.Backdrop:Point('TOPLEFT', 7, -8)
	Button.Backdrop:Point('BOTTOMRIGHT', -7, 8)

	Button:SetHitRectInsets(6, 6, 7, 7)

	Button:HookScript('OnEnter', function(self)
		self:GetNormalTexture():SetVertexColor(1, .2, .2)
		if AS:CheckOption('ElvUISkinModule', 'ElvUI') then
			self.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
		else
			self.Backdrop:SetBackdropBorderColor(1, .2, .2)
		end
	end)

	Button:HookScript('OnLeave', function(self)
		self:GetNormalTexture():SetVertexColor(1, 1, 1)
		self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
	end)

	local Mask = Button:CreateMaskTexture()
	Mask:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Close]], 'CLAMPTOBLACKADDITIVE', 'CLAMPTOBLACKADDITIVE')
	Mask:SetSize(10, 10)
	Mask:SetPoint('CENTER')

	Button.Mask = Mask

	Button:SetNormalTexture(AS.NormTex)
	Button:SetPushedTexture(AS.NormTex)

	local Normal, Pushed = Button:GetNormalTexture(), Button:GetPushedTexture()

	Normal:SetInside(Button.Backdrop)
	Normal:SetVertexColor(1, 1, 1)
	Normal:AddMaskTexture(Mask)

	Pushed:SetInside(Button.Backdrop)
	Pushed:SetVertexColor(1, .2, .2)
	Pushed:AddMaskTexture(Mask)

	if Reposition then
		Button:Point('TOPRIGHT', Reposition, 'TOPRIGHT', 2, 2)
	end
end

function AS:SkinEditBox(EditBox, Width, Height)
	if EditBox.Backdrop then return end

	local EditBoxName = EditBox:GetName()

	for _, Region in pairs(BlizzardRegions) do
		if EditBoxName and _G[EditBoxName..Region] then
			_G[EditBoxName..Region]:SetAlpha(0)
		end
		if EditBox[Region] then
			EditBox[Region]:SetAlpha(0)
		end
	end

	AS:CreateBackdrop(EditBox, AS:CheckOption('ElvUISkinModule', 'ElvUI') and 'Default' or nil)

	if EditBox.SetTextInsets then
		EditBox:SetTextInsets(1, 1, 3, 3)
	end

	if Width then EditBox:Width(Width) end
	if Height then EditBox:Height(Height) end

	if EditBoxName and (EditBoxName:find('Silver') or EditBoxName:find('Copper')) then
		EditBox.Backdrop:Point('BOTTOMRIGHT', -12, -2)
	end
end

function AS:SkinRadioButton(Button)
	if Button.isSkinned then return end

	local InsideMask = Button:CreateMaskTexture()
	InsideMask:SetTexture([[Interface\Minimap\UI-Minimap-Background]], 'CLAMPTOBLACKADDITIVE', 'CLAMPTOBLACKADDITIVE')
	InsideMask:SetSize(10, 10)
	InsideMask:SetPoint('CENTER')

	Button.InsideMask = InsideMask

	local OutsideMask = Button:CreateMaskTexture()
	OutsideMask:SetTexture([[Interface\Minimap\UI-Minimap-Background]], 'CLAMPTOBLACKADDITIVE', 'CLAMPTOBLACKADDITIVE')
	OutsideMask:SetSize(13, 13)
	OutsideMask:SetPoint('CENTER')

	Button.OutsideMask = OutsideMask

	Button:SetCheckedTexture(AS.NormTex)
	Button:SetNormalTexture(AS.NormTex)
	Button:SetHighlightTexture(AS.NormTex)
	Button:SetDisabledTexture(AS.NormTex)

	local Check, Highlight, Normal, Disabled = Button:GetCheckedTexture(), Button:GetHighlightTexture(), Button:GetNormalTexture(), Button:GetDisabledTexture()

	Check:SetVertexColor(unpack(AS.Color))
	Check:SetTexCoord(0, 1, 0, 1)
	Check:SetInside()
	Check:AddMaskTexture(InsideMask)

	Highlight:SetTexCoord(0, 1, 0, 1)
	Highlight:SetVertexColor(1, 1, 1)
	Highlight:AddMaskTexture(InsideMask)

	Normal:SetOutside()
	Normal:SetTexCoord(0, 1, 0, 1)
	Normal:SetVertexColor(unpack(AS.BorderColor))
	Normal:AddMaskTexture(OutsideMask)

	Disabled:SetVertexColor(.3, .3, .3)
	Disabled:AddMaskTexture(OutsideMask)

	Button.SetNormalTexture = AS.Noop
	Button.SetDisabledTexture = AS.Noop
	Button.SetPushedTexture = AS.Noop
	Button.SetHighlightTexture = AS.Noop
	Button.isSkinned = true
end

function AS:SkinCheckBox(CheckBox)
	if CheckBox.isSkinned then return end
	AS:SkinBackdropFrame(CheckBox, AS:CheckOption('ElvUISkinModule', 'ElvUI') and 'Default' or nil)

	CheckBox.Backdrop:SetInside(CheckBox, 4, 4)

	CheckBox:SetCheckedTexture('Interface\\Buttons\\UI-CheckBox-Check')
	CheckBox:SetDisabledCheckedTexture('Interface\\Buttons\\UI-CheckBox-Check-Disabled')

	CheckBox:HookScript('OnDisable', function(self)
		if not self.SetDisabledTexture then return end

		if self:GetChecked() then
			self:SetDisabledTexture('Interface\\Buttons\\UI-CheckBox-Check-Disabled')
		else
			self:SetDisabledTexture('')
		end
	end)

	CheckBox.SetNormalTexture = AS.Noop
	CheckBox.SetPushedTexture = AS.Noop
	CheckBox.SetHighlightTexture = AS.Noop
	CheckBox.isSkinned = true
end

function AS:SkinTab(Tab, Strip)
	if Tab.Backdrop then return end

	if Strip then
		AS:StripTextures(Tab)
	else
		local TabName = Tab:GetName()
		for _, Region in pairs(BlizzardRegions) do
			if TabName and _G[TabName..Region] then
				_G[TabName..Region]:SetTexture(nil)
			end
			if Tab[Region] then
				Tab[Region]:SetAlpha(0)
			end
		end
	end

	if Tab.GetHighlightTexture and Tab:GetHighlightTexture() then
		Tab:GetHighlightTexture():SetTexture(nil)
	end

	AS:CreateBackdrop(Tab)

	Tab:GetFontString():SetTextColor(1, 1, 1)

	Tab:HookScript('OnEnter', function(self) self.Backdrop:SetBackdropBorderColor(unpack(AS.Color)) end)
	Tab:HookScript('OnLeave', function(self) self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) end)

	if AS:CheckAddOn('ElvUI') or AS:CheckOption('ElvUISkinModule', 'ElvUI') then
		if Tab.backdrop then -- Check if ElvUI already provides the backdrop. Otherwise we have two backdrops (e.g. Auctionhouse)
			Tab.Backdrop:Hide()
		end
	end

	Tab.Backdrop:Point('TOPLEFT', 10, AS.PixelPerfect and -1 or -3)
	Tab.Backdrop:Point('BOTTOMRIGHT', -10, 3)
end

local function GrabScrollBarElement(frame, element)
	local FrameName = frame:GetName()
	return FrameName and _G[FrameName..element] or frame[element] or nil
end

function AS:SkinScrollBar(Frame)
	if Frame.Backdrop then return end

	local ScrollUpButton = GrabScrollBarElement(Frame, 'ScrollUpButton') or GrabScrollBarElement(Frame, 'UpButton')
	local ScrollDownButton = GrabScrollBarElement(Frame, 'ScrollDownButton') or GrabScrollBarElement(Frame, 'DownButton')
	local Thumb = GrabScrollBarElement(Frame, 'ThumbTexture') or GrabScrollBarElement(Frame, 'thumbTexture') or Frame.GetThumbTexture and Frame:GetThumbTexture()

	AS:SkinBackdropFrame(Frame)
	Frame.Backdrop:SetPoint('TOPLEFT', ScrollUpButton or Frame, ScrollUpButton and 'BOTTOMLEFT' or 'TOPLEFT', 0, -1)
	Frame.Backdrop:SetPoint('BOTTOMRIGHT', ScrollDownButton or Frame, ScrollUpButton and 'TOPRIGHT' or 'BOTTOMRIGHT', 0, 1)
	Frame.Backdrop:SetFrameLevel(Frame.Backdrop:GetFrameLevel() + 1)

	for _, Button in pairs({ ScrollUpButton, ScrollDownButton }) do
		if Button then
			AS:StripTextures(Button)
			AS:SetTemplate(Button)

			local Mask = Button:CreateMaskTexture()
			Mask:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\]]..(Button == ScrollUpButton and 'UpArrow' or 'DownArrow'), 'CLAMPTOBLACKADDITIVE', 'CLAMPTOBLACKADDITIVE')
			Mask:SetSize(10, 10)
			Mask:SetPoint('CENTER')

			Button.Mask = Mask

			Button:SetNormalTexture(AS.NormTex)
			Button:SetDisabledTexture(AS.NormTex)
			Button:SetPushedTexture(AS.NormTex)

			local Normal, Disabled, Pushed = Button:GetNormalTexture(), Button:GetDisabledTexture(), Button:GetPushedTexture()

			Normal:SetInside()
			Normal:SetTexCoord(0, 1, 0, 1)
			Normal.SetTexCoord = AS.Noop
			Normal:SetVertexColor(1, 1, 1)
			Normal:AddMaskTexture(Mask)

			Disabled:SetInside()
			Disabled:SetTexCoord(0, 1, 0, 1)
			Disabled.SetTexCoord = AS.Noop
			Disabled:SetVertexColor(.3, .3, .3)
			Disabled:AddMaskTexture(Mask)

			Pushed:SetInside()
			Pushed:SetTexCoord(0, 1, 0, 1)
			Pushed.SetTexCoord = AS.Noop
			Pushed:SetVertexColor(unpack(AS.Color))
			Pushed:AddMaskTexture(Mask)

			Button:HookScript('OnEnter', function(self)
				self:SetBackdropBorderColor(unpack(AS.Color))
				Normal:SetVertexColor(unpack(AS.Color))
			end)
			Button:HookScript('OnLeave', function(self)
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
				Normal:SetVertexColor(1, 1, 1)
			end)
		end
	end

	if Thumb then
		Thumb:SetTexture('')
		AS:CreateBackdrop(Thumb)
		Thumb.Backdrop:SetPoint('TOPLEFT', Thumb, 'TOPLEFT', 2, -4)
		Thumb.Backdrop:SetPoint('BOTTOMRIGHT', Thumb, 'BOTTOMRIGHT', -2, 4)
		Thumb.Backdrop:SetFrameLevel(Thumb.Backdrop:GetFrameLevel() + 2)
		Thumb.Backdrop:HookScript('OnEnter', function(self) self:SetBackdropBorderColor(unpack(AS.Color)) end)
		Thumb.Backdrop:HookScript('OnLeave', function(self) self:SetBackdropBorderColor(unpack(AS.BorderColor)) end)

		if AS:CheckAddOn('ElvUI') then
			Thumb.Backdrop:SetBackdropColor(0.6, 0.6, 0.6)
		end
	end
end

function AS:SkinNextPrevButton(Button, Vertical, Inverse)
	local ButtonName = Button:GetName() and Button:GetName():lower()
	Inverse = Inverse or ButtonName and (strfind(ButtonName, 'left') or strfind(ButtonName, 'prev') or strfind(ButtonName, 'decrement') or strfind(ButtonName, 'back'))

	AS:StripTextures(Button)
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
				self.icon:SetPoint('CENTER', -1, -1)
			end
		end)

		Button:HookScript('OnMouseUp', function(self)
			self.icon:SetPoint('CENTER', 0, 0)
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
	AS:SetTemplate(Button, 'Default')
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

	local Button = FrameName and _G[FrameName..'Button'] or Frame.Button
	local Text = FrameName and _G[FrameName..'Text'] or Frame.Text

	if Button and Text then
		AS:StripTextures(Frame)
		Frame:Width(Width or 155)

		Text:ClearAllPoints()
		Text:Point('RIGHT', Button, 'LEFT', -2, 0)

		Button:ClearAllPoints()
		Button:Point('RIGHT', Frame, 'RIGHT', -10, 3)
		Button.SetPoint = AS.Noop

		AS:SkinNextPrevButton(Button, true)

		AS:CreateBackdrop(Frame, AS:CheckOption('ElvUISkinModule', 'ElvUI') and 'Default' or nil)

		Frame.Backdrop:Point('TOPLEFT', 20, -2)
		Frame.Backdrop:Point('BOTTOMRIGHT', Button, 'BOTTOMRIGHT', 2, -2)
	end
end

function AS:SkinSlideBar(Frame, Height, MoveText)
	AS:SkinBackdropFrame(Frame, AS:CheckOption('ElvUISkinModule', 'ElvUI') and 'Default' or nil)
	Frame.Backdrop:SetAllPoints()

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
		if _G[Frame:GetName()..'Text'] then _G[Frame:GetName()..'Text']:Point('TOP', 0, 19) end
	end

	Frame.ThumbBG = CreateFrame('Frame', nil, Frame)
	Frame.ThumbBG:Point('TOPLEFT', Frame:GetThumbTexture(), 'TOPLEFT', 2, -3)
	Frame.ThumbBG:Point('BOTTOMRIGHT', Frame:GetThumbTexture(), 'BOTTOMRIGHT', -2, 3)
	AS:SetTemplate(Frame.ThumbBG, 'Default')

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
	local Icon, Texture = Button.icon or Button.Icon or ButtonName and (_G[ButtonName..'Icon'] or _G[ButtonName..'IconTexture'])

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
	if not override then AS:StripTextures(frame, kill) end
	AS:SetTemplate(frame, template)
end

function AS:SkinBackdropFrame(frame, template, override, kill, setpoints)
	if not override then AS:StripTextures(frame, kill) end
	AS:CreateBackdrop(frame, template)
	if setpoints then
		frame.Backdrop:SetAllPoints()
	end
end

function AS:SkinStatusBar(frame, ClassColor)
	local Color = { frame:GetStatusBarColor() }
	AS:SkinBackdropFrame(frame)
	frame:SetStatusBarTexture(AS.NormTex)
	if ClassColor then
		frame:SetStatusBarColor(unpack(AS.ClassColor))
	else
		frame:SetStatusBarColor(unpack(Color))
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

function AS:SkinTexture(icon, backdrop)
	icon:SetTexCoord(unpack(AS.TexCoords))
	if backdrop then
		AS:CreateBackdrop(icon)
	end
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

	if frame:IsObjectType('Button') or frame:IsObjectType('CheckButton') then
		local Normal, Pushed, Highlight = frame:GetNormalTexture(), frame:GetPushedTexture(), frame:GetHighlightTexture()
		Normal:SetDesaturated(true)
		Pushed:SetDesaturated(true)
		Highlight:SetDesaturated(true)

		Normal.SetDesaturated = AS.Noop
		Pushed.SetDesaturated = AS.Noop
		Highlight.SetDesaturated = AS.Noop
	end
end

function AS:SkinMaxMinFrame(frame)
	AS:StripTextures(frame, true)

	for _, name in pairs({'MaximizeButton', 'MinimizeButton'}) do
		local button = frame[name]

		if button then
			button:SetSize(16, 16)
			button:ClearAllPoints()
			button:SetPoint('CENTER')
			button:SetHitRectInsets(1, 1, 1, 1)
			AS:StripTextures(button, nil, true)
			AS:SetTemplate(button)

			button.Text = button:CreateFontString(nil, 'OVERLAY')
			button.Text:SetFont([[Interface\AddOns\AddOnSkins\Media\Fonts\Arial.TTF]], 12)
			button.Text:SetText(name == 'MaximizeButton' and '▲' or '▼')
			button.Text:SetPoint('CENTER', 0, 0)

			button:HookScript('OnShow', function(self)
				if not self:IsEnabled() then
					self.Text:SetTextColor(.3, .3, .3)
				end
			end)

			button:HookScript('OnEnter', function(self)
				self:SetBackdropBorderColor(unpack(AS.Color))
				self.Text:SetTextColor(unpack(AS.Color))
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
	if (type(enumFuncs) == 'function') then
		enumFuncs = {enumFuncs}
	end

	EnumObjectsHelper(enumFuncs, yieldFunc)
end

function AS:FindChildFrameByPoint(parent, objType, point1, relativeTo, point2, x, y)
	local childPoint1, childParent, childPoint2, childX, childY
	local childs = {parent:GetChildren()}

	x = AS:Round(x)
	y = AS:Round(y)

	for _, child in pairs(childs) do
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
					return child
				end
			end
		end
	end
end

function AS:FindChildFrameBySize(parent, objType, width, height)
	local childs = {parent:GetChildren()}

	width = AS:Round(width)
	height = AS:Round(height)

	for _, child in pairs(childs) do
		if not child:GetName() then
			if not objType or (objType and child:IsObjectType(objType)) then
				if AS:Round(child:GetWidth()) == width and AS:Round(child:GetHeight()) == height then
					return child
				end
			end
		end
	end
end

function AS:FindFrameBySizeChild(childTypes, width, height)
	local obj = EnumerateFrames()

	width = AS:Round(width)
	height = AS:Round(height)

	while obj do
		if obj.IsObjectType and obj:IsObjectType('Frame') then
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
						return obj
					end
				end
			end
		end

		obj = EnumerateFrames(obj)
	end
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
		if obj.IsObjectType and obj:IsObjectType('Frame') then
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
						return obj
					end
				end
			end
		end

		obj = EnumerateFrames(obj)
	end

	return frame
end
