local AS = unpack(AddOnSkins)

function AS:Blizzard_Others()
	-- Others Blizzard frame we want to reskin
	-- local skins = {
		-- "StaticPopup1",
		-- "StaticPopup2",
		-- "StaticPopup3",
		-- "StaticPopup4",
		-- "GameMenuFrame",
		-- "LFDDungeonReadyStatus",
		-- "TicketStatusFrameButton",
		-- "LFDSearchStatus",
		-- "AutoCompleteBox",
		-- "ConsolidatedBuffsTooltip",
		-- "ReadyCheckFrame",
		-- "StackSplitFrame",
		-- "CharacterFrame",
		-- "VoiceChatTalkers"
	-- }

	-- for i = 1, getn(skins) do
		-- if _G[skins[i]] then
			-- AS:SetTemplate(_G[skins[i]], 'Default')
			-- if _G[skins[i]] ~= _G["AutoCompleteBox"] then -- frame to blacklist from create shadow function
				-- _G[skins[i]]:CreateShadow('Default')
			-- end
		-- end
	-- end

	local function SkinNavBarButtons(self)
		local navButton = self.navList[#self.navList]
		if navButton and not navButton.isSkinned then
			AS:SkinButton(navButton, true)
			if navButton.MenuArrowButton then
				AS:SkinNextPrevButton(navButton.MenuArrowButton, true)
			end

			navButton.isSkinned = true
		end
	end
	hooksecurefunc("NavBar_AddButton", SkinNavBarButtons)

	--LFD Role Picker frame
	AS:StripTextures(LFDRoleCheckPopup)
	AS:SetTemplate(LFDRoleCheckPopup, 'Default')
	AS:SkinButton(LFDRoleCheckPopupAcceptButton)
	AS:SkinButton(LFDRoleCheckPopupDeclineButton)
	AS:SkinCheckBox(LFDRoleCheckPopupRoleButtonTank:GetChildren())
	AS:SkinCheckBox(LFDRoleCheckPopupRoleButtonDPS:GetChildren())
	AS:SkinCheckBox(LFDRoleCheckPopupRoleButtonHealer:GetChildren())
	LFDRoleCheckPopupRoleButtonTank:GetChildren():SetFrameLevel(LFDRoleCheckPopupRoleButtonTank:GetChildren():GetFrameLevel() + 1)
	LFDRoleCheckPopupRoleButtonDPS:GetChildren():SetFrameLevel(LFDRoleCheckPopupRoleButtonDPS:GetChildren():GetFrameLevel() + 1)
	LFDRoleCheckPopupRoleButtonHealer:GetChildren():SetFrameLevel(LFDRoleCheckPopupRoleButtonHealer:GetChildren():GetFrameLevel() + 1)

	-- Cinematic Popup
	AS:SetTemplate(CinematicFrameCloseDialog)
	CinematicFrameCloseDialog:SetScale(UIParent:GetScale())
	AS:SkinButton(CinematicFrameCloseDialogConfirmButton)
	AS:SkinButton(CinematicFrameCloseDialogResumeButton)

	-- Movie Frame Popup
	AS:SetTemplate(MovieFrame.CloseDialog)
	MovieFrame.CloseDialog:SetScale(UIParent:GetScale())
	AS:SkinButton(MovieFrame.CloseDialog.ConfirmButton)
	AS:SkinButton(MovieFrame.CloseDialog.ResumeButton)

	-- Report Cheats
	AS:StripTextures(ReportCheatingDialog)
	AS:SetTemplate(ReportCheatingDialog)
	AS:SkinButton(ReportCheatingDialogReportButton)
	AS:SkinButton(ReportCheatingDialogCancelButton)
	AS:StripTextures(ReportCheatingDialogCommentFrame)
	AS:SkinEditBox(ReportCheatingDialogCommentFrameEditBox)
	
	-- Report Name
	AS:StripTextures(ReportPlayerNameDialog)
	AS:SetTemplate(ReportPlayerNameDialog)
	AS:SkinButton(ReportPlayerNameDialogReportButton)
	AS:SkinButton(ReportPlayerNameDialogCancelButton)
	AS:StripTextures(ReportPlayerNameDialogCommentFrame)
	AS:SkinEditBox(ReportPlayerNameDialogCommentFrameEditBox)
	
	-- -- reskin popup buttons
	-- for i = 1, 4 do
		-- for j = 1, 3 do
			-- AS:SkinButton(_G["StaticPopup"..i.."Button"..j])
			-- AS:SkinEditBox(_G["StaticPopup"..i.."EditBox"])
			-- AS:SkinEditBox(_G["StaticPopup"..i.."MoneyInputFrameGold"])
			-- AS:SkinEditBox(_G["StaticPopup"..i.."MoneyInputFrameSilver"])
			-- AS:SkinEditBox(_G["StaticPopup"..i.."MoneyInputFrameCopper"])
			-- _G["StaticPopup"..i.."EditBox"].backdrop:SetPoint("TOPLEFT", -2, -4)
			-- _G["StaticPopup"..i.."EditBox"].backdrop:SetPoint("BOTTOMRIGHT", 2, 4)
			-- _G["StaticPopup"..i.."ItemFrameNameFrame"]:Kill()
			-- _G["StaticPopup"..i.."ItemFrame"]:GetNormalTexture():Kill()
			-- AS:SetTemplate(_G["StaticPopup"..i.."ItemFrame"], 'Default')
			-- AS:StyleButton(_G["StaticPopup"..i.."ItemFrame"])
			-- AS:SkinTexture(_G["StaticPopup"..i.."ItemFrameIconTexture"])
			-- _G["StaticPopup"..i.."ItemFrameIconTexture"]:ClearAllPoints()
			-- _G["StaticPopup"..i.."ItemFrameIconTexture"]:Point("TOPLEFT", 2, -2)
			-- _G["StaticPopup"..i.."ItemFrameIconTexture"]:Point("BOTTOMRIGHT", -2, 2)
		-- end
	-- end

	-- -- reskin all esc/menu buttons
	-- local BlizzardMenuButtons = {
		-- "Options", 
		-- "SoundOptions", 
		-- "UIOptions", 
		-- "Keybindings", 
		-- "Macros",
		-- "Ratings",
		-- "AddOns", 
		-- "Logout", 
		-- "Quit", 
		-- "Continue", 
		-- "MacOptions",
		-- "Help",
		-- "Store",
	-- }

	-- for i = 1, getn(BlizzardMenuButtons) do
		-- local button = _G["GameMenuButton"..BlizzardMenuButtons[i]]
		-- if button then
			-- AS:SkinButton(button)
		-- end
	-- end

	-- if IsAddOnLoaded("OptionHouse") then
		-- AS:SkinButton(GameMenuButtonOptionHouse)
	-- end

	-- -- hide header textures and move text/buttons.
	-- local BlizzardHeader = {
		-- "GameMenuFrame", 
	-- }

	-- for i = 1, getn(BlizzardHeader) do
		-- local title = _G[BlizzardHeader[i].."Header"]			
		-- if title then
			-- title:SetTexture("")
			-- title:ClearAllPoints()
			-- title:SetPoint("TOP", GameMenuFrame, 0, 7)
		-- end
	-- end

	-- here we reskin all "normal" buttons
	-- local BlizzardButtons = {
		-- "ReadyCheckFrameYesButton",
		-- "ReadyCheckFrameNoButton",
		-- "StackSplitOkayButton",
		-- "StackSplitCancelButton",
		-- "RolePollPopupAcceptButton",
		-- "CompactUnitFrameProfilesGeneralOptionsFrameResetPositionButton",
	-- }

	-- for i = 1, getn(BlizzardButtons) do
		-- local Buttons = _G[BlizzardButtons[i]]
		-- if Buttons then
			-- AS:SkinButton(Buttons)
		-- end
	-- end

	-- if a button position is not really where we want, we move it here
	-- _G["ReadyCheckFrameYesButton"]:SetParent(_G["ReadyCheckFrame"])
	-- _G["ReadyCheckFrameNoButton"]:SetParent(_G["ReadyCheckFrame"])
	-- _G["ReadyCheckFrameYesButton"]:ClearAllPoints()
	-- _G["ReadyCheckFrameNoButton"]:ClearAllPoints()
	-- _G["ReadyCheckFrameYesButton"]:SetPoint("RIGHT", _G["ReadyCheckFrame"], "CENTER", -2, -20)
	-- _G["ReadyCheckFrameNoButton"]:SetPoint("LEFT", _G["ReadyCheckFrameYesButton"], "RIGHT", 3, 0)
	-- _G["ReadyCheckFrameText"]:SetParent(_G["ReadyCheckFrame"])	
	-- _G["ReadyCheckFrameText"]:ClearAllPoints()
	-- _G["ReadyCheckFrameText"]:SetPoint("TOP", 0, -12)

	AS:SetTemplate(_G["GeneralDockManagerOverflowButtonList"])

	AS:SetTemplate(RolePollPopup, 'Default')
	AS:CreateShadow(RolePollPopup)
	AS:SkinCloseButton(RolePollPopupCloseButton)
	
	AS:StripTextures(BasicScriptErrors)
	AS:SetTemplate(BasicScriptErrors)
	AS:CreateShadow(BasicScriptErrors)
	AS:SkinButton(BasicScriptErrorsButton)
	BasicScriptErrors:SetScale(AS.UIScale)
	
	-- for i = 1, 4 do
		-- local button = _G["StaticPopup"..i.."CloseButton"]
		-- button:SetNormalTexture("")
		-- button.SetNormalTexture = T.dummy
		-- button:SetPushedTexture("")
		-- button.SetPushedTexture = T.dummy
		-- AS:SkinCloseButton(button)
	-- end

	-- -- mac option 
	-- AS:StripTextures(MacOptionsFrame)
	-- AS:SetTemplate(MacOptionsFrame)
	-- AS:SkinButton(MacOptionsButtonCompress)
	-- AS:SkinButton(MacOptionsButtonKeybindings)
	-- AS:SkinButton(MacOptionsFrameDefaults)
	-- AS:SkinButton(MacOptionsFrameOkay)
	-- AS:SkinButton(MacOptionsFrameCancel)
	-- AS:StripTextures(MacOptionsFrameMovieRecording)
	-- AS:StripTextures(MacOptionsITunesRemote)
	-- AS:StripTextures(MacOptionsFrameMisc)

	-- AS:SkinDropDownBox(MacOptionsFrameResolutionDropDown)
	-- AS:SkinDropDownBox(MacOptionsFrameFramerateDropDown)
	-- AS:SkinDropDownBox(MacOptionsFrameCodecDropDown)
	-- MacOptionsFrameQualitySlider:SkinSlideBar(10)

	-- for i = 1, 11 do
		-- local b = _G["MacOptionsFrameCheckButton"..i]
		-- AS:SkinCheckBox(b)
	-- end

	-- MacOptionsButtonKeybindings:ClearAllPoints()
	-- MacOptionsButtonKeybindings:SetPoint("LEFT", MacOptionsFrameDefaults, "RIGHT", 2, 0)
	-- MacOptionsFrameOkay:ClearAllPoints()
	-- MacOptionsFrameOkay:SetPoint("LEFT", MacOptionsButtonKeybindings, "RIGHT", 2, 0)
	-- MacOptionsFrameCancel:ClearAllPoints()
	-- MacOptionsFrameCancel:SetPoint("LEFT", MacOptionsFrameOkay, "RIGHT", 2, 0)
	-- MacOptionsFrameCancel:SetWidth(MacOptionsFrameCancel:GetWidth() - 6)
end

AS:RegisterSkin('Blizzard_Others', AS.Blizzard_Others)