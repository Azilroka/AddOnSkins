local AS = unpack(AddOnSkins)

function AS:AllTheThings()
	local CurrentInstance = AllTheThings:GetWindow('CurrentInstance')
	AS:SetTemplate(CurrentInstance, 'Transparent')
	AS:SkinCloseButton(CurrentInstance.CloseButton)
	AS:SkinScrollBar(CurrentInstance.ScrollBar)
	CurrentInstance.Container:SetPoint("RIGHT", CurrentInstance.ScrollBar, "LEFT", -3, 0)
end

AS:RegisterSkin('AllTheThings', AS.AllTheThings)

