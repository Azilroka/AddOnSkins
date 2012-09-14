if not(IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Titan") then return end
local function SetEnabled(self, event, ...) 
		if TPBar2and3Position == nil then
			x = WorldFrame:GetWidth()/5 
		else
			x = TPBar2and3Position
		end

		local y = Titan_Bar__Display_Bar:GetHeight() + Titan_Bar__Display_Bar2:GetHeight()/2 + 1

				Titan_Bar__Display_Bar2:ClearAllPoints()
				Titan_Bar__Display_Bar2:SetPoint("TOPRIGHT", WorldFrame, "TOP", -x, -y)
				Titan_Bar__Display_AuxBar2:ClearAllPoints()
				Titan_Bar__Display_AuxBar2:SetPoint("TOPLEFT", WorldFrame, "TOP", x, -y)		
end

local name = "TitanPanelSkin"
local function SkinTitanPanel(self)
		Titan_Bar__Display_Bar:StripTextures()
		Titan_Bar__Display_Bar:SetTemplate("Default")

		Titan_Bar__Display_Bar2:StripTextures()
		Titan_Bar__Display_Bar2:SetTemplate("Default")

		Titan_Bar__Display_AuxBar:StripTextures()
		Titan_Bar__Display_AuxBar:SetTemplate("Default")

		Titan_Bar__Display_AuxBar2:StripTextures()
		Titan_Bar__Display_AuxBar2:SetTemplate("Default")		

			local BarTwo = _G["Titan_Bar__Display_Bar2"]
			BarTwo:SetScript("OnUpdate", UpdateRepExpBar)
			

		local TP_Skin_OptionsFrame = CreateFrame("FRAME", "TP_Skin_OptionsFrame", UIParent)
		TP_Skin_OptionsFrame:SetMovable(true)
		TP_Skin_OptionsFrame:EnableMouse(true)
		TP_Skin_OptionsFrame:RegisterForDrag("LeftButton")
		TP_Skin_OptionsFrame:SetScript("OnDragStart", TP_Skin_OptionsFrame.StartMoving)
		TP_Skin_OptionsFrame:SetScript("OnDragStop", TP_Skin_OptionsFrame.StopMovingOrSizing)
		TP_Skin_OptionsFrame:SetWidth(300)
		if IsAddOnLoaded("ElvUI") then --Only need with ElvUI
			TP_Skin_OptionsFrame:SetHeight(310)
		else
			TP_Skin_OptionsFrame:SetHeight(250)
		end
		TP_Skin_OptionsFrame:SetPoint("CENTER", UIParent, "CENTER")
		TP_Skin_OptionsFrame:SetTemplate('Transparent')
		TP_Skin_OptionsFrame:Hide()

		TP_Skin_OptionsFrame.Title = TP_Skin_OptionsFrame:CreateFontString(nil, 'OVERLAY')
			if ElvUI then
				TP_Skin_OptionsFrame.Title:SetFont([[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]], 17, nil)
			else
				TP_Skin_OptionsFrame.Title:SetFont([[Interface\AddOns\Tukui\medias\fonts\normal_font.ttf]], 17, nil)
			end
		TP_Skin_OptionsFrame.Title:SetPoint("TOP", 0, -5)
		TP_Skin_OptionsFrame.Title:SetText("ElvUI Titan Panel Skin Options")
		TP_Skin_OptionsFrame.Title:SetTextColor(23/255, 132/255, 209/255)

		TP_Skin_OptionsFrame.btn2 = CreateFrame("BUTTON", "TP_Skin_CancelButton", TP_Skin_OptionsFrame, "UIPanelButtonTemplate")
		TP_Skin_OptionsFrame.btn2:SetWidth(80)
		TP_Skin_OptionsFrame.btn2:SetHeight(22)
		TP_Skin_OptionsFrame.btn2:SetText("Close")
		TP_Skin_OptionsFrame.btn2:SetPoint("BOTTOMRIGHT", TP_Skin_OptionsFrame, "BOTTOMRIGHT", -10, 10)
		TP_Skin_OptionsFrame.btn2:SetScript("OnClick", function() TP_Skin_OptionsFrame:Hide() end)
		TP_Skin_OptionsFrame.btn2:SetAlpha(1)
		TP_Skin_OptionsFrame.btn2:Show()

		TP_Skin_OptionsFrame.btn = CreateFrame("BUTTON", "TP_Skin_ReloadUIButton", TP_Skin_OptionsFrame, "UIPanelButtonTemplate")
		TP_Skin_OptionsFrame.btn:SetWidth(80)
		TP_Skin_OptionsFrame.btn:SetHeight(22)
		TP_Skin_OptionsFrame.btn:SetText("Reload")
		TP_Skin_OptionsFrame.btn:SetPoint("RIGHT", TP_Skin_CancelButton, "LEFT", -10, 0)
		TP_Skin_OptionsFrame.btn:SetScript("OnClick", function() ReloadUI() end)
		TP_Skin_OptionsFrame.btn:SetAlpha(1)
		TP_Skin_OptionsFrame.btn:Show()

		local TP_Skin_PreviewFrame = CreateFrame("FRAME", "TP_Skin_PreviewFrame", UIParent)
		TP_Skin_PreviewFrame:SetMovable(true)
		TP_Skin_PreviewFrame:EnableMouse(true)
		TP_Skin_PreviewFrame:RegisterForDrag("LeftButton")
		TP_Skin_PreviewFrame:SetScript("OnDragStart", TP_Skin_OptionsFrame.StartMoving)
		TP_Skin_PreviewFrame:SetScript("OnDragStop", TP_Skin_OptionsFrame.StopMovingOrSizing)
		TP_Skin_PreviewFrame:SetWidth(1048)
		TP_Skin_PreviewFrame:SetHeight(180)
		TP_Skin_PreviewFrame:SetPoint("CENTER", UIParent, "CENTER")
		TP_Skin_PreviewFrame:SetTemplate('Transparent')
				TP_Skin_PreviewFrame.previewImage = TP_Skin_PreviewFrame:CreateTexture('previewZoom', 'OVERLAY')
				TP_Skin_PreviewFrame.previewImage:SetWidth(1024)
				TP_Skin_PreviewFrame.previewImage:SetHeight(128)
				TP_Skin_PreviewFrame.previewImage:SetPoint("TOP", TP_Skin_PreviewFrame, "TOP", 0, -10)
				previewZoom:SetTexture([[Interface\AddOns\Tukui_UIPackages_Skins\media\tpbars.tga]])
				previewZoom:Show()
				-- Close Screenshot Button
					TP_Skin_PreviewFrame.btn = CreateFrame("BUTTON", "TP_Skin_PreviewFrameCloseButton", TP_Skin_PreviewFrame, "UIPanelButtonTemplate")
					TP_Skin_PreviewFrame.btn:SetWidth(100)
					TP_Skin_PreviewFrame.btn:SetHeight(22)
					TP_Skin_PreviewFrame.btn:SetText("Close Screenshot")
					TP_Skin_PreviewFrame.btn:SetPoint("BOTTOM", TP_Skin_PreviewFrame, "BOTTOM", 0, 10)
					TP_Skin_PreviewFrame.btn:SetScript("OnClick", function()
																TP_Skin_PreviewFrame:Hide()
																TP_Skin_OptionsFrame:Show()			
															end)
					TP_Skin_PreviewFrame.btn:SetAlpha(1)
					TP_Skin_PreviewFrame.btn:Show()
		TP_Skin_PreviewFrame:Hide()

		TP_Skin_OptionsFrame.btn3 = CreateFrame("BUTTON", "tpskin_zoom", TP_Skin_OptionsFrame, "UIPanelButtonTemplate")
		TP_Skin_OptionsFrame.btn3:SetWidth(100)
		TP_Skin_OptionsFrame.btn3:SetHeight(22)
		TP_Skin_OptionsFrame.btn3:SetText("View Screenshot")
		TP_Skin_OptionsFrame.btn3:SetPoint("TOPLEFT", TP_Skin_OptionsFrame, "TOPLEFT", 16, -71)
		TP_Skin_OptionsFrame.btn3:SetScript("OnClick", function()
														TP_Skin_PreviewFrame:Show()
														TP_Skin_OptionsFrame:Hide()			
												 end)
		TP_Skin_OptionsFrame.btn3:SetAlpha(1)
		TP_Skin_OptionsFrame.btn3:Show()

		cSkinButton(TP_Skin_OptionsFrame.btn)
		cSkinButton(TP_Skin_OptionsFrame.btn2)
		cSkinButton(TP_Skin_OptionsFrame.btn3)
		cSkinButton(TP_Skin_PreviewFrame.btn)

	local EnableBars = CreateFrame("CheckButton", "tpskin_checkbox", TP_Skin_OptionsFrame, "OptionsBaseCheckButtonTemplate")
		EnableBars:SetPoint("TOPLEFT", TP_Skin_OptionsFrame, "TOPLEFT", 16, -35)
		EnableBars.Title = EnableBars:CreateFontString(nil, 'OVERLAY')
			if ElvUI then
				EnableBars.Title:SetFont([[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]], 12, nil)
			else
				EnableBars.Title:SetFont([[Interface\AddOns\Tukui\medias\fonts\normal_font.ttf]], 12, nil)
			end
		EnableBars.Title:SetPoint("LEFT", EnableBars, "RIGHT", 5, 0)
		EnableBars.Title:SetText("Enable Top Bar 2 and Bottom Bar 2 at top")
		cSkinCheckBox(EnableBars)
		EnableBars:SetScript("OnClick" or "OnUpdate", function(frame)
				if frame:GetChecked() then
					if Titan_Bar__Display_Bar2 and Titan_Bar__Display_AuxBar2 then
							TPEnableSpecialBars = true
					else
						DEFAULT_CHAT_FRAME:AddMessage("|cff1784d1ElvUI|r Titan Panel Skin: You need to make sure you have enabled Top 2 and Bottom 2.")
						RaidNotice_AddMessage(RaidWarningFrame, "You need to make sure you have enabled Top 2 and Bottom 2..", ChatTypeInfo["RAID_WARNING"])
					end
				else
					TPEnableSpecialBars = nil
				end
			end)


local AceGUI = LibStub("AceGUI-3.0")		

		local slider = AceGUI:Create("Slider")
		slider.frame:SetParent("TP_Skin_OptionsFrame")
		slider:SetPoint("TOPLEFT", tpskin_zoom, "BOTTOMLEFT", 0, -10)
		slider:SetLabel("Set Width of Bar 2 and 3.")
		slider:SetSliderValues(10,300,1)
		slider:SetCallback("OnValueChanged", function(self, value) TPBar2and3Width = self.value end)

		local slider2 = AceGUI:Create("Slider")
		slider2.frame:SetParent("TP_Skin_OptionsFrame")
		slider2:SetPoint("TOPLEFT", tpskin_zoom, "BOTTOMLEFT", 0, -70)
		slider2:SetLabel("Set Position of Bar 2 and 3. from center")
		slider2:SetSliderValues(10,500,1)
		slider2:SetCallback("OnValueChanged", function(self, value) TPBar2and3Position = self.value end)

		local slider3 = AceGUI:Create("Slider")
		slider3.frame:SetParent("TP_Skin_OptionsFrame")
		slider3:SetPoint("TOPLEFT", tpskin_zoom, "BOTTOMLEFT", 0, -130)
		slider3:SetLabel("Set Location of Raid Control Button")
		if RaidUtilityPanel then slider3:SetSliderValues(ceil(RaidUtilityPanel:GetWidth()/4)-1,ceil(UIParent:GetWidth())-1-ceil(RaidUtilityPanel:GetWidth()/1.25)-1,1) end
		slider3:SetCallback("OnValueChanged", function(self, value) TPShowButtonPosition = self.value end)
		if Tukui then slider3.frame:Hide() end

		local tpskin = CreateFrame("Frame", "tpskin", TP_Skin_OptionsFrame)
		tpskin:SetScript("OnUpdate", function()
			if Titan_Bar__Display_Bar2 and Titan_Bar__Display_AuxBar2 then -- Do they really exist!
				tpskin_checkbox:SetChecked(TPEnableSpecialBars)
			else
				tpskin_checkbox:SetChecked(nil)
			end
			if TPBar2and3Width == nil then
				slider:SetValue(125)
			else
				slider:SetValue(TPBar2and3Width)
			end
			if TPBar2and3Position == nil then
				local x = WorldFrame:GetWidth()/5
				slider2:SetValue(x)
			else
				slider2:SetValue(TPBar2and3Position)
			end
	end)	
		
	if TPEnableSpecialBars == true then
		if Titan_Bar__Display_Bar2 and Titan_Bar__Display_AuxBar2 then -- Do they really exist!
		
		if TPBar2and3Position == nil then
			x = WorldFrame:GetWidth()/5 
		else
			x = TPBar2and3Position
		end

		local y = Titan_Bar__Display_Bar:GetHeight() + Titan_Bar__Display_Bar2:GetHeight()/2 + 1

				Titan_Bar__Display_Bar2:SetFrameStrata("FULLSCREEN")-- Sets them above cbBar 1.
				if TPBar2and3Width == nil then 
					Titan_Bar__Display_Bar2:SetWidth(125)
				else
					Titan_Bar__Display_Bar2:SetWidth(TPBar2and3Width)
				end
				Titan_Bar__Display_Bar2:SetHeight(23)
				Titan_Bar__Display_Bar2:ClearAllPoints()
				Titan_Bar__Display_Bar2:SetPoint("TOPRIGHT", WorldFrame, "TOP", -x, -y)
				Titan_Bar__Display_Bar2:CreateShadow("Default")			
				Titan_Bar__Display_AuxBar2:SetFrameStrata("FULLSCREEN")	
				if TPBar2and3Width == nil then 
					Titan_Bar__Display_AuxBar2:SetWidth(125)
				else
					Titan_Bar__Display_AuxBar2:SetWidth(TPBar2and3Width)
				end
				Titan_Bar__Display_AuxBar2:SetHeight(23)
				Titan_Bar__Display_AuxBar2:ClearAllPoints()
				Titan_Bar__Display_AuxBar2:SetPoint("TOPLEFT", WorldFrame, "TOP", x, -y)
				Titan_Bar__Display_AuxBar2:CreateShadow("Default")			

	local x = Titan_Bar__Display_Bar2:GetWidth()/4
		
		cbBar2Left = CreateFrame('Frame', nil, Titan_Bar__Display_Bar2)
		cbBar2Left:Point('BOTTOM', Titan_Bar__Display_Bar2, 'TOP',-x,0)
		cbBar2Left:Width(2)
		cbBar2Left:Height(Titan_Bar__Display_Bar2:GetHeight()/2)
		cbBar2Left:SetTemplate('Default')
		cbBar2Left:SetFrameLevel(Titan_Bar__Display_Bar2:GetFrameLevel())
		
		cbBar2Right = CreateFrame('Frame', nil, Titan_Bar__Display_Bar2)
		cbBar2Right:Point('BOTTOM', Titan_Bar__Display_Bar2, 'TOP', x,0)
		cbBar2Right:Width(2)
		cbBar2Right:Height(Titan_Bar__Display_Bar2:GetHeight()/2)
		cbBar2Right:SetTemplate('Default')	
		cbBar2Right:SetFrameLevel(Titan_Bar__Display_Bar2:GetFrameLevel())

		cbBar3Left = CreateFrame('Frame', nil, Titan_Bar__Display_AuxBar2)
		cbBar3Left:Point('BOTTOM', Titan_Bar__Display_AuxBar2, 'TOP',-x,0)
		cbBar3Left:Width(2)
		cbBar3Left:Height(Titan_Bar__Display_AuxBar2:GetHeight()/2)
		cbBar3Left:SetTemplate('Default')
		cbBar3Left:SetFrameLevel(Titan_Bar__Display_AuxBar2:GetFrameLevel())
		
		cbBar3Right = CreateFrame('Frame', nil, Titan_Bar__Display_AuxBar2)
		cbBar3Right:Point('BOTTOM', Titan_Bar__Display_AuxBar2, 'TOP', x,0)
		cbBar3Right:Width(2)
		cbBar3Right:Height(Titan_Bar__Display_AuxBar2:GetHeight()/2)
		cbBar3Right:SetTemplate('Default')	
		cbBar3Right:SetFrameLevel(Titan_Bar__Display_AuxBar2:GetFrameLevel())
	end
		local Enabled = _G["Titan_Bar__Display_AuxBar2"]
		Enabled:SetScript("OnUpdate", SetEnabled)
	end

		if IsAddOnLoaded("ElvUI") then
			if TPShowButtonPosition == nil then
				x = ElvUIParent:GetWidth()/4
					Bar2Height = Titan_Bar__Display_Bar2:GetHeight()
					if Bar2Height == 0 or TPEnableSpecialBars == true then
						RaidUtility_ShowButton:SetPoint("TOP", Titan_Bar__Display_Bar, "BOTTOM", -x, 0)
					else
						RaidUtility_ShowButton:SetPoint("TOP", Titan_Bar__Display_Bar2, "BOTTOM", -x, 0)
					end
				slider3:SetValue(x)
			else
				slider3:SetValue(TPShowButtonPosition)
					Bar2Height = Titan_Bar__Display_Bar2:GetHeight()
					if Bar2Height == 0 or TPEnableSpecialBars == true then
						RaidUtility_ShowButton:SetPoint("TOPLEFT", Titan_Bar__Display_Bar, "BOTTOMLEFT", TPShowButtonPosition, 0)
					else
						RaidUtility_ShowButton:SetPoint("TOPLEFT", Titan_Bar__Display_Bar2, "BOTTOMLEFT", TPShowButtonPosition, 0)
					end
			end
		end

	SLASH_TPSKIN1, SLASH_TPSKIN2 = '/tpskin', '/tpskin show'
	function SlashCmdList.TPSKIN(msg, editbox)
		TP_Skin_OptionsFrame:Show()
	end
end

cRegisterSkin(name,SkinTitanPanel)