local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ServerHop') then return end

function AS:ServerHop()
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

	AS:SkinDropDownBox(hopFramepvpDrop)
	AS:SkinDropDownBox(CountDrop)
end

AS:RegisterSkin('ServerHop', AS.ServerHop)