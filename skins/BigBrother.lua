local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "BigBrotherSkin"
function AS:SkinBigBrother()
	BigBrother:ToggleBuffWindow()
	AS:SkinFrame(BigBrother_BuffWindow)
	AS:SkinCloseButton(BigBrother_BuffWindow.CloseButton)
	AS:SkinButton(BigBrother_BuffWindow.LeftButton)
	BigBrother_BuffWindow.LeftButton:FontString("text", AS.PixelFont, AS.DataTextFontSize) --"MONOCHROMEOUTLINE"
	BigBrother_BuffWindow.LeftButton.text:SetText("<")
	BigBrother_BuffWindow.LeftButton.text:SetPoint("CENTER", 1, 1)
	AS:SkinButton(BigBrother_BuffWindow.RightButton)
	BigBrother_BuffWindow.RightButton:FontString("text", AS.PixelFont, AS.DataTextFontSize) --"MONOCHROMEOUTLINE"
	BigBrother_BuffWindow.RightButton.text:SetText(">")
	BigBrother_BuffWindow.RightButton.text:SetPoint("CENTER", 1, 1)
	BigBrother:ToggleBuffWindow()
end

AS:RegisterSkin(name, AS.SkinBigBrother)