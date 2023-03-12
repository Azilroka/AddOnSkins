local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('TomeOfTeleportation') then return end

function R:TomeOfTeleportation()
	local function SkinFrame()
		S:SetTemplate(TeleporterFrame)

		S:StripTextures(TeleporterCloseButton, true)
		S:StripTextures(TeleporterTitleFrame)
		TeleporterTitleFrame:SetPoint("TOP", "$parent", "TOP", 0, 0)
	end

	hooksecurefunc(_G, "TeleporterOpenFrame", SkinFrame)
end

AS:RegisterSkin('TomeOfTeleportation', R.TomeOfTeleportation)
