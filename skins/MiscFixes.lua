local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "AlwaysTrue"
function AS:SkinMisc(event)
	if event == "PLAYER_ENTERING_WORLD" then return end

	if IsAddOnLoaded("acb_CastBar") then
		AzCastBarPluginPlayer:StripTextures() AzCastBarPluginPlayer:CreateBackdrop()
		AzCastBarPluginTarget:StripTextures() AzCastBarPluginTarget:CreateBackdrop()
		AzCastBarPluginFocus:StripTextures() AzCastBarPluginFocus:CreateBackdrop()
		AzCastBarPluginMirror:StripTextures() AzCastBarPluginMirror:CreateBackdrop()
		AzCastBarPluginPet:StripTextures() AzCastBarPluginPet:CreateBackdrop()
	end
	
	for i = 1, 10 do
		if _G["StaticPopup"..i] then
			_G["StaticPopup"..i]:SetTemplate("Transparent")
			if _G["StaticPopup"..i.."Button1"] then S:HandleButton(_G["StaticPopup"..i.."Button1"]) end
			if _G["StaticPopup"..i.."Button2"] then S:HandleButton(_G["StaticPopup"..i.."Button2"]) end
			if _G["StaticPopup"..i.."CloseButton"] then S:HandleCloseButton(_G["StaticPopup"..i.."CloseButton"]) end
		end
	end
	
	if IsAddOnLoaded("PetJournalEnhanced") then PetJournal:HookScript("OnShow", function() PJEUniquePetCount:StripTextures() end) end
	
	if IsAddOnLoaded("DoubleWideTradeSkills") then
		TradeSkillListScrollFrame:StripTextures()
		AS:SkinFrame(TradeSkillFrame)
		AS:SkinStatusBar(TradeSkillRankFrame)
	end
	
	--TrainAll
	if IsAddOnLoaded("Blizzard_TrainerUI") then
		ClassTrainerFrame:HookScript("OnShow", function()
			if ClassTrainerTrainAllButton then
				AS:SkinFrame(ClassTrainerTrainAllButton, 'Default')
				AS:SkinFrame(ClassTrainerTrainButton, 'Default')
			end
		end)
	end
end
AS:RegisterSkin(name, AS.SkinMisc, "ADDON_LOADED")