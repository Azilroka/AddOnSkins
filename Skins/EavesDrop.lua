local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('EavesDrop') then return end

function AS:EavesDrop()
	AS:SkinFrame(EavesDropFrame)
	AS:SkinFrame(EavesDropHistoryFrame)
	AS:SkinTab(EavesDropTab)
	local Backdrop = EavesDropTab.backdrop or EavesDropTab.Backdrop
	Backdrop:Point('TOPLEFT', 0, -5)
	Backdrop:Point('BOTTOMRIGHT', 0, 2)
	EavesDropTabText:ClearAllPoints()
	EavesDropTabText:SetPoint('CENTER', EavesDropTab, 'CENTER', 0, -2)
	AS:SkinButton(EavesDropHistoryFrameReset)
	AS:SkinCloseButton(EavesDropHistoryFrameClose)
end
AS:RegisterSkin('EavesDrop', AS.EavesDrop)