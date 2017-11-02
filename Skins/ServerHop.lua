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
	local hopAddOn = _G["ServerHop"]
	local hopFrame = hopAddOn.hopFrame
	AS:SkinFrame(hopFrame)
	AS:SkinButton(hopFrame.buttonHop, true)
	hopFrame.buttonHop:SetPoint("LEFT", 20, 0)
	AS:SkinCloseButton(hopAddOn.closeButton)
	hopAddOn.closeButton:SetPoint("TOPRIGHT", 0, 0)
	AS:SkinButton(hopAddOn.buttonOptions)
	hopAddOn.buttonOptions:SetPoint("TOPLEFT", 0, 0)
	AS:SkinEditBox(hopFrame.description, 205, 18)
	AS:SkinButton(sh_clearblbut)
	sh_clearblbut:SetSize(24, 24)

	SkinDropDownBox(hopFramepvpDrop, 128)
	SkinDropDownBox(CountDrop, 128)

	-- Options Frame
	AS:SkinFrame(hopOptions)
	AS:SkinCloseButton(optionsInFrameCloseBut)
	AS:StripTextures(hopOptions.optionsAuthor)
	AS:SkinEditBox(hopOptions.optionsAuthor.linkBox)
	AS:SkinEditBox(hopOptions.hopSearchOptionsFrame.linkBox)
end

AS:RegisterSkin('ServerHop', AS.ServerHop)
