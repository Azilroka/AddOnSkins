local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('InvenMount') then return end

local name = 'InvenMountSkin'
function AS:SkinInvenMount(event, addon)
	if addon == "Blizzard_PetJournal" or event == 'PLAYER_ENTERING_WORLD' and IsAddOnLoaded("Blizzard_PetJournal") then
		for i = 1, #MountJournal.ListScrollFrame.buttons do
			local Button = _G["MountJournalListScrollFrameButton"..i]
			Button.checkbox:ClearAllPoints()
			Button.checkbox:SetPoint("RIGHT", Button, "RIGHT", 0, 0)
			Button.checkbox:StripTextures()
			Button.checkbox:SetTemplate("Default")
			Button.checkbox:Size(12)

			if Button.checkbox.SetCheckedTexture then
				Button.checkbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
				Button.checkbox:GetCheckedTexture():SetInside(nil, -4, -4)
			end
			
			if Button.checkbox.SetDisabledTexture then
				Button.checkbox:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
				Button.checkbox:GetDisabledTexture():SetInside(nil, -4, -4)
			end

			Button.checkbox:HookScript('OnDisable', function(self)
				if not self.SetDisabledTexture then return; end
				if self:GetChecked() then
					self:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
				else
					self:SetDisabledTexture("")
				end
			end)
			Button.checkbox.SetNormalTexture = AS.Noop
			Button.checkbox.SetPushedTexture = AS.Noop
			Button.checkbox.SetHighlightTexture = AS.Noop
		end
		for i = 1, MountJournal:GetNumChildren() do
			local object = select(i, MountJournal:GetChildren())
			if object:IsObjectType('CheckButton') then
				AS:SkinCheckBox(object)
			end
		end
		AS:SkinEditBox(InvenMountSearchBox)
		AS:SkinButton(InvenMountFilterButton)
		local a, b, c, d, e = InvenMountFilterButton:GetPoint()
		InvenMountFilterButton:SetPoint(a, b, c, -2, -8)
		AS:UnregisterSkinEvent(name, 'ADDON_LOADED')
	end
end

AS:RegisterSkin(name, AS.SkinInvenMount, 'ADDON_LOADED')