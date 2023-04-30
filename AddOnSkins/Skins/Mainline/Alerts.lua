local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local next = next
local select = select

local GetItemInfo = GetItemInfo
local SetLargeGuildTabardTextures = SetLargeGuildTabardTextures
local ITEM_QUALITY_COLORS = ITEM_QUALITY_COLORS
local hooksecurefunc = hooksecurefunc

local function forceAlpha(self, alpha, forced)
	if alpha ~= 1 and forced ~= true then
		self:SetAlpha(1, true)
	end
end

local function SkinAchievementAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', frame.Background, 'TOPLEFT', -2, -6)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', frame.Background, 'BOTTOMRIGHT', -2, 6)
	end

	-- Background
	frame.Background:SetTexture()
	S:Kill(frame.glow)
	S:Kill(frame.shine)
	S:Kill(frame.GuildBanner)
	S:Kill(frame.GuildBorder)

	-- Text
	S:FontTemplate(frame.Unlocked, nil, 12)
	frame.Unlocked:SetTextColor(1, 1, 1)
	S:FontTemplate(frame.Name, nil, 12)

	-- Icon
	S:HandleIcon(frame.Icon.Texture, true, true)

	S:Kill(frame.Icon.Overlay)

	frame.Icon.Texture:ClearAllPoints()
	S:Point(frame.Icon.Texture, 'LEFT', frame, 7, 0)
end

local function SkinCriteriaAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', frame, 'TOPLEFT', -2, -6)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -2, 6)
	end

	S:HandleIcon(frame.Icon.Texture, true, true)

	frame.Unlocked:SetTextColor(1, 1, 1)
	frame.Name:SetTextColor(1, 1, 0)
	S:Kill(frame.Background)
	S:Kill(frame.glow)
	S:Kill(frame.shine)
	S:Kill(frame.Icon.Bling)
	S:Kill(frame.Icon.Overlay)
end

local function SkinDungeonCompletionAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', frame, 'TOPLEFT', -2, -6)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -2, 6)
	end

	if frame.glowFrame then
		S:Kill(frame.glowFrame)

		if frame.glowFrame.glow then
			S:Kill(frame.glowFrame.glow)
		end
	end

	if frame.shine then S:Kill(frame.shine) end
	if frame.raidArt then S:Kill(frame.raidArt) end
	if frame.heroicIcon then S:Kill(frame.heroicIcon) end
	if frame.dungeonArt then S:Kill(frame.dungeonArt) end
	if frame.dungeonArt1 then S:Kill(frame.dungeonArt1) end
	if frame.dungeonArt2 then S:Kill(frame.dungeonArt2) end
	if frame.dungeonArt3 then S:Kill(frame.dungeonArt3) end
	if frame.dungeonArt4 then S:Kill(frame.dungeonArt4) end

	-- Icon
	S:HandleIcon(frame.dungeonTexture, true, true)
	frame.dungeonTexture:ClearAllPoints()
	S:Point(frame.dungeonTexture, 'LEFT', frame, 7, 0)
end

local function SkinGuildChallengeAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', -2, -6)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', -2, 6)
	end

	-- Background
	local region = select(2, frame:GetRegions())
	if region:IsObjectType('Texture') then
		if region:GetTexture() == [[Interface\GuildFrame\GuildChallenges]] then
			S:Kill(region)
		end
	end

	S:Kill(frame.glow)
	S:Kill(frame.shine)
	S:Kill(frame.EmblemBorder)

	-- Icon border
	if not frame.EmblemIcon.backdrop then
		S:CreateBackdrop(frame.EmblemIcon, nil, nil, nil, nil, nil, nil, nil, nil, true)
	end

	SetLargeGuildTabardTextures('player', frame.EmblemIcon)
end

local function SkinHonorAwardedAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	S:Kill(frame.Background)
	S:Kill(frame.IconBorder)

	-- Icon border
	if not frame.Icon.backdrop then
		S:CreateBackdrop(frame.Icon, nil, nil, nil, nil, nil, nil, nil, nil, true)
	end

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', frame.Icon, 'TOPLEFT', -4, 4)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', frame.Icon, 'BOTTOMRIGHT', 180, -4)
	end
