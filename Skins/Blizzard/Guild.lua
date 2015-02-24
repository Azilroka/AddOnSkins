local AS = unpack(AddOnSkins)

local AddOnSkinned = 0
function AS:Blizzard_Guild(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		AS:SkinFrame(PetitionFrame, nil, nil, true)
		AS:StripTextures(PetitionFrameInset)

		AS:SkinButton(PetitionFrameRequestButton)
		PetitionFrameRequestButton:Width(110)
		AS:SkinButton(PetitionFrameRenameButton)
		AS:SkinButton(PetitionFrameCancelButton)
		AS:SkinButton(PetitionFrameSignButton)
		AS:SkinCloseButton(PetitionFrameCloseButton)

		PetitionFrameCharterTitle:SetTextColor(1, 1, 0)
		PetitionFrameCharterName:SetTextColor(1, 1, 1)
		PetitionFrameMasterTitle:SetTextColor(1, 1, 0)
		PetitionFrameMasterName:SetTextColor(1, 1, 1)
		PetitionFrameMemberTitle:SetTextColor(1, 1, 0)
		PetitionFrameInstructions:SetTextColor(1, 1, 1)

		for i = 1, 9 do
			_G["PetitionFrameMemberName"..i]:SetTextColor(1, 1, 1)
		end

		AS:SkinFrame(GuildInviteFrame)
		AS:SkinButton(GuildInviteFrameDeclineButton, true)
		AS:SkinButton(GuildInviteFrameJoinButton, true)

		AS:SkinFrame(GuildRegistrarFrame, nil, nil, true)
		AS:StripTextures(GuildRegistrarFrameInset)
		AS:StripTextures(GuildRegistrarGreetingFrame)
		AS:SkinButton(GuildRegistrarFrameGoodbyeButton)
		AS:SkinButton(GuildRegistrarFrameCancelButton)
		AS:SkinButton(GuildRegistrarFramePurchaseButton)
		AS:SkinCloseButton(GuildRegistrarFrameCloseButton)
		AS:SkinEditBox(GuildRegistrarFrameEditBox, nil, 20)
		for i = 1, GuildRegistrarFrameEditBox:GetNumRegions() do
			local region = select(i, GuildRegistrarFrameEditBox:GetRegions())
			if region:IsObjectType("Texture") and strfind(region:GetTexture(), "Interface\\ChatFrame\\UI%-ChatInputBorder%-") then
				region:Kill()
			end
		end

		for i = 1, 2 do
			_G["GuildRegistrarButton"..i]:GetFontString():SetTextColor(1, 1, 1)
		end

		GuildRegistrarPurchaseText:SetTextColor(1, 1, 1)
		AvailableServicesText:SetTextColor(1, 1, 0)

		AS:SkinFrame(TabardFrame)
		AS:StripTextures(TabardFrameInset)
		TabardFramePortrait:Kill()

		AS:SkinCloseButton(TabardFrameCloseButton)
		AS:SkinButton(TabardFrameCancelButton)
		AS:SkinButton(TabardFrameAcceptButton)

		TabardFrameAcceptButton:ClearAllPoints()
		TabardFrameAcceptButton:Point("RIGHT", TabardFrameCancelButton, "LEFT", -3, 0)

		AS:SkinRotateButton(TabardCharacterModelRotateLeftButton)
		AS:SkinRotateButton(TabardCharacterModelRotateRightButton)
		TabardCharacterModelRotateLeftButton:ClearAllPoints()
		TabardCharacterModelRotateLeftButton:Point("BOTTOMLEFT", TabardModel, "BOTTOMLEFT", 4, 4)
		TabardCharacterModelRotateRightButton:ClearAllPoints()
		TabardCharacterModelRotateRightButton:Point("LEFT", TabardCharacterModelRotateLeftButton, "RIGHT", 3, 0)

		AS:StripTextures(TabardFrameMoneyBg)
		AS:StripTextures(TabardFrameMoneyInset)
		AS:StripTextures(TabardFrameCostFrame)
		AS:StripTextures(TabardFrameCustomizationFrame)

		for i = 1, 5 do
			local Frame = _G["TabardFrameCustomization"..i]
			AS:StripTextures(Frame)
			AS:SkinNextPrevButton(_G[Frame:GetName().."LeftButton"])
			AS:SkinNextPrevButton(_G[Frame:GetName().."RightButton"])

			if i > 1 then
				Frame:ClearAllPoints()
				Frame:Point("TOP", _G["TabardFrameCustomization"..i-1], "BOTTOM", 0, -6)
			else
				local point, anchor, point2, x, y = Frame:GetPoint()
				Frame:Point(point, anchor, point2, x, y + 4)
			end
		end
	end
	if (addon == "Blizzard_GuildUI" or IsAddOnLoaded("Blizzard_GuildUI")) and not GuildFrame.isSkinned then
		AS:SkinFrame(GuildFrame, nil, nil, true)
		GuildFrame:CreateShadow('Default')

		AS:SkinCloseButton(GuildMemberDetailCloseButton)
		AS:SkinCloseButton(GuildFrameCloseButton)

		AS:StripTextures(GuildFrameInset)
		AS:StripTextures(GuildFrameBottomInset)
		AS:StripTextures(GuildAllPerksFrame)
		AS:StripTextures(GuildMemberDetailFrame)
		AS:StripTextures(GuildMemberNoteBackground)
		AS:StripTextures(GuildInfoFrameInfo)
		AS:StripTextures(GuildLogContainer)
		AS:StripTextures(GuildLogFrame)
		AS:StripTextures(GuildRewardsFrame)
		AS:StripTextures(GuildMemberOfficerNoteBackground)
		AS:StripTextures(GuildTextEditContainer)
		AS:StripTextures(GuildTextEditFrame)
		AS:StripTextures(GuildRecruitmentRolesFrame)
		AS:StripTextures(GuildRecruitmentAvailabilityFrame)
		AS:StripTextures(GuildRecruitmentInterestFrame)
		AS:StripTextures(GuildRecruitmentLevelFrame)
		AS:StripTextures(GuildRecruitmentCommentFrame)
		AS:StripTextures(GuildRecruitmentCommentInputFrame)
		AS:StripTextures(GuildInfoFrameApplicantsContainer)
		AS:StripTextures(GuildInfoFrameApplicants)
		AS:StripTextures(GuildNewsBossModel)
		AS:StripTextures(GuildNewsBossModelTextFrame)
		AS:StripTextures(GuildInfoFrameApplicantsContainerScrollBar)

		GuildRewardsFrameVisitText:ClearAllPoints()
		GuildRewardsFrameVisitText:SetPoint("TOP", GuildRewardsFrame, "TOP", 0, 30)

		AS:SkinFrame(GuildNewsBossModel)
		AS:SkinFrame(GuildNewsBossModelTextFrame)
		GuildNewsBossModelTextFrame:Point("TOPLEFT", GuildNewsBossModel, "BOTTOMLEFT", 0, -1)
		GuildNewsBossModel:Point("TOPLEFT", GuildFrame, "TOPRIGHT", 4, -43)

		AS:SkinButton(GuildMemberRemoveButton)
		AS:SkinButton(GuildMemberGroupInviteButton)
		AS:SkinButton(GuildAddMemberButton, true)
		AS:SkinButton(GuildViewLogButton, true)
		AS:SkinButton(GuildControlButton, true)
		AS:SkinButton(GuildRecruitmentListGuildButton)
		AS:SkinButton(GuildTextEditFrameAcceptButton)
		AS:SkinButton(GuildRecruitmentInviteButton)
		AS:SkinButton(GuildRecruitmentMessageButton)
		AS:SkinButton(GuildRecruitmentDeclineButton)

		local checkbuttons = {
			"Quest", 
			"Dungeon",
			"Raid",
			"PvP",
			"RP",
			"Weekdays",
			"Weekends",
			"LevelAny",
			"LevelMax",
		}

		for _, frame in pairs(checkbuttons) do
			AS:SkinCheckBox(_G["GuildRecruitment"..frame.."Button"])
		end

		AS:SkinCheckBox(GuildRecruitmentTankButton:GetChildren())
		AS:SkinCheckBox(GuildRecruitmentHealerButton:GetChildren())
		AS:SkinCheckBox(GuildRecruitmentDamagerButton:GetChildren())
		
		for i = 1, 5 do
			AS:SkinTab(_G["GuildFrameTab"..i])
		end

		AS:SkinScrollBar(GuildPerksContainerScrollBar)

		AS:SkinBackdropFrame(GuildFactionBar)
		GuildFactionBar.progress:SetTexture(AS.NormTex)
		GuildFactionBar.Backdrop:Point("TOPLEFT", GuildFactionBar.progress, "TOPLEFT", -2, 2)
		GuildFactionBar.Backdrop:Point("BOTTOMRIGHT", GuildFactionBar, "BOTTOMRIGHT", 0, 0)

		for _, Object in pairs({'Rewards', 'Perks'}) do
			for i = 1, 8 do
				local Button = _G["Guild"..Object.."ContainerButton"..i]
				AS:StripTextures(Button)
				AS:SkinTexture(Button.icon)
				Button.icon:ClearAllPoints()
				Button.icon:Point("TOPLEFT", 2, -2)
				AS:CreateBackdrop(Button, 'Default')
				Button.Backdrop:SetOutside(Button.icon)
				if Object == 'Rewards' then
					Button.Backdrop:SetScript('OnUpdate', function(self)
						local achievementID, itemID, itemName, iconTexture, repLevel, moneyCost = GetGuildRewardInfo(Button.index);
						self:SetBackdropBorderColor(unpack(AS.BorderColor))
						if itemID then
							local Quality = select(3, GetItemInfo(itemID)) 
							if Quality and Quality > 1 and BAG_ITEM_QUALITY_COLORS[Quality] then
								self:SetBackdropBorderColor(BAG_ITEM_QUALITY_COLORS[Quality].r, BAG_ITEM_QUALITY_COLORS[Quality].g, BAG_ITEM_QUALITY_COLORS[Quality].b)
							end
						end
					end)
				end
			end
		end

		AS:SkinScrollBar(GuildRosterContainerScrollBar)
		AS:SkinCheckBox(GuildRosterShowOfflineButton)
		AS:SkinDropDownBox(GuildRosterViewDropdown, 200)

		for i = 1, 4 do
			AS:StripTextures(_G["GuildRosterColumnButton"..i], true)
		end

		for i = 1, 14 do
			AS:SkinButton(_G["GuildRosterContainerButton"..i.."HeaderButton"], true)
		end

		AS:SkinFrame(GuildMemberDetailFrame)
		AS:StripTextures(GuildMemberNoteBackground)
		AS:StripTextures(GuildMemberOfficerNoteBackground)
		GuildMemberRankDropdown:SetFrameLevel(GuildMemberRankDropdown:GetFrameLevel() + 5)
		AS:SkinDropDownBox(GuildMemberRankDropdown, 175)

		AS:StripTextures(GuildNewsFrame)
		for i = 1, 17 do
			_G["GuildNewsContainerButton"..i].header:Kill()
		end

		AS:SkinFrame(GuildNewsFiltersFrame)
		AS:SkinCloseButton(GuildNewsFiltersFrameCloseButton)

		for i = 1, 6 do
			AS:SkinCheckBox(_G["GuildNewsFilterButton"..i])
		end

		GuildNewsFiltersFrame:Point("TOPLEFT", GuildFrame, "TOPRIGHT", 4, -20)
		AS:SkinScrollBar(GuildNewsContainerScrollBar)

		AS:SkinScrollBar(GuildInfoDetailsFrameScrollBar)
		AS:SkinScrollBar(GuildInfoFrameApplicantsContainerScrollBar)
		AS:SkinScrollBar(GuildInfoFrameInfoMOTDScrollFrameScrollBar)

		for i = 1, 3 do
			AS:StripTextures(_G["GuildInfoFrameTab"..i])
		end

		AS:SetTemplate(GuildRecruitmentCommentInputFrame, 'Default')

		for _, button in next, GuildInfoFrameApplicantsContainer.buttons do
			button.selectedTex:Kill()
			button:GetHighlightTexture():Kill()
			button:SetBackdrop(nil)
		end

		AS:SetTemplate(GuildTextEditFrame, 'Default')
		AS:SkinScrollBar(GuildTextEditScrollFrameScrollBar)
		AS:SetTemplate(GuildTextEditContainer, 'Default')
		for i = 1, GuildTextEditFrame:GetNumChildren() do
			local child = select(i, GuildTextEditFrame:GetChildren())
			local point = select(1, child:GetPoint())
			if point == "TOPRIGHT" then
				AS:SkinCloseButton(child)
			else
				AS:SkinButton(child, true)
			end
		end

		--Guild Log
		AS:SkinScrollBar(GuildLogScrollFrameScrollBar)
		AS:SkinFrame(GuildLogFrame)

		for i = 1, GuildLogFrame:GetNumChildren() do
			local child = select(i, GuildLogFrame:GetChildren())
			local point = select(1, child:GetPoint())
			if point == "TOPRIGHT" then
				AS:SkinCloseButton(child)
			else
				AS:SkinButton(child, true)
			end
		end

		AS:SkinScrollBar(GuildRewardsContainerScrollBar)
		GuildFrame.isSkinned = true
		AddOnSkinned = AddOnSkinned + 1
	end
	if (addon == 'Blizzard_GuildControlUI' or IsAddOnLoaded('Blizzard_GuildControlUI')) and not GuildControlUI.isSkinned then
		AS:StripTextures(GuildControlUI)
		AS:StripTextures(GuildControlUIHbar)
		AS:SetTemplate(GuildControlUI, 'Default')
		GuildControlUI:CreateShadow('Default')

		local function SkinGuildRanks()
			for i=1, GuildControlGetNumRanks() do
				local rankFrame = _G["GuildControlUIRankOrderFrameRank"..i]
				if rankFrame then
					AS:SkinButton(rankFrame.downButton)
					AS:SkinButton(rankFrame.upButton)
					AS:SkinButton(rankFrame.deleteButton)

					if not rankFrame.nameBox.backdrop then
						AS:SkinEditBox(rankFrame.nameBox)
					end

					rankFrame.nameBox.backdrop:Point("TOPLEFT", -2, -4)
					rankFrame.nameBox.backdrop:Point("BOTTOMRIGHT", -4, 4)
				end
			end				
		end
		hooksecurefunc("GuildControlUI_RankOrder_Update", SkinGuildRanks)

		GuildControlUIRankOrderFrameNewButton:HookScript("OnClick", function()
			T.Delay(1, SkinGuildRanks)
		end)

		AS:SkinDropDownBox(GuildControlUINavigationDropDown)
		GuildControlUIRankSettingsFrameRankDropDown:SkinDropDownBox(180)
		GuildControlUINavigationDropDownButton:Width(20)
		GuildControlUIRankSettingsFrameRankDropDownButton:Width(20)

		for i=1, NUM_RANK_FLAGS do
			if _G["GuildControlUIRankSettingsFrameCheckbox"..i] then
				AS:SkinCheckBox(_G["GuildControlUIRankSettingsFrameCheckbox"..i])
			end
		end

		AS:SkinButton(GuildControlUIRankOrderFrameNewButton)
		
		AS:SkinEditBox(GuildControlUIRankSettingsFrameGoldBox)
		GuildControlUIRankSettingsFrameGoldBox.backdrop:Point("TOPLEFT", -2, -4)
		GuildControlUIRankSettingsFrameGoldBox.backdrop:Point("BOTTOMRIGHT", 2, 4)
		AS:StripTextures(GuildControlUIRankSettingsFrameGoldBox)
		
		AS:StripTextures(GuildControlUIRankBankFrame)
		
		local once = false
		hooksecurefunc("GuildControlUI_BankTabPermissions_Update", function()
			local numTabs = GetNumGuildBankTabs()
			if numTabs < MAX_BUY_GUILDBANK_TABS then
				numTabs = numTabs + 1
			end
			for i=1, numTabs do
				local tab = _G["GuildControlBankTab"..i.."Owned"]
				local icon = tab.tabIcon
				local editbox = tab.editBox
				
				AS:SkinTexture(icon)
				
				if once == false then
					AS:SkinButton(_G["GuildControlBankTab"..i.."BuyPurchaseButton"])
					AS:StripTextures(_G["GuildControlBankTab"..i.."OwnedStackBox"])
				end
			end
			once = true
		end)

		GuildControlUIRankBankFrameRankDropDown:SkinDropDownBox(180)
		GuildControlUIRankBankFrameRankDropDownButton:Width(20)
		AS:SkinCloseButton(GuildControlUICloseButton)
		AS:StripTextures(GuildControlUIRankBankFrameInset)
		AS:StripTextures(GuildControlUIRankBankFrameInsetScrollFrame)
		AS:SkinScrollBar(GuildControlUIRankBankFrameInsetScrollFrameScrollBar)
		GuildControlUI.isSkinned = true
		AddOnSkinned = AddOnSkinned + 1
	end
	if (event == 'Blizzard_GuildBankUI' or IsAddOnLoaded('Blizzard_GuildBankUI')) and not GuildBankFrame.isSkinned then
		AS:SkinFrame(GuildBankFrame)
		AS:StripTextures(GuildBankEmblemFrame, true)

		AS:SkinCloseButton(GuildBankFrame.CloseButton)

		AS:SkinButton(GuildBankFrameDepositButton, true)
		AS:SkinButton(GuildBankFrameWithdrawButton, true)
		AS:SkinButton(GuildBankInfoSaveButton, true)
		AS:SkinButton(GuildBankFramePurchaseButton, true)
		AS:SkinScrollBar(GuildBankTransactionsScrollFrameScrollBar)

		GuildBankFrameWithdrawButton:Point("RIGHT", GuildBankFrameDepositButton, "LEFT", -2, 0)

		AS:StripTextures(GuildBankInfoScrollFrame)
		AS:StripTextures(GuildBankTransactionsScrollFrame)

		for i = 1, NUM_GUILDBANK_COLUMNS do
			AS:StripTextures(_G["GuildBankColumn"..i])

			for x = 1, NUM_SLOTS_PER_GUILDBANK_GROUP do
				local Button = _G["GuildBankColumn"..i.."Button"..x]
				Button:SetNormalTexture("")
				AS:StyleButton(Button)
				AS:SetTemplate(Button, 'Default', true)
				Button.icon:SetInside()
				AS:SkinTexture(Button.icon)
				Button.IconBorder:SetTexture(nil)
				hooksecurefunc(Button.IconBorder, 'SetVertexColor', function(self, r, g, b, a)
					Button:SetBackdropBorderColor(r, g, b)
				end)
				hooksecurefunc(Button.IconBorder, 'Hide', function(self)
					Button:SetBackdropBorderColor(unpack(AS.BorderColor))
				end)
			end
		end

		for i = 1, 8 do
			local button = _G["GuildBankTab"..i.."Button"]
			local texture = _G["GuildBankTab"..i.."ButtonIconTexture"]
			AS:StripTextures(_G["GuildBankTab"..i], true)

			AS:StripTextures(button)
			AS:StyleButton(button)
			AS:SetTemplate(button, 'Default', true)

			texture:ClearAllPoints()
			texture:Point("TOPLEFT", 2, -2)
			texture:Point("BOTTOMRIGHT", -2, 2)
			AS:SkinTexture(texture)
		end

		for i = 1, 4 do
			AS:SkinTab(_G["GuildBankFrameTab"..i])
		end

		--Popup
		AS:SkinFrame(GuildBankPopupFrame)
		AS:StripTextures(GuildBankPopupScrollFrame)
		AS:SkinScrollBar(GuildBankPopupScrollFrameScrollBar)
		GuildBankPopupFrame:Point("TOPLEFT", GuildBankFrame, "TOPRIGHT", 1, -30)
		AS:SkinButton(GuildBankPopupOkayButton)
		AS:SkinButton(GuildBankPopupCancelButton)
		AS:SkinEditBox(GuildBankPopupEditBox)
		GuildBankPopupNameLeft:Kill()
		GuildBankPopupNameRight:Kill()
		GuildBankPopupNameMiddle:Kill()

		for i=1, 16 do
			local button = _G["GuildBankPopupButton"..i]
			local icon = _G[button:GetName().."Icon"]
			AS:StripTextures(button)
			AS:SetTemplate(button, 'Default')
			AS:StyleButton(button)
			icon:ClearAllPoints()
			icon:Point("TOPLEFT", 2, -2)
			icon:Point("BOTTOMRIGHT", -2, 2)
			AS:SkinTexture(icon)
		end
		
		AS:SkinEditBox(GuildItemSearchBox)
		AS:StripTextures(GuildBankMoneyFrameBackground)
		AS:SkinScrollBar(GuildBankInfoScrollFrameScrollBar)
		GuildBankFrame.isSkinned = true
		AddOnSkinned = AddOnSkinned + 1
	end
	if AddOnSkinned == 3 then
		AS:UnregisterSkinEvent('Blizzard_Guild', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('Blizzard_Guild', AS.Blizzard_Guild, 'ADDON_LOADED')
