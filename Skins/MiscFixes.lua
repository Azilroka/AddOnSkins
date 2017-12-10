local AS = unpack(AddOnSkins)

local _G = _G

function AS:MiscellaneousFixes(event, addon)
	local function SkinIcons()
		for i = 1, LFG_ROLE_NUM_SHORTAGE_TYPES do
			if _G['LFGDungeonReadyDialogRewardsFrameReward'..i] and not _G['LFGDungeonReadyDialogRewardsFrameReward'..i].IsDone then
				_G['LFGDungeonReadyDialogRewardsFrameReward'..i..'Border']:Kill()
				AS:SkinTexture(_G['LFGDungeonReadyDialogRewardsFrameReward'..i..'Texture'])
				_G['LFGDungeonReadyDialogRewardsFrameReward'..i].IsDone = true
			end
		end
	end

	hooksecurefunc('LFGDungeonReadyDialog_UpdateRewards', SkinIcons)

	-- local LT = LibStub('LibExtraTip-1', true)

	-- for _, Tooltip in pairs({GameTooltip, ItemRefTooltip}) do
	-- 	Tooltip:HookScript('OnUpdate', function(self)
	-- 		if not LT then return end
	-- 		local ExtraTip = LT:GetExtraTip(self)
	-- 		if ExtraTip then
	-- 			if not ExtraTip.IsDone then
	-- 				ExtraTip:HookScript('OnShow', function(tt)
	-- 					tt:SetTemplate('Transparent')
	-- 					local a, b, c, d, e = tt:GetPoint()
	-- 					tt:SetPoint(a, b, c, d, e-2)
	-- 				end)
	-- 				ExtraTip.IsDone = true
	-- 			end
	-- 			ExtraTip:SetBackdropBorderColor(Tooltip:GetBackdropBorderColor())
	-- 		end
	-- 	end)
	-- end


	local croprwicons = false
	if croprwicons then
		local RaidNotice_AddMessage_ = RaidNotice_AddMessage
		RaidNotice_AddMessage = function(noticeFrame, textString, colorInfo, displayTime)
			if textString:find('|T') then
				textString = gsub(textString,'(:12:12)',':18:18:0:0:64:64:5:59:5:59')
			end
			return RaidNotice_AddMessage_(noticeFrame, textString, colorInfo, displayTime)
		end
	end
	--[[ -- RAF Reward Frame
	AS:SkinFrame(ProductChoiceFrame)
	AS:StripTextures(ProductChoiceFrame.Inset)
	AS:SkinButton(ProductChoiceFrame.Inset.ClaimButton)
	AS:SkinCloseButton(ProductChoiceFrameCloseButton)
	ProductChoiceFrame:HookScript('OnShow', function(self)
		for _, object in pairs(self.Inset.Buttons) do
			AS:StripTextures(object)
		end
	end)
	]]

	if event == 'AUCTION_HOUSE_SHOW' then
		if AS:CheckAddOn('ElvUI') and ElvUI[1].private.skins.blizzard.enable == true and ElvUI[1].private.skins.blizzard.auctionhouse == true then
			for i = 1, AuctionFrame.numTabs do
				AS:SkinTab(_G['AuctionFrameTab'..i])
			end
		end
		AS:UnregisterSkinEvent('MiscellaneousFixes', event)
	end
end

AS:RegisterSkin('MiscellaneousFixes', AS.MiscellaneousFixes, 'AUCTION_HOUSE_SHOW')