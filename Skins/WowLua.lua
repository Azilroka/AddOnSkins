local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Wowlua') then return end

local name = 'WowLuaSkin'
function AS:SkinWowLua()
	AS:SkinFrame(WowLuaFrame)
	WowLuaFrameLineNumScrollFrame:StripTextures(true)
	WowLuaFrameResizeBar:StripTextures(true)
	WowLuaFrameResizeBar:Height(10)
	AS:SkinCloseButton(WowLuaButton_Close)
	WowLuaButton_Close:Point('TOPRIGHT', WowLuaFrame, 'TOPRIGHT', 0 , 0)
	AS:SkinScrollBar(WowLuaFrameEditScrollFrameScrollBar)
	WowLuaButton_New:Point('LEFT', WowLuaFrameToolbar, 'LEFT', 60, 0)

	WowLuaFrameEditFocusGrabber.bg1 = CreateFrame('Frame', nil, WowLuaFrameEditFocusGrabber)
	AS:SkinBackdropFrame(WowLuaFrameEditFocusGrabber.bg1)
	WowLuaFrameEditFocusGrabber.bg1:Point('TOPLEFT', 0, 0)
	WowLuaFrameEditFocusGrabber.bg1:Point('BOTTOMRIGHT', 5, -5)

	WowLuaFrameResizeBar.bg1 = CreateFrame('Frame', nil, WowLuaFrameResizeBar)
	AS:SkinFrame(WowLuaFrameResizeBar.bg1)
	WowLuaFrameResizeBar.bg1:Point('TOPLEFT', 6, -2)
	WowLuaFrameResizeBar.bg1:Point('BOTTOMRIGHT', -27, 0)

	WowLuaFrameCommand:StripTextures()
	WowLuaFrameCommand.bg1 = CreateFrame('Frame', nil, WowLuaFrameCommand)
	AS:SkinBackdropFrame(WowLuaFrameCommand.bg1)
	WowLuaFrameCommand.bg1:Point('TOPLEFT', 0, -4)
	WowLuaFrameCommand.bg1:Point('BOTTOMRIGHT', -12, 2)

	local Buttons = {
		WowLuaButton_New,
		WowLuaButton_Open,
		WowLuaButton_Save,
		WowLuaButton_Undo,
		WowLuaButton_Redo,
		WowLuaButton_Delete,
		WowLuaButton_Lock,
		WowLuaButton_Unlock,
		WowLuaButton_Config,
		WowLuaButton_Previous,
		WowLuaButton_Next,
		WowLuaButton_Run,
	}
	
	for _, object in pairs(Buttons) do
		object:CreateBackdrop()
		object:GetNormalTexture():SetTexCoord(.1,.9,.1,.9)
		if object:GetDisabledTexture() then
			object:GetDisabledTexture():SetTexCoord(.1,.9,.1,.9)
		end
		object:StyleButton()
	end
end

AS:RegisterSkin(name, AS.SkinWowLua)