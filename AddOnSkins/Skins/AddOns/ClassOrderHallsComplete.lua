local AS, L, S, R = unpack(AddOnSkins)

function R:ClassOrderHallsComplete()
	-- General
	S:HandleFrame(ClassOrderHallsCompleteUIMainFrame)
	S:HandleCloseButton(ClassOrderHallsCompleteUIMainFrameCloseButton)
	S:StripTextures(ClassOrderHallsCompleteUIMainFrameInset)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab1)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab2)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab3)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab4)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab5)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameSubFrameHeaderTab6)
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
	S:HandleFrame(ClassOrderHallsCompleteUIMainFrameTab1SubFrame)
	S:StripTextures(ClassOrderHallsCompleteUIMainFrameTab1SubFrameButtonsColumnHeaderButton)
	S:StripTextures(ClassOrderHallsCompleteUIMainFrameTab1SubFrameNameColumnHeaderButton)
	S:HandleFrame(ClassOrderHallsCompleteUIMainFrameTab1SubFrameFooter)
	S:HandleScrollBar(ClassOrderHallsCompleteUIMainFrameTab1SubFrameScrollFrameScrollBar)
	S:StripTextures(ClassOrderHallsCompleteUIMainFrameTab1SubFrameScrollFrame)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameTab1SubFrameRefreshButton)
	ClassOrderHallsCompleteUIMainFrameTab1SubFrameFooter:SetSize(765, 60)
	ClassOrderHallsCompleteUIMainFrameTab1SubFrameNameColumnHeaderButton:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrameTab1SubFrame, 'TOPLEFT', 0, -7)
	ClassOrderHallsCompleteUIMainFrameTab1SubFrameRefreshButton:SetPoint('BOTTOMRIGHT', ClassOrderHallsCompleteUIMainFrameTab1SubFrameButtonsColumnHeaderButton, 'TOPRIGHT', 2, 15)
	ClassOrderHallsCompleteUIMainFrameTab1SubFrame:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrame, 'TOPLEFT', 10, -57)

	--Characters
	S:HandleFrame(ClassOrderHallsCompleteUIMainFrameTab2SubFrame)
	ClassOrderHallsCompleteUIMainFrameTab2SubFrame:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrame, 'TOPLEFT', 10, -57)
	ClassOrderHallsCompleteUIMainFrameTab2SubFrameCharacterLabel:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrameTab2SubFrame, 'TOPLEFT', 10, -8)
	S:HandleDropDownBox(ClassOrderHallsCompleteUIMainFrameTab2SubFrameCharacterDropDownMenu)
	ClassOrderHallsCompleteUIMainFrameTab2SubFrameCharacterDropDownMenu:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameTab2SubFrameCharacterLabel, 'RIGHT', -12, -3)
	ClassOrderHallsCompleteUIMainFrameTab2SubFrameMonitoredNum:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameTab2SubFrameCharacterDropDownMenu, 'RIGHT', -6, 4)
	ClassOrderHallsCompleteUIMainFrameTab2SubFrameOrderAutomaticallyCheckButton:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameTab2SubFrameCharacterDropDownMenu, 'RIGHT', 0, 3)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameTab2SubFrameOrderButton)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameTab2SubFrameDeleteCharacterButton)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameTab2SubFrameUncheckAllButton)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameTab2SubFrameCheckAllButton)
	S:HandleScrollBar(ClassOrderHallsCompleteUIMainFrameTab2SubFrameScrollFrameScrollBar)
	S:StripTextures(ClassOrderHallsCompleteUIMainFrameTab2SubFrameScrollFrame)

	--Misc
	S:HandleFrame(ClassOrderHallsCompleteUIMainFrameTab3SubFrame)
	ClassOrderHallsCompleteUIMainFrameTab3SubFrame:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrame, 'TOPLEFT', 10, -57)
	S:HandleDropDownBox(ClassOrderHallsCompleteUIMainFrameTab3SubFrameMonitorRowsDropDownMenu)
	S:HandleDropDownBox(ClassOrderHallsCompleteUIMainFrameTab3SubFrameMonitorColumnsDropDownMenu)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameTab3SubFrameCenterButton)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameTab3SubFrameColumnButton)
	S:HandleButton(ClassOrderHallsCompleteUIMainFrameTab3SubFrameResetButton)
	ClassOrderHallsCompleteUIMainFrameTab3SubFrameColumnButton:SetPoint('LEFT', ClassOrderHallsCompleteUIMainFrameTab3SubFrameMonitorColumnsDropDownMenu, 'RIGHT', 1, 3)

	--Alert
	S:HandleFrame(ClassOrderHallsCompleteUIMainFrameTab4SubFrame)
	ClassOrderHallsCompleteUIMainFrameTab4SubFrame:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrame, 'TOPLEFT', 10, -57)
	S:HandleDropDownBox(ClassOrderHallsCompleteUIMainFrameTab4SubFrameAlertDropDownMenu)

	--LDB
	S:HandleFrame(ClassOrderHallsCompleteUIMainFrameTab5SubFrame)
	ClassOrderHallsCompleteUIMainFrameTab5SubFrame:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrame, 'TOPLEFT', 10, -57)
	S:HandleDropDownBox(ClassOrderHallsCompleteUIMainFrameTab5SubFrameSourceDropDownMenu)
	S:HandleDropDownBox(ClassOrderHallsCompleteUIMainFrameTab5SubFrameTextFormatDropDownMenu)

	--Help
	S:HandleFrame(ClassOrderHallsCompleteUIMainFrameTab6SubFrame)
	ClassOrderHallsCompleteUIMainFrameTab6SubFrame:SetPoint('TOPLEFT', ClassOrderHallsCompleteUIMainFrame, 'TOPLEFT', 10, -57)
end

AS:RegisterSkin('ClassOrderHallsComplete')
