local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Wowlua') then return end

function AS:WowLua()
	AS:SkinFrame(WowLuaFrame)
	AS:StripTextures(WowLuaFrameLineNumScrollFrame, true)
	AS:StripTextures(WowLuaFrameResizeBar, true)
	WowLuaFrameResizeBar:SetHeight(10)
	AS:SkinCloseButton(WowLuaButton_Close)
	WowLuaButton_Close:SetPoint('TOPRIGHT', WowLuaFrame, 'TOPRIGHT', 0 , 0)
	AS:SkinScrollBar(WowLuaFrameEditScrollFrameScrollBar)
	WowLuaButton_New:SetPoint('LEFT', WowLuaFrameToolbar, 'LEFT', 60, 0)

	WowLuaFrameEditFocusGrabber.bg1 = CreateFrame('Frame', nil, WowLuaFrameEditFocusGrabber)
	AS:SkinBackdropFrame(WowLuaFrameEditFocusGrabber.bg1)
	WowLuaFrameEditFocusGrabber.bg1:SetPoint('TOPLEFT', 0, 0)
	WowLuaFrameEditFocusGrabber.bg1:SetPoint('BOTTOMRIGHT', 5, -5)

	WowLuaFrameResizeBar.bg1 = CreateFrame('Frame', nil, WowLuaFrameResizeBar)
	AS:SkinFrame(WowLuaFrameResizeBar.bg1)
	WowLuaFrameResizeBar.bg1:SetPoint('TOPLEFT', 6, -2)
	WowLuaFrameResizeBar.bg1:SetPoint('BOTTOMRIGHT', -27, 0)

	AS:StripTextures(WowLuaFrameCommand)
	WowLuaFrameCommand.bg1 = CreateFrame('Frame', nil, WowLuaFrameCommand)
	AS:SkinBackdropFrame(WowLuaFrameCommand.bg1)
	WowLuaFrameCommand.bg1:SetPoint('TOPLEFT', 0, -4)
	WowLuaFrameCommand.bg1:SetPoint('BOTTOMRIGHT', -12, 2)

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
		AS:CreateBackdrop(object)
		AS:SkinTexture(object:GetNormalTexture())
		if object:GetDisabledTexture() then
			AS:SkinTexture(object:GetDisabledTexture())
		end
		AS:StyleButton(object)
	end
end

AS:RegisterSkin('WowLua', AS.WowLua, '[AddonLoader]')