local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AdvancedTradeSkillWindow') then return end

function AS:AdvancedTradeSkillWindow()
	AS:SkinFrame(ATSWFrame)
	AS:StripTextures(ATSWSkillIcon, true)
	AS:StripTextures(ATSWListScrollFrame, true)
	AS:StripTextures(ATSWExpandButtonFrame, true)
	AS:StripTextures(ATSWRankFrameBorder, true)
	AS:SkinStatusBar(ATSWRankFrame)
	ATSWRankFrame:SetSize(398, 20)
	ATSWRankFrame:ClearAllPoints()
	ATSWRankFrame:SetPoint('CENTER', ATSWFrame, 'CENTER', 165, 200)
	ATSWListScrollFrame:SetWidth(280)
	ATSWFramePortrait:Kill()
	AS:SkinScrollBar(ATSWListScrollFrameScrollBar)
	ATSWListScrollFrameScrollBar:SetPoint('CENTER', ATSWListScrollFrame, 'CENTER', 0, 0)

	ATSWFrame.bg1 = CreateFrame('Frame', nil, ATSWFrame)
	AS:SkinBackdropFrame(ATSWFrame.bg1)
	ATSWFrame.bg1:SetPoint('TOPLEFT', 22, -72)
	ATSWFrame.bg1:SetPoint('BOTTOMRIGHT', -439, 20)

	ATSWFrame.bg2 = CreateFrame('Frame', nil, ATSWFrame)
	AS:SkinBackdropFrame(ATSWFrame.bg2)
	ATSWFrame.bg2:SetPoint('TOPLEFT', 350, -72)
	ATSWFrame.bg2:SetPoint('BOTTOMRIGHT', -20, 20)

	AS:SkinEditBox(ATSWFilterBox)
	AS:SkinEditBox(ATSWInputBox)
	AS:SkinEditBox(ATSWCSNewCategoryBox)
	ATSWFilterBox:ClearAllPoints()
	ATSWFilterBox:SetPoint('TOPLEFT', ATSWFrame, 'TOPLEFT', 120, -98)
	ATSWFilterBox:SetWidth(188)

	AS:SkinDropDownBox(ATSWSubClassDropDown)
	AS:SkinDropDownBox(ATSWInvSlotDropDown)
	ATSWSubClassDropDown:ClearAllPoints()
	ATSWInvSlotDropDown:ClearAllPoints()
	ATSWSubClassDropDown:SetPoint('TOPLEFT', ATSWFrame, 'TOPLEFT', 50, -70)
	ATSWInvSlotDropDown:SetPoint('RIGHT', ATSWSubClassDropDown, 'RIGHT', 132, 0)

	AS:SkinButton(ATSWQueueAllButton)
	AS:SkinButton(ATSWCreateAllButton)
	AS:SkinButton(ATSWCreateButton)
	AS:SkinButton(ATSWQueueButton)
	AS:SkinButton(ATSWQueueStartStopButton)
	AS:SkinButton(ATSWQueueDeleteButton)
	AS:SkinButton(ATSWReagentsButton)
	AS:SkinButton(ATSWOptionsButton)
	AS:SkinButton(ATSWCSButton)
	AS:SkinButton(ATSWBuyReagentsButton)
	AS:SkinButton(ATSWOptionsFrameOKButton)
	AS:SkinButton(ATSWAddCategoryButton)
	AS:SkinCloseButton(ATSWFrameCloseButton)
	AS:SkinCloseButton(ATSWReagentFrameCloseButton)
	ATSWOptionsButton:ClearAllPoints()
	ATSWIncrementButton:ClearAllPoints()
	ATSWDecrementButton:ClearAllPoints()
	ATSWQueueAllButton:ClearAllPoints()
	ATSWQueueButton:ClearAllPoints()
	ATSWCreateButton:ClearAllPoints()
	ATSWQueueDeleteButton:ClearAllPoints()
	ATSWReagentsButton:ClearAllPoints()
	ATSWCSButton:SetPoint('LEFT', ATSWCustomSortButton, 'RIGHT', 0, -20)
	ATSWOptionsButton:SetPoint('TOPRIGHT', ATSWFrame, 'TOPRIGHT', -20, -72)
	ATSWQueueAllButton:SetPoint('BOTTOMLEFT', ATSWFrame, 'BOTTOMRIGHT', -418, 152)
	ATSWCreateAllButton:SetPoint('RIGHT', ATSWQueueAllButton, 'RIGHT', 80, 0)
	ATSWDecrementButton:SetPoint('RIGHT', ATSWQueueAllButton, 'RIGHT', 106, 0)
	ATSWIncrementButton:SetPoint('RIGHT', ATSWDecrementButton, 'RIGHT', 52, 0)
	ATSWCreateButton:SetPoint('RIGHT', ATSWQueueAllButton, 'RIGHT', 248, 0)
	ATSWQueueButton:SetPoint('RIGHT', ATSWQueueAllButton, 'RIGHT', 322, 0)
	ATSWQueueButton:SetWidth(70)
	ATSWQueueStartStopButton:SetPoint('BOTTOMLEFT', ATSWFrame, 'BOTTOMRIGHT', -418, 20)
	ATSWQueueDeleteButton:SetPoint('RIGHT', ATSWQueueStartStopButton, 'RIGHT', 124, 0)
	ATSWQueueDeleteButton:SetWidth(120)
	ATSWReagentsButton:SetWidth(120)
	ATSWReagentsButton:SetPoint('RIGHT', ATSWQueueStartStopButton, 'RIGHT', 248, 0)

	AS:SkinCheckBox(ATSWHeaderSortButton)
	AS:SkinCheckBox(ATSWNameSortButton)
	AS:SkinCheckBox(ATSWDifficultySortButton)
	AS:SkinCheckBox(ATSWCustomSortButton)
	AS:SkinCheckBox(ATSWOnlyCreatableButton)
	AS:SkinCheckBox(ATSWOFUnifiedCounterButton)
	AS:SkinCheckBox(ATSWOFSeparateCounterButton)
	AS:SkinCheckBox(ATSWOFIncludeBankButton)
	AS:SkinCheckBox(ATSWOFIncludeAltsButton)
	AS:SkinCheckBox(ATSWOFIncludeMerchantsButton)
	AS:SkinCheckBox(ATSWOFAutoBuyButton)
	AS:SkinCheckBox(ATSWOFTooltipButton)
	AS:SkinCheckBox(ATSWOFShoppingListButton)
	AS:SkinCheckBox(ATSWOFReagentListButton)
	ATSWCustomSortButton:ClearAllPoints()
	ATSWOnlyCreatableButton:ClearAllPoints()
	ATSWCustomSortButton:SetPoint('RIGHT', ATSWHeaderSortButton, 'RIGHT', 150, 0)
	ATSWOnlyCreatableButton:SetPoint('TOPLEFT', ATSWFrame, 'TOPRIGHT', -140, -100)
	ATSWHeaderSortButton:SetPoint('TOPLEFT', ATSWFrame, 'TOPLEFT', 20, -15)
	ATSWNameSortButton:SetPoint('TOPLEFT', ATSWFrame, 'TOPLEFT', 20, -49)
	ATSWDifficultySortButton:SetPoint('TOPLEFT', ATSWFrame, 'TOPLEFT', 20, -32)

	AS:SkinTooltip(ATSWTradeskillTooltip)
	AS:SkinFrame(ATSWReagentFrame)
	AS:SkinFrame(ATSWOptionsFrame)
	ATSWOptionsFrame:SetScale(AS.UIScale)

	AS:SkinFrame(ATSWCSFrame)
	AS:StripTextures(ATSWCSUListScrollFrame, true)
	AS:StripTextures(ATSWCSSListScrollFrame, true)

	local once = false
	for i = 1, ATSW_MAX_TRADE_SKILL_REAGENTS do
		local button = _G['ATSWReagent'..i]
		local icon = _G['ATSWReagent'..i..'IconTexture']
		local count = _G['ATSWReagent'..i..'Count']
		AS:SkinTexture(icon)
		icon:SetDrawLayer('OVERLAY')

		if not icon.backdrop then
			icon.backdrop = CreateFrame('Frame', nil, button)
			icon.backdrop:SetFrameLevel(button:GetFrameLevel() - 1)
			AS:SetTemplate(icon.backdrop, 'Default')
			icon.backdrop:SetOutside(icon)
		end

		icon:SetParent(icon.backdrop)
		count:SetParent(icon.backdrop)
		count:SetDrawLayer('OVERLAY')

		if i > 2 and once == false then
			local point, anchoredto, point2, x, y = button:GetPoint()
			button:ClearAllPoints()
			button:SetPoint(point, anchoredto, point2, x, y - .8)
		end

		_G['ATSWReagent'..i..'NameFrame']:Kill()
	end

	AS:SkinScrollBar(ATSWCSUListScrollFrameScrollBar)
	AS:SkinScrollBar(ATSWCSSListScrollFrameScrollBar)
	AS:SkinCloseButton(ATSWCSFrameCloseButton)

	for i = 1, 4 do
		AS:SkinButton(_G['ATSWQueueItem'..i..'DeleteButton'])
	end

	ATSWQueueStartStopButton:SetPoint('CENTER', ATSWFrame, 'TOPLEFT', 425, -480)
	ATSWAddCategoryButton:SetPoint('LEFT', ATSWCSNewCategoryBox, 'RIGHT', 5, 0)
	ATSWFrameCloseButton:SetPoint('TOPRIGHT', ATSWFrame, 'TOPRIGHT', -5, -5)
	ATSWBuyReagentsButton:SetPoint('CENTER', ATSWReagentFrame, 'BOTTOMLEFT', 246, 50)
	AS:StripTextures(ATSWQueueScrollFrame, true)
	ATSWQueueScrollFrame:SetWidth(52)
	AS:SkinScrollBar(ATSWQueueScrollFrameScrollBar)
	AS:SkinNextPrevButton(ATSWIncrementButton)
	AS:SkinNextPrevButton(ATSWDecrementButton)
	AS:SkinButton(ATSWAutoBuyButton)

	AS:SkinFrame(ATSWShoppingListFrame)
	ATSWShoppingListFrame:SetScript('OnUpdate', function(self)
		self:SetSize(475,150)
		self:ClearAllPoints()
		self:SetPoint('TOPRIGHT', AuctionFrame, 'BOTTOMRIGHT', 0, -1)
	end)
	AS:SkinButton(ATSWSLCloseButton, true)
	ATSWSLCloseButton:ClearAllPoints()
	ATSWSLCloseButton:SetPoint('TOPRIGHT', ATSWShoppingListFrame, 'TOPRIGHT', -5, -5)
	AS:StripTextures(ATSWSLScrollFrame, true)
	AS:SkinScrollBar(ATSWSLScrollFrameScrollBar)

	AS:SkinButton(ATSWScanDelayFrameSkipButton)
	AS:SkinButton(ATSWScanDelayFrameAbortButton)
	AS:SkinFrame(ATSWScanDelayFrame)
	AS:SkinStatusBar(ATSWScanDelayFrameBar, true)
	ATSWInputBox:SetJustifyH('CENTER')
end

AS:RegisterSkin('AdvancedTradeSkillWindow', AS.AdvancedTradeSkillWindow)