end

local function SkinInvasionAlert(frame)
	if not frame.isSkinned then
		frame:SetAlpha(1)
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)

		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', 4, 4)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', -7, 6)

		--Background contains the item border too, so have to remove it
		if frame.GetRegions then
			local region, icon = frame:GetRegions()
			if region and region:IsObjectType('Texture') then
				if region:GetAtlas() == 'legioninvasion-Toast-Frame' then
					S:Kill(region)
				end
			end

			-- Icon border
			if icon and icon:IsObjectType('Texture') then
				if icon:GetTexture() == 236293 then -- interface/icons/ability_warlock_demonicpower
					S:HandleIcon(icon, true)
				end
			end
		end

		frame.isSkinned = true
	end
end

local function SkinScenarioAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', 4, 4)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', -7, 6)
	end

	-- Background
	for _, region in next, { frame:GetRegions() } do
		if region:IsObjectType('Texture') and (region:GetAtlas() == 'Toast-IconBG' or region:GetAtlas() == 'Toast-Frame') then
			S:Kill(region)
		end
	end

	S:Kill(frame.shine)
	S:Kill(frame.glowFrame)
	S:Kill(frame.glowFrame.glow)

	-- Icon
	S:HandleIcon(frame.dungeonTexture, true)
	frame.dungeonTexture:ClearAllPoints()
	S:Point(frame.dungeonTexture, 'LEFT', frame.backdrop, 9, 0)
	frame.dungeonTexture:SetDrawLayer('OVERLAY')
end

local function SkinWorldQuestCompleteAlert(frame)
	if not frame.isSkinned then
		frame:SetAlpha(1)
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)

		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', 10, -6)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', -14, 6)

		S:Kill(frame.shine)

		-- Background
		S:Kill(frame.ToastBackground)

		--Icon
		S:HandleIcon(frame.QuestTexture, true)

		frame.isSkinned = true
	end
end

local function SkinGarrisonFollowerAlert(frame, _, _, _, quality)
	if not frame.isSkinned then
		S:Kill(frame.glow)
		S:Kill(frame.shine)
		frame.FollowerBG:SetAlpha(0)
		frame.DieIcon:SetAlpha(0)

		--Background
		if frame.GetNumRegions then
			for _, region in next, { frame:GetRegions() } do
				if region:IsObjectType('Texture') then
					if region:GetAtlas() == 'Garr_MissionToast' then
						S:Kill(region)
					end
				end
			end
		end

		--Create Backdrop
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', 16, -3)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', -16, 16)

		frame.PortraitFrame.PortraitRing:Hide()
		frame.PortraitFrame.PortraitRingQuality:SetTexture()
		frame.PortraitFrame.LevelBorder:SetAlpha(0)

		local level = frame.PortraitFrame.Level
		level:ClearAllPoints()
		S:Point(level, 'BOTTOM', frame.PortraitFrame, 0, 12)

		S:CreateBackdrop(frame.PortraitFrame)
		S:Point(frame.PortraitFrame.backdrop, 'TOPLEFT', 3, -3)
		S:Point(frame.PortraitFrame.backdrop, 'BOTTOMRIGHT', -3, 11)

		local cover = frame.PortraitFrame.PortraitRingCover
		if cover then
			cover:SetColorTexture(0, 0, 0)
			cover:SetAllPoints(frame.PortraitFrame.backdrop)
		end

		frame.isSkinned = true
	end

	local color = ITEM_QUALITY_COLORS[quality]
	if color then
		frame.PortraitFrame.backdrop:SetBackdropBorderColor(color.r, color.g, color.b)
	else
		frame.PortraitFrame.backdrop:SetBackdropBorderColor(0, 0, 0)
	end
end

local function SkinGarrisonShipFollowerAlert(frame)
	if not frame.isSkinned then
		S:Kill(frame.glow)
		S:Kill(frame.shine)
		frame.FollowerBG:SetAlpha(0)
		frame.DieIcon:SetAlpha(0)

		--Background
		S:Kill(frame.Background)

		--Create Backdrop
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', 16, -3)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', -16, 16)

		frame.isSkinned = true
	end
