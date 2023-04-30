local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local next = next
local hooksecurefunc = hooksecurefunc
local GetSpellTexture = GetSpellTexture

local function HandleTalentFrameDialog(dialog)
	if not dialog then return end

	S:StripTextures(dialog)
	S:CreateBackdrop(dialog)

	if dialog.AcceptButton then S:HandleButton(dialog.AcceptButton) end
	if dialog.CancelButton then S:HandleButton(dialog.CancelButton) end
	if dialog.DeleteButton then S:HandleButton(dialog.DeleteButton) end

	S:HandleEditBox(dialog.NameControl.EditBox)
	S:Point(dialog.NameControl.EditBox.backdrop, 'TOPLEFT', -5, -10)
	S:Point(dialog.NameControl.EditBox.backdrop, 'BOTTOMRIGHT', 5, 10)
end

function R:Blizzard_ClassTalentUI()
	if not AS:IsSkinEnabled('Blizzard_ClassTalentUI', 'talent') then return end

	local ClassTalentFrame = _G.ClassTalentFrame
	S:HandlePortraitFrame(ClassTalentFrame)
	ClassTalentFrame.TalentsTab.BlackBG:SetAlpha(0)
	ClassTalentFrame.TalentsTab.BottomBar:SetAlpha(0)

	S:HandleButton(ClassTalentFrame.TalentsTab.ApplyButton)
	S:HandleDropDownBox(ClassTalentFrame.TalentsTab.LoadoutDropDown.DropDownControl.DropDownMenu)

	S:HandleButton(ClassTalentFrame.TalentsTab.InspectCopyButton)

	S:FontTemplate(ClassTalentFrame.TalentsTab.ClassCurrencyDisplay.CurrencyLabel, nil, 18)
	S:FontTemplate(ClassTalentFrame.TalentsTab.ClassCurrencyDisplay.CurrencyAmount, nil, 26)

	S:FontTemplate(ClassTalentFrame.TalentsTab.SpecCurrencyDisplay.CurrencyLabel, nil, 18)
	S:FontTemplate(ClassTalentFrame.TalentsTab.SpecCurrencyDisplay.CurrencyAmount, nil, 26)

	S:HandleEditBox(ClassTalentFrame.TalentsTab.SearchBox)
	S:Point(ClassTalentFrame.TalentsTab.SearchBox.backdrop, 'TOPLEFT', -4, -5)
	S:Point(ClassTalentFrame.TalentsTab.SearchBox.backdrop, 'BOTTOMRIGHT', 0, 5)
	S:StripTextures(ClassTalentFrame.TalentsTab.SearchPreviewContainer)
	S:CreateBackdrop(ClassTalentFrame.TalentsTab.SearchPreviewContainer)

	for _, tab in next, { ClassTalentFrame.TabSystem:GetChildren() } do
		S:HandleTab(tab)
	end

	hooksecurefunc(ClassTalentFrame.SpecTab, 'UpdateSpecFrame', function(frame)
		for specContentFrame in frame.SpecContentFramePool:EnumerateActive() do
			if not specContentFrame.isSkinned then
				S:HandleButton(specContentFrame.ActivateButton)

				if specContentFrame.SpellButtonPool then
					for button in specContentFrame.SpellButtonPool:EnumerateActive() do
						if button.Ring then
							button.Ring:Hide()
						end

						if button.spellID then
							local texture = GetSpellTexture(button.spellID)
							if texture then
								button.Icon:SetTexture(texture)
							end
						end

						S:HandleIcon(button.Icon, true)
					end
				end

				specContentFrame.isSkinned = true
			end
		end
	end)

	local ImportDialog = _G.ClassTalentLoadoutImportDialog
	if ImportDialog then
		HandleTalentFrameDialog(ImportDialog)
		S:HandleFrame(ImportDialog.ImportControl.InputContainer, true)
	end

	local CreateDialog = _G.ClassTalentLoadoutCreateDialog
	if CreateDialog then
		HandleTalentFrameDialog(CreateDialog)
	end

	local EditDialog = _G.ClassTalentLoadoutEditDialog
	if EditDialog then
		HandleTalentFrameDialog(EditDialog)

		local editbox = EditDialog.LoadoutName
		if editbox then
			S:HandleEditBox(editbox)
			S:Point(editbox.backdrop, 'TOPLEFT', -5, -5)
			S:Point(editbox.backdrop, 'BOTTOMRIGHT', 5, 5)
		end

		local check = EditDialog.UsesSharedActionBars
		if check then
			S:HandleCheckBox(check.CheckButton)
			S:Size(check.CheckButton, 20)
			S:SetInside(check.CheckButton.backdrop)
		end
	end

	--PVP
	S:StripTextures(ClassTalentFrame.TalentsTab.PvPTalentList)
	S:CreateBackdrop(ClassTalentFrame.TalentsTab.PvPTalentList)
	ClassTalentFrame.TalentsTab.PvPTalentList.backdrop:SetFrameStrata(ClassTalentFrame.TalentsTab.PvPTalentList:GetFrameStrata())
	ClassTalentFrame.TalentsTab.PvPTalentList.backdrop:SetFrameLevel(2000)
end

AS:RegisterSkin('Blizzard_ClassTalentUI', nil, 'ADDON_LOADED')
