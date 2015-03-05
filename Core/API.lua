local AS = unpack(AddOnSkins)

local Color = RAID_CLASS_COLORS[AS.MyClass]

function AS:SetTemplate(Frame, Template, UseTexture, TextureFile)
	local Texture = AS.Blank

	if UseTexture then 
		Texture = TextureFile or AS.NormTex
	end

	if AS.PixelPerfect then
		Frame:SetBackdrop({
			bgFile = Texture,
			edgeFile = AS.Blank,
			tile = false, tileSize = 0, edgeSize = 1,
			insets = {left = 0, right = 0, top = 0, bottom = 0},
		})
	else
		Frame:SetBackdrop({
			bgFile = Texture,
			edgeFile = AS.Blank,
			tile = false, tileSize = 0, edgeSize = 1,
			insets = { left = -1, right = -1, top = -1, bottom = -1},
		})

		if not Frame.isInsetDone then
			Frame.InsetTop = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetTop:Point("TOPLEFT", Frame, "TOPLEFT", -1, 1)
			Frame.InsetTop:Point("TOPRIGHT", Frame, "TOPRIGHT", 1, -1)
			Frame.InsetTop:Height(1)
			Frame.InsetTop:SetTexture(0,0,0)	
			Frame.InsetTop:SetDrawLayer("BORDER", -7)

			Frame.InsetBottom = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetBottom:Point("BOTTOMLEFT", Frame, "BOTTOMLEFT", -1, -1)
			Frame.InsetBottom:Point("BOTTOMRIGHT", Frame, "BOTTOMRIGHT", 1, -1)
			Frame.InsetBottom:Height(1)
			Frame.InsetBottom:SetTexture(0,0,0)	
			Frame.InsetBottom:SetDrawLayer("BORDER", -7)

			Frame.InsetLeft = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetLeft:Point("TOPLEFT", Frame, "TOPLEFT", -1, 1)
			Frame.InsetLeft:Point("BOTTOMLEFT", Frame, "BOTTOMLEFT", 1, -1)
			Frame.InsetLeft:Width(1)
			Frame.InsetLeft:SetTexture(0,0,0)
			Frame.InsetLeft:SetDrawLayer("BORDER", -7)

			Frame.InsetRight = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetRight:Point("TOPRIGHT", Frame, "TOPRIGHT", 1, 1)
			Frame.InsetRight:Point("BOTTOMRIGHT", Frame, "BOTTOMRIGHT", -1, -1)
			Frame.InsetRight:Width(1)
			Frame.InsetRight:SetTexture(0,0,0)	
			Frame.InsetRight:SetDrawLayer("BORDER", -7)

			Frame.InsetInsideTop = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetInsideTop:Point("TOPLEFT", Frame, "TOPLEFT", 1, -1)
			Frame.InsetInsideTop:Point("TOPRIGHT", Frame, "TOPRIGHT", -1, 1)
			Frame.InsetInsideTop:Height(1)
			Frame.InsetInsideTop:SetTexture(0,0,0)	
			Frame.InsetInsideTop:SetDrawLayer("BORDER", -7)

			Frame.InsetInsideBottom = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetInsideBottom:Point("BOTTOMLEFT", Frame, "BOTTOMLEFT", 1, 1)
			Frame.InsetInsideBottom:Point("BOTTOMRIGHT", Frame, "BOTTOMRIGHT", -1, 1)
			Frame.InsetInsideBottom:Height(1)
			Frame.InsetInsideBottom:SetTexture(0,0,0)	
			Frame.InsetInsideBottom:SetDrawLayer("BORDER", -7)

			Frame.InsetInsideLeft = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetInsideLeft:Point("TOPLEFT", Frame, "TOPLEFT", 1, -1)
			Frame.InsetInsideLeft:Point("BOTTOMLEFT", Frame, "BOTTOMLEFT", -1, 1)
			Frame.InsetInsideLeft:Width(1)
			Frame.InsetInsideLeft:SetTexture(0,0,0)
			Frame.InsetInsideLeft:SetDrawLayer("BORDER", -7)

			Frame.InsetInsideRight = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetInsideRight:Point("TOPRIGHT", Frame, "TOPRIGHT", -1, -1)
			Frame.InsetInsideRight:Point("BOTTOMRIGHT", Frame, "BOTTOMRIGHT", 1, 1)
			Frame.InsetInsideRight:Width(1)
			Frame.InsetInsideRight:SetTexture(0,0,0)	
			Frame.InsetInsideRight:SetDrawLayer("BORDER", -7)

			Frame.isInsetDone = true
		end
	end
	local R, G, B = unpack(AS.BackdropColor)
	local Alpha = (Template == "Transparent" and .8 or 1)

	if IsAddOnLoaded('ElvUI') then
		if Template == "Transparent" then
			R, G, B, Alpha = unpack(ElvUI[1]["media"].backdropfadecolor)
		else
			R, G, B = unpack(ElvUI[1]["media"].backdropcolor)
		end
	end

	Frame:SetBackdropBorderColor(unpack(AS.BorderColor))
	Frame:SetBackdropColor(R, G, B, Alpha)
