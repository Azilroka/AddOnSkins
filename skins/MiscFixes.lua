local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

name = "AlwaysTrue"
function SkinMisc()
	
	LoadAddOn("acb_CastBar")
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
	
	if IsAddOnLoaded("PetJournalEnhanced") then LoadAddOn("Blizzard_PetJournal") PetJournal:HookScript("OnShow", function() PJEUniquePetCount:StripTextures() end) end
	
	LoadAddOn("Blizzard_TradeSkillUI")
	if IsAddOnLoaded("DoubleWideTradeSkills") then
		TradeSkillListScrollFrame:StripTextures()
		AS:SkinFrame(TradeSkillFrame)
		AS:SkinStatusBar(TradeSkillRankFrame)
	end
	
	--TrainAll
	LoadAddOn("Blizzard_TrainerUI")
	ClassTrainerFrame:HookScript("OnShow", function()
		if ClassTrainerTrainAllButton then
			AS:SkinFrameD(ClassTrainerTrainAllButton)
			AS:SkinFrameD(ClassTrainerTrainButton)
		end
	end)
end
AS:RegisterSkin(name, SkinMisc)