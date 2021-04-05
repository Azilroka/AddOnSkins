if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local ipairs, pairs, select, type, unpack = ipairs, pairs, select, type, unpack
--WoW API / Variables
local GEM_TYPE_INFO = {
	Yellow = {textureKit="yellow", r=0.97, g=0.82, b=0.29},
	Red = {textureKit="red", r=1, g=0.47, b=0.47},
	Blue = {textureKit="blue", r=0.47, g=0.67, b=1},
	Hydraulic = {textureKit="hydraulic", r=1, g=1, b=1},
	Cogwheel = {textureKit="cogwheel", r=1, g=1, b=1},
	Meta = {textureKit="meta", r=1, g=1, b=1},
	Prismatic = {textureKit="prismatic", r=1, g=1, b=1},
	PunchcardRed = {textureKit="punchcard-red", r=1, g=0.47, b=0.47},
	PunchcardYellow = {textureKit="punchcard-yellow", r=0.97, g=0.82, b=0.29},
	PunchcardBlue = {textureKit="punchcard-blue", r=0.47, g=0.67, b=1},
}

local hooksecurefunc = hooksecurefunc
local PaperDollBgDesaturate = PaperDollBgDesaturate
local PAPERDOLL_SIDEBARS = PAPERDOLL_SIDEBARS
local UnitSex = UnitSex
-- GLOBALS:

