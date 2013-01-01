local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "BigBrotherSkin"
local function SkinBigBrother(self)
	BigBrother:ToggleBuffWindow()
	AS:SkinFrame(BigBrother_BuffWindow)
	S:HandleCloseButton(BigBrother_BuffWindow.CloseButton)
	S:HandleButton(BigBrother_BuffWindow.LeftButton)
	BigBrother_BuffWindow.LeftButton:FontString("text", AS.LSM:Fetch("font",E.db.general.font), 12, "OUTLINE")
	BigBrother_BuffWindow.LeftButton.text:SetText("<")
	BigBrother_BuffWindow.LeftButton.text:SetPoint("CENTER", 1, 1 )
	U.SkinButton(BigBrother_BuffWindow.RightButton)
	BigBrother_BuffWindow.RightButton:FontString("text", AS.LSM:Fetch("font",E.db.general.font), 12, "OUTLINE")
	BigBrother_BuffWindow.RightButton.text:SetText(">")
	BigBrother_BuffWindow.RightButton.text:SetPoint("CENTER", 1, 1 )
	BigBrother:ToggleBuffWindow()
end

AS:RegisterSkin(name,SkinBigBrother)