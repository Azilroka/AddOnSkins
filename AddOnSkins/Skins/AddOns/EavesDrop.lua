local AS, L, S, R = unpack(AddOnSkins)

function R:EavesDrop()
	S:HandleFrame(EavesDropFrame)
	S:HandleFrame(EavesDropHistoryFrame)
	S:HandleTab(EavesDropTab)
	EavesDropTab.backdrop:SetPoint('TOPLEFT', 0, -5)
	EavesDropTab.backdrop:SetPoint('BOTTOMRIGHT', 0, 2)
	EavesDropTabText:ClearAllPoints()
	EavesDropTabText:SetPoint('CENTER', EavesDropTab, 'CENTER', 0, -2)
	S:HandleButton(EavesDropHistoryFrameReset)
	S:HandleCloseButton(EavesDropHistoryFrameClose)
end

AS:RegisterSkin('EavesDrop')
