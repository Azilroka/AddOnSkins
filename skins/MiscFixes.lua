local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local MiscFixes = CreateFrame("Frame")
MiscFixes:RegisterEvent("PLAYER_ENTERING_WORLD")
MiscFixes:RegisterEvent("PLAYER_REGEN_ENABLED")
MiscFixes:RegisterEvent("PLAYER_REGEN_DISABLED")

MiscFixes:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_REGEN_ENABLED" or event == "PLAYER_REGEN_DISABLED" then
		if IsAddOnLoaded("tCombo") then
			if (tComboPoints and not tComboPoints.skinned) then 
				tComboPoints.skinned = true
				tComboPoints:SetTemplate("Transparent")
				tComboEnergyBar:SetTemplate("Transparent")
			end
		end
	else
		if IsAddOnLoaded("stAddonManager") then
			GameMenuFrame:HookScript("OnShow", function() if GameMenuButtonAddons then AS:SkinButton(GameMenuButtonAddons) end end)
		end

		if IsAddOnLoaded("TomTom") and (AS:CheckOption("TomTomSkin")) then
			if TomTomBlock then
				TomTomBlock:SetTemplate("Transparent")
			end
		end
		if IsAddOnLoaded("SymbiosisTip") then
			SymbiosisTip:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
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

		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end
end)

