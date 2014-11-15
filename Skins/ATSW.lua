local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AdvancedTradeSkillWindow') then return end

function AS:AdvancedTradeSkillWindow()
	AS:SkinFrame(ATSWFrame)
	AS:StripTextures(ATSWSkillIcon, true)
	AS:StripTextures(ATSWListScrollFrame, true)
	AS:StripTextures(ATSWExpandButtonFrame, true)
	AS:StripTextures(ATSWRankFrameBorder, true)
	AS:SkinStatusBar(ATSWRankFrame)
	ATSWRankFrame:Size(398, 20)
	ATSWRankFrame:ClearAllPoints()
	ATSWRankFrame:Point('CENTER', ATSWFrame, 'CENTER', 165, 200)
	ATSWListScrollFrame:Width(280)
	ATSWFramePortrait:Kill()
	AS:SkinScrollBar(ATSWListScrollFrameScrollBar)
	ATSWListScrollFrameScrollBar:Point('CENTER', ATSWListScrollFrame, 'CENTER', 0, 0)

	ATSWFrame.bg1 = CreateFrame('Frame', nil, ATSWFrame)
	AS:SkinBackdropFrame(ATSWFrame.bg1)
	ATSWFrame.bg1:Point('TOPLEFT', 22, -72)
	ATSWFrame.bg1:Point('BOTTOMRIGHT', -439, 20)

	ATSWFrame.bg2 = CreateFrame('Frame', nil, ATSWFrame)
	AS:SkinBackdropFrame(ATSWFrame.bg2)
	ATSWFrame.bg2:Point('TOPLEFT', 350, -72)
	ATSWFrame.bg2:Point('BOTTOMRIGHT', -20, 20)

	AS:SkinEditBox(ATSWFilterBox)
	AS:SkinEditBox(ATSWInputBox)
	AS:SkinEditBox(ATSWCSNewCategoryBox)
	ATSWFilterBox:ClearAllPoints()
	ATSWFilterBox:Point('TOPLEFT', ATSWFrame, 'TOPLEFT', 120, -98)
	ATSWFilterBox:Width(188)

	AS:SkinDropDownBox(ATSWSubClassDropDown)
	AS:SkinDropDownBox(ATSWInvSlotDropDown)
	ATSWSubClassDropDown:ClearAllPoints()
	ATSWInvSlotDropDown:ClearAllPoints()
	ATSWSubClassDropDown:Point('TOPLEFT', ATSWFrame, 'TOPLEFT', 50, -70)
	ATSWInvSlotDropDown:Point('RIGHT', ATSWSubClassDropDown, 'RIGHT', 132, 0)

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
	ATSWCSButton:Point('LEFT', ATSWCustomSortButton, 'RIGHT', 0, -20)
	ATSWOptionsButton:Point('TOPRIGHT', ATSWFrame, 'TOPRIGHT', -20, -72)
	ATSWQueueAllButton:Point('BOTTOMLEFT', ATSWFrame, 'BOTTOMRIGHT', -418, 152)
	ATSWCreateAllButton:Point('RIGHT', ATSWQueueAllButton, 'RIGHT', 80, 0)
	ATSWDecrementButton:Point('RIGHT', ATSWQueueAllButton, 'RIGHT', 106, 0)
	ATSWIncrementButton:Point('RIGHT', ATSWDecrementButton, 'RIGHT', 52, 0)
	ATSWCreateButton:Point('RIGHT', ATSWQueueAllButton, 'RIGHT', 248, 0)
	ATSWQueueButton:Point('RIGHT', ATSWQueueAllButton, 'RIGHT', 322, 0)
	ATSWQueueButton:Width(70)
	ATSWQueueStartStopButton:Point('BOTTOMLEFT', ATSWFrame, 'BOTTOMRIGHT', -418, 20)
	ATSWQueueDeleteButton:Point('RIGHT', ATSWQueueStartStopButton, 'RIGHT', 124, 0)
	ATSWQueueDeleteButton:Width(120)
	ATSWReagentsButton:Width(120)
	ATSWReagentsButton:Point('RIGHT', ATSWQueueStartStopButton, 'RIGHT', 248, 0)

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
	ATSWCustomSortButton:Point('RIGHT', ATSWHeaderSortButton, 'RIGHT', 150, 0)
	ATSWOnlyCreatableButton:Point('TOPLEFT', ATSWFrame, 'TOPRIGHT', -140, -100)
	ATSWHeaderSortButton:Point('TOPLEFT', ATSWFrame, 'TOPLEFT', 20, -15)
	ATSWNameSortButton:Point('TOPLEFT', ATSWFrame, 'TOPLEFT', 20, -49)
	ATSWDifficultySortButton:Point('TOPLEFT', ATSWFrame, 'TOPLEFT', 20, -32)

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
			button:Point(point, anchoredto, point2, x, y - .8)
		end

		_G['ATSWReagent'..i..'NameFrame']:Kill()
	end

	AS:SkinScrollBar(ATSWCSUListScrollFrameScrollBar)
	AS:SkinScrollBar(ATSWCSSListScrollFrameScrollBar)
	AS:SkinCloseButton(ATSWCSFrameCloseButton)

	for i = 1, 4 do
		AS:SkinButton(_G['ATSWQueueItem'..i..'DeleteButton'])
	end

	ATSWQueueStartStopButton:Point('CENTER', ATSWFrame, 'TOPLEFT', 425, -480)
	ATSWAddCategoryButton:Point('LEFT', ATSWCSNewCategoryBox, 'RIGHT', 5, 0)
	ATSWFrameCloseButton:Point('TOPRIGHT', ATSWFrame, 'TOPRIGHT', -5, -5)
	ATSWBuyReagentsButton:Point('CENTER', ATSWReagentFrame, 'BOTTOMLEFT', 246, 50)
	AS:StripTextures(ATSWQueueScrollFrame, true)
	ATSWQueueScrollFrame:Width(52)
	AS:SkinScrollBar(ATSWQueueScrollFrameScrollBar)
	AS:SkinNextPrevButton(ATSWIncrementButton)
	AS:SkinNextPrevButton(ATSWDecrementButton)
	AS:SkinButton(ATSWAutoBuyButton)

	AS:SkinFrame(ATSWShoppingListFrame)
	ATSWShoppingListFrame:SetScript('OnUpdate', function(self)
		self:Size(475,150)
		self:ClearAllPoints()
		self:Point('TOPRIGHT', AuctionFrame, 'BOTTOMRIGHT', 0, -1)
	end)
	AS:SkinButton(ATSWSLCloseButton, true)
	ATSWSLCloseButton:ClearAllPoints()
	ATSWSLCloseButton:Point('TOPRIGHT', ATSWShoppingListFrame, 'TOPRIGHT', -5, -5)
	AS:StripTextures(ATSWSLScrollFrame, true)
	AS:SkinScrollBar(ATSWSLScrollFrameScrollBar)

	AS:SkinButton(ATSWScanDelayFrameSkipButton)
	AS:SkinButton(ATSWScanDelayFrameAbortButton)
	AS:SkinFrame(ATSWScanDelayFrame)
	AS:SkinStatusBar(ATSWScanDelayFrameBar, true)
	ATSWInputBox:SetJustifyH('CENTER')
end

AS:RegisterSkin('AdvancedTradeSkillWindow', AS.AdvancedTradeSkillWindow)