local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TomeOfTeleportation') then return end

function AS:TomeOfTeleportation()
	local R, G, B = unpack(AS.BackdropColor)
	local Alpha = (AS:CheckOption('SkinTemplate') == "Transparent" and .8 or 1)

	if AS:CheckAddOn('ElvUI') then
		if AS:CheckOption('SkinTemplate') == "Transparent" then
			R, G, B, Alpha = unpack(ElvUI[1]["media"].backdropfadecolor)
		else
			R, G, B = unpack(ElvUI[1]["media"].backdropcolor)
		end
	end

	local Backdrop = { bgFile = AS.Blank, tile = false, tileSize = 0, insets = {left = 4, right = 4, top = 4, bottom = 4} }

	local function SkinFrame()
		if not TeleporterFrame.IsSkinned then
			TeleporterFrame:SetBackdrop(Backdrop)
			TeleporterFrame:SetBackdropColor(R, G, B, Alpha)
		end
		local index = 0
		while _G['TeleporterFrameTeleporterB'..index] do
			_G['TeleporterFrameTeleporterB'..index]:SetBackdrop(Backdrop)
			_G['TeleporterFrameTeleporterB'..index]:SetBackdropColor(R, G, B, Alpha)
			index = index + 1
		end
		AS:StripTextures(TeleporterCloseButton, true)

		AS:StripTextures(TeleporterTitleFrame)
		TeleporterTitleFrame:SetPoint("TOP", "$parent", "TOP", 0, 0)
	end
	hooksecurefunc(_G, "TeleporterOpenFrame", SkinFrame)
end

AS:RegisterSkin('TomeOfTeleportation', AS.TomeOfTeleportation)