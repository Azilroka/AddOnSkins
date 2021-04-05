local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local pairs, select, unpack = pairs, select, unpack
--WoW API / Variables

local hooksecurefunc = hooksecurefunc
local GetItemInfo = GetItemInfo
local GetItemQualityColor = GetItemQualityColor
local GetTradePlayerItemLink = GetTradePlayerItemLink
local GetTradeTargetItemLink = GetTradeTargetItemLink
-- GLOBALS:

function AS:Blizzard_TradeWindow()
	AS:SkinFrame(_G.TradeFrame, nil, nil, true)
	AS:StripTextures(_G.TradeRecipientMoneyBg)
	AS:SkinFrame(_G.TradeRecipientMoneyInset)
	AS:SkinButton(_G.TradeFrameTradeButton, true)
	AS:SkinButton(_G.TradeFrameCancelButton, true)
	AS:SkinCloseButton(_G.TradeFrameCloseButton)

	AS:SkinEditBox(_G.TradePlayerInputMoneyFrameGold)
	AS:SkinEditBox(_G.TradePlayerInputMoneyFrameSilver)
	AS:SkinEditBox(_G.TradePlayerInputMoneyFrameCopper)

	AS:StripTextures(_G.TradePlayerInputMoneyInset)
	_G.TradePlayerInputMoneyFrame:SetPoint('TOPLEFT', 8, -59)
	_G.TradePlayerItem1:SetPoint('TOPLEFT', 8, -89)

	for _, Inset in pairs({ _G.TradePlayerItemsInset, _G.TradeRecipientItemsInset, _G.TradePlayerEnchantInset, _G.TradeRecipientEnchantInset }) do
		AS:SkinFrame(Inset)
	end

	for _, Highlight in pairs({ _G.TradeHighlightPlayer, _G.TradeHighlightRecipient, _G.TradeHighlightPlayerEnchant, _G.TradeHighlightRecipientEnchant }) do
		AS:StripTextures(Highlight)
	end

	for _, Frame in pairs({"TradePlayerItem", "TradeRecipientItem"}) do
		for i = 1, 7 do
			local ItemBackground = _G[Frame..i]
			local ItemButton = _G[Frame..i.."ItemButton"]

			AS:StripTextures(ItemBackground)
			AS:SkinFrame(ItemButton)
			AS:StyleButton(ItemButton)

			AS:SkinTexture(ItemButton.icon)
			AS:SetInside(ItemButton.icon)
			AS:CreateBackdrop(ItemButton)
			ItemButton.Backdrop:SetBackdropColor(0, 0, 0, 0)
			ItemButton.Backdrop:SetPoint("TOPLEFT", ItemButton, "TOPRIGHT", 4, 0)
			ItemButton.Backdrop:SetPoint("BOTTOMRIGHT", _G[Frame..i.."NameFrame"], "BOTTOMRIGHT", -1, 14)
		end
	end

	hooksecurefunc('TradeFrame_SetAcceptState', function(playerState, targetState)
		if ( playerState == 1 ) then
			_G.TradePlayerItemsInset:SetBackdropBorderColor(0, 1, 0)
			_G.TradePlayerEnchantInset:SetBackdropBorderColor(0, 1, 0)
		else
			_G.TradePlayerItemsInset:SetBackdropBorderColor(unpack(AS.BorderColor))
			_G.TradePlayerEnchantInset:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
		if ( targetState == 1 ) then
			_G.TradeRecipientItemsInset:SetBackdropBorderColor(0, 1, 0)
			_G.TradeRecipientEnchantInset:SetBackdropBorderColor(0, 1, 0)
			_G.TradeRecipientMoneyInset:SetBackdropBorderColor(0, 1, 0)
		else
			_G.TradeRecipientItemsInset:SetBackdropBorderColor(unpack(AS.BorderColor))
			_G.TradeRecipientEnchantInset:SetBackdropBorderColor(unpack(AS.BorderColor))
			_G.TradeRecipientMoneyInset:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
	end)

	hooksecurefunc('TradeFrame_UpdatePlayerItem', function(id)
		local tradeItem = _G["TradePlayerItem"..id.."ItemButton"]
		tradeItem:SetBackdropBorderColor(unpack(AS.BorderColor))
		local Link = GetTradePlayerItemLink(id)
		if Link then
			local Quality = select(3, GetItemInfo(Link))
			if Quality and Quality > 1 then
				tradeItem:SetBackdropBorderColor(GetItemQualityColor(Quality))
			end
		end
	end)

	hooksecurefunc('TradeFrame_UpdateTargetItem', function(id)
		local tradeItem = _G["TradeRecipientItem"..id.."ItemButton"]
		tradeItem:SetBackdropBorderColor(unpack(AS.BorderColor))
		local Link = GetTradeTargetItemLink(id)
		if Link then
			local Quality = select(3, GetItemInfo(Link))
			if Quality and Quality > 1 then
				tradeItem:SetBackdropBorderColor(GetItemQualityColor(Quality))
			end
		end
	end)
end

AS:RegisterSkin('Blizzard_TradeWindow', AS.Blizzard_TradeWindow)
