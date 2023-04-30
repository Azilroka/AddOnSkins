local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local unpack = unpack
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc

local function StyleTooltip(frame)
	if not frame then return end

	S:HandleTooltip(frame)
end

local function AbilityTooltip(frame)
	if not frame then return end

	S:HandleTooltip(frame)
	S:HandleIcon(frame.Icon, true)
end

function S:GarrisonShipyardTooltip()
	local tt = _G.GarrisonShipyardMapMissionTooltip
	S:HandleTooltip(tt)

	local reward = tt.ItemTooltip
	local icon = reward and reward.Icon
	if icon then
		S:HandleIcon(icon)

		if reward.IconBorder then
			reward.IconBorder:SetAlpha(0)
		end
	end

	local bonusIcon = tt.BonusReward and tt.BonusReward.Icon
	if bonusIcon then
		S:HandleIcon(bonusIcon)
	end

	-- other tooltips
	StyleTooltip(_G.GarrisonBuildingFrame and _G.GarrisonBuildingFrame.BuildingLevelTooltip)
	StyleTooltip(_G.GarrisonMissionMechanicFollowerCounterTooltip)
	StyleTooltip(_G.GarrisonMissionMechanicTooltip)
end

function R:Blizzard_GarrisonTooltip()
	if not AS:IsSkinEnabled('Blizzard_GarrisonTooltip', 'tooltip') then return end

	StyleTooltip(_G.GarrisonFollowerTooltip)
	StyleTooltip(_G.FloatingGarrisonFollowerTooltip)
	StyleTooltip(_G.FloatingGarrisonMissionTooltip)
	StyleTooltip(_G.FloatingGarrisonShipyardFollowerTooltip)
	StyleTooltip(_G.GarrisonShipyardFollowerTooltip)

	AbilityTooltip(_G.GarrisonFollowerAbilityTooltip)
	AbilityTooltip(_G.FloatingGarrisonFollowerAbilityTooltip)
	AbilityTooltip(_G.GarrisonFollowerMissionAbilityWithoutCountersTooltip)
	AbilityTooltip(_G.GarrisonFollowerAbilityWithoutCountersTooltip)

	S:HandleCloseButton(_G.FloatingGarrisonFollowerTooltip.CloseButton)
	S:HandleCloseButton(_G.FloatingGarrisonFollowerAbilityTooltip.CloseButton)
	S:HandleCloseButton(_G.FloatingGarrisonMissionTooltip.CloseButton)
	S:HandleCloseButton(_G.FloatingGarrisonShipyardFollowerTooltip.CloseButton)

	hooksecurefunc('GarrisonFollowerTooltipTemplate_SetGarrisonFollower', function(tooltipFrame)
		-- Abilities
		if tooltipFrame.numAbilitiesStyled == nil then
			tooltipFrame.numAbilitiesStyled = 1
		end

		local numAbilitiesStyled = tooltipFrame.numAbilitiesStyled
		local abilities = tooltipFrame.Abilities
		local ability = abilities[numAbilitiesStyled]
		while ability do
			S:HandleIcon(ability.Icon, true)

			numAbilitiesStyled = numAbilitiesStyled + 1
			ability = abilities[numAbilitiesStyled]
		end
		tooltipFrame.numAbilitiesStyled = numAbilitiesStyled

		-- Traits
		if tooltipFrame.numTraitsStyled == nil then
			tooltipFrame.numTraitsStyled = 1
		end

		local numTraitsStyled = tooltipFrame.numTraitsStyled
		local traits = tooltipFrame.Traits
		local trait = traits[numTraitsStyled]
		while trait do
			S:HandleIcon(trait.Icon, true)

			numTraitsStyled = numTraitsStyled + 1
			trait = traits[numTraitsStyled]
		end
		tooltipFrame.numTraitsStyled = numTraitsStyled
	end)

	hooksecurefunc('GarrisonFollowerTooltipTemplate_SetShipyardFollower', function(tooltipFrame)
		if tooltipFrame.numPropertiesStyled == nil then
			tooltipFrame.numPropertiesStyled = 1
		end

		local numPropertiesStyled = tooltipFrame.numPropertiesStyled
		local properties = tooltipFrame.Properties
		local property = properties[numPropertiesStyled]
		while property do
			S:HandleIcon(property.Icon, true)

			numPropertiesStyled = numPropertiesStyled + 1
			property = properties[numPropertiesStyled]
		end

		tooltipFrame.numPropertiesStyled = numPropertiesStyled
	end)
end

AS:RegisterSkin('Blizzard_GarrisonTooltip')
