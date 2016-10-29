local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Hekili') then return end

function AS:Hekili()
	for i = 1, #Hekili.DB.profile.displays do
		for n = 1, #Hekili.DB.profile.displays[i]['Icons Shown'] do
			AS:CreateBackdrop(_G['Hekili_D'..i..'_B'..n], 'Transparent')
			AS:SkinTexture(_G['Hekili_D'..i..'_B'..n].Texture)
		end
	end
end

AS:RegisterSkin('Hekili', AS.Hekili)