end

local Insets = {
	InsetTop,
	InsetBottom,
	InsetLeft,
	InsetRight,
	InsetInsideTop,
	InsetInsideBottom,
	InsetInsideLeft,
	InsetInsideRight,
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

function AS:StripTextures(Object, Kill)
	for i = 1, Object:GetNumRegions() do
		local Region = select(i, Object:GetRegions())
		if Region:GetObjectType() == "Texture" then
			if Kill then
				Region:Kill()
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

	if ButtonName then
		for _, Region in pairs(BlizzardRegions) do
			if _G[ButtonName..Region] then
				_G[ButtonName..Region]:SetAlpha(0)
			end
		end
	end

	for _, Region in pairs(BlizzardRegions) do
		if Button[Region] then
			Button[Region]:SetAlpha(0)
		end
	end

	if Button.SetNormalTexture then Button:SetNormalTexture("") end	
	if Button.SetHighlightTexture then Button:SetHighlightTexture("") end
	if Button.SetPushedTexture then Button:SetPushedTexture("") end	
	if Button.SetDisabledTexture then Button:SetDisabledTexture("") end

	AS:SkinFrame(Button, nil, not Strip)

	Button:HookScript("OnEnter", function(self)
		if AS.ValueColor then
			self:SetBackdropBorderColor(unpack(AS.ValueColor))
		else
			self:SetBackdropBorderColor(Color.r, Color.g, Color.b)
		end
	end)

	Button:HookScript("OnLeave", function(self)
		self:SetBackdropBorderColor(unpack(AS.BorderColor))
	end)
end

function AS:CreateShadow(Frame)
	if Frame.Shadow then return end

	local Shadow = CreateFrame("Frame", nil, Frame)
	Shadow:SetFrameLevel(1)
	Shadow:SetFrameStrata(Frame:GetFrameStrata())
	Shadow:Point("TOPLEFT", -3, 3)
	Shadow:Point("BOTTOMLEFT", -3, -3)
	Shadow:Point("TOPRIGHT", 3, 3)
	Shadow:Point("BOTTOMRIGHT", 3, -3)

	Shadow:SetBackdrop({ 
		edgeFile = [[Interface\AddOns\AddOnSkins\Media\Textures\Shadows]], edgeSize = AS:Scale(3),
		insets = {left = AS:Scale(5), right = AS:Scale(5), top = AS:Scale(5), bottom = AS:Scale(5)},
	})

	Shadow:SetBackdropColor(0, 0, 0, 0)
	Shadow:SetBackdropBorderColor(0, 0, 0, 0.8)
	Frame.Shadow = Shadow
end

function AS:StyleButton(Button)
	if Button.hasStyle then return end

	if Button.SetHighlightTexture and not Button.hover then
		local hover = Button:CreateTexture("frame", nil, self)
		hover:SetTexture(1, 1, 1, 0.3)
		hover:SetInside()
		Button.hover = hover
		Button:SetHighlightTexture(hover)
	end

	if Button.SetPushedTexture and not Button.pushed then
		local pushed = Button:CreateTexture("frame", nil, self)
		pushed:SetTexture(0.9, 0.8, 0.1, 0.3)
		pushed:SetInside()
		Button.pushed = pushed
		Button:SetPushedTexture(pushed)
	end

	if Button.SetCheckedTexture and not Button.checked then
		local checked = Button:CreateTexture("frame", nil, self)
		checked:SetTexture(0,1,0,.3)
		checked:SetInside()
		Button.checked = checked
		Button:SetCheckedTexture(checked)
	end

	local cooldown = Button:GetName() and _G[Button:GetName().."Cooldown"]
	if cooldown then
		cooldown:ClearAllPoints()
		cooldown:SetInside()
		cooldown:SetSwipeColor(0, 0, 0, 1)
	end

	Button.hasStyle = true
end

function AS:SkinCloseButton(CloseButton, Reposition)
	if CloseButton.isSkinned then return end
	AS:StripTextures(CloseButton)
	AS:CreateBackdrop(CloseButton)
	AS:SetTemplate(CloseButton.Backdrop, nil, true)
	CloseButton.Backdrop:Point('TOPLEFT', 7, -8)
	CloseButton.Backdrop:Point('BOTTOMRIGHT', -8, 8)

	CloseButton.Text = CloseButton:CreateFontString(nil, "OVERLAY")
	CloseButton.Text:SetFont([[Interface\AddOns\AddOnSkins\Media\Fonts\PTSansNarrow.TTF]], 12)
	CloseButton.Text:SetPoint("CENTER", CloseButton, 'CENTER')
	CloseButton.Text:SetText('x')

	CloseButton:HookScript("OnEnter", function(self)
		self.Text:SetTextColor(1, .2, .2)
		self.Backdrop:SetBackdropBorderColor(1, .2, .2)
	end)

	CloseButton:HookScript("OnLeave", function(self)
		self.Text:SetTextColor(1, 1, 1)
		self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
	end)

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
}

