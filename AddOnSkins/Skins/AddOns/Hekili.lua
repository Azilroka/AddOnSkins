local AS, L, S, R = unpack(AddOnSkins)

function R:Hekili()
	for Display, _ in ipairs( Hekili.DB.profile.displays ) do
		for Buttons = 1, Hekili.DB.profile.displays[Display].numIcons do
			local Button = _G['Hekili_D'..Display..'_B'..Buttons]
			S:CreateBackdrop(Button)
			S:HandleIcon(Button.Texture)
		end
	end
end

AS:RegisterSkin('Hekili')
