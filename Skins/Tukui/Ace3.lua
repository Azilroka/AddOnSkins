local AS = unpack(AddOnSkins)

if AS:CheckAddOn('ElvUI') then return end

function AS:Ace3()
	local AceGUI = LibStub('AceGUI-3.0', true)
	if not AceGUI then return end
	local oldRegisterAsWidget = AceGUI.RegisterAsWidget
	AceGUI.RegisterAsWidget = function(self, widget)
		local TYPE = widget.type
		if TYPE == 'MultiLineEditBox' then
			AS:SetTemplate(widget.scrollBG, 'Default')
			AS:SkinButton(widget.button)
			AS:SkinScrollBar(widget.scrollBar)
			widget.scrollBar:SetPoint('RIGHT', widget.frame, 'RIGHT', 0 -4)
			widget.scrollBG:SetPoint('TOPRIGHT', widget.scrollBar, 'TOPLEFT', -2, 19)
			widget.scrollBG:SetPoint('BOTTOMLEFT', widget.button, 'TOPLEFT')
			widget.scrollFrame:SetPoint('BOTTOMRIGHT', widget.scrollBG, 'BOTTOMRIGHT', -4, 8)
		elseif TYPE == 'CheckBox' then
			AS:CreateBackdrop(widget.checkbg)
			widget.checkbg.Backdrop:SetInside(widget.checkbg, 4, 4)
			widget.checkbg.Backdrop:SetFrameLevel(widget.checkbg.Backdrop:GetFrameLevel() + 1)

			widget.check:SetTexture(AS.NormTex)
			widget.check:SetVertexColor(unpack(AS.Color))

			widget.checkbg:SetTexture('')
			widget.highlight:SetTexture('')

			widget.check:SetInside(widget.checkbg.Backdrop)

			widget.checkbg.SetTexture = AS.Noop
			widget.highlight.SetTexture = AS.Noop
			widget.check.SetTexture = AS.Noop
		elseif TYPE == 'Dropdown' then
			local frame = widget.dropdown
			local button = widget.button
			local text = widget.text
			AS:StripTextures(frame)

			button:ClearAllPoints()
			button:Point('RIGHT', frame, 'RIGHT', -20, 0)

			AS:SkinNextPrevButton(button, true)

			AS:CreateBackdrop(frame)
			frame.Backdrop:Point("TOPLEFT", 20, -2)
			frame.Backdrop:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", 2, -2)

			button:SetParent(frame.Backdrop)
			text:SetParent(frame.Backdrop)

			button:HookScript('OnClick', function(self) AS:SetTemplate(self.obj.pullout.frame) end)
		elseif TYPE == 'LSM30_Font' or TYPE == 'LSM30_Sound' or TYPE == 'LSM30_Border' or TYPE == 'LSM30_Background' or TYPE == 'LSM30_Statusbar' then
			local frame = widget.frame
			local button = frame.dropButton
			local text = frame.text
			AS:StripTextures(frame)

			AS:SkinNextPrevButton(button, true)
			frame.text:ClearAllPoints()
			frame.text:Point('RIGHT', button, 'LEFT', -2, 0)

			button:ClearAllPoints()
			button:Point('RIGHT', frame, 'RIGHT', -10, -6)

			AS:CreateBackdrop(frame, "Default")
			frame.Backdrop:Point('TOPLEFT', 0, -17)

			if TYPE == 'LSM30_Sound' then
				widget.soundbutton:SetParent(frame.Backdrop)
				widget.soundbutton:ClearAllPoints()
				widget.soundbutton:Point('LEFT', frame.Backdrop, 'LEFT', 2, 0)
			elseif TYPE == 'LSM30_Statusbar' then
				widget.bar:SetParent(frame.Backdrop)
				widget.bar:SetInside()
			elseif TYPE == 'LSM30_Border' or TYPE == 'LSM30_Background' then
				frame.Backdrop:Point('TOPLEFT', 22, -16)
			end

			frame.Backdrop:Point('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 2, -2)

			button:SetParent(frame.Backdrop)
			text:SetParent(frame.Backdrop)
			button:HookScript('OnClick', function(this, button)
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
			widget.editbox:SetHeight(17)
			AS:SkinButton(widget.button)
		elseif TYPE == 'Button' then
			AS:SkinButton(widget.frame)
		elseif TYPE == 'Slider' then
			AS:SkinSlideBar(widget.slider)

			AS:SetTemplate(widget.editbox)
			widget.editbox:SetHeight(15)
			widget.editbox:SetPoint('TOP', widget.slider, 'BOTTOM', 0, -1)

			widget.lowtext:SetPoint('TOPLEFT', widget.slider, 'BOTTOMLEFT', 2, -2)
			widget.hightext:SetPoint('TOPRIGHT', widget.slider, 'BOTTOMRIGHT', -2, -2)
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

				for i=1, frame:GetNumChildren() do
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
			AS:SetTemplate(frame, 'Transparent')

			if widget.treeframe then
				AS:SetTemplate(widget.treeframe, 'Transparent')
				frame:SetPoint('TOPLEFT', widget.treeframe, 'TOPRIGHT', 1, 0)

				local oldCreateButton = widget.CreateButton
				widget.CreateButton = function(self)
					local button = oldCreateButton(self)
					AS:StripTextures(button.toggle)
					button.toggle.SetNormalTexture = AS.Noop
					button.toggle.SetPushedTexture = AS.Noop
					button.toggleText = button.toggle:CreateFontString(nil, 'OVERLAY')
					button.toggleText:SetFont(AS.Font, 19)
					button.toggleText:SetPoint('CENTER')
					button.toggleText:SetText('+')
					return button
				end

				local oldRefreshTree = widget.RefreshTree
				widget.RefreshTree = function(self, scrollToSelection)
					oldRefreshTree(self, scrollToSelection)
					if not self.tree then return end
					local status = self.status or self.localstatus
					local groupstatus = status.groups
					local lines = self.lines
					local buttons = self.buttons

					for i, line in pairs(lines) do
						local button = buttons[i]
						if groupstatus[line.uniquevalue] and button then
							button.toggleText:SetText('-')
						elseif button then
							button.toggleText:SetText('+')
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
					tab.Backdrop:Point("TOPLEFT", 10, -3)
					tab.Backdrop:Point("BOTTOMRIGHT", -10, 0)
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
