if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_PetStable()
	AS:SkinFrame(PetStableFrame)

	AS:SkinCloseButton(PetStableFrameCloseButton)

	AS:CreateBackdrop(PetStableModel)

	--AS:SkinTexture(PetStableDietTexture, true)
end

AS:RegisterSkin("Blizzard_PetStable", AS.Blizzard_PetStable, 'ADDON_LOADED')
