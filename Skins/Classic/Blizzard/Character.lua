if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local ipairs, pairs, select, type, unpack = ipairs, pairs, select, type, unpack
--WoW API / Variables

local hooksecurefunc = hooksecurefunc
local PaperDollBgDesaturate = PaperDollBgDesaturate
local UnitSex = UnitSex
-- GLOBALS:

function AS:Blizzard_Character()
	_G.CHARACTERFRAME_EXPANDED_WIDTH = 580

	AS:StripTextures(_G.PaperDollFrame)
	AS:SkinBackdropFrame(_G.CharacterFrame)
	_G.CharacterFrame.Backdrop:Point('TOPLEFT', 11, -12)
	_G.CharacterFrame.Backdrop:Point('BOTTOMRIGHT', -31, 76)
	AS:CreateShadow(_G.CharacterFrame.Backdrop)

	AS:SkinBackdropFrame(_G.CharacterModelFrame)
	_G.CharacterModelFrame.Backdrop:SetPoint('TOPLEFT', -2, 4)
	_G.CharacterModelFrame.Backdrop:SetPoint('BOTTOMRIGHT', 2, -80)
	AS:CreateShadow(_G.CharacterModelFrame.Backdrop, true)

	CharacterModelFrameRotateLeftButton:SetSize(16, 16)
	CharacterModelFrameRotateRightButton:SetSize(16, 16)
	AS:SkinArrowButton(_G.CharacterModelFrameRotateLeftButton)
	AS:SkinArrowButton(_G.CharacterModelFrameRotateRightButton)

	AS:Kill(_G.CharacterFramePortrait)
	AS:StripTextures(_G.CharacterAttributesFrame)

	for _, frame in pairs({_G.CharacterAttributesFrame:GetChildren()}) do
		AS:GradientHighlight(frame, nil, AS:CheckOption('HighlightColor'))
	end

	for _, Slot in pairs({_G.PaperDollItemsFrame:GetChildren()}) do
		local icon = _G[Slot:GetName()..'IconTexture']
