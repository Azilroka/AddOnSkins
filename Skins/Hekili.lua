local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Hekili') then return end

function AS:Hekili()
	for Display, _ in ipairs( Hekili.DB.profile.displays ) do
		for Buttons = 1, Hekili.DB.profile.displays[Display]['Icons Shown'] do
			local Button = _G['Hekili_D'..Display..'_B'..Buttons]
			AS:CreateBackdrop(Button, 'Transparent')
			AS:SkinTexture(Button.Texture)
		end
	end
end

AS:RegisterSkin('Hekili', AS.Hekili)