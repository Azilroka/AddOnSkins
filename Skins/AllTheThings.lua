local AS = unpack(AddOnSkins)

function AS:AllTheThings()
	AllTheThings:GetWindow('CurrentInstance'):SetTemplate('Transparent')
end

AS:RegisterSkin('AllTheThings', AS.AllTheThings)

