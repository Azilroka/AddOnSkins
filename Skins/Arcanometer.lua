local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Arcanometer') then return end

function AS:Arcanometer(event, addon)
	uiAmtrFrameBG:Kill()
	uiAmtrBorder:Kill()

	AS:SkinFrame(uiAmtrFrame)
	AS:SkinStatusBar(amtrManaBar)
	amtrTimeBarBackground:SetTexture(AS.NormTex)

	local Icons = {
		'Bomb',
		'PowerTalent',
		'Charge1',
		'Charge2',
		'Charge3',
		'Charge4',
	}

	for _, object in pairs(Icons) do
		AS:CreateBackdrop(_G['uiAmtrFrame'..object])
		AS:SkinTexture(_G['uiAmtrFrame'..object..'Icon'])
		_G['uiAmtrFrame'..object..'Overlay']:Kill()
	end
end

AS:RegisterSkin('Arcanometer', AS.Arcanometer)