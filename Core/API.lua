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
			Frame.InsetTop:SetColorTexture(0,0,0)	
			Frame.InsetTop:SetDrawLayer("BORDER", -7)

			Frame.InsetBottom = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetBottom:Point("BOTTOMLEFT", Frame, "BOTTOMLEFT", -1, -1)
			Frame.InsetBottom:Point("BOTTOMRIGHT", Frame, "BOTTOMRIGHT", 1, -1)
			Frame.InsetBottom:Height(1)
			Frame.InsetBottom:SetColorTexture(0,0,0)	
			Frame.InsetBottom:SetDrawLayer("BORDER", -7)

			Frame.InsetLeft = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetLeft:Point("TOPLEFT", Frame, "TOPLEFT", -1, 1)
			Frame.InsetLeft:Point("BOTTOMLEFT", Frame, "BOTTOMLEFT", 1, -1)
			Frame.InsetLeft:Width(1)
			Frame.InsetLeft:SetColorTexture(0,0,0)
			Frame.InsetLeft:SetDrawLayer("BORDER", -7)

			Frame.InsetRight = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetRight:Point("TOPRIGHT", Frame, "TOPRIGHT", 1, 1)
			Frame.InsetRight:Point("BOTTOMRIGHT", Frame, "BOTTOMRIGHT", -1, -1)
			Frame.InsetRight:Width(1)
			Frame.InsetRight:SetColorTexture(0,0,0)	
			Frame.InsetRight:SetDrawLayer("BORDER", -7)

			Frame.InsetInsideTop = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetInsideTop:Point("TOPLEFT", Frame, "TOPLEFT", 1, -1)
			Frame.InsetInsideTop:Point("TOPRIGHT", Frame, "TOPRIGHT", -1, 1)
			Frame.InsetInsideTop:Height(1)
			Frame.InsetInsideTop:SetColorTexture(0,0,0)	
			Frame.InsetInsideTop:SetDrawLayer("BORDER", -7)

			Frame.InsetInsideBottom = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetInsideBottom:Point("BOTTOMLEFT", Frame, "BOTTOMLEFT", 1, 1)
			Frame.InsetInsideBottom:Point("BOTTOMRIGHT", Frame, "BOTTOMRIGHT", -1, 1)
			Frame.InsetInsideBottom:Height(1)
			Frame.InsetInsideBottom:SetColorTexture(0,0,0)	
			Frame.InsetInsideBottom:SetDrawLayer("BORDER", -7)

			Frame.InsetInsideLeft = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetInsideLeft:Point("TOPLEFT", Frame, "TOPLEFT", 1, -1)
			Frame.InsetInsideLeft:Point("BOTTOMLEFT", Frame, "BOTTOMLEFT", -1, 1)
			Frame.InsetInsideLeft:Width(1)
			Frame.InsetInsideLeft:SetColorTexture(0,0,0)
			Frame.InsetInsideLeft:SetDrawLayer("BORDER", -7)

			Frame.InsetInsideRight = Frame:CreateTexture(nil, "BORDER")
			Frame.InsetInsideRight:Point("TOPRIGHT", Frame, "TOPRIGHT", -1, -1)
			Frame.InsetInsideRight:Point("BOTTOMRIGHT", Frame, "BOTTOMRIGHT", 1, 1)
			Frame.InsetInsideRight:Width(1)
			Frame.InsetInsideRight:SetColorTexture(0,0,0)	
			Frame.InsetInsideRight:SetDrawLayer("BORDER", -7)

			Frame.isInsetDone = true
		end
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

	if AS:CheckAddOn('ElvUI') and AS:CheckOption('ElvUISkinModule') then
		AS:SetTemplate(Button, 'Default', true)
	end

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

	CloseButton:HookScript("OnEnter", function(self)
		self.Text:SetTextColor(1, .2, .2)
		if AS:CheckAddOn('ElvUI') and AS:CheckOption('ElvUISkinModule') then
			self.Backdrop:SetBackdropBorderColor(unpack(ElvUI[1]["media"].rgbvaluecolor))
		else
			self.Backdrop:SetBackdropBorderColor(1, .2, .2)
		end
	end)

	CloseButton:HookScript("OnLeave", function(self)
		self.Text:SetTextColor(1, 1, 1)
		self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
	end)

	CloseButton.Text = CloseButton:CreateFontString(nil, "OVERLAY")
	CloseButton.Text:SetFont([[Interface\AddOns\AddOnSkins\Media\Fonts\PTSansNarrow.TTF]], 16, AS:CheckAddOn('ElvUI') and AS:CheckOption('ElvUISkinModule') and 'OUTLINE' or nil)
	CloseButton.Text:SetPoint("CENTER", CloseButton, 'CENTER')
	CloseButton.Text:SetJustifyH('CENTER')
	CloseButton.Text:SetJustifyV('MIDDLE')
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
		AS:SetTemplate(Tab.Backdrop, 'Default')
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
				AS:SetTemplate(Frame.ThumbBG, "Default")
				if IsAddOnLoaded('ElvUI') then
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

	Button:GetHighlightTexture():SetColorTexture(1, 1, 1, 0.3)
	Button:GetHighlightTexture():SetAllPoints(Button:GetNormalTexture())

	Button.isSkinned = true
end

function AS:SkinRotateButton(Button)
	if Button.isSkinned then return end

	AS:SetTemplate(Button, "Default")
	Button:Size(Button:GetWidth() - 14, Button:GetHeight() - 14)	

	Button:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)
	Button:GetPushedTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)	

	Button:GetHighlightTexture():SetColorTexture(1, 1, 1, 0.3)

	Button:GetNormalTexture():ClearAllPoints()
	Button:GetNormalTexture():SetInside()
	Button:GetPushedTexture():SetAllPoints(Button:GetNormalTexture())	
	Button:GetHighlightTexture():SetAllPoints(Button:GetNormalTexture())

	Button.isSkinned = true
end

function AS:SkinDropDownBox(Frame, Width)
	local Button, Text
	local FrameName = Frame:GetName()

	if FrameName then
		Button = _G[Frame:GetName().."Button"]
		Text = _G[Frame:GetName().."Text"]
	else
		Button = Frame.Button
		Text = Frame.Text
	end

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

function AS:SkinIconButton(Button, ShrinkIcon)
	if Button.isSkinned then return end

	local Icon, Texture
	local ButtonName = Button:GetName()

	if Button.icon then
		Icon = Button.icon
		Texture = Button.icon:GetTexture()
	elseif Button.Icon then
		Icon = Button.Icon
		Texture = Button.Icon:GetTexture()
	elseif ButtonName then
		if _G[ButtonName.."IconTexture"] then
			Icon = _G[ButtonName.."IconTexture"]
			Texture = _G[ButtonName.."IconTexture"]:GetTexture()
		elseif _G[ButtonName.."Icon"] then
			Icon = _G[ButtonName.."Icon"]
			Texture = _G[ButtonName.."Icon"]:GetTexture()
		end
	end

	if Icon then
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
		local color = RAID_CLASS_COLORS[AS.MyClass]
		frame:SetStatusBarColor(color.r, color.g, color.b)
	end
	if AS:CheckAddOn('ElvUI') then
		ElvUI[1]:RegisterStatusBar(Frame)
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
				local innerEnumFuncs = CopyTable(enumFuncs);
				tremove(innerEnumFuncs, 1);
				EnumObjectsHelper(innerEnumFuncs, yieldFunc, obj);
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
