local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AllTheThings') then return end

function AS:AllTheThings()
	for _, Instance in pairs({ 'Prime', 'CurrentInstance' }) do
		local Window = AllTheThings:GetWindow(Instance)
		AS:SetTemplate(Window)
		AS:SkinCloseButton(Window.CloseButton)
		AS:SkinScrollBar(Window.ScrollBar)
		Window.Container:SetPoint("RIGHT", Window.ScrollBar, "LEFT", -3, 0)
	end
end

AS:RegisterSkin('AllTheThings', AS.AllTheThings)

