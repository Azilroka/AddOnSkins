local AS, L, S, R = unpack(AddOnSkins)

function R:BuffomatClassic()
	local Buttons = {
		BomC_MainWindow_CloseButton,
		BomC_MainWindow_SettingsButton,
		BomC_MainWindow_MacroButton,
		BomC_ListTab_Button,
	}

	local Tabs = {
		BomC_MainWindowTab1,
		BomC_MainWindowTab2,
	}

	-- Skin elements
	for _, Button in pairs(Buttons) do S:HandleButton(Button) end
	for _, Tab in pairs(Tabs) do S:HandleFrame(Tab) end
	S:HandleFrame(BomC_MainWindow)
	S:HandleScrollBar(BomC_SpellTab_ScrollScrollBar)

	-- Reposition Tabs to fit nicely underneath the MainWindow
	local point, relTo, relPoint, xOfs, yOfs = BomC_MainWindowTab1:GetPoint()
	BomC_MainWindowTab1:SetPoint(point, relTo, relPoint, xOfs, 1)
	local point, relTo, relPoint, xOfs, yOfs = BomC_MainWindowTab2:GetPoint()
	BomC_MainWindowTab2:SetPoint(point, relTo, relPoint, (xOfs+18), yOfs)
end

AS:RegisterSkin('BuffomatClassic')
