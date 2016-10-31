local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Hekili') then return end

function AS:Hekili()
	local NumDisplays

	for display, _ in ipairs( Hekili.DB.profile.displays ) do
		NumDisplays = display
	end

	for i = 1, NumDisplays do
		local NumButtons = Hekili.DB.profile.displays[i]['Icons Shown']
		for n = 1, NumButtons do
			AS:CreateBackdrop(_G['Hekili_D'..i..'_B'..n], 'Transparent')
			AS:SkinTexture(_G['Hekili_D'..i..'_B'..n].Texture)
		end
	end
end

AS:RegisterSkin('Hekili', AS.Hekili)