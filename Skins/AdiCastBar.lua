local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AdiCastBar') then return end

local name = 'AdiCastBarSkin'
function AS:SkinAdiCastBar()
	local frames = {
		AdiCastBar_player,
		AdiCastBar_pet,
		AdiCastBar_focus,
		AdiCastBar_target
	}

	for _, frame in pairs(frames) do
		AS:SkinBackdropFrame(frame)
		frame.Border:StripTextures()
		frame.Bar:SetStatusBarTexture(AS.NormTex)
		frame.Text:SetFont(AS.Font, 12, 'THINOUTLINE')
		frame.Bar.TimeText:SetFont(AS.Font, 12, 'THINOUTLINE')
	end
end

AS:RegisterSkin(name, AS.SkinAdiCastBar)