if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
LoadAddOn("WowLua")
if not IsAddOnLoaded("WowLua") then return end

	cSkinFrame(WowLuaFrame)
	WowLuaFrameLineNumScrollFrame:StripTextures(True)
	WowLuaFrameResizeBar:StripTextures(True)
	WowLuaFrameResizeBar:Height(10)
	cSkinCloseButton(WowLuaButton_Close)
	WowLuaButton_Close:Point("TOPRIGHT", WowLuaFrame, "TOPRIGHT", 0 , 0)
	cSkinScrollBar(WowLuaFrameEditScrollFrameScrollBar)
	WowLuaButton_New:Point("LEFT", WowLuaFrameToolbar, "LEFT", 60, 0)

	WowLuaFrameEditFocusGrabber.bg1 = CreateFrame("Frame", nil, WowLuaFrameEditFocusGrabber)
	WowLuaFrameEditFocusGrabber.bg1:CreateBackdrop()
	WowLuaFrameEditFocusGrabber.bg1:Point("TOPLEFT", 0, 0)
	WowLuaFrameEditFocusGrabber.bg1:Point("BOTTOMRIGHT", 5, -5)

	WowLuaFrameResizeBar.bg1 = CreateFrame("Frame", nil, WowLuaFrameResizeBar)
	WowLuaFrameResizeBar.bg1:SetTemplate()
	WowLuaFrameResizeBar.bg1:Point("TOPLEFT", 6, -2)
	WowLuaFrameResizeBar.bg1:Point("BOTTOMRIGHT", -27, 0)

	WowLuaFrameCommand:StripTextures()
	WowLuaFrameCommand.bg1 = CreateFrame("Frame", nil, WowLuaFrameCommand)
	WowLuaFrameCommand.bg1:CreateBackdrop()
	WowLuaFrameCommand.bg1:Point("TOPLEFT", 0, -4)
	WowLuaFrameCommand.bg1:Point("BOTTOMRIGHT", -12, 2)