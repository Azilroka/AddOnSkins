local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('FlyPlateBuffs') then return end

function AS:FPB()
	local C_NamePlate_GetNamePlateForUnit = C_NamePlate.GetNamePlateForUnit

	local function skinNameplateButton(Button)
		--remove fPB stuff
		Button.durationBg:SetTexture('')
		Button.border:SetTexture('')
		--texture
		AS:SkinTexture(Button.texture)
		Button.texture:SetInside(Button, 0, 0)

		AS:CreateBackdrop(Button)

	end

	local function getButtonsFromNameplate(nameplate)
		if not nameplate then return end
		if not nameplate.fPBiconsFrame then return end
		if not nameplate.fPBiconsFrame.iconsFrame then return end

		for i = 1, #nameplate.fPBiconsFrame.iconsFrame do
			if not nameplate.fPBiconsFrame.iconsFrame[i] then return end
			skinNameplateButton(nameplate.fPBiconsFrame.iconsFrame[i])
		end
	end

	local testframe = CreateFrame("Frame")
	testframe:RegisterEvent("UNIT_AURA")
	testframe:SetScript("OnEvent", function(self, event, ...)
		if event == "UNIT_AURA" then
			if strmatch((...), "nameplate%d+") then
				getButtonsFromNameplate(C_NamePlate_GetNamePlateForUnit(...))
			end
		end
	end)
end

AS:RegisterSkin('FlyPlateBuffs', AS.FPB)
