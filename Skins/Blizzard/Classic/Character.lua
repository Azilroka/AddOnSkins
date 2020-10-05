if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local pairs, select, unpack = pairs, select, unpack
--WoW API / Variables

local hooksecurefunc = hooksecurefunc
local HasPetUI = HasPetUI
local GetPetHappiness = GetPetHappiness
-- GLOBALS:

function AS:Blizzard_Character()
	_G.CHARACTERFRAME_EXPANDED_WIDTH = 580

	AS:StripTextures(_G.PaperDollFrame)
	AS:SkinBackdropFrame(_G.CharacterFrame)
	_G.CharacterFrame.Backdrop:SetPoint('TOPLEFT', 11, -12)
	_G.CharacterFrame.Backdrop:SetPoint('BOTTOMRIGHT', -32, 76)
	AS:CreateShadow(_G.CharacterFrame)
	_G.CharacterFrame.Shadow:SetPoint('TOPLEFT', 8, -9)
	_G.CharacterFrame.Shadow:SetPoint('BOTTOMRIGHT', -29, 73)

	CharacterModelFrameRotateLeftButton:SetSize(16, 16)
	CharacterModelFrameRotateRightButton:SetSize(16, 16)
	AS:SkinArrowButton(_G.CharacterModelFrameRotateLeftButton)
	_G.CharacterModelFrameRotateLeftButton:SetPoint('TOPLEFT', 2, 1)
	AS:SkinArrowButton(_G.CharacterModelFrameRotateRightButton)
	_G.CharacterModelFrameRotateRightButton:SetPoint('TOPLEFT', _G.CharacterModelFrameRotateLeftButton, 'TOPRIGHT', 3, 0)

	AS:Kill(_G.CharacterFramePortrait)
	AS:StripTextures(_G.CharacterAttributesFrame)
	AS:SkinBackdropFrame(_G.CharacterAttributesFrame)
	_G.CharacterAttributesFrame.Backdrop:SetPoint('TOPLEFT', -2, 1)
	_G.CharacterAttributesFrame.Backdrop:SetPoint('BOTTOMRIGHT', 2, -5)

	AS:StripTextures(_G.PetPaperDollFrame)
	AS:StripTextures(_G.PetAttributesFrame)
	AS:SkinBackdropFrame(_G.PetAttributesFrame)
	_G.PetAttributesFrame.Backdrop:SetPoint('TOPLEFT', -2, 2)
	_G.PetAttributesFrame.Backdrop:SetPoint('BOTTOMRIGHT', 2, -2)

	AS:StripTextures(_G.PetPaperDollFrameExpBar)
	AS:SkinStatusBar(_G.PetPaperDollFrameExpBar)
	AS:SetOutside(_G.PetPaperDollFrameExpBar.Backdrop, _G.PetPaperDollFrameExpBar)
	_G.PetPaperDollFrameExpBar.Backdrop:SetFrameLevel(_G.PetPaperDollFrameExpBar:GetFrameLevel())

	AS:SkinButton(_G.PetPaperDollCloseButton)

	PetModelFrameRotateLeftButton:SetSize(16, 16)
	PetModelFrameRotateRightButton:SetSize(16, 16)
	AS:SkinArrowButton(_G.PetModelFrameRotateRightButton)
	_G.PetModelFrameRotateLeftButton:SetPoint('TOPLEFT', 2, 1)
	AS:SkinArrowButton(_G.PetModelFrameRotateLeftButton)
	_G.PetModelFrameRotateRightButton:SetPoint('TOPLEFT', _G.PetModelFrameRotateLeftButton, 'TOPRIGHT', 3, 0)

	AS:CreateBackdrop(PetPaperDollPetInfo)
	PetPaperDollPetInfo:SetPoint('TOPLEFT', _G.PetModelFrameRotateLeftButton, 'BOTTOMLEFT', 1, -5)
	PetPaperDollPetInfo:SetSize(24, 24)

	for _, frame in pairs({_G.CharacterAttributesFrame:GetChildren()}) do
		AS:GradientHighlight(frame, nil, AS:CheckOption('HighlightColor'))
	end

	for _, Slot in pairs({_G.PaperDollItemsFrame:GetChildren()}) do
		local icon = _G[Slot:GetName()..'IconTexture']
