local AS, L, S, R = unpack(AddOnSkins)

function R:Outfitter()
	if AS.Retail then
		CharacterFrame:HookScript('OnShow', function(self) PaperDollSidebarTabs:SetPoint('BOTTOMRIGHT', CharacterFrameInsetRight, 'TOPRIGHT', -14, 0) end)
	end

	OutfitterFrame:HookScript('OnShow', function(self)
		S:HandleFrame(OutfitterFrame)
		OutfitterFrameTab1:SetSize(60, 25)
		OutfitterFrameTab2:SetSize(60, 25)
		OutfitterFrameTab3:SetSize(60, 25)
		S:StripTextures(OutfitterMainFrame, true)
		for i = 0, 13 do
			if _G['OutfitterItem'..i..'OutfitSelected'] then
				S:HandleButton(_G['OutfitterItem'..i..'OutfitSelected'])
				_G['OutfitterItem'..i..'OutfitSelected']:ClearAllPoints()
				_G['OutfitterItem'..i..'OutfitSelected']:SetSize(16, 16)
				_G['OutfitterItem'..i..'OutfitSelected']:SetPoint('LEFT', _G['OutfitterItem'..i..'Outfit'], 'LEFT', 8, 0)
			end
		end
	end)

	local index = 0
	local function SkinDropdownList()
		if _G['LibDropdownFrame'..index] then
			S:SetTemplate(_G['LibDropdownFrame'..index])
			index = index + 1
		end
	end

	OutfitterFrame:HookScript("OnUpdate", SkinDropdownList)
	OutfitterMinimapButton:HookScript("OnUpdate", SkinDropdownList)

	S:StripTextures(OutfitterMainFrameScrollbarTrench, true)
	OutfitterFrameTab1:ClearAllPoints()
	OutfitterFrameTab2:ClearAllPoints()
	OutfitterFrameTab3:ClearAllPoints()
	if AS.Retail then
		OutfitterFrameTab3:SetPoint('BOTTOMLEFT', OutfitterFrame, 'BOTTOMLEFT', 60, -25)
		OutfitterFrameTab2:SetPoint('LEFT', OutfitterFrameTab3, 'LEFT', 0, 0)
		OutfitterFrameTab1:SetPoint('LEFT', OutfitterFrameTab2, 'LEFT', 0, 0)
	else
		OutfitterFrameTab1:SetPoint('TOPLEFT', OutfitterFrame, 'BOTTOMRIGHT', -65, -2)
		OutfitterFrameTab2:SetPoint('LEFT', OutfitterFrameTab1, 'LEFT', -65, 0)
		OutfitterFrameTab3:SetPoint('LEFT', OutfitterFrameTab2, 'LEFT', -65, 0)
	end
	S:HandleButton(OutfitterFrameTab1, true)
	S:HandleButton(OutfitterFrameTab2, true)
	S:HandleButton(OutfitterFrameTab3, true)
	S:HandleScrollBar(OutfitterMainFrameScrollFrameScrollBar)
	S:HandleCloseButton(OutfitterCloseButton)
	S:HandleButton(OutfitterNewButton)
	S:HandleButton(OutfitterEnableNone)
	S:HandleButton(OutfitterEnableAll)
	OutfitterSlotEnables:SetFrameStrata('HIGH')
	S:HandleCheckBox(OutfitterEnableHeadSlot)
	S:HandleCheckBox(OutfitterEnableNeckSlot)
	S:HandleCheckBox(OutfitterEnableShoulderSlot)
	S:HandleCheckBox(OutfitterEnableBackSlot)
	S:HandleCheckBox(OutfitterEnableChestSlot)
	S:HandleCheckBox(OutfitterEnableShirtSlot)
	S:HandleCheckBox(OutfitterEnableTabardSlot)
	S:HandleCheckBox(OutfitterEnableWristSlot)
	S:HandleCheckBox(OutfitterEnableMainHandSlot)
	S:HandleCheckBox(OutfitterEnableSecondaryHandSlot)
	S:HandleCheckBox(OutfitterEnableHandsSlot)
	S:HandleCheckBox(OutfitterEnableWaistSlot)
	S:HandleCheckBox(OutfitterEnableLegsSlot)
	S:HandleCheckBox(OutfitterEnableFeetSlot)
	S:HandleCheckBox(OutfitterEnableFinger0Slot)
	S:HandleCheckBox(OutfitterEnableFinger1Slot)
	S:HandleCheckBox(OutfitterEnableTrinket0Slot)
	S:HandleCheckBox(OutfitterEnableTrinket1Slot)
	S:HandleButton(OutfitterItemComparisons)
	S:HandleButton(OutfitterTooltipInfo)
	S:HandleButton(OutfitterShowHotkeyMessages)
	S:HandleButton(OutfitterShowMinimapButton)
	S:HandleButton(OutfitterShowOutfitBar)
	S:HandleButton(OutfitterAutoSwitch)
	OutfitterItemComparisons:SetSize(20, 20)
	OutfitterTooltipInfo:SetSize(20, 20)
	OutfitterShowHotkeyMessages:SetSize(20, 20)
	OutfitterShowMinimapButton:SetSize(20, 20)
	OutfitterShowOutfitBar:SetSize(20, 20)
	OutfitterAutoSwitch:SetSize(20, 20)
	OutfitterShowOutfitBar:SetPoint('TOPLEFT', OutfitterAutoSwitch, 'BOTTOMLEFT', 0, -5)
	S:HandleButton(OutfitterEditScriptDialogDoneButton)
	S:HandleButton(OutfitterEditScriptDialogCancelButton)
	S:HandleScrollBar(OutfitterEditScriptDialogSourceScriptScrollBar)
	S:HandleFrame(OutfitterEditScriptDialogSourceScript, true)
	S:HandleFrame(OutfitterEditScriptDialog)
	S:HandleCloseButton(OutfitterEditScriptDialog.CloseButton)
	S:HandleTab(OutfitterEditScriptDialogTab1)
	S:HandleTab(OutfitterEditScriptDialogTab2)
end

AS:RegisterSkin('Outfitter')
