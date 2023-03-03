local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local hooksecurefunc = hooksecurefunc

local function SkinRewards()
	for reward in _G.AdventureMapQuestChoiceDialog.rewardPool:EnumerateActive() do
		if not reward.isSkinned then
			S:HandleItemButton(reward)
			reward.isSkinned = true
		end
	end
end

function R:Blizzard_AdventureMap()
	if not AS:IsSkinEnabled('Blizzard_AdventureMap', 'adventureMap') then return end

	--Quest Choise
	local AdventureMapQuestChoiceDialog = _G.AdventureMapQuestChoiceDialog
	S:HandleFrame(AdventureMapQuestChoiceDialog)

	-- Rewards
	hooksecurefunc(AdventureMapQuestChoiceDialog, 'RefreshRewards', SkinRewards)

	-- Quick Fix for the Font Color
	AdventureMapQuestChoiceDialog.Details.Child.TitleHeader:SetTextColor(1, 1, 0)
	AdventureMapQuestChoiceDialog.Details.Child.DescriptionText:SetTextColor(1, 1, 1)
	AdventureMapQuestChoiceDialog.Details.Child.ObjectivesHeader:SetTextColor(1, 1, 0)
	AdventureMapQuestChoiceDialog.Details.Child.ObjectivesText:SetTextColor(1, 1, 1)

	--Buttons
	S:HandleScrollBar(AdventureMapQuestChoiceDialog.Details.ScrollBar)
	S:HandleButton(AdventureMapQuestChoiceDialog.AcceptButton)
	S:HandleButton(AdventureMapQuestChoiceDialog.DeclineButton)
end

AS:RegisterSkin('Blizzard_AdventureMap', R.Blizzard_AdventureMap)
