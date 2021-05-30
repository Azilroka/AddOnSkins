local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Questie') then return end

function AS:Questie()
	AS:SkinButton(Questie_Toggle)
end

AS:RegisterSkin('Questie', AS.Questie)
