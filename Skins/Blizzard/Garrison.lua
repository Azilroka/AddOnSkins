local AS = unpack(AddOnSkins)

function AS:Blizzard_GarrisonUI(event, addon)
	if addon ~= 'Blizzard_GarrisonUI' then return end

	AS:SkinFrame(GarrisonMissionFrame, nil, nil, true)
	AS:StripTextures(GarrisonMissionFrame.GarrCorners)
	AS:SkinCloseButton(GarrisonMissionFrame.CloseButton)

	for i = 1, 2 do
		AS:SkinTab(_G["GarrisonMissionFrameTab"..i])
		AS:SkinTab(_G["GarrisonMissionFrameMissionsTab"..i])
	end

	AS:StripTextures(GarrisonMissionFrameMissions.MaterialFrame)
	GarrisonMissionFrameMissions.MaterialFrame.Icon:SetAtlas('GarrMission_CurrencyIcon-Material')
	AS:SkinScrollBar(GarrisonMissionFrameMissionsListScrollFrameScrollBar)
	AS:StripTextures(GarrisonMissionFrameMissions)

	AS:StripTextures(GarrisonCapacitiveDisplayFrame, nil, nil, true)
	AS:CreateBackdrop(GarrisonCapacitiveDisplayFrame)
	AS:StripTextures(GarrisonCapacitiveDisplayFrameInset)
	AS:SkinCloseButton(GarrisonCapacitiveDisplayFrame.CloseButton)
	AS:SkinButton(GarrisonCapacitiveDisplayFrame.StartWorkOrderButton, true)
	AS:SkinButton(GarrisonCapacitiveDisplayFrame.CreateAllWorkOrdersButton, true)

	GarrisonCapacitiveDisplayFramePortrait:Kill()
	GarrisonCapacitiveDisplayFrameLeft:SetTexture(nil)
	GarrisonCapacitiveDisplayFrameMiddle:SetTexture(nil)
	GarrisonCapacitiveDisplayFrameRight:SetTexture(nil)

	GarrisonCapacitiveDisplayFrame.CapacitiveDisplay.IconBG:SetTexture(nil)

	AS:SkinArrowButton(GarrisonCapacitiveDisplayFrame.DecrementButton)
	AS:SkinArrowButton(GarrisonCapacitiveDisplayFrame.IncrementButton)
	AS:SkinEditBox(GarrisonCapacitiveDisplayFrame.Count)

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_OrderHallUI(event, addon)
	if addon ~= 'Blizzard_OrderHallUI' then return end

	-- CommandBar
	AS:SkinBackdropFrame(OrderHallCommandBar)
	OrderHallCommandBar.ClassIcon:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
	OrderHallCommandBar.ClassIcon:SetSize(46, 20)
	OrderHallCommandBar.CurrencyIcon:SetAtlas("legionmission-icon-currency", false)
	OrderHallCommandBar.AreaName:SetVertexColor(unpack(AS.ClassColor))
	OrderHallCommandBar.WorldMapButton:Hide()

	-- Talent Frame
	local function colorBorder(child, backdrop, atlas)
		if child.AlphaIconOverlay:IsShown() then
			local alpha = child.AlphaIconOverlay:GetAlpha()
			if alpha <= 0.5 then
				backdrop:SetBackdropBorderColor(0.5, 0.5, 0.5)
				child.darkOverlay:SetColorTexture(0, 0, 0, 0.50)
				child.darkOverlay:Show()
			elseif alpha <= 0.7 then
				backdrop:SetBackdropBorderColor(0, 1, 1)
				child.darkOverlay:SetColorTexture(0, 0, 0, 0.25)
				child.darkOverlay:Show()
			end
		elseif atlas == "orderhalltalents-spellborder-green" then
			backdrop:SetBackdropBorderColor(0, 1, 0)
			child.darkOverlay:Hide()
		elseif atlas == "orderhalltalents-spellborder-yellow" then
			backdrop:SetBackdropBorderColor(1, 1, 0)
			child.darkOverlay:Hide()
		elseif atlas == "orderhalltalents-spellborder" then
			backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			child.darkOverlay:SetColorTexture(0, 0, 0, 0.75)
			child.darkOverlay:Show()
		end
	end

	OrderHallTalentFrame:HookScript("OnShow", function(self)
		if self.StyleFrame and self.StyleFrame.Background and self.StyleFrame.Background.GetTexture and self.StyleFrame.Background:GetTexture() then
			self.StyleFrame:SetFrameLevel(1)

			for i = 1, self.StyleFrame:GetNumRegions() do
				local region = select(i, self.StyleFrame:GetRegions())
				if region and region:IsObjectType('Texture') then
					if region == self.StyleFrame.Background then
						region:SetAllPoints()
						region:SetDrawLayer("ARTWORK", 1)
						region:SetAlpha(0.8)
					elseif region == self.StyleFrame.CurrencyBG then
						region:SetDrawLayer("ARTWORK", 2)
						region:SetAlpha(0.4)
					else
						region:Hide()
					end
				end
			end
		elseif self.Background then
			self.Background:SetDrawLayer("ARTWORK")
			self.Background:SetAlpha(0.8)
		end

		if self.PortraitFrame then self.PortraitFrame:Hide() end
		if self.CornerLogo then self.CornerLogo:Hide() end
		if self.portrait then self.portrait:Hide() end
		if self.skinned then return end

		for i = 1, self:GetNumRegions() do
			local region = select(i, self:GetRegions())
			if region and region:IsObjectType('Texture') then
				if not ((region == self.Background) or (self.Currency and self.Currency.Icon and region == self.Currency.Icon)) then
					region:SetTexture(nil)
				end
			end
		end

		AS:SetTemplate(self)
		AS:SkinCloseButton(self.CloseButton)
		AS:SkinButton(self.BackButton)
		AS:StripTextures(self.LeftInset)

		for i = 1, self:GetNumChildren() do
			local child = select(i, self:GetChildren())
			if child and child.Icon and child.DoneGlow and not child.Backdrop then
				child:StyleButton()
				AS:CreateBackdrop(child)
				child.Border:SetAlpha(0)
				child.Highlight:SetAlpha(0)
				child.AlphaIconOverlay:SetTexture(nil)
				AS:SkinTexture(child.Icon)
				child.Backdrop:SetFrameLevel(child.Backdrop:GetFrameLevel() + 1)

				child.darkOverlay = child:CreateTexture()
				child.darkOverlay:SetAllPoints(child.Icon)
				child.darkOverlay:SetDrawLayer('OVERLAY')
				child.darkOverlay:Hide()

				colorBorder(child, child.Backdrop, child.Border:GetAtlas())

				child.TalentDoneAnim:HookScript("OnFinished", function()
					child.Border:SetAlpha(0) -- clear the yellow glow border again, after it finishes the animation
				end)
			end
		end

		self.choiceTexturePool:ReleaseAll()

		hooksecurefunc(self, "RefreshAllData", function(frame)
			frame.choiceTexturePool:ReleaseAll()

			for i = 1, frame:GetNumChildren() do
				local child = select(i, frame:GetChildren())
				if child and child.Icon and child.Backdrop then
					colorBorder(child, child.Backdrop, child.Border:GetAtlas())
				end
			end
		end)

		self.skinned = true
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_GarrisonUI', AS.Blizzard_GarrisonUI, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_OrderHallUI', AS.Blizzard_OrderHallUI, 'ADDON_LOADED')