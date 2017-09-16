local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('FaceShooter') then return end

function AS:FaceShooter()
	if button1Mover then
	AS:SkinTexture(button1Button.texture)

		if not button1Button.b then
			button1Button:Hide()
			button1Button.b = CreateFrame("Frame", nil, button1Button)
			AS:SetTemplate(button1Button.b, 'Default')
			button1Button.b:SetFrameStrata("BACKGROUND")
			button1Button.b:SetOutside(button1Button)
		end
	end

	if button2Mover then
		AS:SkinTexture(button2Button.texture)

		if not button2Button.b then
			button2Button:Hide()
			button2Button.b = CreateFrame("Frame", nil, button2Button)
			AS:SetTemplate(button2Button.b, 'Default')
			button2Button.b:SetFrameStrata("BACKGROUND")
			button2Button.b:SetOutside(button2Button)
		end
	end
end

AS:RegisterSkin('FaceShooter', AS.FaceShooter)