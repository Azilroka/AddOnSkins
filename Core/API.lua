local AS = unpack(AddOnSkins)
--if AS:CheckAddOn('Tukui') then return end

function AS:InitAPI()
	local Mult = AS.Mult
	local Scale = function(x) return Mult * math.floor (x/Mult+.5) end
	local floor = math.floor
	local class = AS.MyClass
	local texture = AS.Blank
	local Noop = AS.Noop
	local Color = RAID_CLASS_COLORS[class]

	-- [[ API FUNCTIONS ]] --

	local function Size(frame, width, height)
		frame:SetSize(Scale(width), Scale(height or width))
	end

	local function Width(frame, width)
		frame:SetWidth(Scale(width))
	end

	local function Height(frame, height)
		frame:SetHeight(Scale(height))
	end

	local function Point(obj, arg1, arg2, arg3, arg4, arg5)
		-- anyone has a more elegant way for this?
		if type(arg1)=="number" then arg1 = Scale(arg1) end
		if type(arg2)=="number" then arg2 = Scale(arg2) end
		if type(arg3)=="number" then arg3 = Scale(arg3) end
		if type(arg4)=="number" then arg4 = Scale(arg4) end
		if type(arg5)=="number" then arg5 = Scale(arg5) end

		obj:SetPoint(arg1, arg2, arg3, arg4, arg5)
	end

	local function SetOutside(obj, anchor, xOffset, yOffset)
		xOffset = xOffset or (AS.PixelPerfect and 2) or 1
		yOffset = yOffset or (AS.PixelPerfect and 2) or 1
		anchor = anchor or obj:GetParent()

		if obj:GetPoint() then obj:ClearAllPoints() end

		obj:Point("TOPLEFT", anchor, "TOPLEFT", -xOffset, yOffset)
		obj:Point("BOTTOMRIGHT", anchor, "BOTTOMRIGHT", xOffset, -yOffset)
	end

	local function SetInside(obj, anchor, xOffset, yOffset)
		xOffset = xOffset or (AS.PixelPerfect and 2) or 1
		yOffset = yOffset or (AS.PixelPerfect and 2) or 1
		anchor = anchor or obj:GetParent()

		if obj:GetPoint() then obj:ClearAllPoints() end

		obj:Point("TOPLEFT", anchor, "TOPLEFT", xOffset, -yOffset)
		obj:Point("BOTTOMRIGHT", anchor, "BOTTOMRIGHT", -xOffset, yOffset)
	end

	local function SetTemplate(f, t, tex)
		local balpha = 1
		if t == "Transparent" then balpha = 0.8 end

		local borderr, borderg, borderb = unpack(AS.BorderColor)
		local backdropr, backdropg, backdropb = unpack(AS.BackdropColor)
		local backdropa = balpha

		if tex then
			texture = AS.NormTex
		else
			texture = AS.Blank
		end

		-- 6.0 FIX ME when textures aren't broken
		f:SetBackdrop({
		  --bgFile = texture,
		  bgFile = "Interface\\BUTTONS\\WHITE8X8",
		  --edgeFile = AS.Blank,
		  edgeFile = "Interface\\BUTTONS\\WHITE8X8",
		  tile = false, tileSize = 0, edgeSize = Mult,
		})

		if AS.PixelPerfect and not f.isInsetDone then
			f.insettop = f:CreateTexture(nil, "BORDER")
			f.insettop:Point("TOPLEFT", f, "TOPLEFT", -1, 1)
			f.insettop:Point("TOPRIGHT", f, "TOPRIGHT", 1, -1)
			f.insettop:Height(1)
			f.insettop:SetTexture(0,0,0)	
			f.insettop:SetDrawLayer("BORDER", -7)

			f.insetbottom = f:CreateTexture(nil, "BORDER")
			f.insetbottom:Point("BOTTOMLEFT", f, "BOTTOMLEFT", -1, -1)
			f.insetbottom:Point("BOTTOMRIGHT", f, "BOTTOMRIGHT", 1, -1)
			f.insetbottom:Height(1)
			f.insetbottom:SetTexture(0,0,0)	
			f.insetbottom:SetDrawLayer("BORDER", -7)

			f.insetleft = f:CreateTexture(nil, "BORDER")
			f.insetleft:Point("TOPLEFT", f, "TOPLEFT", -1, 1)
			f.insetleft:Point("BOTTOMLEFT", f, "BOTTOMLEFT", 1, -1)
			f.insetleft:Width(1)
			f.insetleft:SetTexture(0,0,0)
			f.insetleft:SetDrawLayer("BORDER", -7)

			f.insetright = f:CreateTexture(nil, "BORDER")
			f.insetright:Point("TOPRIGHT", f, "TOPRIGHT", 1, 1)
			f.insetright:Point("BOTTOMRIGHT", f, "BOTTOMRIGHT", -1, -1)
			f.insetright:Width(1)
			f.insetright:SetTexture(0,0,0)	
			f.insetright:SetDrawLayer("BORDER", -7)

			f.insetinsidetop = f:CreateTexture(nil, "BORDER")
			f.insetinsidetop:Point("TOPLEFT", f, "TOPLEFT", 1, -1)
			f.insetinsidetop:Point("TOPRIGHT", f, "TOPRIGHT", -1, 1)
			f.insetinsidetop:Height(1)
			f.insetinsidetop:SetTexture(0,0,0)	
			f.insetinsidetop:SetDrawLayer("BORDER", -7)

			f.insetinsidebottom = f:CreateTexture(nil, "BORDER")
			f.insetinsidebottom:Point("BOTTOMLEFT", f, "BOTTOMLEFT", 1, 1)
			f.insetinsidebottom:Point("BOTTOMRIGHT", f, "BOTTOMRIGHT", -1, 1)
			f.insetinsidebottom:Height(1)
			f.insetinsidebottom:SetTexture(0,0,0)	
			f.insetinsidebottom:SetDrawLayer("BORDER", -7)

			f.insetinsideleft = f:CreateTexture(nil, "BORDER")
			f.insetinsideleft:Point("TOPLEFT", f, "TOPLEFT", 1, -1)
			f.insetinsideleft:Point("BOTTOMLEFT", f, "BOTTOMLEFT", -1, 1)
			f.insetinsideleft:Width(1)
			f.insetinsideleft:SetTexture(0,0,0)
			f.insetinsideleft:SetDrawLayer("BORDER", -7)

			f.insetinsideright = f:CreateTexture(nil, "BORDER")
			f.insetinsideright:Point("TOPRIGHT", f, "TOPRIGHT", -1, -1)
			f.insetinsideright:Point("BOTTOMRIGHT", f, "BOTTOMRIGHT", 1, 1)
			f.insetinsideright:Width(1)
			f.insetinsideright:SetTexture(0,0,0)	
			f.insetinsideright:SetDrawLayer("BORDER", -7)

			f.isInsetDone = true
		end

		f:SetBackdropColor(backdropr, backdropg, backdropb, backdropa)
		f:SetBackdropBorderColor(borderr, borderg, borderb)
	end

	local borders = {
		"insettop",
		"insetbottom",
		"insetleft",
		"insetright",
		"insetinsidetop",
		"insetinsidebottom",
		"insetinsideleft",
		"insetinsideright",
	}

	local function HideInsets(f)
		for i, border in pairs(borders) do
			if f[border] then
				f[border]:SetTexture(0,0,0,0)
			end
		end
	end

	local function CreateBackdrop(f, t, tex)
		if f.Backdrop then return end
		if not t then t = "Default" end

		local b = CreateFrame("Frame", nil, f)
		b:SetOutside()
		b:SetTemplate(t, tex)

		if f:GetFrameLevel() - 1 >= 0 then
			b:SetFrameLevel(f:GetFrameLevel() - 1)
		else
			b:SetFrameLevel(0)
		end

		f.Backdrop = b
	end

	local function CreateShadow(f, t)
		if f.Shadow then return end

		local shadow = CreateFrame("Frame", nil, f)
		shadow:SetFrameLevel(1)
		shadow:SetFrameStrata(f:GetFrameStrata())
		shadow:Point("TOPLEFT", -3, 3)
		shadow:Point("BOTTOMLEFT", -3, -3)
		shadow:Point("TOPRIGHT", 3, 3)
		shadow:Point("BOTTOMRIGHT", 3, -3)

		if AS.HideShadows then
			shadow:SetBackdrop({
				edgeFile = nil, edgeSize = 0,
				insets = {left = 0, right = 0, top = 0, bottom = 0},
			})
		else
			shadow:SetBackdrop({
				edgeFile = AS.GlowTex, edgeSize = Scale(3),
				insets = {left = Scale(5), right = Scale(5), top = Scale(5), bottom = Scale(5)},
			})
		end

		shadow:SetBackdropColor(0, 0, 0, 0)
		shadow:SetBackdropBorderColor(0, 0, 0, 0.8)
		f.Shadow = shadow
	end

	local function Kill(object)
		if object.UnregisterAllEvents then
			object:UnregisterAllEvents()
		end
		object.Show = Noop
		object:Hide()
	end

	local function StyleButton(button) 
		if button.SetHighlightTexture and not button.hover then
			local hover = button:CreateTexture("frame", nil, self)
			hover:SetTexture(1, 1, 1, 0.3)
			hover:SetInside()
			button.hover = hover
			button:SetHighlightTexture(hover)
		end

		if button.SetPushedTexture and not button.pushed then
			local pushed = button:CreateTexture("frame", nil, self)
			pushed:SetTexture(0.9, 0.8, 0.1, 0.3)
			pushed:SetInside()
			button.pushed = pushed
			button:SetPushedTexture(pushed)
		end

		if button.SetCheckedTexture and not button.checked then
			local checked = button:CreateTexture("frame", nil, self)
			checked:SetTexture(0,1,0,.3)
			checked:SetInside()
			button.checked = checked
			button:SetCheckedTexture(checked)
		end

		local cooldown = button:GetName() and _G[button:GetName().."Cooldown"]
		if cooldown then
			cooldown:ClearAllPoints()
			cooldown:SetInside()
		end
	end

	local function FontString(parent, name, fontName, fontHeight, fontStyle)
		local fs = parent:CreateFontString(nil, "OVERLAY")
		fs:SetFont(fontName, fontHeight, fontStyle)
		fs:SetJustifyH("LEFT")
		fs:SetShadowColor(0, 0, 0)
		fs:SetShadowOffset(Mult, -Mult)

		if not name then
			parent.Text = fs
		else
			parent[name] = fs
		end

		return fs
	end

	local function HighlightTarget(self, event, unit)
		if self.unit == "target" then return end

		if UnitIsUnit("target", self.unit) then
			self.HighlightTarget:Show()
		else
			self.HighlightTarget:Hide()
		end
	end

	local function HighlightUnit(f, r, g, b)
		if f.HighlightTarget then return end

		local glowBorder = {edgeFile = AS.Blank, edgeSize = 1}
		f.HighlightTarget = CreateFrame("Frame", nil, f)
		f.HighlightTarget:SetOutside()
		f.HighlightTarget:SetBackdrop(glowBorder)
		f.HighlightTarget:SetFrameLevel(f:GetFrameLevel() + 1)
		f.HighlightTarget:SetBackdropBorderColor(r, g, b, 1)
		f.HighlightTarget:Hide()
		f:RegisterEvent("PLAYER_TARGET_CHANGED", HighlightTarget)
	end

	local function StripTextures(Object, Kill, Text)
		for i=1, Object:GetNumRegions() do
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

	local function SkinButton(Frame, Strip)
		if Frame:GetName() then
			local Left = _G[Frame:GetName().."Left"]
			local Middle = _G[Frame:GetName().."Middle"]
			local Right = _G[Frame:GetName().."Right"]

			if Left then Left:SetAlpha(0) end
			if Middle then Middle:SetAlpha(0) end
			if Right then Right:SetAlpha(0) end
		end

		if Frame.Left then Frame.Left:SetAlpha(0) end
		if Frame.Right then Frame.Right:SetAlpha(0) end	
		if Frame.Middle then Frame.Middle:SetAlpha(0) end
		if Frame.SetNormalTexture then Frame:SetNormalTexture("") end	
		if Frame.SetHighlightTexture then Frame:SetHighlightTexture("") end
		if Frame.SetPushedTexture then Frame:SetPushedTexture("") end	
		if Frame.SetDisabledTexture then Frame:SetDisabledTexture("") end

		if Strip then StripTextures(Frame) end

		Frame:SetTemplate()

		Frame:HookScript("OnEnter", function(self)
			self:SetBackdropColor(Color.r * .15, Color.g * .15, Color.b * .15)
			self:SetBackdropBorderColor(Color.r, Color.g, Color.b)	
		end)

		Frame:HookScript("OnLeave", function(self)
			self:SetBackdropColor(AS.BackdropColor[1], AS.BackdropColor[2], AS.BackdropColor[3])
			self:SetBackdropBorderColor(AS.BorderColor[1], AS.BorderColor[2], AS.BorderColor[3])	
		end)
	end

	local function SkinCloseButton(Frame, Reposition)	
		if Reposition then
			Frame:Point("TOPRIGHT", Reposition, "TOPRIGHT", 2, 2)
		end

		Frame:SetNormalTexture("")
		Frame:SetPushedTexture("")
		Frame:SetHighlightTexture("")
		Frame:SetDisabledTexture("")

		Frame.Text = Frame:CreateFontString(nil, "OVERLAY")
		Frame.Text:SetFont(AS.Font, 12, "OUTLINE")
		Frame.Text:SetPoint("CENTER", 0, 1)
		Frame.Text:SetText("X")
		Frame.Text:SetTextColor(.5, .5, .5)
	end

	local function SkinEditBox(Frame)
		local Left, Middle, Right, Mid = _G[Frame:GetName().."Left"], _G[Frame:GetName().."Middle"], _G[Frame:GetName().."Right"], _G[Frame:GetName().."Mid"]

		if Left then Left:Kill() end
		if Middle then Middle:Kill() end
		if Right then Right:Kill() end
		if Mid then Mid:Kill() end

		Frame:CreateBackdrop()
		local Backdrop = Frame.Backdrop or Frame.backdrop
		if Frame:GetName() and Frame:GetName():find("Silver") or Frame:GetName():find("Copper") then
			Backdrop:Point("BOTTOMRIGHT", -12, -2)
		end
	end

	local function SkinArrowButton(Button, Vertical)
		Button:SetTemplate()
		Button:Size(Button:GetWidth() - 7, Button:GetHeight() - 7)

		if Vertical then
			Button:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.72, 0.65, 0.29, 0.65, 0.72)
			Button:GetPushedTexture():SetTexCoord(0.3, 0.35, 0.3, 0.8, 0.65, 0.35, 0.65, 0.8)
			Button:GetDisabledTexture():SetTexCoord(0.3, 0.29, 0.3, 0.75, 0.65, 0.29, 0.65, 0.75)	
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
	end

	local function SkinDropDown(Frame, Width)
		local Button = _G[Frame:GetName().."Button"]
		local Text = _G[Frame:GetName().."Text"]

		Frame:StripTextures()
		Frame:Width(Width or 155)

		Text:ClearAllPoints()
		Text:Point("RIGHT", Button, "LEFT", -2, 0)

		Button:ClearAllPoints()
		Button:Point("RIGHT", Frame, "RIGHT", -10, 3)
		Button.SetPoint = Noop

		Button:SkinArrowButton(true)

		Frame:CreateBackdrop()
		local Backdrop = Frame.backdrop or Frame.Backdrop
		Backdrop:Point("TOPLEFT", 20, -2)
		Backdrop:Point("BOTTOMRIGHT", Button, "BOTTOMRIGHT", 2, -2)
	end

	local function SkinCheckBox(Frame)
		Frame:StripTextures()
		Frame:CreateBackdrop()
		local Backdrop = Frame.Backdrop or Frame.backdrop
		Backdrop:SetInside(Frame, 4, 4)

		if Frame.SetCheckedTexture then
			Frame:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
		end

		if Frame.SetDisabledCheckedTexture then
			Frame:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
		end

		-- why does the disabled texture is always displayed as checked ?
		Frame:HookScript("OnDisable", function(self)
			if not self.SetDisabledTexture then return end

			if self:GetChecked() then
				self:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
			else
				self:SetDisabledTexture("")
			end
		end)

		Frame.SetNormalTexture = Noop
		Frame.SetPushedTexture = Noop
		Frame.SetHighlightTexture = Noop
	end

	local Tabs = {
		"LeftDisabled",
		"MiddleDisabled",
		"RightDisabled",
		"Left",
		"Middle",
		"Right",
	}

	local function SkinTab(tab)
		if (not tab) then
			return
		end

		for _, object in pairs(Tabs) do
			local Texture = _G[tab:GetName()..object]
			if (Texture) then
				Texture:SetTexture(nil)
			end
		end

		if tab.GetHighlightTexture and tab:GetHighlightTexture() then
			tab:GetHighlightTexture():SetTexture(nil)
		else
			tab:StripTextures()
		end

		tab.Backdrop = CreateFrame("Frame", nil, tab)
		tab.Backdrop:SetTemplate()
		tab.Backdrop:SetFrameLevel(tab:GetFrameLevel() - 1)
		tab.Backdrop:Point("TOPLEFT", 10, -3)
		tab.Backdrop:Point("BOTTOMRIGHT", -10, 3)
	end

	local function SkinSlideBar(frame, height, movetext)
		frame:SetTemplate( "Default" )
		frame:SetBackdropColor( 0, 0, 0, .8 )

		if not height then
			height = frame:GetHeight()
		end

		if movetext then
			if(_G[frame:GetName() .. "Low"]) then _G[frame:GetName() .. "Low"]:Point("BOTTOM", 0, -18) end
			if(_G[frame:GetName() .. "High"]) then _G[frame:GetName() .. "High"]:Point("BOTTOM", 0, -18) end
			if(_G[frame:GetName() .. "Text"]) then _G[frame:GetName() .. "Text"]:Point("TOP", 0, 19) end
		end

		_G[frame:GetName()]:SetThumbTexture(AS.Blank)
		_G[frame:GetName()]:GetThumbTexture():SetVertexColor(unpack(AS.BorderColor))
		if( frame:GetWidth() < frame:GetHeight() ) then
			frame:Width(height)
			_G[frame:GetName()]:GetThumbTexture():Size(frame:GetWidth(), frame:GetWidth() + 4)
		else
			frame:Height(height)
			_G[frame:GetName()]:GetThumbTexture():Size(height + 4, height)
		end
	end

	local function SkinRotateButton(btn)
		SetTemplate(btn, "Default")
		Size(btn, btn:GetWidth() - 14, btn:GetHeight() - 14)	
		
		btn:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)
		btn:GetPushedTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)	
		
		btn:GetHighlightTexture():SetTexture(1, 1, 1, 0.3)
		
		btn:GetNormalTexture():ClearAllPoints()
		Point(btn:GetNormalTexture(), "TOPLEFT", 2, -2)
		Point(btn:GetNormalTexture(), "BOTTOMRIGHT", -2, 2)
		btn:GetPushedTexture():SetAllPoints(btn:GetNormalTexture())	
		btn:GetHighlightTexture():SetAllPoints(btn:GetNormalTexture())
	end

	local function SkinIconButton(b, shrinkIcon)
		if b.isSkinned then return end

		b:StripTextures()
		b:CreateBackdrop("Default", true)
		local backdrop = b.backdrop or b.Backdrop
		b:StyleButton()

		local icon = b.icon
		if b:GetName() and _G[b:GetName().."IconTexture"] then
			icon = _G[b:GetName().."IconTexture"]
		elseif b:GetName() and _G[b:GetName().."Icon"] then
			icon = _G[b:GetName().."Icon"]
		end

		if icon then
			icon:SetTexCoord(.08,.88,.08,.88)

			-- create a backdrop around the icon

			if shrinkIcon then
				backdrop:SetAllPoints()
				icon:SetInside(b)
			else
				backdrop:SetOutside(icon)
			end
			icon:SetParent(backdrop)
		end
		b.isSkinned = true
	end

	local function SkinScrollBar(frame)
		if _G[frame:GetName().."BG"] then _G[frame:GetName().."BG"]:SetTexture(nil) end
		if _G[frame:GetName().."Track"] then _G[frame:GetName().."Track"]:SetTexture(nil) end

		if _G[frame:GetName().."Top"] then
			_G[frame:GetName().."Top"]:SetTexture(nil)
		end
		
		if _G[frame:GetName().."Bottom"] then
			_G[frame:GetName().."Bottom"]:SetTexture(nil)
		end
		
		if _G[frame:GetName().."Middle"] then
			_G[frame:GetName().."Middle"]:SetTexture(nil)
		end

		if _G[frame:GetName().."ScrollUpButton"] and _G[frame:GetName().."ScrollDownButton"] then
			StripTextures(_G[frame:GetName().."ScrollUpButton"])
			SetTemplate(_G[frame:GetName().."ScrollUpButton"], "Default", true)
			if not _G[frame:GetName().."ScrollUpButton"].texture then
				_G[frame:GetName().."ScrollUpButton"].texture = _G[frame:GetName().."ScrollUpButton"]:CreateTexture(nil, "OVERLAY")
				Point(_G[frame:GetName().."ScrollUpButton"].texture, "TOPLEFT", 2, -2)
				Point(_G[frame:GetName().."ScrollUpButton"].texture, "BOTTOMRIGHT", -2, 2)
				_G[frame:GetName().."ScrollUpButton"].texture:SetTexture([[Interface\AddOns\Tukui\medias\textures\arrowup.tga]])
				_G[frame:GetName().."ScrollUpButton"].texture:SetVertexColor(unpack(AS.BorderColor))
			end	
			
			StripTextures(_G[frame:GetName().."ScrollDownButton"])
			SetTemplate(_G[frame:GetName().."ScrollDownButton"], "Default", true)
		
			if not _G[frame:GetName().."ScrollDownButton"].texture then
				_G[frame:GetName().."ScrollDownButton"].texture = _G[frame:GetName().."ScrollDownButton"]:CreateTexture(nil, "OVERLAY")
				Point(_G[frame:GetName().."ScrollDownButton"].texture, "TOPLEFT", 2, -2)
				Point(_G[frame:GetName().."ScrollDownButton"].texture, "BOTTOMRIGHT", -2, 2)
				_G[frame:GetName().."ScrollDownButton"].texture:SetTexture([[Interface\AddOns\Tukui\medias\textures\arrowdown.tga]])
				_G[frame:GetName().."ScrollDownButton"].texture:SetVertexColor(unpack(AS.BorderColor))
			end				
			
			if not frame.trackbg then
				frame.trackbg = CreateFrame("Frame", nil, frame)
				Point(frame.trackbg, "TOPLEFT", _G[frame:GetName().."ScrollUpButton"], "BOTTOMLEFT", 0, -1)
				Point(frame.trackbg, "BOTTOMRIGHT", _G[frame:GetName().."ScrollDownButton"], "TOPRIGHT", 0, 1)
				SetTemplate(frame.trackbg, "Transparent")
			end
			
			if frame:GetThumbTexture() then
				if not thumbTrim then thumbTrim = 3 end
				frame:GetThumbTexture():SetTexture(nil)
				if not frame.thumbbg then
					frame.thumbbg = CreateFrame("Frame", nil, frame)
					Point(frame.thumbbg, "TOPLEFT", frame:GetThumbTexture(), "TOPLEFT", 2, -thumbTrim)
					Point(frame.thumbbg, "BOTTOMRIGHT", frame:GetThumbTexture(), "BOTTOMRIGHT", -2, thumbTrim)
					SetTemplate(frame.thumbbg, "Default", true)
					if frame.trackbg then
						frame.thumbbg:SetFrameLevel(frame.trackbg:GetFrameLevel())
					end
				end
			end	
		end	
	end

	---------------------------------------------------
	-- Merge Tukui API with WoW API
	---------------------------------------------------

	local function AddAPI(object)
		local mt = getmetatable(object).__index

		if not object.Size then mt.Size = Size end
		if not object.Point then mt.Point = Point end
		if not object.SetOutside then mt.SetOutside = SetOutside end
		if not object.SetInside then mt.SetInside = SetInside end
		if not object.SetTemplate then mt.SetTemplate = SetTemplate end
		if not object.CreateBackdrop then mt.CreateBackdrop = CreateBackdrop end
		if not object.StripTextures then mt.StripTextures = StripTextures end
		if not object.CreateShadow then mt.CreateShadow = CreateShadow end
		if not object.Kill then mt.Kill = Kill end
		if not object.StyleButton then mt.StyleButton = StyleButton end
		if not object.Width then mt.Width = Width end
		if not object.Height then mt.Height = Height end
		if not object.FontString then mt.FontString = FontString end
		if not object.HighlightUnit then mt.HighlightUnit = HighlightUnit end
		if not object.HideInsets then mt.HideInsets = HideInsets end
		if not object.SkinEditBox then mt.SkinEditBox = SkinEditBox end
		if not object.SkinButton then mt.SkinButton = SkinButton end
		if not object.SkinCloseButton then mt.SkinCloseButton = SkinCloseButton end
		if not object.SkinArrowButton then mt.SkinArrowButton = SkinArrowButton end
		if not object.SkinDropDown then mt.SkinDropDown = SkinDropDown end
		if not object.SkinDropDownBox then mt.SkinDropDownBox = SkinDropDown end
		if not object.SkinCheckBox then mt.SkinCheckBox = SkinCheckBox end
		if not object.SkinTab then mt.SkinTab = SkinTab end

		if not object.SkinNextPrevButton then mt.SkinNextPrevButton = SkinArrowButton end
		if not object.SkinIconButton then mt.SkinIconButton = SkinIconButton end
		if not object.SkinScrollBar then mt.SkinScrollBar = SkinScrollBar end
		if not object.SkinRotateButton then mt.SkinRotateButton = SkinRotateButton end
		if not object.SkinSlideBar then mt.SkinSlideBar = SkinSlideBar end
	end

	local Handled = {["Frame"] = true}

	local Object = CreateFrame("Frame")
	AddAPI(Object)
	AddAPI(Object:CreateTexture())
	AddAPI(Object:CreateFontString())

	Object = EnumerateFrames()

	while Object do
		if (not Handled[Object:GetObjectType()]) then
			AddAPI(Object)
			Handled[Object:GetObjectType()] = true
		end

		Object = EnumerateFrames(Object)
	end
end