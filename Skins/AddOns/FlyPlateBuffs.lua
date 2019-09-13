local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('FlyPlateBuffs') then return end

function AS:FPB()
	local C_NamePlate_GetNamePlateForUnit = C_NamePlate.GetNamePlateForUnit

	local function skinIconButton(Button) AS:SkinTexture(Button.texture) end

	local function getIconsFromFrame(frame)
		if not frame then return end
		if not frame.fPBiconsFrame then return end
		if not frame.fPBiconsFrame.iconsFrame then return end

		for i = 1, #frame.fPBiconsFrame.iconsFrame do
			if not frame.fPBiconsFrame.iconsFrame[i] then return end
			skinIconButton(frame.fPBiconsFrame.iconsFrame[i])
		end
	end

	local testframe = CreateFrame("Frame")
	testframe:RegisterEvent("UNIT_AURA")
	testframe:SetScript("OnEvent", function(self, event, ...)
		if event == "UNIT_AURA" then
			if strmatch((...), "nameplate%d+") then
				getIconsFromFrame(C_NamePlate_GetNamePlateForUnit(...))
			end
		end
	end)
end

AS:RegisterSkin('FlyPlateBuffs', AS.FPB)