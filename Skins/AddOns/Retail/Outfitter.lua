if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Outfitter') then return end

function AS:Outfitter()
	local LDD = LibStub("LibDropdownMC-1.0")
	CharacterFrame:HookScript('OnShow', function(self) PaperDollSidebarTabs:SetPoint('BOTTOMRIGHT', CharacterFrameInsetRight, 'TOPRIGHT', -14, 0) end)
	OutfitterFrame:HookScript('OnShow', function(self)
		AS:SkinFrame(OutfitterFrame)
		OutfitterFrameTab1:SetSize(60, 25)
		OutfitterFrameTab2:SetSize(60, 25)
		OutfitterFrameTab3:SetSize(60, 25)
		AS:StripTextures(OutfitterMainFrame, true)
		for i = 0, 13 do
			if _G['OutfitterItem'..i..'OutfitSelected'] then
				AS:SkinButton(_G['OutfitterItem'..i..'OutfitSelected'])
				_G['OutfitterItem'..i..'OutfitSelected']:ClearAllPoints()
				_G['OutfitterItem'..i..'OutfitSelected']:SetSize(16, 16)
				_G['OutfitterItem'..i..'OutfitSelected']:SetPoint('LEFT', _G['OutfitterItem'..i..'Outfit'], 'LEFT', 8, 0)
			end
		end
	end)

	local index = 0
	local function SkinDropdownList()
		if _G['LibDropdownFrame'..index] then
			AS:SetTemplate(_G['LibDropdownFrame'..index])
			index = index + 1
		end
	end

	OutfitterFrame:HookScript("OnUpdate", SkinDropdownList)
	OutfitterMinimapButton:HookScript("OnUpdate", SkinDropdownList)

	AS:StripTextures(OutfitterMainFrameScrollbarTrench, true)
	OutfitterFrameTab1:ClearAllPoints()
	OutfitterFrameTab2:ClearAllPoints()
	OutfitterFrameTab3:ClearAllPoints()
	OutfitterFrameTab1:SetPoint('TOPLEFT', OutfitterFrame, 'BOTTOMRIGHT', -65, -2)
	OutfitterFrameTab2:SetPoint('LEFT', OutfitterFrameTab1, 'LEFT', -65, 0)
	OutfitterFrameTab3:SetPoint('LEFT', OutfitterFrameTab2, 'LEFT', -65, 0)
	AS:SkinButton(OutfitterFrameTab1, true)
	AS:SkinButton(OutfitterFrameTab2, true)
	AS:SkinButton(OutfitterFrameTab3, true)
	AS:SkinScrollBar(OutfitterMainFrameScrollFrameScrollBar)
	AS:SkinCloseButton(OutfitterCloseButton)
	AS:SkinButton(OutfitterNewButton)
	AS:SkinButton(OutfitterEnableNone)
	AS:SkinButton(OutfitterEnableAll)
	OutfitterSlotEnables:SetFrameStrata('HIGH')
	AS:SkinCheckBox(OutfitterEnableHeadSlot)
	AS:SkinCheckBox(OutfitterEnableNeckSlot)
	AS:SkinCheckBox(OutfitterEnableShoulderSlot)
	AS:SkinCheckBox(OutfitterEnableBackSlot)
	AS:SkinCheckBox(OutfitterEnableChestSlot)
	AS:SkinCheckBox(OutfitterEnableShirtSlot)
	AS:SkinCheckBox(OutfitterEnableTabardSlot)
	AS:SkinCheckBox(OutfitterEnableWristSlot)
	AS:SkinCheckBox(OutfitterEnableMainHandSlot)
	AS:SkinCheckBox(OutfitterEnableSecondaryHandSlot)
	AS:SkinCheckBox(OutfitterEnableHandsSlot)
	AS:SkinCheckBox(OutfitterEnableWaistSlot)
	AS:SkinCheckBox(OutfitterEnableLegsSlot)
	AS:SkinCheckBox(OutfitterEnableFeetSlot)
	AS:SkinCheckBox(OutfitterEnableFinger0Slot)
	AS:SkinCheckBox(OutfitterEnableFinger1Slot)
	AS:SkinCheckBox(OutfitterEnableTrinket0Slot)
	AS:SkinCheckBox(OutfitterEnableTrinket1Slot)
	AS:SkinButton(OutfitterItemComparisons)
	AS:SkinButton(OutfitterTooltipInfo)
	AS:SkinButton(OutfitterShowHotkeyMessages)
	AS:SkinButton(OutfitterShowMinimapButton)
	AS:SkinButton(OutfitterShowOutfitBar)
	AS:SkinButton(OutfitterAutoSwitch)
	OutfitterItemComparisons:SetSize(20, 20)
	OutfitterTooltipInfo:SetSize(20, 20)
	OutfitterShowHotkeyMessages:SetSize(20, 20)
	OutfitterShowMinimapButton:SetSize(20, 20)
	OutfitterShowOutfitBar:SetSize(20, 20)
	OutfitterAutoSwitch:SetSize(20, 20)
	OutfitterShowOutfitBar:SetPoint('TOPLEFT', OutfitterAutoSwitch, 'BOTTOMLEFT', 0, -5)
	AS:SkinButton(OutfitterEditScriptDialogDoneButton)
	AS:SkinButton(OutfitterEditScriptDialogCancelButton)
	AS:SkinScrollBar(OutfitterEditScriptDialogSourceScriptScrollBar)
	AS:SkinBackdropFrame(OutfitterEditScriptDialogSourceScript)
	AS:SkinFrame(OutfitterEditScriptDialog)
	AS:SkinCloseButton(OutfitterEditScriptDialog.CloseButton)
	AS:SkinTab(OutfitterEditScriptDialogTab1)
	AS:SkinTab(OutfitterEditScriptDialogTab2)
end

AS:RegisterSkin('Outfitter', AS.Outfitter)
