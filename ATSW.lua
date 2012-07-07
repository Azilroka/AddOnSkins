	if not IsAddOnLoaded("AdvancedTradeSkillWindow") then return end

	ATSWFrame:StripTextures(true)
	ATSWSkillIcon:StripTextures(true)
	ATSWFrame:SetTemplate("Transparent")
	ATSWFrame:CreateShadow("Default")
	ATSWListScrollFrame:StripTextures(true)
	ATSWExpandButtonFrame:StripTextures()
	ATSWRankFrameBorder:StripTextures()
	ATSWRankFrame:StripTextures()
	ATSWRankFrame:CreateBackdrop("Default")
	ATSWRankFrame:SetStatusBarTexture(c["media"].normTex)
	ATSWRankFrame:SetHeight(13)
	
	cSkinEditBox(ATSWFilterBox)
	cSkinEditBox(ATSWInputBox)
	cSkinEditBox(ATSWCSNewCategoryBox)

	cSkinDropDownBox(ATSWSubClassDropDown)
	cSkinDropDownBox(ATSWInvSlotDropDown)

	cSkinButton(ATSWQueueAllButton)
	cSkinButton(ATSWCreateAllButton)
	cSkinButton(ATSWCreateButton)
	cSkinButton(ATSWQueueButton)
	cSkinButton(ATSWQueueStartStopButton)
	cSkinButton(ATSWQueueDeleteButton)
	cSkinButton(ATSWReagentsButton)
	cSkinButton(ATSWOptionsButton)
	cSkinButton(ATSWCSButton)
	cSkinButton(ATSWBuyReagentsButton)
	cSkinButton(ATSWOptionsFrameOKButton)
	cSkinButton(ATSWAddCategoryButton)

	cSkinCloseButton(ATSWFrameCloseButton)
	cSkinCloseButton(ATSWReagentFrameCloseButton)

	cSkinCheckBox(ATSWHeaderSortButton)
	cSkinCheckBox(ATSWNameSortButton)
	cSkinCheckBox(ATSWDifficultySortButton)
	cSkinCheckBox(ATSWCustomSortButton)
	cSkinCheckBox(ATSWOnlyCreatableButton)
	cSkinCheckBox(ATSWOFUnifiedCounterButton)
	cSkinCheckBox(ATSWOFSeparateCounterButton)
	cSkinCheckBox(ATSWOFIncludeBankButton)
	cSkinCheckBox(ATSWOFIncludeAltsButton)
	cSkinCheckBox(ATSWOFIncludeMerchantsButton)
	cSkinCheckBox(ATSWOFAutoBuyButton)
	cSkinCheckBox(ATSWOFTooltipButton)
	cSkinCheckBox(ATSWOFShoppingListButton)
	cSkinCheckBox(ATSWOFReagentListButton)

	--Tooltip
	ATSWTradeskillTooltip:StripTextures(true)
	ATSWTradeskillTooltip:SetTemplate("Transparent")
	ATSWTradeskillTooltip:CreateShadow("Default")

	--Regeants frame
	ATSWReagentFrame:StripTextures(true)
	ATSWReagentFrame:SetTemplate("Transparent")
	ATSWReagentFrame:CreateShadow("Default")

	--Options frame
	ATSWOptionsFrame:StripTextures(true)
	ATSWOptionsFrame:SetTemplate("Transparent")
	ATSWOptionsFrame:CreateShadow("Default")

	--Edit frame
	ATSWCSFrame:StripTextures(true)
	ATSWCSUListScrollFrame:StripTextures()

	ATSWCSFrame:SetTemplate("Transparent")
		local once = false
			for i=1, ATSW_MAX_TRADE_SKILL_REAGENTS do
				local button = _G["ATSWReagent"..i]
				local icon = _G["ATSWReagent"..i.."IconTexture"]
				local count = _G["ATSWReagent"..i.."Count"]

				icon:SetTexCoord(.08, .92, .08, .92)
				icon:SetDrawLayer("OVERLAY")
				if not icon.backdrop then
					icon.backdrop = CreateFrame("Frame", nil, button)
					icon.backdrop:SetFrameLevel(button:GetFrameLevel() - 1)
					icon.backdrop:SetTemplate("Default")
					icon.backdrop:Point("TOPLEFT", icon, "TOPLEFT", -2, 2)
					icon.backdrop:Point("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 2, -2)
				end

				icon:SetParent(icon.backdrop)
				count:SetParent(icon.backdrop)
				count:SetDrawLayer("OVERLAY")

				if i > 2 and once == false then
					local point, anchoredto, point2, x, y = button:GetPoint()
					button:ClearAllPoints()
					button:Point(point, anchoredto, point2, x, y - .8)
					--once = true
				end

				_G["ATSWReagent"..i.."NameFrame"]:Kill()
			end
		cSkinScrollBar(ATSWCSUListScrollFrameScrollBar)
		cSkinScrollBar(ATSWCSSListScrollFrameScrollBar)
		ATSWCSSListScrollFrame:StripTextures()
		cSkinCloseButton(ATSWCSFrameCloseButton)
	for i = 1, 4 do
		cSkinButton(_G["ATSWQueueItem"..i.."DeleteButton"])
	end

	ATSWQueueStartStopButton:Point("CENTER", ATSWFrame, "TOPLEFT", 425, -480)
	ATSWOptionsButton:Point("CENTER", ATSWFrame, "TOPLEFT", 685, -80)
	ATSWCSButton:Point("CENTER", ATSWFrame, "TOPLEFT", 390, -50)
	ATSWAddCategoryButton:Point("LEFT", ATSWCSNewCategoryBox, "RIGHT", 5, 0)
	ATSWFrameCloseButton:Point("TOPRIGHT", ATSWFrame, "TOPRIGHT", -5, -5)
	ATSWFilterBox:Point("TOPLEFT", ATSWFrame, "TOPLEFT", 126, -90)
	ATSWBuyReagentsButton:Point("CENTER", ATSWReagentFrame, "BOTTOMLEFT", 246, 50)
	ATSWQueueScrollFrame:StripTextures(True)
	cSkinScrollBar(ATSWQueueScrollFrameScrollBar)
	cSkinNextPrevButton(ATSWIncrementButton)
	cSkinNextPrevButton(ATSWDecrementButton)
	cSkinButton(ATSWAutoBuyButton)
--Shopping List Frame
	ATSWShoppingListFrame:StripTextures(true)
	ATSWShoppingListFrame:SetTemplate("Transparent")
	ATSWShoppingListFrame:Size(475,150)
	ATSWShoppingListFrame:ClearAllPoints()
	ATSWShoppingListFrame:Point("TOPLEFT", AuctionFrame, "BOTTOMRIGHT", -475, -1)
	cSkinButton(ATSWSLCloseButton, true)
	ATSWSLCloseButton:ClearAllPoints()
	ATSWSLCloseButton:Point("TOPRIGHT", ATSWShoppingListFrame, "TOPRIGHT", -5, -5)
	ATSWSLScrollFrame:StripTextures(True)
	cSkinScrollBar(ATSWSLScrollFrameScrollBar)
	cSkinScrollBar(ATSWListScrollFrameScrollBar)
--Delay Frame	
	cSkinButton(ATSWScanDelayFrameSkipButton)
	cSkinButton(ATSWScanDelayFrameAbortButton)
	ATSWScanDelayFrame:StripTextures(true)
	ATSWScanDelayFrame:SetTemplate("Transparent")
	ATSWScanDelayFrameBar:StripTextures()
	ATSWScanDelayFrameBar:SetStatusBarTexture(c["media"].normTex)
	if ( ccolor == "DEATHKNIGHT")	then ATSWScanDelayFrameBar:SetStatusBarColor(0.77,0.12,0.23)	end
	if ( ccolor == "DRUID" )	then ATSWScanDelayFrameBar:SetStatusBarColor(1.00,0.49,0.04)	end
	if ( ccolor == "HUNTER" )	then ATSWScanDelayFrameBar:SetStatusBarColor(0.67,0.83,0.45)	end
	if ( ccolor == "MAGE" )		then ATSWScanDelayFrameBar:SetStatusBarColor(0.41,0.80,0.94)	end
	if ( ccolor == "MONK" )		then ATSWScanDelayFrameBar:SetStatusBarColor(0.00,1.00,0.59)	end
	if ( ccolor == "PALADIN" )	then ATSWScanDelayFrameBar:SetStatusBarColor(0.96,0.55,0.73)	end
	if ( ccolor == "PRIEST" )	then ATSWScanDelayFrameBar:SetStatusBarColor(1.00,1.00,1.00)	end
	if ( ccolor == "ROGUE" )	then ATSWScanDelayFrameBar:SetStatusBarColor(1.00,0.96,0.41)	end
	if ( ccolor == "SHAMAN" )	then ATSWScanDelayFrameBar:SetStatusBarColor(0.00,0.44,0.87)	end
	if ( ccolor == "WARLOCK" )	then ATSWScanDelayFrameBar:SetStatusBarColor(0.58,0.51,0.79)	end
	if ( ccolor == "WARRIOR" )	then ATSWScanDelayFrameBar:SetStatusBarColor(0.78,0.61,0.43)	end
