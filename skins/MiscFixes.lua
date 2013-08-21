local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'MiscFixes'
function AS:MiscFixes(event, addon)

	if addon == 'Blizzard_PetJournal' and IsAddOnLoaded('PetJournalEnhanced') then
		PetJournal:HookScript('OnShow', function() PJEUniquePetCount:StripTextures() end)
	end

	if IsAddOnLoaded('acb_CastBar') then
		AS:SkinBackdropFrame(AzCastBarPluginPlayer)
		AS:SkinBackdropFrame(AzCastBarPluginTarget)
		AS:SkinBackdropFrame(AzCastBarPluginFocus)
		AS:SkinBackdropFrame(AzCastBarPluginMirror)
		AS:SkinBackdropFrame(AzCastBarPluginPet)
	end

	if IsAddOnLoaded('DoubleWideTradeSkills') then
		TradeSkillListScrollFrame:StripTextures()
		AS:SkinFrame(TradeSkillFrame)
		AS:SkinStatusBar(TradeSkillRankFrame)
	end

	if addon == 'Blizzard_TradeSkillUI' and IsAddOnLoaded('Auctionator') then 
		TradeSkillFrame:HookScript('OnShow', function() AS:SkinButton(Auctionator_Search, true) end)
	end

	if addon == 'Blizzard_TrainerUI' and IsAddOnLoaded('TrainAll') then
		ClassTrainerFrame:HookScript('OnShow', function()
			AS:SkinFrame(ClassTrainerTrainAllButton, 'Default')
			AS:SkinFrame(ClassTrainerTrainButton, 'Default')
		end)
	end

	if XPBarNoneXPBar then XPBarNoneXPBar:CreateBackdrop('Transparent') end

	for i = 1, 10 do
		if _G['StaticPopup'..i] then
			_G['StaticPopup'..i]:SetTemplate('Transparent')
			if _G['StaticPopup'..i..'Button1'] then AS:SkinButton(_G['StaticPopup'..i..'Button1']) end
			if _G['StaticPopup'..i..'Button2'] then AS:SkinButton(_G['StaticPopup'..i..'Button2']) end
			if _G['StaticPopup'..i..'CloseButton'] then AS:SkinCloseButton(_G['StaticPopup'..i..'CloseButton']) end
		end
	end
end

AS:RegisterSkin(name, AS.MiscFixes, 'ADDON_LOADED')