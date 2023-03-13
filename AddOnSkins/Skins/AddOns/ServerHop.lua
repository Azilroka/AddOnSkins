local AS, L, S, R = unpack(AddOnSkins)

function R:ServerHop()
	local hopAddOn = _G["ServerHop"]
	local hopFrame = hopAddOn.hopFrame
	S:HandleFrame(hopFrame)
	S:HandleButton(hopFrame.buttonHop, true)
	hopFrame.buttonHop:SetPoint("LEFT", 20, 0)
	S:HandleCloseButton(hopAddOn.closeButton)
	hopAddOn.closeButton:SetPoint("TOPRIGHT", 0, 0)
	S:HandleButton(hopAddOn.buttonOptions)
	hopAddOn.buttonOptions:SetPoint("TOPLEFT", 0, 0)
	S:HandleEditBox(hopFrame.description, 205, 18)
	S:HandleButton(sh_clearblbut)
	sh_clearblbut:SetSize(24, 24)

	S:HandleDropDownBox(hopFramepvpDrop)
	S:HandleDropDownBox(CountDrop)
end

AS:RegisterSkin('ServerHop')
