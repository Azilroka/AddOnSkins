local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MrTrader') then return end

local name = "MrTraderSkin"
function AS:SkinMrTrader()
	AS:SkinFrame(MRTSkillFrame, 'Transparent', nil, true)
	MRTSkillFrameInset:StripTextures()

	MRTSkillButtons:StripTextures()
	MRTSkillListScrollFrame:StripTextures()
	AS:SkinScrollBar(MRTSkillListScrollFrameScrollBar)

	MRTSkillFilterButtons:SetWidth(160)
	AS:SkinBackdropFrame(MRTSkillFilterButtons)
	local Backdrop = MRTSkillFilterButtons.backdrop or MRTSkillFilterButtons.Backdrop
	Backdrop:Point("TOPLEFT", 0, 2)
	Backdrop:Point("BOTTOMRIGHT", -3, -1)

	MRTSkillFilterScrollFrame:StripTextures()
	AS:SkinScrollBar(MRTSkillFilterScrollFrameScrollBar)

	hooksecurefunc(MRTSkillWindow, "DrawFilters", function()
		for i = 1, 22 do
			local button = _G["MRTSkillFilterButton"..i]
			local lastButton = _G["MRTSkillFilterButton"..i-1]
			local checkbox = _G["MRTSkillFilterButton"..i.."Checkbox"]

			button:StripTextures()
			button.hover = nil
			button.pushed = nil
			button.checked = nil
			button:StyleButton()
			button.hover:SetInside(nil, 5, 0)

			if (MRTSkillFilterScrollFrameScrollBar:IsVisible()) then
				button:SetWidth(139)
			end

			if (checkbox) then
				AS:SkinCheckBox(checkbox)
			end

			if (not button:IsVisible() and lastButton) then
				lastButton:SetText("+ New Favorite Group")
			end
		end
	end)

	AS:SkinStatusBar(MRTSkillRankFrame)
	MRTSkillRankFrame:SetPoint('TOPLEFT', MRTSkillFrameMoneyBg, 'TOPLEFT', 5, -1)
	MRTSkillRankFrame:SetWidth(155)
	MRTSkillHighlightFrame:Kill()

	for i = 1, 10 do
		_G["MRTSkillButton"..i.."Border"]:Kill()
		_G["MRTSkillButton"..i]:SetTemplate()
		AS:SkinIconButton(_G["MRTSkillButton"..i.."Icon"])
		_G["MRTSkillButton"..i.."IconBorder"]:Kill()
		_G["MRTSkillButton"..i.."Icon"]:HookScript('OnUpdate', function(self)
			local Backdrop = self.backdrop or self.Backdrop
			Backdrop:SetBackdropBorderColor(_G["MRTSkillButton"..i.."IconBorder"]:GetBackdropBorderColor())
		end)
		for j = 1, 4 do
			_G["MRTSkillButton"..i.."ReagentLrg"..j.."IconTexture"]:SetTexCoord(unpack(AS.TexCoords))
			_G["MRTSkillButton"..i.."ReagentLrg"..j.."Border"]:Kill()
			_G["MRTSkillButton"..i.."ReagentLrg"..j]:StyleButton()
		end
		for j = 1, 8 do
			_G["MRTSkillButton"..i.."ReagentSml"..j.."IconTexture"]:SetTexCoord(unpack(AS.TexCoords))
			_G["MRTSkillButton"..i.."ReagentSml"..j]:StyleButton()
		end
	end

	hooksecurefunc(MRTSkillWindow, "SelectSkill", function(window, selectedButton, skillID)
		for i = 1, 10 do
			local button = _G["MRTSkillButton"..i]
			if (button == selectedButton) then
				button:SetBackdropBorderColor(1, 1, 0)
			else
				button:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end
	end);

	hooksecurefunc(MRTSkillWindow, "AdjustWindow", function()
		local expandButton = _G["MRTSkillFrameFilterExpandButton"]
		
		expandButton.icon = nil

		AS:SkinNextPrevButton(expandButton)

		if (_G["MRTSkillWindow"].isExpanded) then
			SquareButton_SetIcon(expandButton, 'LEFT')
		else
			SquareButton_SetIcon(expandButton, 'RIGHT')
		end

		expandButton:ClearAllPoints()
		expandButton:SetPoint("RIGHT", "MRTSkillFrameSortDropDown", "LEFT", 10, 4)
		expandButton:SetSize(22, 22)
	end)

	AS:SkinDropDownBox(MRTSkillFrameSortDropDown)
	AS:SkinEditBox(MRTSkillFrameSearchBox)
	AS:SkinButton(MRTSkillCreateButton, true)
	AS:SkinButton(MRTSkillCreateAllButton, true)
	AS:SkinNextPrevButton(MRTSkillDecrementButton)
	AS:SkinNextPrevButton(MRTSkillIncrementButton)
	MRTSkillDecrementButton:Size(MRTSkillCreateButton:GetHeight())
	MRTSkillIncrementButton:Size(MRTSkillCreateButton:GetHeight())
	AS:SkinEditBox(MRTSkillInputBox)
	AS:SkinCloseButton(MRTSkillFrameCloseButton)
	AS:SkinFrame(MRTNewCategoryFrame, 'Transparent', nil, true)
	AS:SkinCloseButton(MRTNewCategoryFrameDetailCloseButton)
	AS:SkinEditBox(MRTNewCategoryFrameCategoryName)
	AS:SkinButton(MRTNewCategoryFrameOkayButton)
	AS:SkinButton(MRTNewCategoryFrameCancelButton)
end

AS:RegisterSkin(name, AS.SkinMrTrader)