function AS:SkinScrollBar(Frame)
	local ScrollUpButton = Frame:GetName() and _G[Frame:GetName().."ScrollUpButton"] or Frame.ScrollUpButton
	local ScrollDownButton = Frame:GetName() and _G[Frame:GetName().."ScrollDownButton"] or Frame.ScrollDownButton

	for _, object in pairs(ScrollBarElements) do
		if Frame:GetName() and _G[Frame:GetName()..object] then
			_G[Frame:GetName()..object]:SetTexture(nil)
		end
	end

	if ScrollUpButton and ScrollDownButton then
		AS:StripTextures(ScrollUpButton)
		AS:SetTemplate(ScrollUpButton, "Default", true)

		AS:StripTextures(ScrollDownButton)
		AS:SetTemplate(ScrollDownButton, "Default", true)

		if not ScrollUpButton.Text then
			ScrollUpButton.Text = ScrollUpButton:CreateFontString(nil, "OVERLAY")
			ScrollUpButton.Text:SetFont([[Fonts\ARIALN.TTF]], 12)
			ScrollUpButton.Text:SetText("▲")
			ScrollUpButton.Text:SetPoint("CENTER", 1, 0)

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
				self:SetBackdropBorderColor(Color.r, Color.g, Color.b)
				self.Text:SetTextColor(Color.r, Color.g, Color.b)
			end)
			ScrollUpButton:HookScript('OnLeave', function(self)
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.Text:SetTextColor(1, 1, 1)
			end)
		end	

		if not ScrollDownButton.Text then
			ScrollDownButton.Text = ScrollDownButton:CreateFontString(nil, "OVERLAY")
			ScrollDownButton.Text:SetFont([[Fonts\ARIALN.TTF]], 12)
			ScrollDownButton.Text:SetText("▼")
			ScrollDownButton.Text:SetPoint("CENTER", 1, 0)

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
				self:SetBackdropBorderColor(Color.r, Color.g, Color.b)
				self.Text:SetTextColor(Color.r, Color.g, Color.b)
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
				Frame.ThumbBG:Point("TOPLEFT", Frame:GetThumbTexture(), "TOPLEFT", 2, -3)
				Frame.ThumbBG:Point("BOTTOMRIGHT", Frame:GetThumbTexture(), "BOTTOMRIGHT", -2, 3)
				AS:SetTemplate(Frame.ThumbBG, "Default", true)

				if Frame.ThumbBG then
					Frame.ThumbBG:SetFrameLevel(Frame.TrackBG:GetFrameLevel())
				end
			end
		end
	end
end

