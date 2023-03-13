local AS, L, S, R = unpack(AddOnSkins)

function R:InvenMount(event, addon)
	if addon == "Blizzard_PetJournal" or event == 'PLAYER_ENTERING_WORLD' and IsAddOnLoaded("Blizzard_PetJournal") then
		for i = 1, #MountJournal.ListScrollFrame.buttons do
			local Button = _G["MountJournalListScrollFrameButton"..i]
			Button.checkbox:ClearAllPoints()
			Button.checkbox:SetPoint("RIGHT", Button, "RIGHT", 0, 0)
			S:StripTextures(Button.checkbox)
			S:SetTemplate(Button.checkbox, 'Default')
			Button.checkbox:SetSize(12, 12)

			if Button.checkbox.SetCheckedTexture then
				Button.checkbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
				S:SetInside(Button.checkbox:GetCheckedTexture(), nil, -4, -4)
			end

			if Button.checkbox.SetDisabledTexture then
				Button.checkbox:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
				S:SetInside(Button.checkbox:GetDisabledTexture(), nil, -4, -4)
			end

			Button.checkbox:HookScript('OnDisable', function(s)
				if not s.SetDisabledTexture then return end
				if s:GetChecked() then
					s:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
				else
					s:SetDisabledTexture("")
				end
			end)
			Button.checkbox.SetNormalTexture = S.noop
			Button.checkbox.SetPushedTexture = S.noop
			Button.checkbox.SetHighlightTexture = S.noop
		end
		for _, obj in next, { MountJournal:GetChildren() } do
			if obj:IsObjectType('CheckButton') then
				S:HandleCheckBox(obj)
			end
		end
		S:HandleEditBox(InvenMountSearchBox)
		S:HandleButton(InvenMountFilterButton)
		local a, b, c, d, e = InvenMountFilterButton:GetPoint()
		InvenMountFilterButton:SetPoint(a, b, c, -2, -8)
		AS:UnregisterSkinEvent('InvenMount', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('InvenMount', nil, 'ADDON_LOADED')
