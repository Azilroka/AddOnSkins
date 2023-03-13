local AS, L, S, R = unpack(AddOnSkins)

function R:WowLua()
	S:HandleFrame(WowLuaFrame)
	S:StripTextures(WowLuaFrameLineNumScrollFrame, true)
	S:StripTextures(WowLuaFrameResizeBar, true)
	WowLuaFrameResizeBar:SetHeight(10)
	S:HandleCloseButton(WowLuaButton_Close)
	WowLuaButton_Close:SetPoint('TOPRIGHT', WowLuaFrame, 'TOPRIGHT', 0 , 0)
	S:HandleScrollBar(WowLuaFrameEditScrollFrameScrollBar)
	WowLuaButton_New:SetPoint('LEFT', WowLuaFrameToolbar, 'LEFT', 60, 0)

	WowLuaFrameEditFocusGrabber.bg1 = CreateFrame('Frame', nil, WowLuaFrameEditFocusGrabber)
	S:HandleFrame(WowLuaFrameEditFocusGrabber.bg1, true)
	WowLuaFrameEditFocusGrabber.bg1:SetPoint('TOPLEFT', 0, 0)
	WowLuaFrameEditFocusGrabber.bg1:SetPoint('BOTTOMRIGHT', 5, -5)

	WowLuaFrameResizeBar.bg1 = CreateFrame('Frame', nil, WowLuaFrameResizeBar)
	S:HandleFrame(WowLuaFrameResizeBar.bg1)
	WowLuaFrameResizeBar.bg1:SetPoint('TOPLEFT', 6, -2)
	WowLuaFrameResizeBar.bg1:SetPoint('BOTTOMRIGHT', -27, 0)

	S:StripTextures(WowLuaFrameCommand)
	WowLuaFrameCommand.bg1 = CreateFrame('Frame', nil, WowLuaFrameCommand)
	S:HandleFrame(WowLuaFrameCommand.bg1, true)
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
		S:CreateBackdrop(object)
		S:HandleIcon(object:GetNormalTexture())
		if object:GetDisabledTexture() then
			S:HandleIcon(object:GetDisabledTexture())
		end
		S:StyleButton(object)
	end
end

AS:RegisterSkin('WowLua')