function AS:Blizzard_Character()
	_G.CHARACTERFRAME_EXPANDED_WIDTH = 580

	AS:SkinFrame(_G.CharacterFrame)
	AS:SkinCloseButton(_G.CharacterFrame.CloseButton)

	_G.CharacterFrame:HookScript('OnShow', function() PaperDollBgDesaturate(false) end)

	AS:SkinBackdropFrame(_G.CharacterModelFrame)
	_G.CharacterModelFrame.Backdrop:SetPoint('BOTTOMRIGHT', 2, -2)
	AS:CreateShadow(_G.CharacterModelFrame.Backdrop, true)

	AS:Kill(_G.CharacterFramePortrait)

	_G.PaperDollSidebarTabs:SetPoint('BOTTOMRIGHT', _G.CharacterFrameInsetRight, 'TOPRIGHT', -29, -1)

	local function UpdateAzerite(self)
		self.AzeriteTexture:SetAtlas("AzeriteIconFrame")
		AS:SetOutside(self.AzeriteTexture)
		self.AzeriteTexture:SetDrawLayer("ARTWORK", 1)
	end

	for _, Slot in pairs({_G.PaperDollItemsFrame:GetChildren()}) do
		if Slot:IsObjectType("Button") then
			AS:SkinTexture(Slot.icon)
			AS:SkinFrame(Slot)
			AS:StyleButton(Slot)
			AS:CreateShadow(Slot, true)
			AS:SetInside(Slot.icon)

			hooksecurefunc(Slot, "DisplayAsAzeriteItem", UpdateAzerite)
			hooksecurefunc(Slot, "DisplayAsAzeriteEmpoweredItem", UpdateAzerite)

			if Slot.popoutButton:GetPoint() == 'TOP' then
				Slot.popoutButton:SetPoint("TOP", Slot, "BOTTOM", 0, 2)
			else
				Slot.popoutButton:SetPoint("LEFT", Slot, "RIGHT", -2, 0)
			end

			Slot.ignoreTexture:SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-LeaveItem-Transparent]])
			Slot.IconBorder:SetAlpha(0)
			hooksecurefunc(Slot.IconBorder, 'SetVertexColor', function(self, r, g, b) Slot:SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc(Slot.IconBorder, 'Hide', function(self) Slot:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
		end
	end

	AS:StripTextures(_G.CharacterFrameInsetRight)
	AS:StripTextures(_G.CharacterStatsPane)

	_G.CharacterStatsPane.ClassBackground:ClearAllPoints()
	_G.CharacterStatsPane.ClassBackground:SetTexture([[Interface\AddOns\AddOnSkins\Media\ClassIcons\]]..AS.MyClass)
	_G.CharacterStatsPane.ClassBackground:SetPoint('BOTTOM')
	_G.CharacterStatsPane.ClassBackground:SetSize(128, 128)
	_G.CharacterStatsPane.ClassBackground:SetAlpha(.5)

	local function CharacterStatFrameCategoryTemplate(Button)
		local bg = Button.Background
		bg:SetTexture([[Interface\LFGFrame\UI-LFG-SEPARATOR]])
		bg:SetTexCoord(0, 0.6640625, 0, 0.3125)
		bg:ClearAllPoints()
		bg:SetPoint("CENTER", 0, -5)
		bg:SetSize(210, 30)
		local r, g, b = unpack(AS.Color)
		bg:SetVertexColor(r * .7, g * .7, b * .7)
	end

	CharacterStatFrameCategoryTemplate(_G.CharacterStatsPane.EnhancementsCategory)
	CharacterStatFrameCategoryTemplate(_G.CharacterStatsPane.ItemLevelCategory)
	CharacterStatFrameCategoryTemplate(_G.CharacterStatsPane.AttributesCategory)

	_G.CharacterStatsPane.ItemLevelFrame.Background:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Highlight]])
	_G.CharacterStatsPane.ItemLevelFrame.Background:SetVertexColor(unpack(AS.Color))

	for i = 1, _G.CharacterFrame.numTabs do
		AS:SkinTab(_G["CharacterFrameTab"..i])
	end

	for i = 1, #PAPERDOLL_SIDEBARS do
		local tab = _G["PaperDollSidebarTab"..i]
		tab.Highlight:SetColorTexture(1, 1, 1, 0.3)
		tab.Highlight:SetPoint("TOPLEFT", 3, -4)
		tab.Highlight:SetPoint("BOTTOMRIGHT", -1, 0)
		tab.Hider:SetColorTexture(0, 0, 0, .8)
		tab.Hider:SetPoint("TOPLEFT", 3, -4)
		tab.Hider:SetPoint("BOTTOMRIGHT", -1, 0)
		AS:Kill(tab.TabBg)
		AS:CreateBackdrop(tab)
		tab.Backdrop:SetPoint("TOPLEFT", 2, -3)
		tab.Backdrop:SetPoint("BOTTOMRIGHT", 0, -1)
		AS:CreateShadow(tab.Backdrop, true)
	end

	hooksecurefunc("PaperDollFrame_UpdateStats", function()
		for _, Table in ipairs({_G.CharacterStatsPane.statsFramePool:EnumerateActive()}) do
			if type(Table) == 'table' then
				for statFrame in pairs(Table) do
					statFrame.Background:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Highlight]])
					statFrame.Background:SetVertexColor(unpack(AS.Color))
					AS:SetInside(statFrame.Background)
				end
			end
		end
	end)

	hooksecurefunc("EquipmentFlyout_CreateButton", function()
		for _, Button in pairs(_G.EquipmentFlyoutFrame.buttons) do
			if not Button.isStyled then
				AS:SkinTexture(Button.icon)
				AS:SkinFrame(Button)
				AS:StyleButton(Button)
				AS:SetInside(Button.icon)
				Button.IconBorder:SetAlpha(0)
				hooksecurefunc(Button.IconBorder, 'SetVertexColor', function(self, r, g, b) Button:SetBackdropBorderColor(r, g, b) end)
				hooksecurefunc(Button.IconBorder, 'Hide', function(self) Button:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
				Button.isStyled = true
			end
		end
	end)

	hooksecurefunc("EquipmentFlyout_Show", function()
		AS:SkinBackdropFrame(_G.EquipmentFlyoutFrame.buttonFrame)
		_G.EquipmentFlyoutFrame.buttonFrame.Backdrop:SetPoint('BOTTOMRIGHT', 5, -2)
	end)

	_G.PaperDollTitlesPane:SetWidth(_G.PaperDollTitlesPane:GetWidth() + 45)
	AS:SkinScrollBar(_G.PaperDollTitlesPane.scrollBar)

	--Titles
	hooksecurefunc('PaperDollTitlesPane_Update', function()
		for _, Title in pairs(_G.PaperDollTitlesPane.buttons) do
			if not Title.isStyled then
				AS:StripTextures(Title)
				Title:SetWidth(Title:GetWidth() + 30)
				Title.Stripe:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Highlight]])
				Title.Stripe.SetColorTexture = AS.Noop
				Title.Check:SetTexture([[Interface\Buttons\UI-CheckBox-Check]])
				Title.text:SetTextColor(1, 1, 1)
				Title:HookScript('OnEnter', function(self) self.text:SetTextColor(unpack(AS.Color)) end)
				Title:HookScript('OnLeave', function(self) self.text:SetTextColor(1, 1, 1) end)
				Title.isStyled = true
			end

			--Title.text:SetFont(AS.Font, 12)
		end
	end)

	--Equipement Manager
	_G.PaperDollEquipmentManagerPane:SetPoint('TOPLEFT', _G.CharacterFrameInsetRight, 'TOPLEFT', 40, -4)
	_G.PaperDollEquipmentManagerPane:SetWidth(_G.PaperDollEquipmentManagerPane:GetWidth() + 9)

	AS:SkinButton(_G.PaperDollEquipmentManagerPane.EquipSet, true)
	AS:SkinButton(_G.PaperDollEquipmentManagerPane.SaveSet)
	AS:SkinScrollBar(_G.PaperDollEquipmentManagerPane.scrollBar)
	_G.PaperDollEquipmentManagerPane.EquipSet:SetPoint("TOPLEFT", _G.PaperDollEquipmentManagerPane, "TOPLEFT", 0, -2)
	_G.PaperDollEquipmentManagerPane.SaveSet:SetPoint("LEFT", _G.PaperDollEquipmentManagerPane.EquipSet, "RIGHT", 4, 0)

	for _, Button in pairs(_G.PaperDollEquipmentManagerPane.buttons) do
		AS:SkinBackdropFrame(Button)
		Button.Check:SetTexture([[Interface\Buttons\UI-CheckBox-Check]])
		AS:SkinTexture(Button.icon, true)
		AS:SkinTexture(Button.SpecIcon)
		Button:HookScript('OnEnter', function(self) self.Backdrop:SetBackdropBorderColor(unpack(AS.Color)) self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.Color)) end)
		Button:HookScript('OnLeave', function(self)
			if self.SelectedBar:IsShown() then
				self.Backdrop:SetBackdropBorderColor(1, .8, .1)
				self.icon.Backdrop:SetBackdropBorderColor(1, .8, .1)
			else
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				self.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
		hooksecurefunc(Button.SelectedBar, "Show", function() Button.Backdrop:SetBackdropBorderColor(1, .8, .1) Button.icon.Backdrop:SetBackdropBorderColor(1, .8, .1) end)
		hooksecurefunc(Button.SelectedBar, "Hide", function() Button.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) Button.icon.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
	end

	hooksecurefunc("GearSetButton_SetSpecInfo", function(self, specID)
		if ( specID and specID > 0 ) then
			self.SpecIcon:SetTexture(select(4, GetSpecializationInfoByID(specID)))
		end
	end)

	-- Reputation
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
			local factionIndex = factionOffset + i
			if ( factionIndex <= numFactions ) then
				local name, _, _, _, _, _, atWarWith, canToggleAtWar, isHeader, isCollapsed = GetFactionInfo(factionIndex)
				if isHeader then
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
		AS:StripTextures(_G["ReputationBar"..i])
		AS:SkinStatusBar(_G["ReputationBar"..i.."ReputationBar"])
	end

	-- Gear Manager
	AS:SkinFrame(_G.GearManagerDialogPopup)
	AS:StripTextures(_G.GearManagerDialogPopup.BorderBox)
	AS:SkinEditBox(_G.GearManagerDialogPopupEditBox)
	AS:SkinButton(_G.GearManagerDialogPopupOkay)
	AS:SkinButton(_G.GearManagerDialogPopupCancel)

	AS:StripTextures(_G.GearManagerDialogPopupScrollFrame)
	AS:SkinScrollBar(_G.GearManagerDialogPopupScrollFrame.ScrollBar)

	_G.GearManagerDialogPopup:SetPoint("LEFT", _G.PaperDollFrame, "RIGHT", 4, 0)
	_G.GearManagerDialogPopup:SetHeight(_G.GearManagerDialogPopup:GetHeight() + 15)
	_G.GearManagerDialogPopupScrollFrame:SetHeight(_G.GearManagerDialogPopupScrollFrame:GetHeight() + 16)

	for i = 1, _G.NUM_GEARSET_ICONS_SHOWN do
		local Button = _G["GearManagerDialogPopupButton"..i]
		AS:SetTemplate(Button)
		AS:StyleButton(Button)
		Button:SetCheckedTexture(nil)
		AS:SkinTexture(Button.icon)
		AS:SetInside(Button.icon)
		hooksecurefunc(Button, 'SetChecked', function(self, value)
			if value == true then
				self:SetBackdropBorderColor(unpack(AS.Color))
			else
				self:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end

	--Currency
	AS:SkinFrame(_G.TokenFramePopup)
	AS:SkinScrollBar(_G.TokenFrameContainerScrollBar)
	AS:SkinCloseButton(_G.TokenFramePopupCloseButton)
	AS:SkinCheckBox(_G.TokenFramePopupInactiveCheckBox)
	AS:SkinCheckBox(_G.TokenFramePopupBackpackCheckBox)
	_G.TokenFramePopup:SetPoint("TOPLEFT", _G.TokenFrame, "TOPRIGHT", 4, -28)

	hooksecurefunc('TokenFrame_Update', function()
		if _G.TokenFrameContainer.buttons then
			for _, Button in pairs(_G.TokenFrameContainer.buttons) do
				Button.categoryMiddle:SetAlpha(0)
				Button.categoryLeft:SetAlpha(0)
				Button.categoryRight:SetAlpha(0)
				Button.highlight:SetAlpha(0)
				Button.stripe:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Highlight]])
				Button.stripe:SetAlpha(.1)
				AS:SkinTexture(Button.icon)
			end
		end
	end)
