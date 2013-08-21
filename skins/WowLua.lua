local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "WowLuaSkin"
function AS:SkinWowLua()
	AS:SkinFrame(WowLuaFrame)
	WowLuaFrameLineNumScrollFrame:StripTextures(True)
	WowLuaFrameResizeBar:StripTextures(True)
	WowLuaFrameResizeBar:Height(10)
	AS:SkinCloseButton(WowLuaButton_Close)
	WowLuaButton_Close:Point("TOPRIGHT", WowLuaFrame, "TOPRIGHT", 0 , 0)
	AS:SkinScrollBar(WowLuaFrameEditScrollFrameScrollBar)
	WowLuaButton_New:Point("LEFT", WowLuaFrameToolbar, "LEFT", 60, 0)

	WowLuaFrameEditFocusGrabber.bg1 = CreateFrame("Frame", nil, WowLuaFrameEditFocusGrabber)
	AS:SkinBackdropFrame(WowLuaFrameEditFocusGrabber.bg1)
	WowLuaFrameEditFocusGrabber.bg1:Point("TOPLEFT", 0, 0)
	WowLuaFrameEditFocusGrabber.bg1:Point("BOTTOMRIGHT", 5, -5)

	WowLuaFrameResizeBar.bg1 = CreateFrame("Frame", nil, WowLuaFrameResizeBar)
	AS:SkinFrame(WowLuaFrameResizeBar.bg1)
	WowLuaFrameResizeBar.bg1:Point("TOPLEFT", 6, -2)
	WowLuaFrameResizeBar.bg1:Point("BOTTOMRIGHT", -27, 0)

	WowLuaFrameCommand:StripTextures()
	WowLuaFrameCommand.bg1 = CreateFrame("Frame", nil, WowLuaFrameCommand)
	AS:SkinBackdropFrame(WowLuaFrameCommand.bg1)
	WowLuaFrameCommand.bg1:Point("TOPLEFT", 0, -4)
	WowLuaFrameCommand.bg1:Point("BOTTOMRIGHT", -12, 2)
end

AS:RegisterSkin(name, AS.SkinWowLua)