--[[
	Some things to note:
			I don't know how to remove some of the background/borders in various panels
			of this addon. I'm doing what I can to help alleviate the time and stress
			that would be placed on you to skin this addon.

			I've placed the tag "CheckItOut" throughout the code as a way for you to
			quickfind problem areas that I tagged as something that needs your attention
			or otherwise has an issue I couldn't figure out.
]]--

local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TotalRP3') then return end

function AS:TotalRP3()

--View Fields

	--Close TRP3 Panel Button (Main Frame)
	AS:SkinCloseButton(TRP3_MainFrameClose)
	-- Tooltip Skin
	AS:SkinTooltip(TRP3_CharacterTooltip)
	AS:SkinTooltip(TRP3_CompanionTooltip)
	-- Left Side Column Buttons/Frames
	-- CheckItOut
	-- I'm not entirely sure why it isn't skinning past the 5th button
	-- Probably needs some kind of "OnClick" update thing to skin additional
	-- buttons that are created
	-- These buttons appear to be created in: Interface\Addons\totalRP3\core\impl\main_structure.lua
	-- That might help with tracking down the issue
	AS:SkinScrollBar(TRP3_MainFrameMenuScrollScrollBar)
	AS:SkinScrollBar(TRP3_MainFrameMenuScroll)

	for i = 0, 99 do
		if _G['TRP3_MainFrameMenuButton'..i] then AS:SkinFrame(_G['TRP3_MainFrameMenuButton'..i]) end
	end	

	AS:SkinButton(TRP3_MainFrameMenuButtonCloseAll)
	for i = 0, 33 do
		if _G['TRP3_MainFrameMenuButton'..i..'Close'] then AS:SkinCloseButton(_G['TRP3_MainFrameMenuButton'..i..'Close']) end
	end	

	--Main Frames
	AS:SkinFrame(TRP3_MainFrame)
	AS:SkinFrame(TRP3_Dashboard)
	TRP3_Dashboard:SetBackdropBorderColor(0,0,0,0)
	AS:SkinFrame(TRP3_DashboardStatus)
	AS:SkinFrame(TRP3_DashboardNotifications)
	AS:SkinFrame(TRP3_MainFramePageContainer)
	TRP3_MainFramePageContainer:SetBackdropBorderColor(0,0,0,0)

	--Hide Status Panel Header Frame
	AS:SkinFrame(TRP3_DashboardStatusCaptionPanel)
	TRP3_DashboardStatusCaptionPanel:Hide()

	--Status Panel Dropdown Boxes
	AS:SkinDropDownBox(TRP3_DashboardStatus_CharactStatusList)
	AS:SkinDropDownBox(TRP3_DashboardStatus_XPStatusList)
	AS:SkinButton(TRP3_DashboardStatus_CharactStatusListButton)
	AS:SkinButton(TRP3_DashboardStatus_XPStatusListButton)

	--Hide Notifications Header Frame
	AS:SkinFrame(TRP3_DashboardNotificationsCaptionPanel)
	TRP3_DashboardNotificationsCaptionPanel:Hide()

	--Notification Panels
	AS:SkinFrame(TRP3_DashboardNotifications1)
	AS:SkinFrame(TRP3_DashboardNotifications2)
	AS:SkinFrame(TRP3_DashboardNotifications3)
	AS:SkinFrame(TRP3_DashboardNotifications4)

	--Notification "Show" Buttons
	for i = 1, 4 do
		if _G['TRP3_DashboardNotifications'..i..'Show'] then AS:SkinButton(_G['TRP3_DashboardNotifications'..i..'Show']) end
	end

	--Notification "Close" Buttons
	for i = 1, 4 do
		if _G['TRP3_DashboardNotifications'..i..'Remove'] then AS:SkinCloseButton(_G['TRP3_DashboardNotifications'..i..'Remove']) end
	end

	--Notifications Dropdown Filter & "Clear All" button
	AS:SkinDropDownBox(TRP3_DashboardNotificationsFilter)
	AS:SkinButton(TRP3_DashboardNotificationsFilterButton)
	AS:SkinButton(TRP3_DashboardNotificationsClear)

	-- CheckItOut
	-- This is the scroll/slidebar in the Notifications Panel
	-- Not sure how to make it skin properly
	-- AS:SkinSlideBar(TRP3_DashboardNotificationsSlidebar)

	--Character Menu, Profiles
	-- Top Tabs
	AS:SkinFrame(TRP3_RegisterMainTabBar)
	TRP3_RegisterMainTabBar:SetBackdropBorderColor(0,0,0,0)
	for i = 0, 20 do
		if _G['TRP3_TabBar_Tab_'..i] then AS:SkinFrame(_G['TRP3_TabBar_Tab_'..i]) end
	end

	AS:SkinFrame(TRP3_RegisterMain)
	AS:SkinFrame(TRP3_RegisterList)
	AS:SkinFrame(TRP3_RegisterCharact)
	TRP3_RegisterCharact:SetBackdropBorderColor(0,0,0,0)

	-- Add Character Profile Panel
	AS:SkinFrame(TRP3_ProfileManager)
	TRP3_ProfileManager:SetBackdrop(nil)
	AS:SkinButton(TRP3_ProfileManagerAdd)
	AS:SkinFrame(TRP3_ProfileManagerList)

	-- Name Panel
	AS:SkinFrame(TRP3_RegisterCharact_NamePanelCaptionPanel)
	AS:SkinFrame(TRP3_RegisterCharact_NamePanel)
	AS:SkinButton(TRP3_RegisterCharact_NamePanel_EditButton)
	TRP3_RegisterCharact_NamePanelCaptionPanel:SetBackdropBorderColor(0,0,0,0)

	-- Characteristics Panel
	AS:SkinFrame(TRP3_RegisterCharact_CharactPanelCaptionPanel)
	AS:SkinFrame(TRP3_RegisterCharact_CharactPanel)

	--CheckItOut
	-- The following line of code throws the 'index nil' error
	-- TRP3_RegisterCharact_CharactPanel:SetBackdrop(nil)
	--[[
	This is the error the above line of code throws out:
	Date: 2015-01-15 22:49:44
	ID: 1
	Error occured in: Global
	Count: 1
	Message: ...les\register\characters\register_characteristics.lua line 154:
	attempt to index local 'backdrop' (a nil value)
	Debug:
		...les\register\characters\register_characteristics.lua:154:
		...les\register\characters\register_characteristics.lua:152
		...les\register\characters\register_characteristics.lua:168:
		...les\register\characters\register_characteristics.lua:158
		...les\register\characters\register_characteristics.lua:683:
		...les\register\characters\register_characteristics.lua:649
		...les\register\characters\register_characteristics.lua:745:
		...les\register\characters\register_characteristics.lua:742
		...talRP3\modules\register\characters\register_main.lua:332:
		...talRP3\modules\register\characters\register_main.lua:326
		totalRP3\core\impl\ui_tools.lua:661:
		totalRP3\core\impl\ui_tools.lua:658
		totalRP3\core\impl\ui_tools.lua:668: callback()
		...talRP3\modules\register\characters\register_main.lua:349:
		...talRP3\modules\register\characters\register_main.lua:341
		totalRP3\core\impl\ui_tools.lua:668:
		totalRP3\core\impl\ui_tools.lua:664
		totalRP3\core\impl\ui_tools.lua:643: SelectTab()
		...talRP3\modules\register\characters\register_main.lua:358:
		...talRP3\modules\register\characters\register_main.lua:355
		...talRP3\modules\register\characters\register_main.lua:453: onPagePostShow()
		...terface\AddOns\totalRP3\core\impl\main_structure.lua:277:
		...terface\AddOns\totalRP3\core\impl\main_structure.lua:241
		...talRP3\modules\register\characters\register_main.lua:431: onSelected()
		...terface\AddOns\totalRP3\core\impl\main_structure.lua:199:
		...terface\AddOns\totalRP3\core\impl\main_structure.lua:194
		...talRP3\modules\register\characters\register_main.lua:417: onSelected()
		...terface\AddOns\totalRP3\core\impl\main_structure.lua:199:
		...terface\AddOns\totalRP3\core\impl\main_structure.lua:194
		...terface\AddOns\totalRP3\core\impl\main_structure.lua:57:
		...terface\AddOns\totalRP3\core\impl\main_structure.lua:55
	Locals:
	backgroundIndex = 1
	backdrop = nil
	(*temporary) = "Interface\DialogFrame\UI-DialogBox-Background"
	(*temporary) = 1
	(*temporary) = "Interface\DialogFrame\UI-DialogBox-Background"
	(*temporary) = "attempt to index local 'backdrop' (a nil value)"
	getTiledBackground = <function> defined @Interface\AddOns\totalRP3\core\impl\ui_tools.lua:71

	]]--

	AS:SkinFrame(TRP3_RegisterCharact_CharactPanel_Scroll)
	AS:SkinScrollBar(TRP3_RegisterCharact_CharactPanel_ScrollScrollBar)
	TRP3_RegisterCharact_CharactPanelCaptionPanel:SetBackdropBorderColor(0,0,0,0)

	-- "About" Tab
	AS:SkinFrame(TRP3_RegisterAbout)

	--[[
	-- CheckItOut
	I don't know how to strip out the Background Panels from these interfaces
	but I think this is on the right track. I tried using just SetBackdrop(nil)
	but there was an error tossed about indexing nil value

	TRP3_RegisterAbout:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
									edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
									tile = true, edgeSize = 0})
	]]--

	AS:SkinFrame(TRP3_RegisterAbout_AboutPanel)
	AS:SkinButton(TRP3_RegisterAbout_AboutPanel_EditButton)
	AS:SkinFrame(TRP3_RegisterAbout_AboutPanel_Scroll)
	AS:SkinScrollBar(TRP3_RegisterAbout_AboutPanel_ScrollScrollBar)
	AS:SkinFrame(TRP3_RegisterAbout_AboutPanel_MusicPlayer)
	AS:SkinButton(TRP3_RegisterAbout_AboutPanel_MusicPlayer_Play)
	AS:SkinButton(TRP3_RegisterAbout_AboutPanel_MusicPlayer_Stop)
	AS:SkinFrame(TRP3_RegisterAbout_AboutPanel_Thumb)
	TRP3_RegisterAbout_AboutPanel_Thumb:SetBackdropBorderColor(0,0,0,0)

	-- "Misc" Tab
	AS:SkinFrame(TRP3_RegisterMisc)
	AS:SkinFrame(TRP3_RegisterMiscView)
	AS:SkinFrame(TRP3_RegisterMiscViewGlance)
	AS:SkinFrame(TRP3_RegisterMiscViewGlanceCaptionPanel)
	TRP3_RegisterMiscViewGlanceCaptionPanel:SetBackdropBorderColor(0,0,0,0)

	-- This is the dropdown button for "At a Glance" preset saves (giant red button with a diagonal down arrow)
	-- That I'm unsure of how to make look like a proper button reskin
	-- CheckItOut
	-- AS:SkinButton(TRP3_RegisterMiscViewGlanceAction)

	-- "Misc" Tab IC/OOC Info
	-- IC
	AS:SkinFrame(TRP3_RegisterMiscViewCurrently)
	TRP3_RegisterMiscViewCurrently:SetBackdropBorderColor(0,0,0,0)
	AS:SkinFrame(TRP3_RegisterMiscViewCurrentlyCaptionPanel)
	TRP3_RegisterMiscViewCurrentlyCaptionPanel:SetBackdropBorderColor(0,0,0,0)
	AS:SkinFrame(TRP3_RegisterMiscViewCurrentlyIC)
	AS:SkinFrame(TRP3_RegisterMiscViewCurrentlyICScroll)
	TRP3_RegisterMiscViewCurrentlyICScroll:SetBackdropBorderColor(0,0,0,0)
	AS:SkinScrollBar(TRP3_RegisterMiscViewCurrentlyICScrollScrollBar)
	-- OOC
	AS:SkinFrame(TRP3_RegisterMiscViewCurrentlyOOC)
	AS:SkinFrame(TRP3_RegisterMiscViewCurrentlyOOCScroll)
	TRP3_RegisterMiscViewCurrentlyOOCScroll:SetBackdropBorderColor(0,0,0,0)
	AS:SkinScrollBar(TRP3_RegisterMiscViewCurrentlyOOCScrollScrollBar)

	--RP Styles
	AS:SkinFrame(TRP3_RegisterMiscViewRPStyle)
	AS:SkinFrame(TRP3_RegisterMiscViewRPStyleCaptionPanel)
	TRP3_RegisterMiscViewRPStyleCaptionPanel:SetBackdropBorderColor(0,0,0,0)

	-- CheckItOut
	--[[
	I'm unsure of how to even begin to frame something that creates a "listbox" style dropdown.
	The code that produces these boxes/menus/selections is in
		Interface\Addons\totalRP3\modules\register\characters\register_misc.lua  (roughly around line 150)
	A snippet of the code follows:

	if frame == nil then
		frame = CreateFrame("Frame", "TRP3_RegisterMiscViewRPStyle_line"..index, TRP3_RegisterMiscViewRPStyle, "TRP3_RegisterRPStyleMain_Edit_Line")
		setupListBox(_G[frame:GetName().."Values"], fieldData.values, onEditStyle, nil, 180, true)
		frame.fieldData = fieldData
		tinsert(styleLines, frame)
	end

	--RP Line Values Dropdowns
	AS:SkinDropdownBox(TRP3_RegisterMiscViewRPStyle_line1)
	]]--

	-- "Companions" Panel/Profile
	AS:SkinFrame(TRP3_CompanionsProfiles)
	AS:SkinFrame(TRP3_CompanionsProfilesList)
	AS:SkinButton(TRP3_CompanionsProfilesAdd)

	--Registry of Known Characters
	AS:SkinFrame(TRP3_RegisterList)
	AS:SkinFrame(TRP3_RegisterListContainer)
	AS:SkinFrame(TRP3_RegisterListHeader)

	AS:SkinFrame(TRP3_RegisterListCharactFilterCaptionPanel)
	TRP3_RegisterListCharactFilterCaptionPanel:SetBackdropBorderColor(0,0,0,0)
	AS:SkinFrame(TRP3_RegisterListCharactFilter)
	AS:SkinFrame(TRP3_RegisterListPetFilterCaptionPanel)
	TRP3_RegisterListPetFilterCaptionPanel:SetBackdropBorderColor(0,0,0,0)
	AS:SkinFrame(TRP3_RegisterListPetFilter)

	-- Strip out the textures from Registry Entries per Line
	for i = 1, 14 do
		if _G['TRP3_RegisterListLine'..i] then AS:StripTextures(_G['TRP3_RegisterListLine'..i]) end
	end

	-- Settings Menu, Configuration Pages
	-- Looping the Skinning of Buttons, Config Pages, and Sliders
	for i = 1, 10 do
		if _G['TRP3_ConfigurationPage'..i] then AS:SkinFrame(_G['TRP3_ConfigurationPage'..i]) end
	end
	for i = 1, 99 do
		if _G['TRP3_ConfigurationWidget'..i..'Button'] then AS:SkinButton(_G['TRP3_ConfigurationWidget'..i..'Button']) end
	end
	for i = 1, 99 do
		if _G['TRP3_ConfigurationWidget'..i..'Slider'] then AS:SkinSlideBar(_G['TRP3_ConfigurationWidget'..i..'Slider']) end
	end
	for i = 1, 99 do
		if _G['TRP3_ConfigurationPage'..i..'InnerScrollScrollBar'] then AS:SkinScrollBar(_G['TRP3_ConfigurationPage'..i..'InnerScrollScrollBar']) end
	end
	for i = 1, 99 do
		if _G['TRP3_ConfigurationPage'..i..'Inner'] then AS:SkinFrame(_G['TRP3_ConfigurationPage'..i..'Inner']) end
	end
	AS:SkinFrame(TRP3_ConfigurationModule)
	AS:SkinFrame(TRP3_ConfigurationModuleFrame)
	AS:SkinScrollBar(TRP3_ConfigurationModuleScrollScrollBar)