--		local cooldown = _G[slot:GetName()..'Cooldown']
		AS:SkinTexture(icon)
		icon:SetInside()
		AS:SkinFrame(Slot)
		AS:StyleButton(Slot)
		AS:CreateShadow(Slot, true)
	end

	hooksecurefunc('PaperDollItemSlotButton_Update', function(self, cooldownOnly)
		if cooldownOnly then return end

		local rarity = GetInventoryItemQuality('player', self:GetID())
		if rarity and rarity > 1 then
			self:SetBackdropBorderColor(GetItemQualityColor(rarity))
		else
			self:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
	end)

	local ResistanceCoords = {
		[1] = { 0.21875, 0.8125, 0.25, 0.32421875 },		--Arcane
		[2] = { 0.21875, 0.8125, 0.0234375, 0.09765625 },	--Fire
		[3] = { 0.21875, 0.8125, 0.13671875, 0.2109375 },	--Nature
		[4] = { 0.21875, 0.8125, 0.36328125, 0.4375},		--Frost
		[5] = { 0.21875, 0.8125, 0.4765625, 0.55078125},	--Shadow
	}

	local function HandleResistanceFrame(frameName)
		for i = 1, 5 do
			local frame, icon, text = _G[frameName..i], _G[frameName..i]:GetRegions()
			frame:Size(24)
			frame:SetTemplate('Default')

			if i ~= 1 then
				frame:ClearAllPoints()
				frame:Point('TOP', _G[frameName..i - 1], 'BOTTOM', 0, -1)
			end

			if icon then
				icon:SetInside()
				icon:SetTexCoord(unpack(ResistanceCoords[i]))
				icon:SetDrawLayer('ARTWORK')
			end

			if text then
				text:SetDrawLayer('OVERLAY')
			end
		end
	end

	HandleResistanceFrame('MagicResFrame')

	for i = 1, 4 do
		AS:SkinTab(_G["CharacterFrameTab"..i])
	end

	-- Reputation
	AS:StripTextures(ReputationFrame)
	AS:StripTextures(_G.ReputationListScrollFrame)
	AS:SkinScrollBar(_G.ReputationListScrollFrame.ScrollBar)
	AS:SkinFrame(_G.ReputationDetailFrame)

	_G.ReputationDetailFrame:SetPoint("TOPLEFT", _G.ReputationFrame, "TOPRIGHT", 4, -28)

	hooksecurefunc("ReputationFrame_Update", function()
		local factionOffset = FauxScrollFrame_GetOffset(_G.ReputationListScrollFrame)
		local numFactions = GetNumFactions()
		for i = 1, _G.NUM_FACTIONS_DISPLAYED do
			local FactionName = _G["ReputationBar"..i.."FactionName"]
			local Button = _G["ReputationBar"..i.."ExpandOrCollapseButton"]
			local Header = _G['ReputationHeader'..i]
			local factionIndex = factionOffset + i
			if ( factionIndex <= numFactions ) then
				local name, _, _, _, _, _, atWarWith, canToggleAtWar, isHeader, isCollapsed = GetFactionInfo(factionIndex)
				if isHeader then
					if isCollapsed then
						Header:SetNormalTexture(AS.Media.Textures.Plus)
					else
						Header:SetNormalTexture(AS.Media.Textures.Minus)
					end
					Header:SetHighlightTexture(nil)
					FactionName:SetTextColor(.9, .8, 0)
				else
					if atWarWith and canToggleAtWar then
						FactionName:SetTextColor(1, .1, .1)
					else
						FactionName:SetTextColor(1, 1, 1)
					end
				end
			end
		end
	end)

	AS:SkinCloseButton(_G.ReputationDetailCloseButton)
	AS:SkinCheckBox(_G.ReputationDetailAtWarCheckBox)
	_G.ReputationDetailAtWarCheckBox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-SwordCheck")
	AS:SkinCheckBox(_G.ReputationDetailInactiveCheckBox)
	AS:SkinCheckBox(_G.ReputationDetailMainScreenCheckBox)

	for i = 1, 15 do
		AS:SkinStatusBar(_G["ReputationBar"..i])
		AS:SetOutside(_G["ReputationBar"..i].Backdrop, _G["ReputationBar"..i])
	end

	-- Skill Frame
	AS:StripTextures(_G.SkillFrame)

	AS:StripTextures(_G.SkillFrameExpandButtonFrame)

	hooksecurefunc('SkillFrame_UpdateSkills', function()
		if strfind(_G.SkillFrameCollapseAllButton:GetNormalTexture():GetTexture(), 'MinusButton') then
			_G.SkillFrameCollapseAllButton:SetNormalTexture(AS.Media.Textures.Minus)
		else
			_G.SkillFrameCollapseAllButton:SetNormalTexture(AS.Media.Textures.Plus)
		end
		_G.SkillFrameCollapseAllButton:SetHighlightTexture(nil)
	end)

	AS:SkinButton(_G.SkillFrameCancelButton)

	for i = 1, _G.SKILLS_TO_DISPLAY do
		local bar = _G['SkillRankFrame'..i]
		local label = _G['SkillTypeLabel'..i]
		local border = _G['SkillRankFrame'..i..'Border']
		local background = _G['SkillRankFrame'..i..'Background']

		AS:SkinStatusBar(bar)
		AS:SetOutside(bar.Backdrop, bar, 1, 1)
		border:StripTextures()
		background:SetTexture(nil)

		label:GetNormalTexture():Size(14)
		label:SetHighlightTexture(nil)
	end

	hooksecurefunc('SkillFrame_SetStatusBar', function(statusBarID, skillIndex, numSkills)
		local skillLine = _G["SkillTypeLabel"..statusBarID]
		if strfind(skillLine:GetNormalTexture():GetTexture(), 'MinusButton') then
			skillLine:SetNormalTexture(AS.Media.Textures.Minus)
		else
			skillLine:SetNormalTexture(AS.Media.Textures.Plus)
		end
	end)

	_G.SkillListScrollFrame:StripTextures()
	AS:SkinScrollBar(_G.SkillListScrollFrameScrollBar)

	_G.SkillDetailScrollFrame:StripTextures()
	AS:SkinScrollBar(_G.SkillDetailScrollFrameScrollBar)

	AS:SkinStatusBar(_G.SkillDetailStatusBar)

	AS:SkinArrowButton(_G.SkillDetailStatusBarUnlearnButton)
	_G.SkillDetailStatusBarUnlearnButton:Size(24)
	_G.SkillDetailStatusBarUnlearnButton:Point('LEFT', _G.SkillDetailStatusBarBorder, 'RIGHT', 5, 0)
	_G.SkillDetailStatusBarUnlearnButton:SetHitRectInsets(0, 0, 0, 0)

	-- Honor Frame
	AS:StripTextures(HonorFrame)
	AS:SkinStatusBar(HonorFrameProgressBar)
end

function AS:Blizzard_DressUpFrame()
	AS:SkinFrame(_G.SideDressUpFrame, nil, nil, true)
	AS:SkinButton(_G.SideDressUpModelResetButton)
	AS:SkinCloseButton(_G.SideDressUpModelCloseButton)

	hooksecurefunc("SetUpSideDressUpFrame", function(parentFrame, closedWidth, openWidth, point, relativePoint, offsetX, offsetY)
		if parentFrame == _G.AuctionFrame then
			_G.SideDressUpFrame:SetPoint(point, parentFrame, relativePoint, 2, offsetY)
		end
	end)

	AS:SkinBackdropFrame(_G.DressUpFrame)
	AS:SkinCloseButton(_G.DressUpFrameCloseButton)
	AS:SkinButton(_G.DressUpFrameResetButton)

	_G.DressUpFramePortrait:SetAlpha(0)

	AS:SkinButton(_G.DressUpFrameCancelButton)
	_G.DressUpFrame.ResetButton:SetPoint("RIGHT", _G.DressUpFrameCancelButton, "LEFT", -2, 0)
