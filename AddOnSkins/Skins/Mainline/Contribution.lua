local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local hooksecurefunc = hooksecurefunc

function R:Blizzard_Contribution()
	if not AS:IsSkinEnabled('Blizzard_Contribution', 'contribution') then return end

	local MainFrame = _G.ContributionCollectionFrame
	S:HandleCloseButton(MainFrame.CloseButton)
	MainFrame.CloseButton.CloseButtonBackground:SetAlpha(0)

	-- Reward Tooltip
	local tt = _G.ContributionBuffTooltip
	S:HandleIcon(tt.Icon, true)
	tt.Border:SetAlpha(0)
	S:HandleTooltip(tt)

	hooksecurefunc(_G.ContributionMixin, 'SetupContributeButton', function(s)
		-- Skin the Contribute Buttons
		if not s.isSkinned then
			S:HandleButton(s.ContributeButton)
			s.isSkinned = true
		end

		-- Skin the StatusBar
		local statusBar = s.Status
		if statusBar and not statusBar.backdrop then
			S:HandleStatusBar(statusBar)
		end
	end)

	-- Skin the reward icons
	hooksecurefunc(_G.ContributionMixin, 'AddReward', function(s, _, rewardID)
		local reward = s:FindOrAcquireReward(rewardID)
		if reward and not reward.backdrop then
			reward:SetFrameLevel(5)
			reward.Border:SetAlpha(0)
			S:HandleIcon(reward.Icon, true)
		end
	end)
end

AS:RegisterSkin('Blizzard_Contribution', nil, 'ADDON_LOADED')
