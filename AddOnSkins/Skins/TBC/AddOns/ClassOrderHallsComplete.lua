local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ClassOrderHallsComplete') then return end

function AS:ClassOrderHallsComplete()
	-- General
	AS:SkinFrame(ClassOrderHallsCompleteUIMainFrame)
	AS:SkinCloseButton(ClassOrderHallsCompleteUIMainFrameCloseButton)
	AS:StripTextures(ClassOrderHallsCompleteUIMainFrameInset)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab1)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab2)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab3)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab4)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab5)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab6)
	ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab2:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab1, 'RIGHT', 10, 0)
	ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab3:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab2, 'RIGHT', 10, 0)
	ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab4:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab3, 'RIGHT', 10, 0)
	ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab5:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab4, 'RIGHT', 10, 0)
	ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab6:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab5, 'RIGHT', 10, 0)
	ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab1:SetSize(60, 24)
	ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab2:SetSize(60, 24)
	ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab3:SetSize(60, 24)
	ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab4:SetSize(60, 24)
	ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab5:SetSize(60, 24)
	ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab6:SetSize(60, 24)

	--Monitor
	AS:SkinFrame(ClassOrderHallsCompleteUIMainFrameTab1SubFrame)
	AS:StripTextures(ClassOrderHallsCompleteUIMainFrameTab1SubFrameButtonsColumnHeaderButton)
	AS:StripTextures(ClassOrderHallsCompleteUIMainFrameTab1SubFrameNameColumnHeaderButton)
	AS:SkinFrame(ClassOrderHallsCompleteUIMainFrameTab1SubFrameFooter)
	AS:SkinScrollBar(ClassOrderHallsCompleteUIMainFrameTab1SubFrameScrollFrameScrollBar)
	AS:StripTextures(ClassOrderHallsCompleteUIMainFrameTab1SubFrameScrollFrame)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameTab1SubFrameRefreshButton)
	ClassOrderHallsCompleteUIMainFrameTab1SubFrameFooter:SetSize(765, 60)
	ClassOrderHallsCompleteUIMainFrameTab1SubFrameNameColumnHeaderButton:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrameTab1SubFrame, 'TOPLEFT', 0, -7)
	ClassOrderHallsCompleteUIMainFrameTab1SubFrameRefreshButton:SetPoint('BOTTOMRIGHT', ClassOrderHallsCompleteUIMainFrameTab1SubFrameButtonsColumnHeaderButton, 'TOPRIGHT', 2, 15)
	ClassOrderHallsCompleteUIMainFrameTab1SubFrame:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrame, 'TOPLEFT', 10, -57)

	--Characters
	AS:SkinFrame(ClassOrderHallsCompleteUIMainFrameTab2SubFrame)
	ClassOrderHallsCompleteUIMainFrameTab2SubFrame:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrame, 'TOPLEFT', 10, -57)
	ClassOrderHallsCompleteUIMainFrameTab2SubFrameCharacterLabel:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrameTab2SubFrame, 'TOPLEFT', 10, -8)
	AS:SkinDropDownBox(ClassOrderHallsCompleteUIMainFrameTab2SubFrameCharacterDropDownMenu)
	ClassOrderHallsCompleteUIMainFrameTab2SubFrameCharacterDropDownMenu:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameTab2SubFrameCharacterLabel, 'RIGHT', -12, -3)
	ClassOrderHallsCompleteUIMainFrameTab2SubFrameMonitoredNum:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameTab2SubFrameCharacterDropDownMenu, 'RIGHT', -6, 4)
	ClassOrderHallsCompleteUIMainFrameTab2SubFrameOrderAutomaticallyCheckButton:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameTab2SubFrameCharacterDropDownMenu, 'RIGHT', 0, 3)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameTab2SubFrameOrderButton)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameTab2SubFrameDeleteCharacterButton)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameTab2SubFrameUncheckAllButton)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameTab2SubFrameCheckAllButton)
	AS:SkinScrollBar(ClassOrderHallsCompleteUIMainFrameTab2SubFrameScrollFrameScrollBar)
	AS:StripTextures(ClassOrderHallsCompleteUIMainFrameTab2SubFrameScrollFrame)

	--Misc
	AS:SkinFrame(ClassOrderHallsCompleteUIMainFrameTab3SubFrame)
	ClassOrderHallsCompleteUIMainFrameTab3SubFrame:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrame, 'TOPLEFT', 10, -57)
	AS:SkinDropDownBox(ClassOrderHallsCompleteUIMainFrameTab3SubFrameMonitorRowsDropDownMenu)
	AS:SkinDropDownBox(ClassOrderHallsCompleteUIMainFrameTab3SubFrameMonitorColumnsDropDownMenu)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameTab3SubFrameCenterButton)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameTab3SubFrameColumnButton)
	AS:SkinButton(ClassOrderHallsCompleteUIMainFrameTab3SubFrameResetButton)
	ClassOrderHallsCompleteUIMainFrameTab3SubFrameColumnButton:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameTab3SubFrameMonitorColumnsDropDownMenu, 'RIGHT', 1, 3)

	--Alert
	AS:SkinFrame(ClassOrderHallsCompleteUIMainFrameTab4SubFrame)
	ClassOrderHallsCompleteUIMainFrameTab4SubFrame:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrame, 'TOPLEFT', 10, -57)
	AS:SkinDropDownBox(ClassOrderHallsCompleteUIMainFrameTab4SubFrameAlertDropDownMenu)

	--LDB
	AS:SkinFrame(ClassOrderHallsCompleteUIMainFrameTab5SubFrame)
	ClassOrderHallsCompleteUIMainFrameTab5SubFrame:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrame, 'TOPLEFT', 10, -57)
	AS:SkinDropDownBox(ClassOrderHallsCompleteUIMainFrameTab5SubFrameSourceDropDownMenu)
	AS:SkinDropDownBox(ClassOrderHallsCompleteUIMainFrameTab5SubFrameTextFormatDropDownMenu)

	--Help
	AS:SkinFrame(ClassOrderHallsCompleteUIMainFrameTab6SubFrame)
	ClassOrderHallsCompleteUIMainFrameTab6SubFrame:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrame, 'TOPLEFT', 10, -57)
end

AS:RegisterSkin('ClassOrderHallsComplete', AS.ClassOrderHallsComplete)
