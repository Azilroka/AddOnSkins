local AS, L, S, R = unpack(AddOnSkins)

function R:AllTheThings()
	for _, Instance in pairs({ 'Prime', 'CurrentInstance' }) do
		local Window = AllTheThings:GetWindow(Instance)
		S:SetTemplate(Window)
		S:HandleCloseButton(Window.CloseButton)
		S:HandleScrollBar(Window.ScrollBar)
		Window.Container:SetPoint("RIGHT", Window.ScrollBar, "LEFT", -3, 0)
	end
end

AS:RegisterSkin('AllTheThings')

