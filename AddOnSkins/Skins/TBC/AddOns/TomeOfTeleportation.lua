local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TomeOfTeleportation') then return end

function AS:TomeOfTeleportation()
	local function SkinFrame()
		AS:SetTemplate(TeleporterFrame)

		AS:StripTextures(TeleporterCloseButton, true)
		AS:StripTextures(TeleporterTitleFrame)
		TeleporterTitleFrame:SetPoint("TOP", "$parent", "TOP", 0, 0)
	end

	hooksecurefunc(_G, "TeleporterOpenFrame", SkinFrame)
end

AS:RegisterSkin('TomeOfTeleportation', AS.TomeOfTeleportation)
