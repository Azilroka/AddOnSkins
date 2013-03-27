local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "DresserSkin"
function AS:SkinDresser()
	-- Dresser Skin
	S:HandleButton(DresserButton1)
	S:HandleButton(DresserButton2)
	S:HandleButton(DresserButton3)
	S:HandleButton(DresserButton4)

	--Reposition buttons
	DresserButton1:ClearAllPoints()
	DresserButton1:Point("BOTTOMLEFT", DressUpFrame, "BOTTOMLEFT", 138, 79)
	DresserButton2:ClearAllPoints()
	DresserButton2:Point("BOTTOMLEFT", DressUpFrame, "BOTTOMLEFT", 96, 79)
	DresserButton3:ClearAllPoints()
	DresserButton3:Point("BOTTOMLEFT", DressUpFrame, "BOTTOMLEFT", 54, 79)
	DresserButton4:ClearAllPoints()
	DresserButton4:Point("BOTTOMLEFT", DressUpFrame, "BOTTOMLEFT", 12, 79)

	--Resize Buttons
	DresserButton1:Size(38, 22)
	DresserButton2:Size(38, 22)
	DresserButton3:Size(38, 22)
	DresserButton4:Size(38, 22)
end

AS:RegisterSkin(name, AS.SkinDresser)