end

function AS:Blizzard_Inspect(event, addon)
	if addon ~= "Blizzard_InspectUI" then return end

	AS:SkinFrame(_G.InspectFrame)
	AS:SkinCloseButton(_G.InspectFrame.CloseButton)
	_G.InspectFrame.portrait:SetAlpha(0)

	for i = 1, 4 do
		AS:SkinTab(_G["InspectFrameTab"..i])
	end

	AS:SkinButton(_G.InspectPaperDollFrame.ViewButton)
	AS:SkinBackdropFrame(_G.InspectModelFrame)

	for _, Slot in pairs({_G.InspectPaperDollItemsFrame:GetChildren()}) do
		if Slot:IsObjectType("Button") or Slot:IsObjectType("ItemButton") then
			AS:SkinTexture(Slot.icon)
			AS:SkinFrame(Slot)
			AS:StyleButton(Slot)
			AS:CreateShadow(Slot, true)
			Slot.icon:SetInside()

			Slot.IconBorder:SetAlpha(0)
			hooksecurefunc(Slot.IconBorder, 'SetVertexColor', function(self, r, g, b) Slot:SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc(Slot.IconBorder, 'Hide', function(self) Slot:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		end
	end

	AS:StripTextures(_G.InspectPVPFrame)

	for _, Button in pairs(_G.InspectPVPFrame.Slots) do
		AS:CreateBackdrop(Button.Texture)

		Button.Arrow:SetAlpha(0)
		Button.Border:Hide()

		hooksecurefunc(Button, "Update", function(self)
			if (not self.slotIndex) or (not _G.INSPECTED_UNIT) then
				return
			end

			local slotInfo = C_SpecializationInfo_GetInspectSelectedPvpTalent(_G.INSPECTED_UNIT, self.slotIndex)

			if (slotInfo) then
				AS:SkinTexture(self.Texture)
				self.Texture:SetDesaturated(false)
				self.Texture.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			else
				self.Texture:SetTexture([[Interface\PetBattles\PetBattle-LockIcon]])
				self.Texture:SetTexCoord(0, 1, 0, 1)
				self.Texture:SetDesaturated(true)
				self.Texture:Show()
				self.Texture.Backdrop:SetBackdropBorderColor(1, 0, 0, 1)
			end
		end)
	end

	AS:StripTextures(_G.InspectTalentFrame)
	_G.InspectTalentFrame.InspectSpec.ring:SetTexture('')
	AS:SkinTexture(_G.InspectTalentFrame.InspectSpec.specIcon, true)

	_G.InspectTalentFrame.InspectSpec:HookScript('OnShow', function(self)
		local Spec, Sex
		if (_G.INSPECTED_UNIT ~= nil) then
			Spec = GetInspectSpecialization(_G.INSPECTED_UNIT)
			Sex = UnitSex(_G.INSPECTED_UNIT)
		end
		if(Spec ~= nil and Spec > 0 and Sex ~= nil) then
			local Role = GetSpecializationRoleByID(Spec)
			if (Role ~= nil) then
				self.specIcon:SetTexture(select(4, GetSpecializationInfoByID(Spec, Sex)))
			end
		end
	end)

	for i = 1, _G.MAX_TALENT_TIERS do
		for j = 1, _G.NUM_TALENT_COLUMNS do
			local Button = _G.InspectTalentFrame.InspectTalents['tier'..i]["talent"..j]
			AS:StripTextures(Button)
			AS:SkinTexture(Button.icon, true)
			hooksecurefunc(Button.border, 'SetShown', function(self, value)
				if value == true then
					Button.icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
				else
					Button.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
		end
	end

	_G.InspectGuildFrameBG:SetTexture('')

	AS:UnregisterSkinEvent(addon, event)
end

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
		Highlight:StripTextures()
	end

	for _, Frame in pairs({"TradePlayerItem", "TradeRecipientItem"}) do
		for i = 1, 7 do
			local ItemBackground = _G[Frame..i]
			local ItemButton = _G[Frame..i.."ItemButton"]

			AS:StripTextures(ItemBackground)
			AS:SkinFrame(ItemButton)
			AS:StyleButton(ItemButton)

			AS:SkinTexture(ItemButton.icon)
			ItemButton.icon:SetInside()
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

AS:RegisterSkin('Blizzard_Character', AS.Blizzard_Character)
AS:RegisterSkin('Blizzard_DressUpFrame', AS.Blizzard_DressUpFrame)
AS:RegisterSkin("Blizzard_Inspect", AS.Blizzard_Inspect, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_TradeWindow', AS.Blizzard_TradeWindow)
