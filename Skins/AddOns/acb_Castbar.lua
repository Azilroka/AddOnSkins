local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('acb_CastBar') then return end

function AS:acb_CastBar()
	local Bars = { 'Player', 'Pet', 'Target', 'Focus', 'Mirror' }

	for _, Frame in pairs(Bars) do
		local Bar = _G['AzCastBarPlugin'..Frame]
		if Bar then
			AS:StripTextures(Bar)
			AS:CreateBackdrop(Bar)
			Bar.Backdrop:SetOutside(Bar.icon)
			AS:SkinStatusBar(Bar.status)

			if not AzCastBar_Config[Frame]['AddOnSkins'] then
				AzCastBar_Config[Frame]["useSameBGTexture"] = true
				AzCastBar_Config[Frame]["colBackdrop"] = { 0, 0, 0, 0 }
				AzCastBar_Config[Frame]["iconOffset"] = 3
				AzCastBar_Config[Frame]["texture"] = AS.NormTex

				AzCastBar_Config[Frame]['AddOnSkins'] = true
			end
		end
	end
end

AS:RegisterSkin('acb_CastBar', AS.acb_CastBar)
