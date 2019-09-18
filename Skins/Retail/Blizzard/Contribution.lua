if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_Contribution(event, addon)
	if addon ~= 'Blizzard_Contribution' then return end

	AS:SkinCloseButton(ContributionCollectionFrame.CloseButton)
	ContributionCollectionFrame.CloseButton.CloseButtonBackground:SetAlpha(0)

	AS:SkinTooltip(ContributionBuffTooltip)
	AS:SkinTexture(ContributionBuffTooltip.Icon, true)

	hooksecurefunc(ContributionMixin, "SetupContributeButton", function(self)
		if (not self.isSkinned) then
			AS:SkinButton(self.ContributeButton)
			self.isSkinned = true
		end

		local statusBar = self.Status
		if statusBar and not statusBar.isSkinned then
			AS:SkinStatusBar(statusBar)
			statusBar.isSkinned = true
		end
	end)

	hooksecurefunc(ContributionMixin, "AddReward", function(self, _, rewardID)
		local reward = self:FindOrAcquireReward(rewardID);
		if (reward and not reward.isSkinned) then
			reward:SetFrameLevel(5)
			reward.Border:SetAlpha(0)
			AS:SkinTexture(reward.Icon)
			reward.isSkinned = true
		end
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_Contribution", AS.Blizzard_Contribution, 'ADDON_LOADED')
