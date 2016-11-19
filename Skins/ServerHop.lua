local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ServerHop') then return end

function AS:ServerHop()

	function SkinDropDownBox(Frame, Width) -- Same as AS:SkinDropDownBox but without Button.SetPoint = AS.Noop
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
			Frame:SetWidth(Width or 155)
			Text:ClearAllPoints()
			Text:SetPoint("RIGHT", Button, "LEFT", -2, 0)
			Button:ClearAllPoints()
			Button:SetPoint("RIGHT", Frame, "RIGHT", -10, 3)
			AS:SkinNextPrevButton(Button, true)
			AS:CreateBackdrop(Frame)
			Frame.Backdrop:SetPoint("TOPLEFT", 20, -2)
			Frame.Backdrop:SetPoint("BOTTOMRIGHT", Button, "BOTTOMRIGHT", 2, -2)
		end
	end

	-- Main Frame
	AS:SkinFrame(hopAddon)
	AS:StripTextures(hopAddon.hopFrame)
	AS:SkinButton(hopAddon.hopFrame.buttonHop, true)
	hopAddon.hopFrame.buttonHop:SetPoint("RIGHT",-15,0)
	AS:SkinButton(hopAddon.buttonChangeMode,true)
	hopAddon.buttonChangeMode:SetHeight(25)
	hopAddon.buttonChangeMode:SetPoint("TOPLEFT", 40,0)
	AS:SkinButton(hopAddon.hopFrame.buttonHopBack,true)
	hopAddon.hopFrame.buttonHopBack:SetPoint("LEFT",42,0)
	AS:SkinButton(helpButton)
	hopAddon.buttonHelp:SetPoint("TOPRIGHT",-25,0)
	AS:SkinButton(hopAddon.closeButton)
	hopAddon.closeButton:SetPoint("TOPRIGHT",0,0)
	AS:SkinButton(groupOnMain)
	groupOnMain:SetPoint("TOPRIGHT",-50,0)
	AS:SkinButton(hopAddon.buttonOptions)
	hopAddon.buttonOptions:SetPoint("TOPLEFT",0,0)

	SkinDropDownBox(hopFramepvpDrop, 128)
	SkinDropDownBox(CountDrop, 128)
	hopFramepvpDrop:SetPoint("BOTTOMLEFT",-5,35)
	hopAddon.hopFrame.dropDown:SetPoint("BOTTOMRIGHT",-7,35)

	AS:StripTextures(hopAddon.searchFrame)
	SkinDropDownBox(CategoryDrop,210)
	SkinDropDownBox(dungeonsDrop,210)
	SkinDropDownBox(raidsDrop,210)
	hopAddon.searchFrame.dropDown:ClearAllPoints()
	hopAddon.searchFrame.dropDown:SetPoint("BOTTOMRIGHT",hopAddon.searchFrame,-28,8)
	raidsDrop:SetPoint("BOTTOM",-13,35)
	dungeonsDrop:SetPoint("BOTTOM",-13,35)

	AS:SkinButton(hopAddon.searchFrame.buttonCatFilters)
	hopAddon.searchFrame.buttonCatFilters:SetSize(21,21)
	hopAddon.searchFrame.buttonCatFilters:SetPoint("RIGHT",hopAddon.searchFrame.dropDown,20,3)
	hopAddon.searchFrame.dropDown:SetPoint("BOTTOM",0,8)

	AS:SkinFrame(hopAddon.searchFrame.holderCatFilters, "Default")
	hopAddon.searchFrame.holderCatFilters:SetSize(201,90)
	hopAddon.searchFrame.holderCatFilters:SetPoint("CENTER",-16,-7)

	AS:SkinCheckBox(searchFrameTimeCheck)
	AS:SkinCheckBox(searchFrameilvlCheck)
	AS:SkinCheckBox(searchFrameacceptCheck)
	AS:SkinEditBox(searchFrameTimeEdit)
	AS:SkinEditBox(searchFrameilvlEdit)
	searchFrameilvlEdit:SetPoint("TOPLEFT",140,-35)
	searchFrameTimeEdit:SetSize(40,19)
	searchFrameilvlEdit:SetSize(40,19)

	-- Host Frame
	AS:StripTextures(hopAddon.hostFrame)
	AS:SkinButton(hopAddon.hostFrame.buttonHost, true)
	hopAddon.hostFrame.buttonHost:SetHeight(25)
	hopAddon.hostFrame.buttonHost:SetPoint("RIGHT",-14,0)
	SkinDropDownBox(hopAddon.hostFrame.sizeDrop,100)
	hopAddon.hostFrame.sizeDrop:SetPoint("RIGHT",hopAddon.hostFrame.buttonHost,"LEFT",0,-2)
	hopAddon.hostFrame.sizeDrop.Text:SetPoint("LEFT",hopAddon.hostFrame.sizeDrop,"LEFT",0,2)
	hopAddon.hostFrame.sizeDrop.Text:SetPoint("RIGHT",hopAddon.hostFrame.sizeDrop,"RIGHT",-28,2)
	AS:SkinButton(hopAddon.hopFrame.buttonHop, true)
	hopAddon.hopFrame.buttonHop:SetPoint("BOTTOM",65,14)
	hopAddon.hopFrame.buttonHop:SetHeight(25)
	AS:SkinButton(hopAddon.hostFrame.openList, true)
	hopAddon.hostFrame.openList:SetHeight(25)
	hopAddon.hostFrame.openList:SetPoint("BOTTOMLEFT",16,14)
	AS:SkinButton(hopAddon.hopFrame.buttonResetBL)
	hopAddon.hopFrame.buttonResetBL:SetPoint("LEFT",118,0)

	-- Search Frame
	AS:SkinEditBox(ServerHop_SearchBox)
	ServerHop_SearchBox:SetPoint("TOPLEFT", hopAddon, "BOTTOMLEFT", 0, 0)
	hopAddon.searchFrame.searchBox:SetSize(HOPADDON_WIDTH-40, 20)
	ServerHop_SearchBox:SetTemplate("Default", true)
	AS:StripTextures(ServerHop_SearchBox.Backdrop)
	AS:SkinButton(hopAddon.searchFrame.refreshButton)
	hopAddon.searchFrame.refreshButton:SetSize(20, 20)
	hopAddon.searchFrame.refreshButton:SetTemplate("Default", true)
	hopAddon.searchFrame.refreshButton:ClearAllPoints()
	hopAddon.searchFrame.refreshButton:SetPoint("LEFT",hopAddon.searchFrame.searchBox,"RIGHT",0,0)
	AS:SkinButton(hopAddon.searchFrame.buttonFavourites)
	hopAddon.searchFrame.buttonFavourites:SetTemplate("Default", true)
	hopAddon.searchFrame.buttonFavourites:SetSize(20, 20)

	local SearchBoxResults = {ServerHop_SearchBox:GetChildren()}
	for i=2, #SearchBoxResults do
		if SearchBoxResults[i]:IsObjectType("Button") then
			local regions = {SearchBoxResults[i]:GetRegions()}
			SearchBoxResults[i]:DisableDrawLayer("background")
			SearchBoxResults[i]:SetWidth(HOPADDON_WIDTH+2)
			AS:SkinBackdropFrame(SearchBoxResults[i])
			SearchBoxResults[i].Backdrop:SetInside()
			SearchBoxResults[i]:SetHeight(25)
			AS:StyleButton(SearchBoxResults[i])
	   end
	end
	SearchBoxResults[2]:SetPoint("TOPLEFT", hopAddon.searchFrame.searchBox, "BOTTOMLEFT",-2,-2)
	hopAddon.searchFrame.buttonFavourites:SetPoint("LEFT",hopAddon.searchFrame.searchBox,"RIGHT",20,0)

	-- Status Frame
	AS:SkinFrame(hopAddon.hopStatus)
	hopAddon.hopStatus:SetPoint("LEFT",hopAddon,"RIGHT",-1,0)
	hopAddon:SetHeight(120)
	AS:SkinButton(groupStatus.convertToParty, true)
	AS:SkinButton(groupStatus.convertToRaid, true)
	AS:SkinButton(groupStatus.leaveButton, true)

	-- Options Frame
	AS:SkinFrame(hopOptions)
	AS:SkinCloseButton(optionsInFrameCloseBut)
	AS:StripTextures(hopOptions.optionsAuthor)
	AS:SkinEditBox(hopOptions.optionsAuthor.linkBox)

	SkinDropDownBox(SH_MinimapStrataDrop)
	SkinDropDownBox(SH_StatusFrameDrop)

	AS:SkinFrame(hopOptions.tabList)
	AS:SkinFrame(hopOptions.globalOptionsFrame)
	AS:SkinFrame(hopOptions.customSearchOptionsFrame)
	AS:SkinFrame(hopOptions.hopSearchOptionsFrame)
	AS:SkinFrame(hopOptions.aboutTab)

	AS:SkinCheckBox(MinimapCheck)
	AS:SkinCheckBox(statusCheckBtn)
	AS:SkinCheckBox(SHChatNotifCheckBtn)
	AS:SkinCheckBox(autoacceptCheckBtn)
	AS:SkinCheckBox(CheckBTank)
	AS:SkinCheckBox(CheckBDPS)
	AS:SkinCheckBox(CheckBHeal)
	AS:SkinCheckBox(CheckBSound)
	AS:SkinCheckBox(CheckTaskbar)
	AS:SkinCheckBox(CheckBEndless)
	AS:SkinCheckBox(SHGroupHoppingButton)

	AS:StripTextures(catFiltersBtn, true)
	AS:SkinButton(catFiltersBtn, true)

	AS:SkinCheckBox(CheckAutoinv)
	AS:SkinSlideBar(hopAddon_sliderQueueWait,16, true)
	AS:SkinSlideBar(hopAddon_sliderBL,16)

	AS:SkinButton(hopOptions.hopSearchOptionsFrame.buttonClearBL, true)
	AS:SkinButton(hopOptions.globalOptionsFrame.buttonClearBL, true)
	AS:SkinButton(sh_clearblbut)
	sh_clearblbut:SetSize(24,24)
	sh_clearblbut:SetPoint("BOTTOMLEFT",15,15)

	local HopEditBox = {hopOptions.hopSearchOptionsFrame:GetChildren()}
	for i = 1, #HopEditBox do
		if HopEditBox[i]:IsObjectType("EditBox") then
			AS:SkinEditBox(HopEditBox[i])
		end
	end

	-- Favourites Frame
	AS:SkinFrame(hopAddonFavourites)
	AS:SkinCloseButton(hopAddonFavourites.closeButton)
	AS:SkinButton(ANewScrollFrame.buttonAdd, true)
	AS:SkinScrollBar(ANewScrollFrameScrollBar)
	AS:SkinButton(hopAddonFavourites.editFrame.buttonSave, true)
	AS:SkinButton(hopAddonFavourites.editFrame.buttonCancel, true)
	AS:SkinButton(hopAddonFavourites.editFrame.buttonDelete, true)

	AS:SkinEditBox(hopAddonFavourites.editFrame.editBoxName)
	AS:SkinFrame(hopfavdescr)

	-- HopList MainFrame
	AS:SkinFrame(SH_HopListMainFrame)
	AS:SkinButton(SH_HopListMainFrame.refreshButton)
	AS:SkinCloseButton(SH_HopListMainFrameClose)
	AS:SkinScrollBar(SH_HopListScrollScrollBar)
	AS:SkinCheckBox(SH_OnlyMyZoneCheck)

	-- LFGButton
	local LFGHopeButton = {LFGListFrame:GetChildren()}
	for i = 1, #LFGHopeButton do
		if LFGHopeButton[i]:IsObjectType("Button") and LFGHopeButton[i]:GetText() == " ServerHop" then
			AS:SkinButton(LFGHopeButton[i])
			LFGHopeButton[i]:SetText("ServerHop")
			LFGHopeButton[i]:SetPoint("BOTTOM",LFGListFrame,"BOTTOM",-3,3)
			LFGHopeButton[i]:SetSize(61,22)
		end
	end
end

AS:RegisterSkin('ServerHop', AS.ServerHop)