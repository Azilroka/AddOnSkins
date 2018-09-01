local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WhisperPop') then return end

function AS:WhisperPop()
	AS:SkinFrame(WhisperPopFrame)
	AS:SkinFrame(WhisperPopMessageFrame)

	AS:SkinNextPrevButton(WhisperPopScrollingMessageFrameButtonDown, true, false)
	AS:SkinNextPrevButton(WhisperPopScrollingMessageFrameButtonEnd, true, false)
	AS:SkinNextPrevButton(WhisperPopScrollingMessageFrameButtonUp, true, true)

	WhisperPopScrollingMessageFrameButtonDown:SetPoint('BOTTOM', WhisperPopScrollingMessageFrameButtonEnd, 'TOP', 0, 0)
	WhisperPopScrollingMessageFrameButtonUp:SetPoint('BOTTOM', WhisperPopScrollingMessageFrameButtonDown, 'TOP', 0, 0)

	AS:SkinCheckBox(WhisperPopMessageFrameProtectCheck)
	AS:SkinIconButton(WhisperPopFrameConfig)
	AS:SkinIconButton(WhisperPopNotifyButton)
	AS:SkinScrollBar(WhisperPopFrameListScrollBar)

	for _, Button in pairs({ WhisperPopFrameListDelete, WhisperPopFrameTopCloseButton, WhisperPopMessageFrameTopCloseButton }) do
		AS:SkinCloseButton(Button)
	end
end

AS:RegisterSkin('WhisperPop', AS.WhisperPop)
