local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('ElvUI') then return end
local E

function AS:UpdateMedia()
	if not ElvUI then return end
	if not E then
		E = unpack(ElvUI)
	end

	AS.Blank = AS.LSM:Fetch('background', 'ElvUI Blank')
	AS.Font = AS.LSM:Fetch('font', E.db.general.font)
	AS.NormTex = AS.LSM:Fetch('statusbar', E.private.general.normTex)
	AS.BackdropColor = E['media'].backdropcolor
	AS.BorderColor = E['media'].bordercolor
	AS.Color = E["media"].rgbvaluecolor or AS.ClassColor
	AS.HideShadows = false

	AS.TexCoords = {0, 1, 0, 1}
	local modifier = 0.04 * _G.ElvUI[1].db.general.cropIcon
	for i, v in ipairs(AS.TexCoords) do
		if i % 2 == 0 then
			AS.TexCoords[i] = v - modifier
		else
			AS.TexCoords[i] = v + modifier
		end
	end
end