end

function AS:Blizzard_DeathRecap(event, addon)
	if addon ~= 'Blizzard_DeathRecap' then return end

	AS:SkinFrame(_G.DeathRecapFrame)
	AS:SkinCloseButton(_G.DeathRecapFrame.CloseXButton)
	AS:SkinButton(_G.DeathRecapFrame.CloseButton)

	for _, Recap in pairs(_G.DeathRecapFrame.DeathRecapEntry) do
		AS:SkinTexture(Recap.SpellInfo.Icon, true)
		Recap.SpellInfo.IconBorder:SetAlpha(0)
	end

	AS:UnregisterSkinEvent(addon, event)
end

function AS:Blizzard_DressUpFrame()
	AS:SkinFrame(_G.SideDressUpFrame, nil, nil, true)
	AS:SkinButton(_G.SideDressUpFrame.ResetButton)
	AS:SkinCloseButton(_G.SideDressUpFrameCloseButton)

	hooksecurefunc("SetUpSideDressUpFrame", function(parentFrame, closedWidth, openWidth, point, relativePoint, offsetX, offsetY)
		if parentFrame == _G.AuctionFrame then
			_G.SideDressUpFrame:SetPoint(point, parentFrame, relativePoint, 2, offsetY)
		end
	end)

	AS:SkinBackdropFrame(_G.DressUpFrame)
	AS:SkinCloseButton(_G.DressUpFrame.CloseButton)
	AS:SkinButton(_G.DressUpFrame.ResetButton)

	_G.DressUpFrame.portrait:SetAlpha(0)

	AS:SkinMaxMinFrame(_G.DressUpFrame.MaximizeMinimizeFrame)

	AS:SkinButton(_G.DressUpFrameCancelButton)
	_G.DressUpFrame.ResetButton:SetPoint("RIGHT", _G.DressUpFrameCancelButton, "LEFT", -2, 0)

	AS:SkinDropDownBox(_G.DressUpFrame.OutfitDropDown)

	AS:SkinButton(_G.DressUpFrame.OutfitDropDown.SaveButton)
	_G.DressUpFrame.OutfitDropDown.SaveButton:SetHeight(20)
	_G.DressUpFrame.OutfitDropDown.SaveButton:SetPoint("LEFT", _G.DressUpFrame.OutfitDropDown, 'RIGHT', -10, -5)
