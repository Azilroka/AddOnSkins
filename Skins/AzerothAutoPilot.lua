local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Azeroth Auto Pilot') then return end
function AS:AzerothAutoPilot()
	AS:SkinFrame(AAP_GreetingsFrame)
	AAP.QuestList.Greetings2FS1:SetWidth(500)
	AAP.QuestList.Greetings:SetHeight(175)
	AAP.QuestList.Greetings2FS1:SetFont(AS.Font, 20, "OUTLINE")
	AAP.QuestList.Greetings2FS2:SetFont(AS.Font, 14, "OUTLINE")
	AAP.QuestList.Greetings2FS221:SetFont(AS.Font, 14, "OUTLINE")
	AS:SkinButton(AAP_GreetingsHideB)
	AS:SkinEditBox(AAPGreetEBox)
	AS:SkinButton(AAP_SkipActiveButton3)
	AS:SkinFrame(AAP_SugQuestFrameFrame)
	local function AAP_buttonSkin(self, button)
			self.icon = self:GetNormalTexture()
			AS:CreateBackdrop(self)
			AS:SkinIconButton(self)
			self.icon:SetAllPoints()
			self:SetWidth(AAP.QuestList2.BF1:GetHeight()-2)
			self:SetHeight(AAP.QuestList2.BF1:GetHeight()-2)
		return
	end
	local i
	for i = 1, 20 do
		AS:SkinFrame(_G["CLQListF"..i], nil)
		AS:SkinButton(_G["AAP_SkipActiveButton"..i])
		AAP.QuestList2["BF"..i]["AAP_Button"]:HookScript("OnShow", AAP_buttonSkin)
		AAP.QuestList.QuestFrames["FS"..i]:SetFont(AS.Font, 18, "OUTLINE")
		AAP.QuestList.QuestFrames["FS"..i]["Fontstring1"]:SetFont(AS.Font, 10)
	end
	for i = 1, 5 do
		AS:SkinFrame(_G["CLQaaListF"..i])
		AAP.PartyList.PartyFramesFS1[i]:SetFont(AS.Font, 16, "OUTLINE")
		AAP.PartyList.PartyFrames[i]:SetPoint("BOTTOMLEFT", AAP.PartyList.PartyFrame, "BOTTOMLEFT",41,-((26*i)-25))
		AS:SkinFrame(_G["CLQaListF"..i])
		AAP.PartyList.PartyFramesFS2[i]:SetFont(AS.Font, 16, "OUTLINE")
		AAP.PartyList.PartyFrames2[i]:SetPoint("BOTTOMLEFT", AAP.PartyList.PartyFrame, "BOTTOMLEFT",0,-((26*i)-25))
	end
	AAP_UpdateQuestList()
	AS:SkinFrame(AAP_OptionsMainFrame)
	AAP.OptionsFrame.FontString1:SetFont(AS.Font, 14, "OUTLINE")
	local CheckBoxes = {
		1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12,
	}
	for _, box in pairs(CheckBoxes) do
		AS:SkinCheckBox(_G["CLxCheckButton"..box])
	end
	for i=1, 3 do
		AS:SkinSlideBar(_G["AAP_SettingsSlider"..i], 17)
		AAP.OptionsFrame["Slider"..i].Low:SetFont(AS.Font, 10, "OUTLINE")
		AAP.OptionsFrame["Slider"..i].High:SetFont(AS.Font, 10, "OUTLINE")
		AAP.OptionsFrame["Slider"..i].Text:SetFont(AS.Font, 10, "OUTLINE")
	end
	for i = 1, 4 do
		AS:SkinButton(_G["AAP_OptionsButtons"..i])
		local text = AAP.OptionsFrame["Button"..i]:GetText()
		AAP.OptionsFrame["Button"..i]:SetText("")
		AAP.OptionsFrame["Button"..i].Text = AAP.OptionsFrame["Button"..i]:CreateFontString(nil, "OVERLAY")
		AAP.OptionsFrame["Button"..i].Text:SetFont(AS.Font, 12, "OUTLINE")
		AAP.OptionsFrame["Button"..i].Text:SetTextColor(255, 255, 0)
		AAP.OptionsFrame["Button"..i].Text:SetText(text)
		AAP.OptionsFrame["Button"..i].Text:SetPoint("CENTER", 0, 0)
	end
	AS:SkinDropDownBox(AAP_DropDownList)
	AS:SkinDropDownBox(AAP_DropDown1)
	AS:SkinFrame(AAP_Warcamp2)
	AAP.QuestList.WarcampFS2:SetFont(AS.Font, 14, "OUTLINE")
	for i = 1, 2 do
		AS:SkinButton(_G["AAP_WarCampB"..i])
		local text = AAP.QuestList["WarcampB"..i]:GetText()
		AAP.QuestList["WarcampB"..i]:SetText("")
		AAP.QuestList["WarcampB"..i].Text = AAP.QuestList["WarcampB"..i]:CreateFontString(nil, "OVERLAY")
		AAP.QuestList["WarcampB"..i].Text:SetFont(AS.Font, 12, "OUTLINE")
		AAP.QuestList["WarcampB"..i].Text:SetTextColor(255, 255, 0)
		AAP.QuestList["WarcampB"..i].Text:SetText(text)
		AAP.QuestList["WarcampB"..i].Text:SetPoint("CENTER", 0, 0)
	end
	AS:SkinFrame(AAP_AFkFrames)
	AAP_AfkFrame.Fontstring:SetFont(AS.Font, 20, "OUTLINE")
	AS:SkinButton(AAP_ArrowActiveButton)
	AAP_ArrowFrame.Fontstring:SetFont(AS.Font, 8, "OUTLINE")
	AAP_ArrowFrame.Fontstring:SetWidth(AAP_ArrowFrame.Fontstring:GetStringWidth()+100)
	AAP_ArrowFrame.Button:SetWidth(AAP_ArrowFrame.Fontstring:GetStringWidth()+2)
	AAP_ArrowFrame.distance:SetFont(AS.Font, 10, "OUTLINE")
	AS:SkinFrame(AAP_BrutalFrames1)
	AS:SkinFrame(AAP_BrutalFrames2)
	AAP.BrutallCC.BrutallFrame.FrameName:SetPoint("TOP", AAP.BrutallCC.BrutallFrame.Frame, "TOP",-25,27)
	for i=1, 4 do
		AAP.BrutallCC.BrutallFrame["FS"..i]:SetFont(AS.Font, 16, "OUTLINE")
	end
	AAP.QuestList.SugQuestFrameFS1:SetFont(AS.Font, 20, "OUTLINE")
	AAP.QuestList.SugQuestFrameFS2:SetFont(AS.Font, 15, "OUTLINE")
	AS:SkinButton(AAP_SBX1)
	AS:SkinButton(AAP_SBX2)
	for i=1, 20 do
		AAP.QuestList2["BF"..i]["AAP_Button"]:SetPoint("LEFT",AAP.QuestList2["BF"..i],"RIGHT",1,0)
	end
	AAP.Banners.BannersFrame.FrameFS1:SetFont(AS.Font, 8, "OUTLINE")
	AAP.Banners.BannersFrame.FrameFS2:SetFont(AS.Font, 10, "OUTLINE")
	AAP.Banners.BannersFrame.B1:SetPoint("TOP", AAP.Banners.BannersFrame.Frame, "BOTTOM", 0, -1)
	AAP.Banners.BannersFrame.B1.icon = AAP.Banners.BannersFrame.B1:GetNormalTexture()
	AS:SkinIconButton(AAP_BannersFrames1B1)
		for i = 1, 5 do
			AS:SkinFrame(_G["AAP_BannersFrames"..i])
			if i < 4 then
				AAP.Banners.BannersFrame["B"..i].icon = AAP.Banners.BannersFrame["B"..i]:GetNormalTexture()
				AS:SkinIconButton(_G["AAP_BannersFrames1B"..i])
			end
			if AAP.Banners.BannersFrame["FrameB2"..i] then
				AS:SkinFrame(_G["AAP_BannersFrames2B"..i], nil, true)
				AS:SkinTexture(_G["AAP_BannersFramesz2B"..i])
				AS:CreateBackdrop(_G["AAP_BannersFrames2B"..i])
				AAP.Banners.BannersFrame["FrameB2"..i]:SetWidth(29)
				AAP.Banners.BannersFrame["FrameB2"..i]:SetHeight(29)
			end
			if AAP.Banners.BannersFrame["FrameB3"..i] then
				AS:SkinFrame(_G["AAP_BannersFrames3B"..i], nil, true)
				AS:SkinTexture(_G["AAP_BannersFramesz3B"..i])
				AS:CreateBackdrop(_G["AAP_BannersFrames3B"..i])
				AAP.Banners.BannersFrame["FrameB3"..i]:SetWidth(29)
				AAP.Banners.BannersFrame["FrameB3"..i]:SetHeight(29)
			end
			if AAP.Banners.BannersFrame["FrameB4"..i] then
				AS:SkinFrame(_G["AAP_BannersFrames4B"..i], nil, true)
				AS:SkinTexture(_G["AAP_BannersFramesz4B"..i])
				AS:CreateBackdrop(_G["AAP_BannersFrames4B"..i])
				AAP.Banners.BannersFrame["FrameB4"..i]:SetWidth(29)
				AAP.Banners.BannersFrame["FrameB4"..i]:SetHeight(29)
			end
			--AAP.Banners.BannersFrame["Frame"..i]:Show()
			if 	AAP.Banners.BannersFrame["Frame"..i] then
				AAP.Banners.BannersFrame["Frame"..i]:SetPoint("TOPLEFT", AAP.Banners.BannersFrame, "TOPLEFT",-(33*i),0)
				AAP.Banners.BannersFrame["FrameB2"..i]:SetPoint("TOP", AAP.Banners.BannersFrame["Frame"..i], "BOTTOM", 0, -2)
				AAP.Banners.BannersFrame["FrameFS1"..i]:SetFont(AS.Font, 8, "OUTLINE")
				AAP.Banners.BannersFrame["FrameFSs"..i]:SetFont(AS.Font, 10, "OUTLINE")
			end
		end
end

AS:RegisterSkin('AzerothAutoPilot', AS.AzerothAutoPilot)