if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

--WoW API / Variables
local GetPetHappiness = GetPetHappiness
local HasPetUI = HasPetUI
local UnitExists = UnitExists

function AS:Blizzard_PetStable()
	AS:SkinBackdropFrame(PetStableFrame)

	AS:SkinCloseButton(PetStableFrameCloseButton)

	AS:CreateBackdrop(PetStableModel)

	PetStableFramePortrait:SetAlpha(0)

	_G.PetStableFrame.Backdrop:SetPoint("TOPLEFT", 11, -12)
	_G.PetStableFrame.Backdrop:SetPoint("BOTTOMRIGHT", -32, 76)

	AS:SkinButton(_G.PetStableCurrentPet, true)

	for i = 1, _G.NUM_PET_STABLE_SLOTS do
		AS:SkinButton(_G['PetStableStabledPet'..i], true)
	end

	PetStableModelRotateLeftButton:SetSize(16, 16)
	PetStableModelRotateRightButton:SetSize(16, 16)
	AS:SkinArrowButton(_G.PetStableModelRotateRightButton)
	_G.PetStableModelRotateLeftButton:SetPoint('TOPLEFT', 2, -2)
	AS:SkinArrowButton(_G.PetStableModelRotateLeftButton)
	_G.PetStableModelRotateRightButton:SetPoint('TOPLEFT', _G.PetStableModelRotateLeftButton, 'TOPRIGHT', 3, 0)

	AS:CreateBackdrop(PetStablePetInfo)
	PetStablePetInfo:SetPoint('TOPLEFT', 3, -22)
	PetStablePetInfo:SetSize(24, 24)

	hooksecurefunc('PetStable_Update', function()
		local hasPetUI, isHunterPet = HasPetUI()
		if hasPetUI and not isHunterPet and UnitExists("pet") then return end

		local happiness = GetPetHappiness()
		local texture = PetStablePetInfo:GetRegions()

		if happiness == 1 then
			texture:SetTexCoord(0.41, 0.53, 0.06, 0.30)
		elseif happiness == 2 then
			texture:SetTexCoord(0.22, 0.345, 0.06, 0.30)
		elseif happiness == 3 then
			texture:SetTexCoord(0.04, 0.15, 0.06, 0.30)
		end
	end)
end

AS:RegisterSkin("Blizzard_PetStable", AS.Blizzard_PetStable, 'ADDON_LOADED')
