if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local pairs, select, unpack = pairs, select, unpack
--WoW API / Variables
local CreateFrame = CreateFrame
local GetItemInfo = GetItemInfo
local hooksecurefunc = hooksecurefunc
local ITEM_QUALITY_COLORS = ITEM_QUALITY_COLORS
local SetLargeGuildTabardTextures = SetLargeGuildTabardTextures
local AchievementAlertSystem = AchievementAlertSystem
local CriteriaAlertSystem = CriteriaAlertSystem
local DungeonCompletionAlertSystem = DungeonCompletionAlertSystem
local GuildChallengeAlertSystem = GuildChallengeAlertSystem
local InvasionAlertSystem = InvasionAlertSystem
local ScenarioAlertSystem = ScenarioAlertSystem
local WorldQuestCompleteAlertSystem = WorldQuestCompleteAlertSystem
local GarrisonFollowerAlertSystem = GarrisonFollowerAlertSystem
local GarrisonShipFollowerAlertSystem = GarrisonShipFollowerAlertSystem
local GarrisonTalentAlertSystem = GarrisonTalentAlertSystem
local GarrisonBuildingAlertSystem = GarrisonBuildingAlertSystem
local GarrisonMissionAlertSystem = GarrisonMissionAlertSystem
local GarrisonShipMissionAlertSystem = GarrisonShipMissionAlertSystem
local GarrisonRandomMissionAlertSystem = GarrisonRandomMissionAlertSystem
local LegendaryItemAlertSystem = LegendaryItemAlertSystem
local LootAlertSystem = LootAlertSystem
local LootUpgradeAlertSystem = LootUpgradeAlertSystem
local MoneyWonAlertSystem = MoneyWonAlertSystem
local StorePurchaseAlertSystem = StorePurchaseAlertSystem
local DigsiteCompleteAlertSystem = DigsiteCompleteAlertSystem
local NewRecipeLearnedAlertSystem = NewRecipeLearnedAlertSystem
local NewPetAlertSystem = NewPetAlertSystem
local NewMountAlertSystem = NewMountAlertSystem
-- GLOBALS:

