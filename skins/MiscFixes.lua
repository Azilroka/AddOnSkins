local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "TomTomSkin"
local function SkinTomTom()
	if TomTomBlock then
		TomTomBlock:SetTemplate("Transparent")
	end
end
AS:RegisterSkin(name, SkinTomTom)

name = "AlwaysTrue"
function SkinMisc()
	if IsAddOnLoaded("stAddonManager") then
		GameMenuFrame:HookScript("OnShow", function() if GameMenuButtonAddons then S:HandleButton(GameMenuButtonAddons) end end)
	end
	if IsAddOnLoaded("VengeanceStatus") and (AS:CheckOption("VengeanceStatusSkin")) then
		AS:SkinStatusBar(VengeanceStatus_StatusBar)
	end
	
	LoadAddOn("acb_CastBar")
	if IsAddOnLoaded("acb_CastBar") then
		AzCastBarPluginPlayer:StripTextures() AzCastBarPluginPlayer:CreateBackdrop()
		AzCastBarPluginTarget:StripTextures() AzCastBarPluginTarget:CreateBackdrop()
		AzCastBarPluginFocus:StripTextures() AzCastBarPluginFocus:CreateBackdrop()
		AzCastBarPluginMirror:StripTextures() AzCastBarPluginMirror:CreateBackdrop()
		AzCastBarPluginPet:StripTextures() AzCastBarPluginPet:CreateBackdrop()
	end
end
AS:RegisterSkin(name, SkinMisc)
