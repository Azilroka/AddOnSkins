local AS = unpack(AddOnSkins)

function AS:Blizzard_PetStable()
	AS:SkinFrame(PetStableFrame)

	AS:StripTextures(PetStableFrame.Inset)
	AS:StripTextures(PetStableFrame.LeftInset)
	AS:StripTextures(PetStableFrame.BottomInset)
	AS:SkinCloseButton(PetStableFrame.CloseButton)
	AS:SkinButton(PetStablePrevPageButton)
	AS:SkinButton(PetStableNextPageButton)

	AS:CreateBackdrop(PetStableModel)

	AS:SkinTexture(PetStableSelectedPetIcon, true)
	PetStableSelectedPetIcon:SetSize(36, 36)

	--AS:SkinTexture(PetStableDietTexture, true)

	for Pet, Num in pairs({ PetStableActivePet = 5, PetStableStabledPet = 10 }) do
		for i = 1, Num do
			local Button = _G[Pet..i]
			local Icon = _G[Pet..i..'IconTexture']
			AS:SetTemplate(Button)
			AS:StyleButton(Button)

			AS:SkinTexture(Icon)
			Icon:SetInside()

			if Button.Border then
				Button.Border:Hide()
			end
			Button.Background:Hide()
			Button.Checked:SetAlpha(0)

			if Button.Checked:IsShown() then
				Button:SetBackdropBorderColor(0, 0.44, .87)
			end

			hooksecurefunc(Button.Checked, 'Show', function()
				Button:SetBackdropBorderColor(0, 0.44, .87)
			end)
			hooksecurefunc(Button.Checked, 'Hide', function()
				Button:SetBackdropBorderColor(unpack(AS.BorderColor))
			end)
		end
	end
end

AS:RegisterSkin("Blizzard_PetStable", AS.Blizzard_PetStable, 'ADDON_LOADED')
