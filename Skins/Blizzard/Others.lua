local AS = unpack(AddOnSkins)

function AS:Blizzard_Others()
	local function SkinNavBarButtons(self)
		local navButton = self.navList[#self.navList]
		if navButton and not navButton.isSkinned then
			AS:SkinButton(navButton, true)
			if navButton.MenuArrowButton then
				AS:SkinArrowButton(navButton.MenuArrowButton)
				navButton.MenuArrowButton:SetBackdrop(nil)
				navButton.MenuArrowButton:SetSize(22, 22)
			end

			navButton.xoffset = 1

			navButton.isSkinned = true
		end
	end
	hooksecurefunc("NavBar_AddButton", SkinNavBarButtons)

	AS:SkinBackdropFrame(LFDRoleCheckPopup)
	AS:SkinButton(LFDRoleCheckPopupAcceptButton)
	AS:SkinButton(LFDRoleCheckPopupDeclineButton)
	AS:SkinCheckBox(LFDRoleCheckPopupRoleButtonTank.checkButton)
	AS:SkinCheckBox(LFDRoleCheckPopupRoleButtonDPS.checkButton)
	AS:SkinCheckBox(LFDRoleCheckPopupRoleButtonHealer.checkButton)

	AS:SetTemplate(CinematicFrameCloseDialog)
	CinematicFrameCloseDialog:SetScale(UIParent:GetScale())
	AS:SkinButton(CinematicFrameCloseDialogConfirmButton)
	AS:SkinButton(CinematicFrameCloseDialogResumeButton)

	AS:SetTemplate(MovieFrame.CloseDialog)
	MovieFrame.CloseDialog:SetScale(UIParent:GetScale())
	AS:SkinButton(MovieFrame.CloseDialog.ConfirmButton)
	AS:SkinButton(MovieFrame.CloseDialog.ResumeButton)

	AS:SkinFrame(ReportCheatingDialog)
	AS:SkinButton(ReportCheatingDialog.reportButton)
	AS:SkinButton(ReportCheatingDialogCancelButton)
	AS:StripTextures(ReportCheatingDialog.CommentFrame)
	AS:SkinEditBox(ReportCheatingDialog.CommentFrame.EditBox)

	for i = 1, 4 do
		local Popup = _G["StaticPopup"..i]

		AS:SkinFrame(Popup, nil, true)

		for j = 1, 4 do
			AS:SkinButton(Popup['button'..j])
		end

		AS:SkinButton(Popup.extraButton)

		AS:SkinEditBox(_G["StaticPopup"..i.."EditBox"])
		_G["StaticPopup"..i.."EditBox"].Backdrop:SetPoint("TOPLEFT", -2, -4)
		_G["StaticPopup"..i.."EditBox"].Backdrop:SetPoint("BOTTOMRIGHT", 2, 4)

		AS:SkinEditBox(_G["StaticPopup"..i.."MoneyInputFrameGold"])
		AS:SkinEditBox(_G["StaticPopup"..i.."MoneyInputFrameSilver"])
		AS:SkinEditBox(_G["StaticPopup"..i.."MoneyInputFrameCopper"])

		AS:SkinFrame(Popup.ItemFrame)
		AS:StyleButton(Popup.ItemFrame)
		AS:SkinTexture(Popup.ItemFrame.icon)
		Popup.ItemFrame.icon:SetInside()
	end

	AS:SetTemplate(_G["GeneralDockManagerOverflowButtonList"])

	AS:SetTemplate(RolePollPopup, 'Default')
	AS:CreateShadow(RolePollPopup)
	AS:SkinCloseButton(RolePollPopupCloseButton)

	-- _G["ReadyCheckFrameYesButton"]:SetParent(_G["ReadyCheckFrame"])
	-- _G["ReadyCheckFrameNoButton"]:SetParent(_G["ReadyCheckFrame"])
	-- _G["ReadyCheckFrameYesButton"]:ClearAllPoints()
	-- _G["ReadyCheckFrameNoButton"]:ClearAllPoints()
	-- _G["ReadyCheckFrameYesButton"]:SetPoint("RIGHT", _G["ReadyCheckFrame"], "CENTER", -2, -20)
	-- _G["ReadyCheckFrameNoButton"]:SetPoint("LEFT", _G["ReadyCheckFrameYesButton"], "RIGHT", 3, 0)
	-- _G["ReadyCheckFrameText"]:SetParent(_G["ReadyCheckFrame"])
	-- _G["ReadyCheckFrameText"]:ClearAllPoints()
	-- _G["ReadyCheckFrameText"]:SetPoint("TOP", 0, -12)

	AS:SkinBackdropFrame(GameMenuFrame)
	AS:CreateBackdrop(GameMenuFrameHeader, 'Default')
	for i = 1, GameMenuFrame:GetNumRegions() do
		local Region = select(i, GameMenuFrame:GetRegions())
		if Region.IsObjectType and Region:IsObjectType('FontString') then
			Region:SetTextColor(1, 1, 1)
			GameMenuFrameHeader.Backdrop:SetOutside(Region, 24, 6)
			GameMenuFrameHeader.Backdrop:SetFrameLevel(GameMenuFrame:GetFrameLevel())
		end
	end
	for _, Button in pairs({GameMenuFrame:GetChildren()}) do
		if Button.IsObjectType and Button:IsObjectType("Button") then
			AS:SkinButton(Button)
		end
	end

	hooksecurefunc("UIDropDownMenu_CreateFrames", function()
		local listFrame = _G["DropDownList1"];
		local listFrameName = listFrame:GetName();
		local index = listFrame and (listFrame.numButtons + 1) or 1;
		local expandArrow = _G[listFrameName.."Button"..index.."ExpandArrow"];
		if expandArrow then
			expandArrow:SetNormalTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Arrow]])
			expandArrow:SetSize(12, 12)
			expandArrow:GetNormalTexture():SetVertexColor(NORMAL_FONT_COLOR:GetRGB())
			expandArrow:GetNormalTexture():SetRotation(AS.ArrowRotation['right'])
		end
	end)
end

AS:RegisterSkin('Blizzard_Others', AS.Blizzard_Others)