--Editing View

	--Editing Charactertistics
	AS:SkinFrame(TRP3_RegisterCharact_Edit_NamePanelCaptionPanel)
	TRP3_RegisterCharact_Edit_NamePanelCaptionPanel:SetBackdropBorderColor(0,0,0,0)
	AS:SkinFrame(TRP3_RegisterCharact_Edit_NamePanel)
	AS:SkinButton(TRP3_RegisterCharact_NamePanel_Edit_SaveButton)
	AS:SkinButton(TRP3_RegisterCharact_NamePanel_Edit_CancelButton)
	AS:SkinFrame(TRP3_RegisterCharact_Edit_CharactPanelCaptionPanel)
	TRP3_RegisterCharact_Edit_CharactPanelCaptionPanel:SetBackdropBorderColor(0,0,0,0)
	AS:SkinFrame(TRP3_RegisterCharact_Edit_CharactPanel)
	AS:SkinFrame(TRP3_RegisterCharact_Edit_CharactPanel_Container)
	AS:SkinScrollBar(TRP3_RegisterCharact_Edit_CharactPanel_ScrollScrollBar)
	AS:SkinButton(TRP3_RegisterCharact_Edit_MiscAdd)
	AS:SkinButton(TRP3_RegisterCharact_Edit_PsychoAdd)

	-- CheckItOut
	-- I can't figure out how to properly skin these styles of buttons.
	-- They inherit their skin from TRP3_CloseButton, which itself is an inherit of UIPanelCloseButton
	-- Line 23 of totalRP3\core\ui\widgets.xml
	-- <Button name="TRP3_CloseButton" inherits="UIPanelCloseButton" virtual="true">
	--[[
	-- CheckItOut
	-- This is also my horrible attempt to remove the textures from the panels in the
	-- personality traits section. The same area that the above buttons are in
	-- I tried, and failed, miserably. lol
	for i = 1, 99 do
		if _G['TRP3_RegisterCharact_MiscEditLine'..i..'Delete'] then AS:SkinCloseButton(_G['TRP3_RegisterCharact_MiscEditLine'..i..'Delete']) end
	end
	for i = 1, 99 do
		if _G['TRP3_RegisterCharact_PsychoEditLine'..i..'Delete'] then AS:SkinCloseButton(_G['TRP3_RegisterCharact_PsychoEditLine'..i..'Delete']) end
	end

	for i = 1, 99 do
		if _G['TRP3_RegisterCharact_PsychoEditLine'..i..'Jauge'] then AS:StripTextures(_G['TRP3_RegisterCharact_PsychoEditLine'..i..'Jauge']) end
	end
	for i = 1, 99 do
		if _G['TRP3_RegisterCharact_PsychoEditLine'..i..'Jauge'] then AS:StripTextures(_G['TRP3_RegisterCharact_PsychoEditLine'..i..'Jauge']) end
	end
	]]--

	--Edit Mode, About/Description
	AS:SkinFrame(TRP3_RegisterAbout_AboutPanel_Edit)
	AS:SkinButton(TRP3_RegisterAbout_Edit_SaveButton)
	AS:SkinButton(TRP3_RegisterAbout_Edit_CancelButton)

	AS:SkinScrollBar(TRP3_RegisterAbout_Edit_Template1ScrollScrollBar)
	AS:SkinFrame(TRP3_RegisterAbout_Edit_Template1Scroll)
	AS:SkinFrame(TRP3_RegisterAbout_Edit_Template1_Toolbar)
	AS:SkinFrame(TRP3_RegisterAbout_Edit_Template1)
	AS:SkinFrame(TRP3_RegisterAbout_Edit_Template1FocusDummy)
	AS:SkinButton(TRP3_RegisterAbout_Edit_Template1_Toolbar_H1)
	AS:SkinButton(TRP3_RegisterAbout_Edit_Template1_Toolbar_H2)
	AS:SkinButton(TRP3_RegisterAbout_Edit_Template1_Toolbar_H3)
	AS:SkinButton(TRP3_RegisterAbout_Edit_Template1_Toolbar_P)
	AS:SkinButton(TRP3_RegisterAbout_Edit_Template1_Toolbar_Image)
	AS:SkinButton(TRP3_RegisterAbout_Edit_Template1_Toolbar_Icon)
	AS:SkinButton(TRP3_RegisterAbout_Edit_Template1_Toolbar_Color)
	AS:SkinButton(TRP3_RegisterAbout_Edit_Template1_Toolbar_Link)

	-- Glance Editor
	AS:SkinFrame(TRP3_RegisterGlanceEditor)
	AS:SkinFrame(TRP3_RegisterGlanceEditor_Edit)
	AS:SkinFrame(TRP3_RegisterGlanceEditor_Preset)
	AS:SkinFrame(TRP3_RegisterMiscEdit_Glance_Text)
	AS:SkinFrame(TRP3_RegisterMiscEdit_Glance_TextScroll)
	AS:SkinScrollBar(TRP3_RegisterMiscEdit_Glance_TextScrollScrollBar)
	AS:SkinFrame(TRP3_RegisterMiscEdit_Glance_TextFocusDummy)
	AS:SkinButton(TRP3_RegisterMiscEdit_Glance_Apply)
	AS:SkinButton(TRP3_RegisterGlanceEditor_PresetSaveButton)

	-- Icon Browser

	AS:SkinFrame(TRP3_IconBrowser)
	AS:SkinFrame(TRP3_IconBrowserContent)
	AS:SkinCloseButton(TRP3_IconBrowserClose)
	AS:SkinFrame(TRP3_IconBrowserFilter)

	-- Companions Editor/Page
	AS:SkinFrame(TRP3_CompanionsPage)
	AS:SkinFrame(TRP3_CompanionsPageInformation)
	AS:SkinFrame(TRP3_CompanionsPageInformationConsult)
	AS:SkinFrame(TRP3_CompanionsPageInformationConsult_NamePanelCaptionPanel)
	TRP3_CompanionsPageInformationConsult_NamePanelCaptionPanel:SetBackdropBorderColor(0,0,0,0)
	AS:SkinFrame(TRP3_CompanionsPageInformationConsult_NamePanel)
	AS:SkinButton(TRP3_CompanionsPageInformationConsult_NamePanel_EditButton)

	AS:SkinFrame(TRP3_CompanionsPageInformationConsult_Glance)
	AS:SkinFrame(TRP3_CompanionsPageInformationConsult_GlanceCaptionPanel)
	TRP3_CompanionsPageInformationConsult_GlanceCaptionPanel:SetBackdropBorderColor(0,0,0,0)

	AS:SkinFrame(TRP3_CompanionsPageInformationConsult_AboutCaptionPanel)
	TRP3_CompanionsPageInformationConsult_AboutCaptionPanel:SetBackdropBorderColor(0,0,0,0)
	AS:SkinFrame(TRP3_CompanionsPageInformationConsult_About_Scroll)
	AS:SkinFrame(TRP3_CompanionsPageInformationConsult_About)
	AS:SkinScrollBar(TRP3_CompanionsPageInformationConsult_About_ScrollScrollBar)

	AS:SkinFrame(TRP3_CompanionsPageInformationEdit_NamePanelCaptionPanel)
	TRP3_CompanionsPageInformationEdit_NamePanelCaptionPanel:SetBackdropBorderColor(0,0,0,0)
	AS:SkinFrame(TRP3_CompanionsPageInformation)
	AS:SkinFrame(TRP3_CompanionsPageInformationEdit)
	AS:SkinButton(TRP3_CompanionsPageInformationEdit_NamePanel_SaveButton)
	AS:SkinButton(TRP3_CompanionsPageInformationEdit_NamePanel_CancelButton)
	AS:SkinFrame(TRP3_CompanionsPageInformationEdit_About)
	AS:SkinFrame(TRP3_CompanionsPageInformationEdit_AboutCaptionPanel)
	TRP3_CompanionsPageInformationEdit_AboutCaptionPanel:SetBackdropBorderColor(0,0,0,0)
	AS:SkinFrame(TRP3_CompanionsPageInformationEdit_About_Text)
	AS:SkinFrame(TRP3_CompanionsPageInformationEdit_About_TextScroll)
	AS:SkinScrollBar(TRP3_CompanionsPageInformationEdit_About_TextScrollScrollBar)
	AS:SkinFrame(TRP3_CompanionsPageInformationEdit_About_TextFocusDummy)

	--Companions Edit Toolbar Buttons
	AS:SkinFrame(TRP3_CompanionsPageInformationEdit_About_Toolbar)
	AS:SkinButton(TRP3_CompanionsPageInformationEdit_About_Toolbar_H1)
	AS:SkinButton(TRP3_CompanionsPageInformationEdit_About_Toolbar_H2)
	AS:SkinButton(TRP3_CompanionsPageInformationEdit_About_Toolbar_H3)
	AS:SkinButton(TRP3_CompanionsPageInformationEdit_About_Toolbar_P)
	AS:SkinButton(TRP3_CompanionsPageInformationEdit_About_Toolbar_Image)
	AS:SkinButton(TRP3_CompanionsPageInformationEdit_About_Toolbar_Icon)
	AS:SkinButton(TRP3_CompanionsPageInformationEdit_About_Toolbar_Color)
	AS:SkinButton(TRP3_CompanionsPageInformationEdit_About_Toolbar_Link)

	-- Companions/Mount Browser
	AS:SkinFrame(TRP3_CompanionBrowser)
	AS:SkinFrame(TRP3_CompanionBrowserContent)
	AS:SkinFrame(TRP3_CompanionBrowserFilter)

	--Misc Panels (Color Selector, Popups)
	AS:SkinFrame(TRP3_ColorBrowser)
	AS:SkinFrame(TRP3_PopupsFrame)

	--Target Frame, Tool Bar & Glance Bar
	AS:SkinFrame(TRP3_TargetFrame)
	AS:SkinFrame(TRP3_GlanceBar)
	AS:SkinFrame(TRP3_TargetFrameCaptionPanel)
	TRP3_TargetFrameCaptionPanel:SetBackdropBorderColor(0,0,0,0)
	TRP3_TargetFrame:SetBackdropBorderColor(0,0,0,0)
	TRP3_GlanceBar:SetBackdropBorderColor(0,0,0,0)

	TRP3_TargetFrameCaptionPanel:ClearAllPoints()
	TRP3_TargetFrameCaptionPanel:SetPoint("BOTTOM", TRP3_TargetFrame, "TOP", 0, 0)
	TRP3_TargetFrameCaptionPanel:SetHeight(18)

	-- CheckItOut
	-- I can't properly set the width here for some reason::Takote-WymrestAccord
	-- I think it's because TRP allows TRP3_TargetFrame to be resized via dragging
	-- TRP3_TargetFrameCaptionPanel:SetWidth(20)

	-- Toolbar
	AS:SkinFrame(TRP3_Toolbar)
	AS:SkinFrame(TRP3_ToolbarTopFrame)
	AS:SkinFrame(TRP3_ToolbarContainer)

	TRP3_ToolbarTopFrame:ClearAllPoints()
	TRP3_ToolbarContainer:ClearAllPoints()
	TRP3_ToolbarTopFrame:SetPoint("TOP", TRP3_Toolbar, "TOP", 0, 0)
	TRP3_ToolbarContainer:SetPoint("BOTTOM", TRP3_Toolbar, "BOTTOM", 0, 0)

end

AS:RegisterSkin('Total RP3', AS.TotalRP3)