function AS:SkinNextPrevButton(Button, Vertical)
	if Button.isSkinned then return end
	AS:SetTemplate(Button)
	Button:Size(Button:GetWidth() - 7, Button:GetHeight() - 7)

	for i = 1, Button:GetNumRegions() do
		local region = select(i, Button:GetRegions())
		if region and region:GetObjectType() == "Texture" and region:GetTexture() == "Interface\\Buttons\\UI-PageButton-Background" then
			region:SetTexture('')
		end
	end

	if Vertical then
		Button:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.72, 0.65, 0.29, 0.65, 0.72)

		if Button:GetPushedTexture() then
			Button:GetPushedTexture():SetTexCoord(0.3, 0.35, 0.3, 0.8, 0.65, 0.35, 0.65, 0.8)
		end

		if Button:GetDisabledTexture() then
			Button:GetDisabledTexture():SetTexCoord(0.3, 0.29, 0.3, 0.75, 0.65, 0.29, 0.65, 0.75)
		end
	else
		Button:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.81, 0.65, 0.29, 0.65, 0.81)

		if Button:GetPushedTexture() then
			Button:GetPushedTexture():SetTexCoord(0.3, 0.35, 0.3, 0.81, 0.65, 0.35, 0.65, 0.81)
		end

		if Button:GetDisabledTexture() then
			Button:GetDisabledTexture():SetTexCoord(0.3, 0.29, 0.3, 0.75, 0.65, 0.29, 0.65, 0.75)
		end
	end

	Button:GetNormalTexture():ClearAllPoints()
	Button:GetNormalTexture():SetInside()

	if Button:GetDisabledTexture() then
		Button:GetDisabledTexture():SetAllPoints(Button:GetNormalTexture())
	end

	if Button:GetPushedTexture() then
		Button:GetPushedTexture():SetAllPoints(Button:GetNormalTexture())
	end

	Button:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
	Button:GetHighlightTexture():SetAllPoints(Button:GetNormalTexture())

	Button.isSkinned = true
end

function AS:SkinRotateButton(Button)
	if Button.isSkinned then return end

	AS:SetTemplate(Button, "Default")
	Button:Size(Button:GetWidth() - 14, Button:GetHeight() - 14)	

	Button:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)
	Button:GetPushedTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)	

	Button:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)

	Button:GetNormalTexture():ClearAllPoints()
	Button:GetNormalTexture():SetInside()
	Button:GetPushedTexture():SetAllPoints(Button:GetNormalTexture())	
	Button:GetHighlightTexture():SetAllPoints(Button:GetNormalTexture())

	Button.isSkinned = true
end

function AS:SkinDropDownBox(Frame, Width)
	local Button = _G[Frame:GetName().."Button"]
	local Text = _G[Frame:GetName().."Text"]

	AS:StripTextures(Frame)
	Frame:Width(Width or 155)

	Text:ClearAllPoints()
	Text:Point("RIGHT", Button, "LEFT", -2, 0)

	Button:ClearAllPoints()
	Button:Point("RIGHT", Frame, "RIGHT", -10, 3)
	Button.SetPoint = AS.Noop

	AS:SkinNextPrevButton(Button, true)

	AS:CreateBackdrop(Frame)
	Frame.Backdrop:Point("TOPLEFT", 20, -2)
	Frame.Backdrop:Point("BOTTOMRIGHT", Button, "BOTTOMRIGHT", 2, -2)
end

function AS:SkinSlideBar(Frame, Height, MoveText)
	AS:StripTextures(Frame)
	AS:CreateBackdrop(Frame)
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

function AS:SkinIconButton(Button, ShrinkIcon)
	if Button.isSkinned then return end

	AS:StripTextures(Button)
	AS:CreateBackdrop(Button)
	AS:StyleButton(Button)

	local Icon = Button.icon
	local ButtonName = Button:GetName()

	if ButtonName then
		if _G[ButtonName.."IconTexture"] then
			Icon = _G[ButtonName.."IconTexture"]
		elseif _G[ButtonName.."Icon"] then
			Icon = _G[ButtonName.."Icon"]
		end
	end

	if Icon then
		AS:SkinTexture(Icon)

		if ShrinkIcon then
			Button.Backdrop:SetAllPoints()
			Icon:SetInside(Button)
		else
			Button.Backdrop:SetOutside(Icon)
		end
		Icon:SetParent(Button.Backdrop)
	end

	Button.isSkinned = true
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
		local color = RAID_CLASS_COLORS[AS.MyClass]
		frame:SetStatusBarColor(color.r, color.g, color.b)
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

function AS:Desaturate(frame, point)
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
