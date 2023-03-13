local AS, L, S, R = unpack(AddOnSkins)

function R:Ludwig()
	hooksecurefunc(Ludwig, 'ToggleSearchFrame', function()
		if LudwigFrame.isSkinned then return end

		-- Main frame
		S:HandleFrame(LudwigFrame)
		LudwigFrame:SetHeight(456)
		LudwigFrame:SetWidth(360)
		LudwigFrame:SetMovable(true)
		LudwigFrame:EnableMouse(true)
		LudwigFrame:RegisterForDrag('LeftButton')
		LudwigFrame:SetScript('OnDragStart', LudwigFrame.StartMoving)
		LudwigFrame:SetScript('OnDragStop', LudwigFrame.StopMovingOrSizing)

		S:HandleCloseButton(LudwigFrameCloseButton, true)

		-- Search box
		S:HandleEditBox(LudwigFramesearch)
		LudwigFramesearch:SetPoint('TOPLEFT', 58, -44)

		-- iLevel boxes
		S:HandleEditBox(LudwigFrameminLevel)
		local LudwigFrameHyphenText = select(7, LudwigFrame:GetRegions())
		LudwigFrameHyphenText:SetPoint('LEFT', LudwigFrameminLevel, 'RIGHT', 4, 0)
		S:HandleEditBox(LudwigFramemaxLevel)

		-- Reset button
		local LudwigFrameResetButton = select(5, LudwigFrame:GetChildren())
		S:Desaturate(LudwigFrameResetButton)

		-- Scroll frame and scroll bar
		S:HandleFrame(LudwigFrameScrollFrame, 'Default')
		LudwigFrameScrollFrame:ClearAllPoints()
		LudwigFrameScrollFrame:SetPoint('TOPLEFT', 20, -78)
		LudwigFrameScrollFrame:SetHeight(330)
		LudwigFrameScrollFrame:SetWidth(300)
		S:HandleScrollBar(LudwigFrameScrollFrameScrollBar)

		-- Dropdown boxes (Needs work on dropdown lists positions)
		S:HandleDropDownBox(LudwigFrameQuality)
		LudwigFrameQuality:ClearAllPoints()
		LudwigFrameQuality:SetPoint('BOTTOMLEFT', 35, 4)
		LudwigFrameQuality:SetWidth(90)
		S:HandleDropDownBox(LudwigFrameCategory)
		LudwigFrameCategory:ClearAllPoints()
		LudwigFrameCategory:SetPoint('BOTTOMLEFT', LudwigFrameQuality, 'BOTTOMRIGHT', -20, 0)
		LudwigFrameCategory:SetWidth(200)

		LudwigFrame.isSkinned = true
	end)
end

AS:RegisterSkin('Ludwig')