end

local function SkinGarrisonTalentAlert(frame)
	if not frame.isSkinned then
		frame:GetRegions():Hide()
		S:Kill(frame)
		S:Kill(frame.shine)

		--Icon
		S:HandleIcon(frame.Icon, true)

		--Create Backdrop
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', 8, -2)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', -6, 2)

		frame.isSkinned = true
	end
end

local function SkinGarrisonBuildingAlert(frame)
	if not frame.isSkinned then
		S:Kill(frame.glow)
		S:Kill(frame.shine)
		frame:GetRegions():Hide()

		--Create Backdrop
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', 8, -8)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', -6, 8)

		--Icon
		S:HandleIcon(frame.Icon, true)

		frame.isSkinned = true
	end
end

local function SkinGarrisonMissionAlert(frame) -- SkinGarrisonShipMissionAlert
	if not frame.isSkinned then
		S:Kill(frame.glow)
		S:Kill(frame.shine)
		S:Kill(frame.Background)
		frame.IconBG:Hide()

		--Icon
		S:HandleIcon(frame.MissionType, true)

		--Create Backdrop
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', 8, -2)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', -6, 2)

		frame.isSkinned = true
	end
end

local function SkinGarrisonRandomMissionAlert(frame, _, _, _, _, _, quality)
	if not frame.isSkinned then
		S:Kill(frame.Background)
		S:Kill(frame.Blank)
		S:Kill(frame.IconBG)
		S:Kill(frame.glow)
		S:Kill(frame.shine)

		--Icon
		S:HandleIcon(frame.MissionType, true)

		--Create Backdrop
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', 8, -2)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', -6, 2)

		frame.isSkinned = true
	end

	if frame.PortraitFrame and frame.PortraitFrame.backdrop then
		local color = quality and ITEM_QUALITY_COLORS[quality]
		if color then
			frame.PortraitFrame.backdrop:SetBackdropBorderColor(color.r, color.g, color.b)
		else
			frame.PortraitFrame.backdrop:SetBackdropBorderColor(0, 0, 0)
		end
	end
end

local function SkinLegendaryItemAlert(frame, itemLink)
	if not frame.isSkinned then
		S:Kill(frame.Background)
		S:Kill(frame.Background2)
		S:Kill(frame.Background3)
		S:Kill(frame.Ring1)
		S:Kill(frame.Particles3)
		S:Kill(frame.Particles2)
		S:Kill(frame.Particles1)
		S:Kill(frame.Starglow)
		S:Kill(frame.glow)
		S:Kill(frame.shine)

		--Icon
		S:HandleIcon(frame.Icon, true)

		--Create Backdrop
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', 20, -20)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', -20, 20)

		frame.isSkinned = true
	end

	local _, _, itemRarity = GetItemInfo(itemLink)
	local color = itemRarity and ITEM_QUALITY_COLORS[itemRarity]
	if color then
		frame.Icon.backdrop:SetBackdropBorderColor(color.r, color.g, color.b)
	else
		frame.Icon.backdrop:SetBackdropBorderColor(0, 0, 0)
	end
end

local function SkinLootWonAlert(frame)
	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	frame:SetAlpha(1)
	S:Kill(frame.Background)

	local lootItem = frame.lootItem or frame
	S:HandleIcon(lootItem.Icon, true)

	S:Kill(lootItem.IconBorder)
	S:Kill(frame.glow)
	S:Kill(frame.shine)
	S:Kill(frame.BGAtlS)
	S:Kill(frame.PvPBackground)

	lootItem.SpecRing:SetTexture('')

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', lootItem.Icon.backdrop, 'TOPLEFT', -4, 4)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', lootItem.Icon.backdrop, 'BOTTOMRIGHT', 180, -4)
	end
end

local function SkinLootUpgradeAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	S:Kill(frame.Background)
	S:Kill(frame.Sheen)
	S:Kill(frame.BorderGlow)

	S:HandleIcon(frame.Icon, true)

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', frame.Icon.backdrop, 'TOPLEFT', -8, 8)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', frame.Icon.backdrop, 'BOTTOMRIGHT', 180, -8)
	end
