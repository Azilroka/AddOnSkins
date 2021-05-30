local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Ludwig') then return end

function AS:Ludwig()
	hooksecurefunc(Ludwig, 'ToggleSearchFrame', function()
		if LudwigFrame.isSkinned then return end
		
		-- Main frame
		AS:SkinFrame(LudwigFrame)
		LudwigFrame:SetHeight(456)
		LudwigFrame:SetWidth(360)
		LudwigFrame:SetMovable(true)
		LudwigFrame:EnableMouse(true)
		LudwigFrame:RegisterForDrag('LeftButton')
		LudwigFrame:SetScript('OnDragStart', LudwigFrame.StartMoving)
		LudwigFrame:SetScript('OnDragStop', LudwigFrame.StopMovingOrSizing)

		AS:SkinCloseButton(LudwigFrameCloseButton, true)
		
		-- Search box
		AS:SkinEditBox(LudwigFramesearch)
		LudwigFramesearch:SetPoint('TOPLEFT', 58, -44)

		-- iLevel boxes
		AS:SkinEditBox(LudwigFrameminLevel)
		local LudwigFrameHyphenText = select(7, LudwigFrame:GetRegions())
		LudwigFrameHyphenText:SetPoint('LEFT', LudwigFrameminLevel, 'RIGHT', 4, 0)
		AS:SkinEditBox(LudwigFramemaxLevel)

		-- Reset button
		local LudwigFrameResetButton = select(5, LudwigFrame:GetChildren())
		AS:Desaturate(LudwigFrameResetButton)
		
		-- Scroll frame and scroll bar
		AS:SkinFrame(LudwigFrameScrollFrame, 'Default')
		LudwigFrameScrollFrame:ClearAllPoints()
		LudwigFrameScrollFrame:SetPoint('TOPLEFT', 20, -78)
		LudwigFrameScrollFrame:SetHeight(330)
		LudwigFrameScrollFrame:SetWidth(300)
		AS:SkinScrollBar(LudwigFrameScrollFrameScrollBar)
		
		-- Dropdown boxes (Needs work on dropdown lists positions)
		AS:SkinDropDownBox(LudwigFrameQuality)
		LudwigFrameQuality:ClearAllPoints()
		LudwigFrameQuality:SetPoint('BOTTOMLEFT', 35, 4)
		LudwigFrameQuality:SetWidth(90)
		AS:SkinDropDownBox(LudwigFrameCategory)
		LudwigFrameCategory:ClearAllPoints()
		LudwigFrameCategory:SetPoint('BOTTOMLEFT', LudwigFrameQuality, 'BOTTOMRIGHT', -20, 0)
		LudwigFrameCategory:SetWidth(200)

		LudwigFrame.isSkinned = true
	end)
end

AS:RegisterSkin('Ludwig', AS.Ludwig)