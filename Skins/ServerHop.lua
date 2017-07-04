local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ServerHop') then return end

function AS:ServerHop()

	function SkinDropDownBox(Frame, Width) -- Same as AS:SkinDropDownBox but without Button.SetPoint = AS.Noop
		local Button, Text
		local FrameName = Frame:GetName()
		if FrameName then
			Button = _G[Frame:GetName().."Button"]
			Text = _G[Frame:GetName().."Text"]
		else
			Button = Frame.Button
			Text = Frame.Text
		end
		if Button and Text then
			AS:StripTextures(Frame)
			Frame:SetWidth(Width or 155)
			Text:ClearAllPoints()
			Text:SetPoint("RIGHT", Button, "LEFT", -2, 0)
			Button:ClearAllPoints()
			Button:SetPoint("RIGHT", Frame, "RIGHT", -10, 3)
			AS:SkinNextPrevButton(Button, true)
			AS:CreateBackdrop(Frame)
			Frame.Backdrop:SetPoint("TOPLEFT", 20, -2)
			Frame.Backdrop:SetPoint("BOTTOMRIGHT", Button, "BOTTOMRIGHT", 2, -2)
		end
	end

	-- Main Frame
	AS:SkinFrame(ServerHop)
	AS:StripTextures(ServerHop.hopFrame)
	AS:SkinButton(ServerHop.hopFrame.buttonHop, true)
	ServerHop.hopFrame.buttonHop:SetPoint("RIGHT",-15,0)

	AS:SkinButton(ServerHop.closeButton)
	ServerHop.closeButton:SetPoint("TOPRIGHT",0,0)

	AS:SkinButton(ServerHop.buttonOptions)
	ServerHop.buttonOptions:SetPoint("TOPLEFT",0,0)

	SkinDropDownBox(hopFramepvpDrop, 128)
	SkinDropDownBox(CountDrop, 128)

	AS:SkinEditBox(ServerHop.hopFrame.description, 205, 20)

	-- Options Frame
	AS:SkinFrame(hopOptions)
	AS:SkinCloseButton(optionsInFrameCloseBut)
	AS:StripTextures(hopOptions.optionsAuthor)
	AS:SkinEditBox(hopOptions.optionsAuthor.linkBox)
	AS:SkinEditBox(hopOptions.hopSearchOptionsFrame.linkBox)

	AS:SkinFrame(hopOptions.tabList)
	AS:SkinFrame(hopOptions.hopSearchOptionsFrame)
	AS:SkinFrame(hopOptions.aboutTab)

	AS:SkinCheckBox(CheckAutoinv)
	AS:SkinSlideBar(ServerHop_sliderQueueWait,16, true)
	AS:SkinSlideBar(ServerHop_sliderBL,16)

	local HopEditBox = {hopOptions.hopSearchOptionsFrame:GetChildren()}
	for i = 1, #HopEditBox do
		if HopEditBox[i]:IsObjectType("EditBox") then
			AS:SkinEditBox(HopEditBox[i])
		end
	end
end

AS:RegisterSkin('ServerHop', AS.ServerHop)