end

local function SkinMoneyWonAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	S:Kill(frame.Background)
	S:Kill(frame.IconBorder)

	-- Icon border
	S:HandleIcon(frame.Icon, true)

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', frame.Icon.backdrop, 'TOPLEFT', -4, 4)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', frame.Icon.backdrop, 'BOTTOMRIGHT', 180, -4)
	end
end

local function SkinEntitlementDeliveredAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', frame, 'TOPLEFT', 10, -6)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -14, 6)
	end

	-- Background
	S:Kill(frame.Background)
	S:Kill(frame.glow)
	S:Kill(frame.shine)

	-- Icon
	S:HandleIcon(frame.Icon, true)
end

local function SkinRafRewardDeliveredAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', frame, 'TOPLEFT', 10, -6)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -14, 6)
	end

	-- Background
	S:Kill(frame.StandardBackground)
	S:Kill(frame.glow)
	S:Kill(frame.shine)

	-- Icon
	S:HandleIcon(frame.Icon, true)
	frame.Icon:ClearAllPoints()
	S:Point(frame.Icon, 'LEFT', frame.backdrop, 9, 0)
end

local function SkinDigsiteCompleteAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', frame, 'TOPLEFT', -16, -6)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', frame, 'BOTTOMRIGHT', 13, 6)
	end

	S:Kill(frame.glow)
	S:Kill(frame.shine)
	frame:GetRegions():Hide()
	S:Point(frame.DigsiteTypeTexture, 'LEFT', -10, -14)
end

local function SkinNewRecipeLearnedAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', frame, 'TOPLEFT', 19, -6)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -23, 6)
	end

	S:Kill(frame.glow)
	S:Kill(frame.shine)
	frame:GetRegions():Hide()

	frame.Icon:SetMask('')
	S:HandleIcon(frame.Icon, true)

	frame.Icon:ClearAllPoints()
	frame.Icon:Point('LEFT', frame.backdrop, 9, 0)
end

local function SkinNewPetAlert(frame)
	frame:SetAlpha(1)

	if not frame.hooked then
		hooksecurefunc(frame, 'SetAlpha', forceAlpha)
		frame.hooked = true
	end

	S:Kill(frame.Background)
	S:Kill(frame.IconBorder)

	frame.Icon:SetMask('')
	S:HandleIcon(frame.Icon, true)

	if not frame.backdrop then
		S:CreateBackdrop(frame)
		S:Point(frame.backdrop, 'TOPLEFT', frame.Icon.backdrop, 'TOPLEFT', -8, 8)
		S:Point(frame.backdrop, 'BOTTOMRIGHT', frame.Icon.backdrop, 'BOTTOMRIGHT', 180, -8)
	end
end

