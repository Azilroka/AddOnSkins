local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('FaceShooter') then return end

local name = 'FaceShooterSkin'
function AS:SkinFaceShooter()
	if button1Mover then
	button1Button.texture:SetTexCoord(unpack(AS.TexCoords))

		if not button1Button.b then
			button1Button:Hide()
			button1Button.b = CreateFrame("Frame", nil, button1Button)
			button1Button.b:SetTemplate("Default")
			button1Button.b:SetFrameStrata("BACKGROUND")
			button1Button.b:SetOutside(button1Button)
		end
	end

	if button2Mover then
		button2Button.texture:SetTexCoord(unpack(AS.TexCoords))

		if not button2Button.b then
			button2Button:Hide()
			button2Button.b = CreateFrame("Frame", nil, button2Button)
			button2Button.b:SetTemplate("Default")
			button2Button.b:SetFrameStrata("BACKGROUND")
			button2Button.b:SetOutside(button2Button)
		end
	end
end

AS:RegisterSkin(name, AS.SkinFaceShooter)