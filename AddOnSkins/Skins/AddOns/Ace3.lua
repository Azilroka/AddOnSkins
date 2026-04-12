local AS, L, S, R = unpack(AddOnSkins)

if AS:CheckAddOn('ElvUI') then return end

function AS:Ace3()
	local AceGUI = AS.Libs.GUI

	if not AceGUI then return end

	local oldRegisterAsWidget = AceGUI.RegisterAsWidget
	local ColorBlind = GetCVarBool('colorblindmode')

	local BLANK = (_G.ElvUI and _G.ElvUI[1] and _G.ElvUI[1].media.blankTex)
		or [[Interface\Buttons\WHITE8X8]]

	local function SkinAceCheckBox(widget)
		local frame = widget.frame
		if frame._asSkinned then return end
		frame._asSkinned = true

		-- Wipe button-state slots
		frame:SetNormalTexture('')
		frame:SetPushedTexture('')
		frame:SetHighlightTexture('')
		frame:SetCheckedTexture(BLANK)
		local ct = frame:GetCheckedTexture()
		if ct then ct:SetAlpha(0) end

		-- Hide all texture regions (checkbg, check, highlight are Textures on frame)
		for i = 1, frame:GetNumRegions() do
			local r = select(i, frame:GetRegions())
			if r and r.GetObjectType and r:GetObjectType() ~= 'FontString' then
				r:SetTexture(nil)
				r:SetAlpha(0)
				r:Hide()
			end
		end
		-- Prevent SetType() from restoring them
		widget.checkbg.SetTexture = AS.noop
		widget.check.SetTexture   = AS.noop
		widget.highlight.SetTexture = AS.noop

		local border = frame:CreateTexture(nil, 'BACKGROUND')
		border:SetPoint('TOPLEFT', frame, 'TOPLEFT', 2, -5)
		border:SetSize(13, 13)
		border:SetTexture(BLANK)
		border:SetVertexColor(unpack(AS.BorderColor))
		frame._aceBorder = border

		local fill = frame:CreateTexture(nil, 'ARTWORK')
		fill:SetPoint('TOPLEFT', border, 'TOPLEFT', 1, -1)
		fill:SetSize(11, 11)
		fill:SetTexture(BLANK)
		fill:SetVertexColor(unpack(AS.Color))
		fill:Hide()
		frame._aceFill = fill

		local function Update(f)
			if f:GetChecked() then
				f._aceBorder:SetVertexColor(unpack(AS.Color))
				f._aceFill:Show()
			else
				f._aceBorder:SetVertexColor(unpack(AS.BorderColor))
				f._aceFill:Hide()
			end
		end

		frame:HookScript('OnClick', Update)
		hooksecurefunc(frame, 'SetChecked', function(f)
			C_Timer.After(0, function() Update(f) end)
		end)
		C_Timer.After(0, function() Update(frame) end)
	end

	local function SkinAceDropdown(widget)
		local dd = widget.dropdown -- UIDropDownMenuTemplate frame
		if dd._asSkinned then return end
		dd._asSkinned = true

		-- Strip the three UIDropDownMenu background textures
		local name = dd:GetName()
		for _, suffix in ipairs({'Left','Middle','Right'}) do
			local tex = _G[name..suffix]
			if tex then tex:SetTexture(nil) tex:Hide() end
		end

		-- Apply backdrop directly on the dropdown frame
		AS:SetTemplate(dd)
		dd:SetBackdropColor(unpack(AS.BackdropColor))

		-- Arrow button
		local btn = _G[name..'Button']
		if btn then
			for _, getter in ipairs({'GetNormalTexture','GetPushedTexture','GetHighlightTexture','GetDisabledTexture'}) do
				local tex = btn[getter] and btn[getter](btn)
				if tex then tex:SetTexture(nil) tex:Hide() end
			end
			local arrow = dd:CreateTexture(nil, 'OVERLAY')
			arrow:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Arrow]])
			arrow:SetRotation(3.14)
			arrow:SetSize(12, 12)
			arrow:SetPoint('RIGHT', dd, 'RIGHT', -4, 0)
			arrow:SetVertexColor(1, 1, 1)
			dd:HookScript('OnEnter', function()
				arrow:SetVertexColor(unpack(AS.Color))
				dd:SetBackdropBorderColor(unpack(AS.Color))
			end)
			dd:HookScript('OnLeave', function()
				arrow:SetVertexColor(1, 1, 1)
				dd:SetBackdropBorderColor(unpack(AS.BorderColor))
			end)
		end

		-- Label color fix
		if widget.label then
			hooksecurefunc(widget.label, 'SetTextColor', function(self, r, g, b)
				if r == 1 and g == 0.82 and b == 0 then self:SetTextColor(1,1,1,1) end
			end)
		end
	end

	AceGUI.RegisterAsWidget = function(self, widget)
		local TYPE = widget.type
		if TYPE == 'MultiLineEditBox' then
			S:SetTemplate(widget.scrollBG)
			S:HandleButton(widget.button)
			S:HandleScrollBar(widget.scrollBar)

			widget.scrollBar:SetPoint('RIGHT', widget.frame, 'RIGHT', 0 -4)
			widget.scrollBG:SetPoint('TOPRIGHT', widget.scrollBar, 'TOPLEFT', -2, 19)
			widget.scrollBG:SetPoint('BOTTOMLEFT', widget.button, 'TOPLEFT')
			widget.scrollFrame:SetPoint('BOTTOMRIGHT', widget.scrollBG, 'BOTTOMRIGHT', -4, 8)
		elseif TYPE == 'CheckBox' then
			SkinAceCheckBox(widget)
		elseif TYPE == 'Dropdown' then
			SkinAceDropdown(widget)
		elseif TYPE == 'LSM30_Font' or TYPE == 'LSM30_Sound' or TYPE == 'LSM30_Border' or TYPE == 'LSM30_Background' or TYPE == 'LSM30_Statusbar' then
			local frame = widget.frame
			local button = frame.dropButton
			local text = frame.text

			S:HandleFrame(frame, true)
			S:HandleNextPrevButton(button)

			frame.label:ClearAllPoints()
			frame.label:SetPoint('BOTTOMLEFT', frame.backdrop, 'TOPLEFT', 2, 0)
			hooksecurefunc(frame.label, 'SetTextColor', function(self, r, g, b, a)
				if r == 1 and g == 0.82 and b == 0 then
					self:SetTextColor(1, 1, 1, 1)
				end
			end)

			frame.text:ClearAllPoints()
			frame.text:SetPoint('RIGHT', button, 'LEFT', -2, 0)

			button:SetSize(20, 20)
			button:ClearAllPoints()
			button:SetPoint('RIGHT', frame.backdrop, 'RIGHT', -2, 0)

			frame.backdrop:SetPoint('TOPLEFT', 0, -21)
			frame.backdrop:SetPoint("BOTTOMRIGHT", -4, -1)

			if TYPE == 'LSM30_Sound' then
				widget.soundbutton:SetParent(frame.backdrop)
				widget.soundbutton:ClearAllPoints()
				widget.soundbutton:SetPoint('LEFT', frame.backdrop, 'LEFT', 2, 0)
			elseif TYPE == 'LSM30_Statusbar' then
				widget.bar:SetParent(frame.backdrop)
				widget.bar:ClearAllPoints()
				widget.bar:SetPoint('TOPLEFT', frame.backdrop, 'TOPLEFT', 2, -2)
				widget.bar:SetPoint('BOTTOMRIGHT', button, 'BOTTOMLEFT', -1, 0)
			--elseif TYPE == 'LSM30_Border' or TYPE == 'LSM30_Background' then
			end

			button:SetParent(frame.backdrop)
			text:SetParent(frame.backdrop)
			button:HookScript('PostClick', function(this)
				local self = this.obj
				if self.dropdown then
					S:SetTemplate(self.dropdown)
					if self.dropdown.slider then
						S:SetTemplate(self.dropdown.slider)
						self.dropdown.slider:SetThumbTexture([[Interface\Buttons\WHITE8X8]])
						self.dropdown.slider:GetThumbTexture():SetVertexColor(unpack(AS.Color))
					end
				end
			end)
		elseif TYPE == 'EditBox' then
			S:HandleEditBox(widget.editbox)
			hooksecurefunc(widget.editbox, "SetPoint", function(self, a, b, c, d, e)
				if d == 7 then
					self:SetPoint(a, b, c, 0, e)
				end
			end)
			hooksecurefunc(widget.label, 'SetTextColor', function(self, r, g, b, a)
				if r == 1 and g == 0.82 and b == 0 then
					self:SetTextColor(1, 1, 1, 1)
				end
			end)
			widget.editbox:SetPoint('BOTTOMLEFT', 0, 0)
			S:HandleButton(widget.button)
			widget.editbox.backdrop:SetPoint('TOPLEFT', 0, -2)
			widget.editbox.backdrop:SetPoint('BOTTOMRIGHT', -1, 0)
		elseif TYPE == 'Button' then
			S:HandleButton(widget.frame)
			widget.text:SetTextColor(1, 1, 1, 1)
		elseif TYPE == 'Slider' then
			S:HandleSliderFrame(widget.slider)

			S:SetTemplate(widget.editbox)
			widget.editbox:SetHeight(15)
			widget.editbox:SetPoint('TOP', widget.slider, 'BOTTOM', 0, -1)

			hooksecurefunc(widget.label, 'SetTextColor', function(self, r, g, b, a)
				if r == 1 and g == 0.82 and b == 0 then
					self:SetTextColor(1, 1, 1, 1)
				end
			end)

			widget.lowtext:SetPoint('TOPLEFT', widget.slider, 'BOTTOMLEFT', 2, -2)
			widget.hightext:SetPoint('TOPRIGHT', widget.slider, 'BOTTOMRIGHT', -2, -2)
		elseif TYPE == 'Keybinding' then
			local button = widget.button
			local msgframe = widget.msgframe

			S:HandleButton(button)

			S:HandleFrame(msgframe)
			msgframe.msg:ClearAllPoints()
			msgframe.msg:SetPoint("CENTER")
		elseif TYPE == 'ColorPicker' then
			local frame = widget.frame
			local colorSwatch = widget.colorSwatch

			S:CreateBackdrop(frame)
			frame.backdrop:SetSize(24, 16)
			frame.backdrop:ClearAllPoints()
			frame.backdrop:SetPoint('LEFT', frame, 'LEFT', 4, 0)
			colorSwatch:SetTexture(AS.Blank)
			colorSwatch:ClearAllPoints()
			colorSwatch:SetParent(frame.backdrop)
			S:SetInside(colorSwatch, frame.backdrop)

			if colorSwatch.checkers then
				colorSwatch.checkers:ClearAllPoints()
				colorSwatch.checkers:SetParent(frame.backdrop)
				S:SetInside(colorSwatch.checkers, frame.backdrop)
			end

			if colorSwatch.background then
				colorSwatch.background:SetColorTexture(0, 0, 0, 0)
			end
		elseif TYPE == 'Heading' then
			widget.label:SetTextColor(1, 1, 1, 1)
		elseif TYPE == 'Icon' then
			S:StripTextures(widget.frame)
		end

		return oldRegisterAsWidget(self, widget)
	end

	local oldRegisterAsContainer = AceGUI.RegisterAsContainer

	AceGUI.RegisterAsContainer = function(self, widget)
		local TYPE = widget.type

		if TYPE == 'ScrollFrame' then
			S:HandleScrollBar(widget.scrollbar)
		elseif TYPE == 'InlineGroup' or TYPE == 'TreeGroup' or TYPE == 'TabGroup' or TYPE == 'Frame' or TYPE == 'DropdownGroup' or TYPE =="Window" then
			local frame = widget.content:GetParent()
			if TYPE == 'Frame' then
				S:StripTextures(frame)

				for i = 1, frame:GetNumChildren() do
					local child = select(i, frame:GetChildren())
					local childType = child:GetObjectType()
					local childText = childType == 'Button' and child:GetText()
					if childText and childText ~= '' then
						S:HandleButton(child)
					elseif childType == 'Button' then
						-- statusbg: Button without label text, has its own backdrop
						S:StripTextures(child)
						S:SetTemplate(child)
					else
						S:StripTextures(child)
					end
				end
			elseif TYPE == "Window" then
				S:StripTextures(frame)
				S:HandleCloseButton(frame.obj.closebutton)
			end
			S:SetTemplate(frame)

			if widget.titletext then
				widget.titletext:SetTextColor(1, 1, 1, 1)
			end

			if widget.treeframe then
				S:SetTemplate(widget.treeframe)
				frame:SetPoint('TOPLEFT', widget.treeframe, 'TOPRIGHT', 1, 0)

				local oldRefreshTree = widget.RefreshTree
				widget.RefreshTree = function(self, scrollToSelection)
					oldRefreshTree(self, scrollToSelection)
					if not self.tree then return end
					local status = self.status or self.localstatus
					local groupstatus = status.groups
					local lines = self.lines
					local buttons = self.buttons
					local offset = status.scrollvalue

					for i = offset + 1, #lines do
						local button = buttons[i - offset]
						if button then
							if groupstatus[lines[i].uniquevalue] then
								button.toggle:SetNormalTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Minus]])
								button.toggle:SetPushedTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Minus]])
								button.toggle:SetHighlightTexture('')
							else
								button.toggle:SetNormalTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Plus]])
								button.toggle:SetPushedTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Plus]])
								button.toggle:SetHighlightTexture('')
							end
							button.text:SetTextColor(1, 1, 1, 1)
						end
					end
				end
			end

			if TYPE == 'TabGroup' then
				local oldCreateTab = widget.CreateTab
				widget.CreateTab = function(self, id)
					local tab = oldCreateTab(self, id)
					S:HandleFrame(tab, true)
					tab.backdrop:SetFrameLevel(tab:GetFrameLevel() - 2)
					tab.backdrop:SetPoint("TOPLEFT", 10, -3)
					tab.backdrop:SetPoint("BOTTOMRIGHT", -10, 0)
					tab.text:SetTextColor(1, 1, 1, 1)
					return tab
				end
			end

			if widget.scrollbar then
				S:HandleScrollBar(widget.scrollbar)
			end
		elseif TYPE == "SimpleGroup" then
			local frame = widget.content:GetParent()
			S:SetTemplate(frame)
			frame:SetBackdropBorderColor(0, 0, 0, 0)
		end

		return oldRegisterAsContainer(self, widget)
	end
end

AS:RegisterSkin('Ace3', AS.Ace3)
