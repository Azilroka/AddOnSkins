local AS, L, S, R = unpack(AddOnSkins)

if AS:CheckAddOn('ElvUI') then return end

function AS:Ace3()
	local AceGUI = AS.Libs.GUI

	if not AceGUI then return end

	local oldRegisterAsWidget = AceGUI.RegisterAsWidget
	local ColorBlind = GetCVarBool('colorblindmode')

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
			S:CreateBackdrop(widget.checkbg)
			S:SetInside(widget.checkbg.backdrop, widget.checkbg, 4, 4)
			widget.checkbg.backdrop:SetFrameLevel(widget.checkbg.backdrop:GetFrameLevel() + 1)

			widget.checkbg:SetTexture('')
			widget.highlight:SetTexture('')

			if not ColorBlind then
				S:SetInside(widget.checkbg.backdrop, widget.checkbg, 5, 5)

				widget.check:SetTexture(AS.NormTex)

				hooksecurefunc(widget.check, "SetDesaturated", function(self, value)
					if value == true then
						self:SetVertexColor(.6, .6, .6, .8)
					else
						self:SetVertexColor(unpack(S.Media.valueColor))
					end
				end)

				widget.check.SetTexture = S.noop
				S:SetInside(widget.check, widget.checkbg.backdrop)
			else
				S:SetOutside(widget.check, widget.checkbg.backdrop, 3, 3)
			end

			widget.checkbg.SetTexture = S.noop
			widget.highlight.SetTexture = AS.noop
		elseif TYPE == 'Dropdown' then
			local frame = widget.dropdown
			local button = widget.button
			local text = widget.text

			S:HandleFrame(frame, true)
			frame.backdrop:SetPoint('TOPLEFT', 15, -2)
			frame.backdrop:SetPoint("BOTTOMRIGHT", -21, 0)

			S:HandleNextPrevButton(button)

			widget.label:ClearAllPoints()
			widget.label:SetPoint('BOTTOMLEFT', frame.backdrop, 'TOPLEFT', 2, 0)
			hooksecurefunc(widget.label, 'SetTextColor', function(self, r, g, b, a)
				if r == 1 and g == 0.82 and b == 0 then
					self:SetTextColor(1, 1, 1, 1)
				end
			end)

			button:SetSize(20, 20)
			button:ClearAllPoints()
			button:SetPoint('RIGHT', frame.backdrop, 'RIGHT', -2, 0)

			text:ClearAllPoints()
			text:SetJustifyH("RIGHT")
			text:SetPoint('RIGHT', button, 'LEFT', -3, 0)

			button:HookScript('PostClick', function(s) S:SetTemplate(s.obj.pullout.frame) end)
			widget.button_cover:HookScript('PostClick', function(s) S:SetTemplate(s.obj.pullout.frame) end)
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
			S:HandleSlideBar(widget.slider)

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
					if child:GetObjectType() == 'Button' and child:GetText() then
						S:HandleButton(child)
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