end

function AS:Blizzard_Inspect(event, addon)
	if addon ~= "Blizzard_InspectUI" then return end

	AS:SkinFrame(_G.InspectFrame)
	AS:SkinCloseButton(_G.InspectFrame.CloseButton)
	_G.InspectFrame.portrait:SetAlpha(0)

	for i = 1, _G.InspectFrame.numTabs do
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
			AS:SetInside(Slot.icon)

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

			local slotInfo = C_SpecializationInfo.GetInspectSelectedPvpTalent(_G.INSPECTED_UNIT, self.slotIndex)

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

function AS:Blizzard_ItemSocketingUI(event, addon)
	if addon ~= 'Blizzard_ItemSocketingUI' then return end

	AS:SkinFrame(_G.ItemSocketingFrame)
	_G.ItemSocketingFrame.portrait:SetAlpha(0)
	AS:SkinFrame(_G.ItemSocketingScrollFrame)
	AS:SkinCloseButton(_G.ItemSocketingFrame.CloseButton)

	for i = 1, _G.MAX_NUM_SOCKETS do
		local button = _G["ItemSocketingSocket"..i]
		AS:SkinFrame(button)
		AS:StyleButton(button)
		AS:SkinTexture(button.icon)
		button.icon:ClearAllPoints()
		AS:SetInside(button.icon)
		_G["ItemSocketingSocket"..i.."BracketFrame"]:SetAlpha(0)
		_G["ItemSocketingSocket"..i.."Background"]:SetAlpha(0)
	end

	hooksecurefunc("ItemSocketingFrame_Update", function()
		for i = 1, GetNumSockets() do
			local color = GEM_TYPE_INFO[GetSocketTypes(i)]
			_G["ItemSocketingSocket"..i]:SetBackdropColor(color.r, color.g, color.b, 0.15)
			_G["ItemSocketingSocket"..i]:SetBackdropBorderColor(color.r, color.g, color.b)
		end
	end)

	_G.ItemSocketingSocketButton:ClearAllPoints()
	_G.ItemSocketingSocketButton:SetPoint("BOTTOMRIGHT", _G.ItemSocketingFrame, "BOTTOMRIGHT", -5, 5)
	AS:SkinButton(_G.ItemSocketingSocketButton)
	AS:SkinScrollBar(_G.ItemSocketingScrollFrameScrollBar)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_Character', AS.Blizzard_Character)
AS:RegisterSkin('Blizzard_DeathRecap', AS.Blizzard_DeathRecap, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_DressUpFrame', AS.Blizzard_DressUpFrame)
AS:RegisterSkin("Blizzard_Inspect", AS.Blizzard_Inspect, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_ItemSocketingUI', AS.Blizzard_ItemSocketingUI, 'ADDON_LOADED')
