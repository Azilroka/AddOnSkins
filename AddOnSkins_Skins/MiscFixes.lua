local AS = unpack(AddOnSkins)

local name = 'MiscFixes'
function AS:MiscFixes(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		for i = 1, 4 do
			_G['StaticPopup'..i]:SetTemplate('Transparent')
			AS:SkinButton(_G['StaticPopup'..i..'Button1'])
			AS:SkinButton(_G['StaticPopup'..i..'Button2'])
			AS:SkinButton(_G['StaticPopup'..i..'Button3'])
			AS:SkinEditBox(_G['StaticPopup'..i..'EditBox'])
			AS:SkinCloseButton(_G['StaticPopup'..i..'CloseButton'])
		end

		local function SkinIcons()
			for i = 1, LFG_ROLE_NUM_SHORTAGE_TYPES do
				if _G['LFGDungeonReadyDialogRewardsFrameReward'..i] and not _G['LFGDungeonReadyDialogRewardsFrameReward'..i].IsDone then
					_G['LFGDungeonReadyDialogRewardsFrameReward'..i..'Border']:Kill()
					_G['LFGDungeonReadyDialogRewardsFrameReward'..i..'Texture']:SetTexCoord(unpack(AS.TexCoords))
					_G['LFGDungeonReadyDialogRewardsFrameReward'..i].IsDone = true
				end
			end
		end

		hooksecurefunc('LFGDungeonReadyDialog_UpdateRewards', SkinIcons)
		GameTooltip:HookScript('OnShow', function()
			for i = 1, 5 do
				if _G['LibExtraTip_1_329Tooltip'..i] and not _G['LibExtraTip_1_329Tooltip'..i].IsDone then
					_G['LibExtraTip_1_329Tooltip'..i]:HookScript('OnShow', function(self)
						self:SetTemplate('Transparent')
						local a, b, c, d, e = self:GetPoint()
						self:SetPoint(a, b, c, d, e-2)
					end)
					_G['LibExtraTip_1_329Tooltip'..i].IsDone = true
				end
			end
		end)

		--[[ -- RAF Reward Frame
		AS:SkinFrame(ProductChoiceFrame)
		ProductChoiceFrame.Inset:StripTextures()
		AS:SkinButton(ProductChoiceFrame.Inset.ClaimButton)
		AS:SkinCloseButton(ProductChoiceFrameCloseButton)
		ProductChoiceFrame:HookScript('OnShow', function(self)
			for i = 1, 8 do
				self.Inset.Buttons[i]:StripTextures()
			end
		end)
		]]
	end
	if event == 'AUCTION_HOUSE_SHOW' then
		if not AS:CheckAddOn('ElvUI') or ElvUI[1].private.skins.blizzard.enable == true and ElvUI[1].private.skins.blizzard.auctionhouse == true then
			if AS:CheckOption('AuctionHouse') then
				BrowseNameText:Point('TOPLEFT', 20, -39)
				BrowseName:SetHeight(17)
				BrowseName:Point('TOPLEFT', BrowseNameText, 'BOTTOMLEFT', 2, -3)
				BrowseLevelText:Point('TOPLEFT', 184, -40)
				BrowseMinLevel:SetHeight(17)
				BrowseMinLevel:Point('TOPLEFT', BrowseLevelText, 'BOTTOMLEFT', 0, -6)
				BrowseLevelHyphen:Point('LEFT', BrowseMinLevel, 'RIGHT', 4, 0)
				BrowseMaxLevel:SetHeight(17)
				BrowseMaxLevel:Point('LEFT', BrowseMinLevel, 'RIGHT', 12, 0)
				BrowseDropDown:Point('TOPLEFT', BrowseLevelText, 'BOTTOMRIGHT', -5, -2)
				BrowseResetButton:Point('TOPLEFT', AuctionFrameBrowse, 'TOPLEFT', 20, -78)
				BrowseSearchButton:Point('TOPRIGHT', AuctionFrameBrowse, 'TOPRIGHT', 24, -52)
				BrowseCloseButton:Point('BOTTOMRIGHT', AuctionFrameBrowse, 'BOTTOMRIGHT', 66, 6)
				AuctionFrameMoneyFrame:Point('BOTTOMRIGHT', AuctionFrame, 'BOTTOMLEFT', 181, 10)
				BrowseBidPrice:Point('BOTTOM', AuctionFrameBrowse, 'BOTTOM', 25, 10)
				BidBidPrice:Point('BOTTOM', AuctionFrameBid, 'BOTTOM', 25, 10)
				BidCloseButton:Point('BOTTOMRIGHT', AuctionFrameBid, 'BOTTOMRIGHT', 66, 6)
				AuctionsCloseButton:Point('BOTTOMRIGHT', AuctionFrameAuctions, 'BOTTOMRIGHT', 66, 6)
				AuctionFrameTab1:Point('TOPLEFT', AuctionFrame, 'BOTTOMLEFT', -5, 2)
				BrowseNextPageButton:Size(20)
				BrowsePrevPageButton:Size(20)
			end
			for i = 1, AuctionFrame.numTabs do
				AS:SkinTab(_G['AuctionFrameTab'..i])
			end
		end
		AS:UnregisterSkinEvent(name, event)
	end
end

AS:RegisterSkin(name, AS.MiscFixes, 'AUCTION_HOUSE_SHOW')