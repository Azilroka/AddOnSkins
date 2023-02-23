local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('WhisperPop') then return end

function AS:WhisperPop()
	S:HandleFrame(WhisperPopFrame)
	S:HandleFrame(WhisperPopMessageFrame)

	S:HandleNextPrevButton(WhisperPopScrollingMessageFrameButtonDown)
	S:HandleNextPrevButton(WhisperPopScrollingMessageFrameButtonEnd)
	S:HandleNextPrevButton(WhisperPopScrollingMessageFrameButtonUp)

	WhisperPopScrollingMessageFrameButtonDown:SetPoint('BOTTOM', WhisperPopScrollingMessageFrameButtonEnd, 'TOP', 0, 0)
	WhisperPopScrollingMessageFrameButtonUp:SetPoint('BOTTOM', WhisperPopScrollingMessageFrameButtonDown, 'TOP', 0, 0)

	S:HandleCheckBox(WhisperPopMessageFrameProtectCheck)
	S:HandleItemButton(WhisperPopFrameConfig)
	S:HandleItemButton(WhisperPopNotifyButton)
	S:HandleScrollBar(WhisperPopFrameListScrollBar)

	for _, Button in pairs({ WhisperPopFrameListDelete, WhisperPopFrameTopCloseButton, WhisperPopMessageFrameTopCloseButton }) do
		S:HandleCloseButton(Button)
	end
end

AS:RegisterSkin('WhisperPop', AS.WhisperPop)