function AS:Blizzard_Alerts()
	local function SkinAchievementAlert(frame)
		if not frame.Backdrop then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint("TOPLEFT", frame.Background, "TOPLEFT", -2, -6)
			frame.Backdrop:SetPoint("BOTTOMRIGHT", frame.Background, "BOTTOMRIGHT", -2, 6)
		end

		-- Background
		frame.Background:SetTexture()
		frame.OldAchievement:SetAlpha(0)
		frame.glow:SetAlpha(0)
		frame.shine:SetAlpha(0)
		frame.GuildBanner:SetAlpha(0)
		frame.GuildBorder:SetAlpha(0)

		-- Text
		frame.Unlocked:SetTextColor(1, 1, 1)

		-- Icon
		AS:SkinTexture(frame.Icon.Texture, true)
		frame.Icon.Overlay:SetAlpha(0)
		frame.Icon.Texture:ClearAllPoints()
		frame.Icon.Texture:SetPoint("LEFT", frame, 7, 0)
	end

	local function SkinCriteriaAlert(frame)
		if not frame.Backdrop then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint("TOPLEFT", frame, "TOPLEFT", -2, -6)
			frame.Backdrop:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 6)
		end

		frame.Unlocked:SetTextColor(1, 1, 1)
		frame.Name:SetTextColor(1, .8, .1)
		frame.Background:SetAlpha(0)
		frame.glow:SetAlpha(0)
		frame.shine:SetAlpha(0)
		frame.Icon.Bling:SetAlpha(0)
		frame.Icon.Overlay:SetAlpha(0)

		AS:SkinTexture(frame.Icon.Texture, true)
	end

	local function SkinDungeonCompletionAlert(frame)
		if not frame.Backdrop then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint("TOPLEFT", frame, "TOPLEFT", -2, -6)
			frame.Backdrop:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 6)
		end

		frame.shine:SetAlpha(0)
		frame.glowFrame:SetAlpha(0)
		frame.glowFrame.glow:SetAlpha(0)

		frame.raidArt:SetAlpha(0)
		frame.dungeonArt1:SetAlpha(0)
		frame.dungeonArt2:SetAlpha(0)
		frame.dungeonArt3:SetAlpha(0)
		frame.dungeonArt4:SetAlpha(0)
		frame.heroicIcon:SetAlpha(0)

		-- Icon
		AS:SkinTexture(frame.dungeonTexture, true)
		frame.dungeonTexture:ClearAllPoints()
		frame.dungeonTexture:SetPoint("LEFT", frame, 7, 0)
	end

	local function SkinGuildChallengeAlert(frame)
		if not frame.Backdrop then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint("TOPLEFT", frame, "TOPLEFT", -2, -6)
			frame.Backdrop:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 6)
		end

		-- Background
		local region = select(2, frame:GetRegions())
		if region:GetObjectType() == "Texture" then
			if region:GetTexture() == "Interface\\GuildFrame\\GuildChallenges" then
				region:SetAlpha(0)
			end
		end

		frame.glow:SetAlpha(0)
		frame.shine:SetAlpha(0)
		frame.EmblemBorder:SetAlpha(0)

		-- Icon border
		local EmblemIcon = frame.EmblemIcon
		if not EmblemIcon.b then
			EmblemIcon.b = CreateFrame("Frame", nil, frame)
			EmblemIcon.b:SetTemplate("Default")
			EmblemIcon.b:SetPoint("TOPLEFT", EmblemIcon, "TOPLEFT", -3, 3)
			EmblemIcon.b:SetPoint("BOTTOMRIGHT", EmblemIcon, "BOTTOMRIGHT", 3, -2)
			EmblemIcon:SetParent(EmblemIcon.b)
		end

		SetLargeGuildTabardTextures("player", EmblemIcon, nil, nil)
	end

	local function SkinInvasionAlert(frame)
		if not frame.isSkinned then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, 4)
			frame.Backdrop:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -7, 6)
			--Background contains the item border too, so have to remove it
			local region, icon = frame:GetRegions()
			if region and region:GetObjectType() == "Texture" then
				if region:GetAtlas() == "legioninvasion-Toast-Frame" then
					region:SetAlpha(0)
				end
			end
			-- Icon border
			if icon and icon:GetObjectType() == "Texture" then
				if icon:GetTexture() == "Interface\\Icons\\Ability_Warlock_DemonicPower" then
					AS:SkinTexture(icon, true)
				end
			end
			frame.isSkinned = true
		end
	end

	local function SkinScenarioAlert(frame)
		if not frame.Backdrop then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, 4)
			frame.Backdrop:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -7, 6)
		end

		-- Background
		for i = 1, frame:GetNumRegions() do
			local region = select(i, frame:GetRegions())
			if region:GetObjectType() == "Texture" then
				if region:GetAtlas() == "Toast-IconBG" or region:GetAtlas() == "Toast-Frame" then
					region:SetAlpha(0)
				end
			end
		end

		frame.shine:SetAlpha(0)
		frame.glowFrame:SetAlpha(0)
		frame.glowFrame.glow:SetAlpha(0)

		-- Icon
		AS:SkinTexture(frame.dungeonTexture, true)
		frame.dungeonTexture:ClearAllPoints()
		frame.dungeonTexture:SetPoint("LEFT", frame.Backdrop, 9, 0)
	end

	local function SkinWorldQuestCompleteAlert(frame)
		if not frame.isSkinned then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -6)
			frame.Backdrop:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -14, 6)
			frame.shine:SetAlpha(0)
			-- Background
			for i = 1, frame:GetNumRegions() do
				local region = select(i, frame:GetRegions())
				if region:GetObjectType() == "Texture" then
					if region:GetTexture() == "Interface\\LFGFrame\\UI-LFG-DUNGEONTOAST" then
						region:SetAlpha(0)
					end
				end
			end
			--Icon

			AS:SkinTexture(frame.QuestTexture, true)

			frame.isSkinned = true
		end
	end

	local function SkinGarrisonFollowerAlert(frame, _, _, _, quality)
		if not frame.isSkinned then
			frame.glow:SetAlpha(0)
			frame.shine:SetAlpha(0)
			frame.FollowerBG:SetAlpha(0)
			frame.DieIcon:SetAlpha(0)
			--Background
			for i = 1, frame:GetNumRegions() do
				local region = select(i, frame:GetRegions())
				if region:GetObjectType() == "Texture" then
					if region:GetAtlas() == "Garr_MissionToast" then
						region:SetAlpha(0)
					end
				end
			end
			--Create Backdrop
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 16, -3)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -16, 16)

			frame.PortraitFrame.PortraitRing:Hide()
			frame.PortraitFrame.PortraitRingQuality:SetTexture("")
			frame.PortraitFrame.LevelBorder:SetAlpha(0)

			local level = frame.PortraitFrame.Level
			level:ClearAllPoints()
			level:SetPoint("BOTTOM", frame.PortraitFrame, 0, 12)

			local squareBG = CreateFrame("Frame", nil, frame.PortraitFrame)
			squareBG:SetFrameLevel(frame.PortraitFrame:GetFrameLevel()-1)
			squareBG:SetPoint("TOPLEFT", 3, -3)
			squareBG:SetPoint("BOTTOMRIGHT", -3, 11)
			squareBG:SetTemplate("Default")
			frame.PortraitFrame.squareBG = squareBG

			local cover = frame.PortraitFrame.PortraitRingCover
			if cover then
				cover:SetColorTexture(0, 0, 0)
				cover:SetAllPoints(squareBG)
			end

			frame.isSkinned = true
		end

		local color = ITEM_QUALITY_COLORS[quality]
		if color then
			frame.PortraitFrame.squareBG:SetBackdropBorderColor(color.r, color.g, color.b)
		else
			frame.PortraitFrame.squareBG:SetBackdropBorderColor(0, 0, 0)
		end
	end

	local function SkinGarrisonShipFollowerAlert(frame)
		if not frame.isSkinned then
			frame.glow:SetAlpha(0)
			frame.shine:SetAlpha(0)
			frame.FollowerBG:SetAlpha(0)
			frame.DieIcon:SetAlpha(0)
			--Background
			frame.Background:SetAlpha(0)
			--Create Backdrop
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 16, -3)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -16, 16)

			frame.isSkinned = true
		end
	end

	local function SkinGarrisonTalentAlert(frame)
		if not frame.isSkinned then
			frame:GetRegions():Hide()
			frame.glow:SetAlpha(0)
			frame.shine:SetAlpha(0)
			--Icon
			AS:SkinTexture(frame.Icon, true)

			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 8, -2)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -6, 2)

			frame.isSkinned = true
		end
	end

	local function SkinGarrisonBuildingAlert(frame)
		if not frame.isSkinned then
			frame.glow:SetAlpha(0)
			frame.shine:SetAlpha(0)
			frame:GetRegions():Hide()
			--Create Backdrop
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 8, -8)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -6, 8)

			AS:SkinTexture(frame.Icon, true)

			frame.isSkinned = true
		end
	end

	local function SkinGarrisonMissionAlert(frame)
		if not frame.isSkinned then
			frame.glow:SetAlpha(0)
			frame.shine:SetAlpha(0)
			frame.IconBG:Hide()
			frame.Background:SetAlpha(0)

			AS:SkinTexture(frame.MissionType, true)

			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 8, -2)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -6, 2)

			frame.isSkinned = true
		end
	end

	local function SkinGarrisonShipMissionAlert(frame)
		if not frame.isSkinned then
			frame.Background:SetAlpha(0)
			frame.glow:SetAlpha(0)
			frame.shine:SetAlpha(0)

			AS:SkinTexture(frame.MissionType, true)

			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 8, -2)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -6, 2)

			frame.isSkinned = true
		end
	end

	local function SkinGarrisonRandomMissionAlert(frame, _, _, _, _, _, quality)
		if not frame.isSkinned then
			frame.Background:SetAlpha(0)
			frame.Blank:SetAlpha(0)
			frame.IconBG:SetAlpha(0)
			frame.glow:SetAlpha(0)
			frame.shine:SetAlpha(0)
			--Icon
			frame.MissionType:SetTexCoord(unpack(AS.TexCoords))
			frame.MissionType:SetDrawLayer("ARTWORK")
			frame.MissionType.b = CreateFrame("Frame", nil, frame)
			frame.MissionType.b:SetTemplate("Default")
			frame.MissionType.b:SetOutside(frame.MissionType)
			frame.MissionType:SetParent(frame.MissionType.b)
			--Create Backdrop
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 8, -2)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -6, 2)

			frame.isSkinned = true
		end

		local color = ITEM_QUALITY_COLORS[quality]
		if color then
			frame.PortraitFrame.squareBG:SetBackdropBorderColor(color.r, color.g, color.b)
		else
			frame.PortraitFrame.squareBG:SetBackdropBorderColor(0, 0, 0)
		end
	end

	local function SkinLegendaryItemAlert(frame, itemLink)
		if not frame.isSkinned then
			frame.Background:SetAlpha(0)
			frame.Background2:SetAlpha(0)
			frame.Background3:SetAlpha(0)
			frame.Ring1:SetAlpha(0)
			frame.Particles3:SetAlpha(0)
			frame.Particles2:SetAlpha(0)
			frame.Particles1:SetAlpha(0)
			frame.Starglow:SetAlpha(0)
			frame.glow:SetAlpha(0)
			frame.shine:SetAlpha(0)
			--Icon
			frame.Icon:SetTexCoord(unpack(AS.TexCoords))
			frame.Icon:SetDrawLayer("ARTWORK")
			frame.Icon.b = CreateFrame("Frame", nil, frame)
			frame.Icon.b:SetTemplate("Default")
			frame.Icon.b:SetOutside(frame.Icon)
			frame.Icon:SetParent(frame.Icon.b)
			--Create Backdrop
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 20, -20)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -20, 20)

			frame.isSkinned = true
		end

		local _, _, itemRarity = GetItemInfo(itemLink)
		local color = ITEM_QUALITY_COLORS[itemRarity]
		if color then
			frame.Icon.b:SetBackdropBorderColor(color.r, color.g, color.b)
		else
			frame.Icon.b:SetBackdropBorderColor(0, 0, 0)
		end
	end

	local function SkinLootWonAlert(frame)
		frame.Background:SetAlpha(0)
		frame.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		frame.Icon:SetDrawLayer("BORDER")
		frame.IconBorder:SetAlpha(0)
		frame.glow:SetAlpha(0)
		frame.shine:SetAlpha(0)
		frame.BGAtlas:SetAlpha(0)
		frame.PvPBackground:SetAlpha(0)

		frame.SpecRing:SetTexture("")
		frame.SpecIcon:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -15)
		frame.SpecIcon:SetTexCoord(unpack(AS.TexCoords))

		-- Icon border
		if not frame.Icon.b then
			frame.Icon.b = CreateFrame("Frame", nil, frame)
			frame.Icon.b:SetTemplate("Default")
			frame.Icon.b:SetOutside(frame.Icon)
			frame.Icon:SetParent(frame.Icon.b)
		end

		if not frame.SpecIcon.b then
			frame.SpecIcon.b = CreateFrame("Frame", nil, frame)
			frame.SpecIcon.b:SetFrameLevel(3)
			frame.SpecIcon.b:SetTemplate("Default")
			frame.SpecIcon.b:SetPoint("TOPLEFT", frame.SpecIcon, "TOPLEFT", -2, 2)
			frame.SpecIcon.b:SetPoint("BOTTOMRIGHT", frame.SpecIcon, "BOTTOMRIGHT", 2, -2)
			frame.SpecIcon:SetParent(frame.SpecIcon.b)
		end
		frame.SpecIcon.b:SetShown(frame.SpecIcon:IsShown() and frame.SpecIcon:GetTexture() ~= nil)

		if not frame.Backdrop then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame.Icon.b, 'TOPLEFT', -4, 4)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame.Icon.b, 'BOTTOMRIGHT', 180, -4)
		end
	end

	local function SkinLootUpgradeAlert(frame)
		frame.Background:SetAlpha(0)
		frame.Sheen:SetAlpha(0)
		frame.BorderGlow:SetAlpha(0)
		frame.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		frame.Icon:SetDrawLayer("BORDER", 5)
		frame.Icon:ClearAllPoints()
		AS:SetInside(frame.Icon, frame.BaseQualityBorder, 5, 5)

		-- Icon border
		if not frame.Icon.b then
			frame.Icon.b = CreateFrame("Frame", nil, frame)
			frame.Icon.b:SetTemplate("Default")
			frame.Icon.b:SetOutside(frame.Icon)
			frame.Icon:SetParent(frame.Icon.b)
		end

		if not frame.Backdrop then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame.Icon.b, 'TOPLEFT', -8, 8)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame.Icon.b, 'BOTTOMRIGHT', 180, -8)
		end
	end

	local function SkinMoneyWonAlert(frame)
		frame.Background:SetAlpha(0)
		frame.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		frame.IconBorder:SetAlpha(0)

		-- Icon border
		if not frame.Icon.b then
			frame.Icon.b = CreateFrame("Frame", nil, frame)
			frame.Icon.b:SetTemplate("Default")
			frame.Icon.b:SetOutside(frame.Icon)
			frame.Icon:SetParent(frame.Icon.b)
		end

		if not frame.Backdrop then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame.Icon.b, 'TOPLEFT', -4, 4)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame.Icon.b, 'BOTTOMRIGHT', 180, -4)
		end
	end

	local function SkinStorePurchaseAlert(frame)
		if not frame.Backdrop then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -6)
			frame.Backdrop:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -14, 6)
		end

		-- Background
		frame.Background:SetAlpha(0)
		frame.glow:SetAlpha(0)
		frame.shine:SetAlpha(0)

		-- Icon
		frame.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		frame.Icon:ClearAllPoints()
		frame.Icon:SetPoint("LEFT", frame.Backdrop, 9, 0)

		-- Icon border
		if not frame.Icon.b then
			frame.Icon.b = CreateFrame("Frame", nil, frame)
			frame.Icon.b:SetTemplate("Default")
			frame.Icon.b:SetPoint("TOPLEFT", frame.Icon, "TOPLEFT", -2, 2)
			frame.Icon.b:SetPoint("BOTTOMRIGHT", frame.Icon, "BOTTOMRIGHT", 2, -2)
			frame.Icon:SetParent(frame.Icon.b)
		end
	end

	local function SkinDigsiteCompleteAlert(frame)
		if not frame.Backdrop then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint("TOPLEFT", frame, "TOPLEFT", -16, -6)
			frame.Backdrop:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 13, 6)
		end

		frame.glow:SetAlpha(0)
		frame.shine:SetAlpha(0)
		frame:GetRegions():Hide()
		frame.DigsiteTypeTexture:SetPoint("LEFT", -10, -14)
	end

	local function SkinNewRecipeLearnedAlert(frame)
		if not frame.Backdrop then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 19, -6)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -23, 6)
		end

		frame.glow:SetAlpha(0)
		frame.shine:SetAlpha(0)
		frame:GetRegions():Hide()

		frame.Icon:SetMask("")
		frame.Icon:SetTexCoord(unpack(AS.TexCoords))
		frame.Icon:SetDrawLayer("BORDER", 5)
		frame.Icon:ClearAllPoints()
		frame.Icon:SetPoint("LEFT", frame.Backdrop, 9, 0)

		-- Icon border
		if not frame.Icon.b then
			frame.Icon.b = CreateFrame("Frame", nil, frame)
			frame.Icon.b:SetTemplate("Default")
			frame.Icon.b:SetPoint("TOPLEFT", frame.Icon, "TOPLEFT", -2, 2)
			frame.Icon.b:SetPoint("BOTTOMRIGHT", frame.Icon, "BOTTOMRIGHT", 2, -2)
			frame.Icon:SetParent(frame.Icon.b)
		end
	end

	local function SkinNewPetAlert(frame)
		frame.Background:SetAlpha(0)
		frame.IconBorder:SetAlpha(0)

		frame.Icon:SetMask("")
		frame.Icon:SetTexCoord(unpack(AS.TexCoords))
		frame.Icon:SetDrawLayer("BORDER", 5)

		-- Icon border
		if not frame.Icon.b then
			frame.Icon.b = CreateFrame("Frame", nil, frame)
			frame.Icon.b:SetTemplate("Default")
			frame.Icon.b:SetPoint("TOPLEFT", frame.Icon, "TOPLEFT", -2, 2)
			frame.Icon.b:SetPoint("BOTTOMRIGHT", frame.Icon, "BOTTOMRIGHT", 2, -2)
			frame.Icon:SetParent(frame.Icon.b)
		end

		if not frame.Backdrop then
			AS:CreateBackdrop(frame, "Transparent")
			frame.Backdrop:SetPoint('TOPLEFT', frame.Icon.b, 'TOPLEFT', -8, 8)
			frame.Backdrop:SetPoint('BOTTOMRIGHT', frame.Icon.b, 'BOTTOMRIGHT', 180, -8)
		end
	end

	-- Achievements
	hooksecurefunc(AchievementAlertSystem, "setUpFunction", SkinAchievementAlert)
	hooksecurefunc(CriteriaAlertSystem, "setUpFunction", SkinCriteriaAlert)

	-- Encounters
	hooksecurefunc(DungeonCompletionAlertSystem, "setUpFunction", SkinDungeonCompletionAlert)
	hooksecurefunc(GuildChallengeAlertSystem, "setUpFunction", SkinGuildChallengeAlert)
	hooksecurefunc(InvasionAlertSystem, "setUpFunction", SkinInvasionAlert)
	hooksecurefunc(ScenarioAlertSystem, "setUpFunction", SkinScenarioAlert)
	hooksecurefunc(WorldQuestCompleteAlertSystem, "setUpFunction", SkinWorldQuestCompleteAlert)

	-- Garrisons
	hooksecurefunc(GarrisonFollowerAlertSystem, "setUpFunction", SkinGarrisonFollowerAlert)
	hooksecurefunc(GarrisonShipFollowerAlertSystem, "setUpFunction", SkinGarrisonShipFollowerAlert)
	hooksecurefunc(GarrisonTalentAlertSystem, "setUpFunction", SkinGarrisonTalentAlert)
	hooksecurefunc(GarrisonBuildingAlertSystem, "setUpFunction", SkinGarrisonBuildingAlert)
	hooksecurefunc(GarrisonMissionAlertSystem, "setUpFunction", SkinGarrisonMissionAlert)
	hooksecurefunc(GarrisonShipMissionAlertSystem, "setUpFunction", SkinGarrisonShipMissionAlert)
	hooksecurefunc(GarrisonRandomMissionAlertSystem, "setUpFunction", SkinGarrisonRandomMissionAlert)

	-- Loot
	hooksecurefunc(LegendaryItemAlertSystem, "setUpFunction", SkinLegendaryItemAlert)
	hooksecurefunc(LootAlertSystem, "setUpFunction", SkinLootWonAlert)
	hooksecurefunc(LootUpgradeAlertSystem, "setUpFunction", SkinLootUpgradeAlert)
	hooksecurefunc(MoneyWonAlertSystem, "setUpFunction", SkinMoneyWonAlert)
	hooksecurefunc(StorePurchaseAlertSystem, "setUpFunction", SkinStorePurchaseAlert)

	-- Professions
	hooksecurefunc(DigsiteCompleteAlertSystem, "setUpFunction", SkinDigsiteCompleteAlert)
	hooksecurefunc(NewRecipeLearnedAlertSystem, "setUpFunction", SkinNewRecipeLearnedAlert)

	-- Pets/Mounts
	hooksecurefunc(NewPetAlertSystem, "setUpFunction", SkinNewPetAlert)
	hooksecurefunc(NewMountAlertSystem, "setUpFunction", SkinNewPetAlert)

	-- for _, frame in pairs({ _G.BonusRollMoneyWonFrame, _G.BonusRollLootWonFrame }) do
	-- 	frame.Background:SetAlpha(0)
	-- 	frame.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	-- 	frame.IconBorder:SetAlpha(0)

	-- 	frame.Icon.b = CreateFrame("Frame", nil, frame)
	-- 	frame.Icon.b:SetTemplate("Default")
	-- 	frame.Icon.b:SetOutside(frame.Icon)
	-- 	frame.Icon:SetParent(frame.Icon.b)

	-- 	AS:CreateBackdrop(frame, "Transparent")
	-- 	frame.Backdrop:SetPoint('TOPLEFT', frame.Icon.b, 'TOPLEFT', -4, 4)
	-- 	frame.Backdrop:SetPoint('BOTTOMRIGHT', frame.Icon.b, 'BOTTOMRIGHT', 180, -4)
	-- end
end

AS:RegisterSkin("Blizzard_Alerts", AS.Blizzard_Alerts)
