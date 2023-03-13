local AS, L, S, R = unpack(AddOnSkins)

function R:KarniCrap()
	local Frames = {
		KarniCrap,
		KarniCrap_Blacklist,
		KarniCrap_CategoryFrame,
		KarniCrap_Inventory,
		KarniCrap_OptionsFrame,
		KarniCrap_Whitelist,
	}

	for _, object in pairs(Frames) do
		S:HandleFrame(object)
	end

	local Tabs = {
		KarniCrapTab1,
		KarniCrapTab2,
		KarniCrapTab3,
	}

	for _, object in pairs(Tabs) do
		S:HandleTab(object)
	end

	local Buttons = {
		KarniCrap_BtnBlacklistRemove,
		KarniCrap_BtnWhitelistRemove,
		KarniCrap_InvHeader1,
		KarniCrap_InvHeader2,
		KarniCrap_ValueHeader,
		KarniCrap_InvHeader4,
		KarniCrap_BtnDestroyItem,
		KarniCrap_BtnDestroyAllCrap,
	}

	for _, object in pairs(Buttons) do
		S:HandleButton(object)
	end

	local CheckBoxes = {
		KarniCrap_CBEnabled,
		KarniCrap_CBPoor,
		KarniCrap_Tab1_CBCommon,
		KarniCrap_Tab1_CBUseStackValue,
		KarniCrap_Tab1_CBEcho,
		KarniCrap_CBDestroy,
		KarniCrap_CBDestroySlots,
		KarniCrap_CBNoDestroyTradeskill,
		KarniCrap_CBDestroyGroup,
		KarniCrap_CBDestroyRaid,
		KarniCrap_Cloth_CBLinen,
		KarniCrap_Cloth_CBLinen_Never,
		KarniCrap_Cloth_CBWool,
		KarniCrap_Cloth_CBWool_Never,
		KarniCrap_Cloth_CBSilk,
		KarniCrap_Cloth_CBSilk_Never,
		KarniCrap_Cloth_CBMageweave,
		KarniCrap_Cloth_CBMageweave_Never,
		KarniCrap_Cloth_CBRunecloth,
		KarniCrap_Cloth_CBRunecloth_Never,
		KarniCrap_Cloth_CBNetherweave,
		KarniCrap_Cloth_CBNetherweave_Never,
		KarniCrap_Cloth_CBFrostweave,
		KarniCrap_Cloth_CBFrostweave_Never,
		KarniCrap_Cloth_CBEmbersilk,
		KarniCrap_Cloth_CBEmbersilk_Never,
		KarniCrap_Corpses_CBSkinnable,
		KarniCrap_Corpses_CBGatherable,
		KarniCrap_Corpses_CBMinable,
		KarniCrap_Corpses_CBEngineerable,
		KarniCrap_Corpses_CBSkilledEnough,
		KarniCrap_Consumables_RBFood1,
		KarniCrap_Consumables_RBFood2,
		KarniCrap_Consumables_CBFoodMax,
		KarniCrap_Consumables_RBWater1,
		KarniCrap_Consumables_RBWater2,
		KarniCrap_Consumables_CBWaterMax,
		KarniCrap_Potions_RBHealth1,
		KarniCrap_Potions_RBHealth2,
		KarniCrap_Potions_CBHealthMax,
		KarniCrap_Potions_RBMana1,
		KarniCrap_Potions_RBMana2,
		KarniCrap_Potions_CBManaMax,
		KarniCrap_Quality_CBQualityPoor,
		KarniCrap_Quality_CBQualityCommon,
		KarniCrap_Quality_CBQualityUncommon,
		KarniCrap_Quality_CBQualityRare,
		KarniCrap_Quality_CBQualityEpic,
		KarniCrap_Quality_CBQualityGrouped,
		KarniCrap_Scrolls_CBMaxScrolls,
		KarniCrap_Scrolls_CBScrollAgility,
		KarniCrap_Scrolls_CBScrollIntellect,
		KarniCrap_Scrolls_CBScrollProtection,
		KarniCrap_Scrolls_CBScrollSpirit,
		KarniCrap_Scrolls_CBScrollStamina,
		KarniCrap_Scrolls_CBScrollStrength,
		KarniCrap_Tradeskills_CBCooking,
		KarniCrap_Tradeskills_CBFishing,
		KarniCrap_Tradeskills_CBPickpocketing,
		KarniCrap_Tradeskills_CBEnchanting,
		KarniCrap_Tradeskills_CBGathering,
		KarniCrap_Tradeskills_CBMilling,
		KarniCrap_Tradeskills_CBMining,
		KarniCrap_Tradeskills_CBProspecting,
		KarniCrap_Tradeskills_CBSkinning,
		KarniCrap_Inventory_CBHideQuestItems,
		KarniCrap_CBOpenAtMerchant,
	}

	for _, object in pairs(CheckBoxes) do
		S:HandleCheckBox(object)
	end

	local EditBoxes = {
		KarniCrap_Poor_GoldInputBox,
		KarniCrap_Poor_SilverInputBox,
		KarniCrap_Poor_CopperInputBox,
		KarniCrap_Tab1_CBCommonDesc_GoldInputBox,
		KarniCrap_Tab1_CBCommonDesc_SilverInputBox,
		KarniCrap_Tab1_CBCommonDesc_CopperInputBox,
		KarniCrap_EBDestroySlotsNum,
	}

	--[[for _, object in pairs(EditBoxes) do
		S:HandleEditBox(object)
	end]]

	S:StripTextures(KarniCrap_Inventory_ScrollBar, true)
	KarniCrapTab1:SetPoint('BOTTOMLEFT', KarniCrap, 'BOTTOMLEFT',0,-30)
	S:HandleScrollBar(KarniCrap_Inventory_ScrollBarScrollBar)
	S:HandleCloseButton(KarniCrapCloseButton)
	S:Kill(KarniCrapPortrait)

	for i = 1, 15 do
		S:HandleCloseButton(_G['KarniInvEntry'..i..'_BtnCrap'])
	end
end

AS:RegisterSkin('KarniCrap')
