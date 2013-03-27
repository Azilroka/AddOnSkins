local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "EavesDropSkin"
function AS:SkinEavesDrop()
	AS:SkinFrame(EavesDropFrame)
	AS:SkinFrame(EavesDropHistoryFrame)
	S:HandleTab(EavesDropTab)
	EavesDropTab.backdrop:Point("TOPLEFT", 0, -5)
	EavesDropTab.backdrop:Point("BOTTOMRIGHT", 0, 2)
	EavesDropTabText:ClearAllPoints()
	EavesDropTabText:SetPoint("CENTER", EavesDropTab, "CENTER", 0, -2)
	S:HandleButton(EavesDropHistoryFrameReset)
	S:HandleCloseButton(EavesDropHistoryFrameClose)
end
AS:RegisterSkin(name, AS.SkinEavesDrop)