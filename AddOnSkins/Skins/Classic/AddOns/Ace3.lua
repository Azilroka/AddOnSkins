local AS = unpack(AddOnSkins)

if AS:CheckAddOn('ElvUI') then return end

function AS:Ace3()
	local AceGUI = LibStub('AceGUI-3.0', true)

	if not AceGUI then return end

	local oldRegisterAsWidget = AceGUI.RegisterAsWidget
	local ColorBlind = GetCVarBool('colorblindmode')

	AceGUI.RegisterAsWidget = function(self, widget)
		local TYPE = widget.type
		if TYPE == 'MultiLineEditBox' then
			AS:SetTemplate(widget.scrollBG)
			AS:SkinButton(widget.button)
			AS:SkinScrollBar(widget.scrollBar)

			widget.scrollBar:SetPoint('RIGHT', widget.frame, 'RIGHT', 0 -4)
			widget.scrollBG:SetPoint('TOPRIGHT', widget.scrollBar, 'TOPLEFT', -2, 19)
			widget.scrollBG:SetPoint('BOTTOMLEFT', widget.button, 'TOPLEFT')
			widget.scrollFrame:SetPoint('BOTTOMRIGHT', widget.scrollBG, 'BOTTOMRIGHT', -4, 8)
		elseif TYPE == 'CheckBox' then
			AS:CreateBackdrop(widget.checkbg)
			AS:SetInside(widget.checkbg.Backdrop, widget.checkbg, 4, 4)
			widget.checkbg.Backdrop:SetFrameLevel(widget.checkbg.Backdrop:GetFrameLevel() + 1)

			widget.checkbg:SetTexture('')
			widget.highlight:SetTexture('')

			if not ColorBlind then
				AS:SetInside(widget.checkbg.Backdrop, widget.checkbg, 5, 5)

				widget.check:SetTexture(AS.NormTex)

				hooksecurefunc(widget.check, "SetDesaturated", function(self, value)
					if value == true then
						self:SetVertexColor(.6, .6, .6, .8)
					else
						self:SetVertexColor(unpack(AS.Color))
					end
				end)

				widget.check.SetTexture = AS.Noop
				AS:SetInside(widget.check, widget.checkbg.Backdrop)
			else
				AS:SetOutside(widget.check, widget.checkbg.Backdrop, 3, 3)
			end

			widget.checkbg.SetTexture = AS.Noop
			widget.highlight.SetTexture = AS.Noop
		elseif TYPE == 'Dropdown' then
			local frame = widget.dropdown
			local button = widget.button
			local text = widget.text

			AS:SkinBackdropFrame(frame)
			frame.Backdrop:SetPoint('TOPLEFT', 15, -2)
			frame.Backdrop:SetPoint("BOTTOMRIGHT", -21, 0)

			AS:SkinArrowButton(button)

			widget.label:ClearAllPoints()
			widget.label:SetPoint('BOTTOMLEFT', frame.Backdrop, 'TOPLEFT', 2, 0)
			hooksecurefunc(widget.label, 'SetTextColor', function(self, r, g, b, a)
				if r == 1 and g == 0.82 and b == 0 then
					self:SetTextColor(1, 1, 1, 1)
				end
			end)

			button:SetSize(20, 20)
			button:ClearAllPoints()
			button:SetPoint('RIGHT', frame.Backdrop, 'RIGHT', -2, 0)

			text:ClearAllPoints()
			text:SetJustifyH("RIGHT")
			text:SetPoint('RIGHT', button, 'LEFT', -3, 0)

			button:HookScript('PostClick', function(self) AS:SetTemplate(self.obj.pullout.frame) end)
			widget.button_cover:HookScript('PostClick', function(self) AS:SetTemplate(self.obj.pullout.frame) end)
		elseif TYPE == 'LSM30_Font' or TYPE == 'LSM30_Sound' or TYPE == 'LSM30_Border' or TYPE == 'LSM30_Background' or TYPE == 'LSM30_Statusbar' then
			local frame = widget.frame
			local button = frame.dropButton
			local text = frame.text

			AS:SkinBackdropFrame(frame)
			AS:SkinArrowButton(button)

			frame.label:ClearAllPoints()
			frame.label:SetPoint('BOTTOMLEFT', frame.Backdrop, 'TOPLEFT', 2, 0)
			hooksecurefunc(frame.label, 'SetTextColor', function(self, r, g, b, a)
				if r == 1 and g == 0.82 and b == 0 then
					self:SetTextColor(1, 1, 1, 1)
				end
			end)

			frame.text:ClearAllPoints()
			frame.text:SetPoint('RIGHT', button, 'LEFT', -2, 0)

			button:SetSize(20, 20)
			button:ClearAllPoints()
			button:SetPoint('RIGHT', frame.Backdrop, 'RIGHT', -2, 0)

			frame.Backdrop:SetPoint('TOPLEFT', 0, -21)
			frame.Backdrop:SetPoint("BOTTOMRIGHT", -4, -1)

			if TYPE == 'LSM30_Sound' then
				widget.soundbutton:SetParent(frame.Backdrop)
				widget.soundbutton:ClearAllPoints()
				widget.soundbutton:SetPoint('LEFT', frame.Backdrop, 'LEFT', 2, 0)
			elseif TYPE == 'LSM30_Statusbar' then
				widget.bar:SetParent(frame.Backdrop)
				widget.bar:ClearAllPoints()
				widget.bar:SetPoint('TOPLEFT', frame.Backdrop, 'TOPLEFT', 2, -2)
				widget.bar:SetPoint('BOTTOMRIGHT', button, 'BOTTOMLEFT', -1, 0)
			--elseif TYPE == 'LSM30_Border' or TYPE == 'LSM30_Background' then
			end

			button:SetParent(frame.Backdrop)
			text:SetParent(frame.Backdrop)
			button:HookScript('PostClick', function(this)
				local self = this.obj
				if self.dropdown then
					AS:SetTemplate(self.dropdown)
					if self.dropdown.slider then
						AS:SetTemplate(self.dropdown.slider)
						self.dropdown.slider:SetThumbTexture([[Interface\Buttons\WHITE8X8]])
						self.dropdown.slider:GetThumbTexture():SetVertexColor(unpack(AS.Color))
					end
				end
			end)
		elseif TYPE == 'EditBox' then
			AS:SkinEditBox(widget.editbox)
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
			AS:SkinButton(widget.button)
			widget.editbox.Backdrop:SetPoint('TOPLEFT', 0, -2)
			widget.editbox.Backdrop:SetPoint('BOTTOMRIGHT', -1, 0)
		elseif TYPE == 'Button' then
			AS:SkinButton(widget.frame)
			widget.text:SetTextColor(1, 1, 1, 1)
		elseif TYPE == 'Slider' then
			AS:SkinSlideBar(widget.slider)

			AS:SetTemplate(widget.editbox)
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

			AS:SkinButton(button)

			AS:SkinFrame(msgframe)
			msgframe.msg:ClearAllPoints()
			msgframe.msg:SetPoint("CENTER")
		elseif TYPE == 'ColorPicker' then
			local frame = widget.frame
			local colorSwatch = widget.colorSwatch

			AS:CreateBackdrop(frame)
			frame.Backdrop:SetSize(24, 16)
			frame.Backdrop:ClearAllPoints()
			frame.Backdrop:SetPoint('LEFT', frame, 'LEFT', 4, 0)
			colorSwatch:SetTexture(AS.Blank)
			colorSwatch:ClearAllPoints()
			colorSwatch:SetParent(frame.Backdrop)
			AS:SetInside(colorSwatch, frame.Backdrop)

			if colorSwatch.checkers then
				colorSwatch.checkers:ClearAllPoints()
				colorSwatch.checkers:SetParent(frame.Backdrop)
				AS:SetInside(colorSwatch.checkers, frame.Backdrop)
			end

			if colorSwatch.background then
				colorSwatch.background:SetColorTexture(0, 0, 0, 0)
			end
		elseif TYPE == 'Heading' then
			widget.label:SetTextColor(1, 1, 1, 1)
		elseif TYPE == 'Icon' then
			AS:StripTextures(widget.frame)
		end

		return oldRegisterAsWidget(self, widget)
	end

	local oldRegisterAsContainer = AceGUI.RegisterAsContainer

	AceGUI.RegisterAsContainer = function(self, widget)
		local TYPE = widget.type

		if TYPE == 'ScrollFrame' then
			AS:SkinScrollBar(widget.scrollbar)
		elseif TYPE == 'InlineGroup' or TYPE == 'TreeGroup' or TYPE == 'TabGroup' or TYPE == 'Frame' or TYPE == 'DropdownGroup' or TYPE =="Window" then
			local frame = widget.content:GetParent()
			if TYPE == 'Frame' then
				AS:StripTextures(frame)

				for i = 1, frame:GetNumChildren() do
					local child = select(i, frame:GetChildren())
					if child:GetObjectType() == 'Button' and child:GetText() then
						AS:SkinButton(child)
					else
						AS:StripTextures(child)
					end
				end
			elseif TYPE == "Window" then
				AS:StripTextures(frame)
				AS:SkinCloseButton(frame.obj.closebutton)
			end
			AS:SetTemplate(frame)

			if widget.titletext then
				widget.titletext:SetTextColor(1, 1, 1, 1)
			end

			if widget.treeframe then
				AS:SetTemplate(widget.treeframe)
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
					AS:SkinBackdropFrame(tab, "Transparent")
					tab.Backdrop:SetFrameLevel(tab:GetFrameLevel() - 2)
					tab.Backdrop:SetPoint("TOPLEFT", 10, -3)
					tab.Backdrop:SetPoint("BOTTOMRIGHT", -10, 0)
					tab.text:SetTextColor(1, 1, 1, 1)
					return tab
				end
			end

			if widget.scrollbar then
				AS:SkinScrollBar(widget.scrollbar)
			end
		elseif TYPE == "SimpleGroup" then
			local frame = widget.content:GetParent()
			AS:SetTemplate(frame)
			frame:SetBackdropBorderColor(0, 0, 0, 0)
		end

		return oldRegisterAsContainer(self, widget)
	end
end

AS:RegisterSkin('Ace3', AS.Ace3)
