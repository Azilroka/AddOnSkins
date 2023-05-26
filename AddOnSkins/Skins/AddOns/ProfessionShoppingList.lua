local AS, L, S, R = unpack(AddOnSkins)

function R:ProfessionShoppingList()
	-- Window 1
	S:SetTemplate(ScrollTable1)
	S:HandleCloseButton(pslFrame1.closeButton)
	pslFrame1.closeButton:SetPoint("TOPRIGHT", pslFrame1, 1, 5)
	S:HandleScrollBar(ScrollTable1ScrollFrameScrollBar)

	-- Window 2
	S:SetTemplate(ScrollTable2)
	S:HandleCloseButton(pslFrame2.closeButton)
	pslFrame2.closeButton:SetPoint("TOPRIGHT", pslFrame2, 1, 5)
	S:HandleScrollBar(ScrollTable2ScrollFrameScrollBar)

    -- There might be issues with other AddOns also using lib-st, because the ScrollTable frames cannot be renamed. :(
end

AS:RegisterSkin('ProfessionShoppingList')