function R:AlertSystem()
	if not AS:IsSkinEnabled('Blizzard_AlertSystem', 'alertframes') then return end

	-- Achievements
	hooksecurefunc(_G.AchievementAlertSystem, 'setUpFunction', SkinAchievementAlert)
	hooksecurefunc(_G.CriteriaAlertSystem, 'setUpFunction', SkinCriteriaAlert)
	hooksecurefunc(_G.MonthlyActivityAlertSystem, 'setUpFunction', SkinCriteriaAlert) -- untested needs testing

	-- Encounters
	hooksecurefunc(_G.DungeonCompletionAlertSystem, 'setUpFunction', SkinDungeonCompletionAlert)
	hooksecurefunc(_G.GuildChallengeAlertSystem, 'setUpFunction', SkinGuildChallengeAlert)
	hooksecurefunc(_G.InvasionAlertSystem, 'setUpFunction', SkinInvasionAlert)
	hooksecurefunc(_G.ScenarioAlertSystem, 'setUpFunction', SkinScenarioAlert)
	hooksecurefunc(_G.WorldQuestCompleteAlertSystem, 'setUpFunction', SkinWorldQuestCompleteAlert)

	-- Garrisons
	hooksecurefunc(_G.GarrisonFollowerAlertSystem, 'setUpFunction', SkinGarrisonFollowerAlert)
	hooksecurefunc(_G.GarrisonShipFollowerAlertSystem, 'setUpFunction', SkinGarrisonShipFollowerAlert)
	hooksecurefunc(_G.GarrisonTalentAlertSystem, 'setUpFunction', SkinGarrisonTalentAlert)
	hooksecurefunc(_G.GarrisonBuildingAlertSystem, 'setUpFunction', SkinGarrisonBuildingAlert)
	hooksecurefunc(_G.GarrisonMissionAlertSystem, 'setUpFunction', SkinGarrisonMissionAlert)
	hooksecurefunc(_G.GarrisonShipMissionAlertSystem, 'setUpFunction', SkinGarrisonMissionAlert)
	hooksecurefunc(_G.GarrisonRandomMissionAlertSystem, 'setUpFunction', SkinGarrisonRandomMissionAlert)

	-- Honor
	hooksecurefunc(_G.HonorAwardedAlertSystem, 'setUpFunction', SkinHonorAwardedAlert)

	-- Loot
	hooksecurefunc(_G.LegendaryItemAlertSystem, 'setUpFunction', SkinLegendaryItemAlert)
	hooksecurefunc(_G.LootAlertSystem, 'setUpFunction', SkinLootWonAlert)
	hooksecurefunc(_G.LootUpgradeAlertSystem, 'setUpFunction', SkinLootUpgradeAlert)
	hooksecurefunc(_G.MoneyWonAlertSystem, 'setUpFunction', SkinMoneyWonAlert)
	hooksecurefunc(_G.EntitlementDeliveredAlertSystem, 'setUpFunction', SkinEntitlementDeliveredAlert) -- 8.2.5 New
	hooksecurefunc(_G.RafRewardDeliveredAlertSystem, 'setUpFunction', SkinRafRewardDeliveredAlert) -- 8.2.5 New
	-- Professions
	hooksecurefunc(_G.DigsiteCompleteAlertSystem, 'setUpFunction', SkinDigsiteCompleteAlert)
	hooksecurefunc(_G.NewRecipeLearnedAlertSystem, 'setUpFunction', SkinNewRecipeLearnedAlert)

	-- Pets/Mounts
	hooksecurefunc(_G.NewPetAlertSystem, 'setUpFunction', SkinNewPetAlert)
	hooksecurefunc(_G.NewMountAlertSystem, 'setUpFunction', SkinNewPetAlert)
	hooksecurefunc(_G.NewToyAlertSystem, 'setUpFunction', SkinNewPetAlert)

	-- Cosmetics
	hooksecurefunc(_G.NewCosmeticAlertFrameSystem, 'setUpFunction', SkinNewPetAlert)

	--Bonus Roll Money
	local frame = _G.BonusRollMoneyWonFrame
	frame:SetAlpha(1)
	hooksecurefunc(frame, 'SetAlpha', forceAlpha)
	S:Kill(frame.Background)
	S:HandleIcon(frame.Icon, true)
	S:Kill(frame.IconBorder)

	--Create Backdrop
	S:CreateBackdrop(frame)
	S:Point(frame.backdrop, 'TOPLEFT', frame.Icon.backdrop, 'TOPLEFT', -4, 4)
	S:Point(frame.backdrop, 'BOTTOMRIGHT', frame.Icon.backdrop, 'BOTTOMRIGHT', 180, -4)

	--Bonus Roll Loot
	frame = _G.BonusRollLootWonFrame
	frame:SetAlpha(1)
	hooksecurefunc(frame, 'SetAlpha', forceAlpha)
	S:Kill(frame.Background)
	S:Kill(frame.glow)
	S:Kill(frame.shine)

	local lootItem = frame.lootItem or frame
	S:HandleIcon(lootItem.Icon, true)
	S:Kill(lootItem.IconBorder)

	--Create Backdrop
	S:CreateBackdrop(frame)
	S:Point(frame.backdrop, 'TOPLEFT', frame.Icon.backdrop, 'TOPLEFT', -4, 4)
	S:Point(frame.backdrop, 'BOTTOMRIGHT', frame.Icon.backdrop, 'BOTTOMRIGHT', 180, -4)
end

AS:RegisterSkin('Blizzard_AlertSystem')
