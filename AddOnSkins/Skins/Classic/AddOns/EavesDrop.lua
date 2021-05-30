local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('EavesDrop') then return end

function AS:EavesDrop()
	AS:SkinFrame(EavesDropFrame)
	AS:SkinFrame(EavesDropHistoryFrame)
	AS:SkinTab(EavesDropTab)
	EavesDropTab.Backdrop:SetPoint('TOPLEFT', 0, -5)
	EavesDropTab.Backdrop:SetPoint('BOTTOMRIGHT', 0, 2)
	EavesDropTabText:ClearAllPoints()
	EavesDropTabText:SetPoint('CENTER', EavesDropTab, 'CENTER', 0, -2)
	AS:SkinButton(EavesDropHistoryFrameReset)
	AS:SkinCloseButton(EavesDropHistoryFrameClose)
end
AS:RegisterSkin('EavesDrop', AS.EavesDrop)
