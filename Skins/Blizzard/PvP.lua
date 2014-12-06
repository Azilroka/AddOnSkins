local AS = unpack(AddOnSkins)

function AS:Blizzard_PVPUI(event, addon)
	if addon ~= "Blizzard_PVPUI" then return end
	AS:StripTextures(PVPUIFrame)
	
	AS:StripTextures(HonorFrame.RoleInset)
	
	AS:SkinCheckBox(HonorFrame.RoleInset.DPSIcon.checkButton, true)
	AS:SkinCheckBox(HonorFrame.RoleInset.TankIcon.checkButton, true)
	AS:SkinCheckBox(HonorFrame.RoleInset.HealerIcon.checkButton, true)
	
	for i = 1, 4 do
		local Button = PVPQueueFrame['CategoryButton'..i]
		AS:SkinFrame(Button, nil, true)
		Button.Background:SetTexture('')
		Button.Ring:SetTexture('')
		Button.Icon:Size(45)
		AS:SkinTexture(Button.Icon)
		AS:CreateBackdrop(Button)
		Button.Backdrop:SetOutside(Button.Icon)
		Button.Backdrop:SetFrameLevel(Button:GetFrameLevel())
		Button:SetHighlightTexture('')
		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
			self.Backdrop:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self) 
			if self:GetID() == self.isSelected then
				self:SetBackdropBorderColor(0, 0.44, .87, 1)
				self.Backdrop:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	PVPQueueFrame.CategoryButton1.Icon:SetTexture("Interface\\Icons\\achievement_bg_winwsg")
	PVPQueueFrame.CategoryButton2.Icon:SetTexture("Interface\\Icons\\achievement_bg_killxenemies_generalsroom")
	PVPQueueFrame.CategoryButton3.Icon:SetTexture("Interface\\Icons\\ability_warrior_offensivestance")
	PVPQueueFrame.CategoryButton4.Icon:SetTexture("Interface\\Icons\\Achievement_General_StayClassy")

	hooksecurefunc('PVPQueueFrame_SelectButton', function(index)
		for i = 1, 4 do
			local Button = PVPQueueFrame["CategoryButton"..i];
			if ( i == index ) then
				Button:SetBackdropBorderColor(0, 0.44, .87, 1)
				Button.Backdrop:SetBackdropBorderColor(0, 0.44, .87, 1)
				Button.isSelected = i
			else
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
				Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				Button.isSelected = 0
			end
		end
	end)

	AS:SkinDropDownBox(HonorFrameTypeDropDown)

	AS:StripTextures(HonorFrame.Inset)

	AS:SkinScrollBar(HonorFrameSpecificFrameScrollBar)
	AS:SkinButton(HonorFrameSoloQueueButton, true)
	AS:SkinButton(HonorFrameGroupQueueButton, true)
	AS:StripTextures(HonorFrame.BonusFrame)
	AS:StripTextures(HonorFrame.BonusFrame.ShadowOverlay)
	AS:StripTextures(ConquestFrame.Inset)

	for _, Section in pairs({ 'RandomBGButton', 'Arena1Button', 'Arena2Button' }) do
		local Button = HonorFrame.BonusFrame[Section]
		AS:StripTextures(Button)
		AS:SkinButton(Button)
		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self)
			if self.SelectedTexture:IsShown() then
				self:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
		Button.SelectedTexture:SetTexture('')
	end

	hooksecurefunc('HonorFrame_UpdateQueueButtons', function()
		for _, Section in pairs({ 'RandomBGButton', 'Arena1Button', 'Arena2Button' }) do
			local Button = HonorFrame.BonusFrame[Section]
			if Button.SelectedTexture:IsShown() then
				Button:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end
	end)

	AS:StripTextures(ConquestFrame)
	AS:StripTextures(ConquestFrame.ShadowOverlay)
	AS:SkinBackdropFrame(ConquestPointsBar)
	ConquestPointsBar.Backdrop:SetPoint('TOPLEFT', 0, -1)
	ConquestPointsBar.Backdrop:SetPoint('BOTTOMRIGHT', 0, 1)
	ConquestPointsBar.progress:SetTexture(AS.NormTex)
	AS:SkinButton(ConquestJoinButton, true)
	AS:SkinFrame(ConquestTooltip)

	for _, Section in pairs({ 'RatedBG', 'Arena2v2', 'Arena3v3', 'Arena5v5'}) do
		local Button = ConquestFrame[Section]
		AS:StripTextures(Button)
		AS:SkinButton(Button)
		Button:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(1, .82, 0)
		end)
		Button:HookScript('OnLeave', function(self)
			if self.SelectedTexture:IsShown() then
				self:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
		Button.SelectedTexture:SetTexture('')
	end

	hooksecurefunc('ConquestFrame_UpdateJoinButton', function()
		for _, Section in pairs({ 'RatedBG', 'Arena2v2', 'Arena3v3', 'Arena5v5'}) do
			local Button = ConquestFrame[Section]
			if Button.SelectedTexture:IsShown() then
				Button:SetBackdropBorderColor(0, 0.44, .87, 1)
			else
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end
	end)

	AS:StripTextures(WarGamesFrame)
	AS:StripTextures(WarGamesFrame.RightInset)
	AS:StripTextures(WarGamesFrame.HorizontalBar)
	AS:SkinButton(WarGameStartButton, true)
	AS:SkinScrollBar(WarGamesFrameScrollFrameScrollBar)
	AS:SkinCheckBox(WarGameTournamentModeCheckButton)

	hooksecurefunc('WarGamesFrame_Update', function()
		local scrollFrame = WarGamesFrame.scrollFrame;
		local offset = HybridScrollFrame_GetOffset(scrollFrame);
		local buttons = scrollFrame.buttons;
		local numButtons = #buttons;
		local numWarGames = GetNumWarGameTypes();
		local selectedIndex = GetSelectedWarGameType();

		for i = 1, numButtons do
			local button = buttons[i];
			local index = offset + i;
			if index <= numWarGames  then
				local name, pvpType, collapsed, id, minPlayers, maxPlayers, isRandom, iconTexture = GetWarGameTypeInfo(index);
				if not button.Entry.isSkinned then
					button.Entry:SetHighlightTexture('')
					AS:CreateBackdrop(button.Entry)
					button.Entry.Backdrop:SetInside(button.Entry, 1, 1)
					AS:SkinTexture(button.Entry.Icon)
					button.Entry.Icon:SetPoint("TOPLEFT", 6, -4)
					button.Entry.Icon.Background = CreateFrame('Frame', nil, button.Entry)
					AS:CreateBackdrop(button.Entry.Icon.Background)
					button.Entry.Icon.Background.Backdrop:SetOutside(button.Entry.Icon, 0, 0)
					button.Entry.Bg:SetTexture('')
					button.Entry.Border:SetTexture('')
					button.Entry.SelectedTexture:SetTexture('')
					button.Entry.isSkinned = true
				end
			end
		end
	end)
end

AS:RegisterSkin("Blizzard_PVPUI", AS.Blizzard_PVPUI, 'ADDON_LOADED')