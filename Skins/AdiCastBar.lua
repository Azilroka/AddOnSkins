local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AdiCastBar') then return end

function AS:AdiCastBar()
	local frames = {
		AdiCastBar_player,
		AdiCastBar_pet,
		AdiCastBar_focus,
		AdiCastBar_target
	}

	for _, frame in pairs(frames) do
		AS:SkinBackdropFrame(frame)
		AS:StripTextures(frame.Border)
		frame.Bar:SetStatusBarTexture(AS.NormTex)
		frame.Text:SetFont(AS.Font, 12, 'THINOUTLINE')
		frame.Bar.TimeText:SetFont(AS.Font, 12, 'THINOUTLINE')
	end
end

AS:RegisterSkin('AdiCastBar', AS.AdiCastBar)