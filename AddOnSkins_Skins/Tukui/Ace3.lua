local AS = unpack(AddOnSkins)
local Color = RAID_CLASS_COLORS[select(2, UnitClass('player'))]

local name = 'Ace3Skin'
function AS:SkinAce3()
	local AceGUI = LibStub('AceGUI-3.0', true)
	if not AceGUI then return end
	local oldRegisterAsWidget = AceGUI.RegisterAsWidget
	AceGUI.RegisterAsWidget = function(self, widget)
		local TYPE = widget.type
		if TYPE == 'MultiLineEditBox' then
			widget.scrollBG:SetTemplate('Default')
			AS:SkinButton(widget.button)
			AS:SkinScrollBar(widget.scrollBar)
			widget.scrollBar:SetPoint('RIGHT', widget.frame, 'RIGHT', 0 -4)
			widget.scrollBG:SetPoint('TOPRIGHT', widget.scrollBar, 'TOPLEFT', -2, 19)
			widget.scrollBG:SetPoint('BOTTOMLEFT', widget.button, 'TOPLEFT')
			widget.scrollFrame:SetPoint('BOTTOMRIGHT', widget.scrollBG, 'BOTTOMRIGHT', -4, 8)
		elseif TYPE == 'CheckBox' then
			widget.checkbg:Kill()
			widget.highlight:Kill()

			if not widget.skinnedCheckBG then
				widget.skinnedCheckBG = CreateFrame('Frame', nil, widget.frame)
				widget.skinnedCheckBG:SetTemplate('Default', true)
				widget.skinnedCheckBG:SetInside(widget.checkbg, 4, 4)
				widget.skinnedCheckBG:SetScript('OnShow', function() widget.check:SetInside() widget.check:SetTexture(AS.NormTex) widget.check:SetVertexColor(0, .44, .87) end)
			end

			widget.check:SetParent(widget.skinnedCheckBG)
		elseif TYPE == 'Dropdown' then
			local frame = widget.dropdown
			local button = widget.button
			local text = widget.text
			AS:SkinBackdropFrame(frame, 'Default')

			button:ClearAllPoints()
			button:Point('RIGHT', frame, 'RIGHT', -20, 0)

			AS:SkinNextPrevButton(button, true)
			local Backdrop = frame.backdrop or frame.Backdrop
			Backdrop:Point('TOPLEFT', 20, -2)
			Backdrop:Point('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 2, -2)
			button:SetParent(Backdrop)
			text:SetParent(Backdrop)
			button:HookScript('OnClick', function(this)
				local self = this.obj
				self.pullout.frame:SetTemplate('Default', true)
			end)
		elseif TYPE == 'LSM30_Font' or TYPE == 'LSM30_Sound' or TYPE == 'LSM30_Border' or TYPE == 'LSM30_Background' or TYPE == 'LSM30_Statusbar' then
			local frame = widget.frame
			local button = frame.dropButton
			local text = frame.text
			AS:SkinBackdropFrame(frame, 'Default')

			AS:SkinNextPrevButton(button, true)
			frame.text:ClearAllPoints()
			frame.text:Point('RIGHT', button, 'LEFT', -2, 0)

			button:ClearAllPoints()
			button:Point('RIGHT', frame, 'RIGHT', -10, -6)

			local Backdrop = frame.backdrop or frame.Backdrop
			if TYPE == 'LSM30_Font' then
				Backdrop:Point('TOPLEFT', 20, -17)
			elseif TYPE == 'LSM30_Sound' then
				Backdrop:Point('TOPLEFT', 20, -17)
				widget.soundbutton:SetParent(Backdrop)
				widget.soundbutton:ClearAllPoints()
				widget.soundbutton:Point('LEFT', Backdrop, 'LEFT', 2, 0)
			elseif TYPE == 'LSM30_Statusbar' then
				Backdrop:Point('TOPLEFT', 20, -17)
				widget.bar:SetParent(Backdrop)
				widget.bar:SetInside()
			elseif TYPE == 'LSM30_Border' or TYPE == 'LSM30_Background' then
				Backdrop:Point('TOPLEFT', 42, -16)
			end
			Backdrop:Point('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 2, -2)
			button:SetParent(Backdrop)
			text:SetParent(Backdrop)
			button:HookScript('OnClick', function(this, button)
				local self = this.obj
				if self.dropdown then
					self.dropdown:SetTemplate('Default', true)
				end
			end)
		elseif TYPE == 'EditBox' then
			local frame = widget.editbox
			local button = widget.button
			_G[frame:GetName()..'Left']:Kill()
			_G[frame:GetName()..'Middle']:Kill()
			_G[frame:GetName()..'Right']:Kill()
			frame:Height(17)
			frame:CreateBackdrop('Default')
			local Backdrop = frame.backdrop or frame.Backdrop
			Backdrop:Point('TOPLEFT', -2, 0)
			Backdrop:Point('BOTTOMRIGHT', 2, 0)
			Backdrop:SetParent(widget.frame)
			frame:SetParent(Backdrop)
			button:SkinButton()
		elseif TYPE == 'Button' then
			local frame = widget.frame
			frame:StripTextures(true)
			frame:CreateBackdrop('Default', true)
			local Backdrop = frame.backdrop or frame.Backdrop
			Backdrop:SetInside()
			Backdrop:SetBackdropColor(0,0,0,0)
			frame:SetScript('OnEnter', function() Backdrop:SetBackdropBorderColor(Color.r, Color.g, Color.b) end)
			frame:SetScript('OnLeave', function() Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		elseif TYPE == 'Slider' then
			local frame = widget.slider
			local editbox = widget.editbox
			local lowtext = widget.lowtext
			local hightext = widget.hightext
			local HEIGHT = 12

			AS:SkinFrame(frame)
			frame:Height(HEIGHT)
			frame:SetThumbTexture('Interface\\ChatFrame\\ChatFrameBackground')
			frame:GetThumbTexture():SetVertexColor(0.3, 0.3, 0.3)
			frame:GetThumbTexture():Size(HEIGHT-2,HEIGHT+2)

			editbox:SetTemplate('Default')
			editbox:Height(15)
			editbox:Point('TOP', frame, 'BOTTOM', 0, -1)

			lowtext:SetPoint('TOPLEFT', frame, 'BOTTOMLEFT', 2, -2)
			hightext:SetPoint('TOPRIGHT', frame, 'BOTTOMRIGHT', -2, -2)
		end
		return oldRegisterAsWidget(self, widget)
	end

	local oldRegisterAsContainer = AceGUI.RegisterAsContainer

	AceGUI.RegisterAsContainer = function(self, widget)
		local TYPE = widget.type

		if TYPE == 'ScrollFrame' then
			local frame = widget.scrollbar
			if not frame.isSkinned then
				AS:SkinScrollBar(frame)
				frame.isSkinned = true
			end
		elseif TYPE == 'InlineGroup' or TYPE == 'TreeGroup' or TYPE == 'TabGroup' or TYPE == 'SimpleGroup' or TYPE == 'Frame' or TYPE == 'DropdownGroup' then
			local frame = widget.content:GetParent()
			if TYPE == 'Frame' then
				frame:StripTextures()
				for i=1, frame:GetNumChildren() do
					local child = select(i, frame:GetChildren())
					if child:GetObjectType() == 'Button' and child:GetText() then
						AS:SkinButton(child)
					else
						child:StripTextures()
					end
				end
			end
			frame:SetTemplate('Transparent')

			if widget.treeframe then
				widget.treeframe:SetTemplate('Transparent')
				frame:Point('TOPLEFT', widget.treeframe, 'TOPRIGHT', 1, 0)

				local oldCreateButton = widget.CreateButton
				widget.CreateButton = function(self)
					local button = oldCreateButton(self)
					button.toggle:StripTextures()
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
					tab:StripTextures()
					return tab
				end
			end

			if widget.scrollbar and not widget.scrollbar.isSkinned then
				AS:SkinScrollBar(widget.scrollbar)
				widget.scrollbar.isSkinned = true
			end
		end

		return oldRegisterAsContainer(self, widget)
	end
end

AS:RegisterSkin(name, AS.SkinAce3)