--		local cooldown = _G[slot:GetName()..'Cooldown']
		AS:SkinTexture(icon)
		AS:SetInside(icon)
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
			frame:SetSize(24, 24)
			AS:SetTemplate(frame)

			if i ~= 1 then
				frame:ClearAllPoints()
				frame:SetPoint('TOP', _G[frameName..i - 1], 'BOTTOM', 0, -1)
			end

			if icon then
				AS:SetInside(icon)
				icon:SetTexCoord(unpack(ResistanceCoords[i]))
				icon:SetDrawLayer('ARTWORK')
			end

			if text then
				text:SetDrawLayer('OVERLAY')
			end
		end
	end

	HandleResistanceFrame('MagicResFrame')
	HandleResistanceFrame('PetMagicResFrame')

	local function updHappiness(self)
		local happiness = GetPetHappiness()
		local _, isHunterPet = HasPetUI()
		if not happiness or not isHunterPet then return end

		local texture = self:GetRegions()
		if happiness == 1 then
			texture:SetTexCoord(0.41, 0.53, 0.06, 0.30)
		elseif happiness == 2 then
			texture:SetTexCoord(0.22, 0.345, 0.06, 0.30)
		elseif happiness == 3 then
			texture:SetTexCoord(0.04, 0.15, 0.06, 0.30)
		end
	end

	PetPaperDollPetInfo:RegisterEvent('UNIT_HAPPINESS')
	PetPaperDollPetInfo:SetScript('OnEvent', updHappiness)
	PetPaperDollPetInfo:SetScript('OnShow', updHappiness)

	for i = 1, CharacterFrame.numTabs do
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
		AS:StripTextures(border)
		background:SetTexture(nil)

		label:GetNormalTexture():SetSize(14, 14)
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

	AS:StripTextures(_G.SkillListScrollFrame)
	AS:SkinScrollBar(_G.SkillListScrollFrameScrollBar)

	AS:StripTextures(_G.SkillDetailScrollFrame)
	AS:SkinScrollBar(_G.SkillDetailScrollFrameScrollBar)

	AS:SkinStatusBar(_G.SkillDetailStatusBar)

	AS:SkinArrowButton(_G.SkillDetailStatusBarUnlearnButton)
	_G.SkillDetailStatusBarUnlearnButton:SetSize(24, 24)
	_G.SkillDetailStatusBarUnlearnButton:SetPoint('LEFT', _G.SkillDetailStatusBarBorder, 'RIGHT', 5, 0)
	_G.SkillDetailStatusBarUnlearnButton:SetHitRectInsets(0, 0, 0, 0)

	-- Honor Frame
	AS:StripTextures(HonorFrame)
	AS:SkinBackdropFrame(HonorFrame)
	HonorFrame.Backdrop:SetPoint("TOPLEFT", 18, -105)
	HonorFrame.Backdrop:SetPoint("BOTTOMRIGHT", -39, 83)
	HonorFrame.Backdrop:SetFrameLevel(HonorFrame:GetFrameLevel())

	AS:CreateBackdrop(HonorFrameProgressButton, "Transparent")
	HonorFrameProgressBar:Width(325)
	HonorFrameProgressBar:SetStatusBarTexture(AS.NormTex)

	HonorFrameProgressBar:ClearAllPoints()
	HonorFrameProgressBar:SetPoint("TOP", HonorFrame, "TOP", -10, -73)
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

	_G.DressUpFrame.Backdrop:SetPoint("TOPLEFT", 11, -12)
	_G.DressUpFrame.Backdrop:SetPoint("BOTTOMRIGHT", -32, 76)

	AS:SkinArrowButton(_G.DressUpModelFrameRotateLeftButton)
	_G.DressUpModelFrameRotateLeftButton:SetPoint('TOPLEFT', DressUpFrame, 25, -79)

	AS:SkinArrowButton(_G.DressUpModelFrameRotateRightButton)
	_G.DressUpModelFrameRotateRightButton:SetPoint('TOPLEFT', _G.DressUpModelFrameRotateLeftButton, 'TOPRIGHT', 3, 0)

	DressUpModelFrameRotateLeftButton:SetSize(16, 16)
	DressUpModelFrameRotateRightButton:SetSize(16, 16)

	_G.DressUpFramePortrait:SetAlpha(0)

	AS:SkinButton(_G.DressUpFrameCancelButton)
	_G.DressUpFrame.ResetButton:SetPoint("RIGHT", _G.DressUpFrameCancelButton, "LEFT", -2, 0)
end

function AS:Blizzard_Inspect(event, addon)
	if addon ~= "Blizzard_InspectUI" then return end

	AS:SkinBackdropFrame(_G.InspectPaperDollFrame)
	AS:SkinCloseButton(_G.InspectFrameCloseButton)
	_G.InspectFramePortrait:SetAlpha(0)

	_G.InspectPaperDollFrame.Backdrop:SetPoint("TOPLEFT", 11, -12)
	_G.InspectPaperDollFrame.Backdrop:SetPoint("BOTTOMRIGHT", -32, 76)

	AS:SkinBackdropFrame(_G.InspectModelFrame)

	AS:SkinArrowButton(_G.InspectModelFrameRotateLeftButton)
	_G.InspectModelFrameRotateLeftButton:SetPoint('TOPLEFT', 3, -3)

	AS:SkinArrowButton(_G.InspectModelFrameRotateRightButton)
	_G.InspectModelFrameRotateRightButton:SetPoint('TOPLEFT', _G.InspectModelFrameRotateLeftButton, 'TOPRIGHT', 3, 0)

	InspectModelFrameRotateLeftButton:SetSize(16, 16)
	InspectModelFrameRotateRightButton:SetSize(16, 16)

	for i = 1, _G.InspectFrame.numTabs do
		AS:SkinTab(_G["InspectFrameTab"..i])
	end

	for _, Slot in pairs({_G.InspectPaperDollItemsFrame:GetChildren()}) do
		if Slot:IsObjectType("Button") or Slot:IsObjectType("ItemButton") then
			AS:SkinTexture(Slot.icon)
			AS:SkinFrame(Slot)
			AS:StyleButton(Slot)
			AS:CreateShadow(Slot, true)
			AS:SetInside(Slot.icon)

			Slot.IconBorder:SetAlpha(0)
			hooksecurefunc(Slot.IconBorder, 'SetVertexColor', function(self, r, g, b) Slot:SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc(Slot.IconBorder, 'Hide', function(self) Slot:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		end
	end

	AS:SkinBackdropFrame(_G.InspectHonorFrame)

	_G.InspectHonorFrame.Backdrop:SetPoint("TOPLEFT", 11, -12)
	_G.InspectHonorFrame.Backdrop:SetPoint("BOTTOMRIGHT", -32, 76)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_Character', AS.Blizzard_Character)
AS:RegisterSkin('Blizzard_DressUpFrame', AS.Blizzard_DressUpFrame)
AS:RegisterSkin("Blizzard_Inspect", AS.Blizzard_Inspect, 'ADDON_LOADED')
