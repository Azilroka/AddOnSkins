local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Dresser') then return end

function AS:Dresser()
	AS:SkinButton(DresserButton1)
	AS:SkinButton(DresserButton2)
	AS:SkinButton(DresserButton3)
	AS:SkinButton(DresserButton4)
	DresserButton1:ClearAllPoints()
	DresserButton1:Point('BOTTOMLEFT', DressUpFrame, 'BOTTOMLEFT', 138, 79)
	DresserButton2:ClearAllPoints()
	DresserButton2:Point('BOTTOMLEFT', DressUpFrame, 'BOTTOMLEFT', 96, 79)
	DresserButton3:ClearAllPoints()
	DresserButton3:Point('BOTTOMLEFT', DressUpFrame, 'BOTTOMLEFT', 54, 79)
	DresserButton4:ClearAllPoints()
	DresserButton4:Point('BOTTOMLEFT', DressUpFrame, 'BOTTOMLEFT', 12, 79)
	DresserButton1:Size(38, 22)
	DresserButton2:Size(38, 22)
	DresserButton3:Size(38, 22)
	DresserButton4:Size(38, 22)
end

AS:RegisterSkin('Dresser', AS.Dresser)