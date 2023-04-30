local AS, L, S, R = unpack(AddOnSkins)

local _G = _G

local slotColor = { r = .6, g = 0, b = .6, a = .5 }
local function itemSlotColor(self)
	self:SetBackdropColor(slotColor.r, slotColor.g, slotColor.b, slotColor.a)
end

function S:Blizzard_AzeriteRespecUI()
	if not AS:IsSkinEnabled('Blizzard_AzeriteRespecUI', 'azeriteRespec') then return end

	local AzeriteRespecFrame = _G.AzeriteRespecFrame
	AzeriteRespecFrame:SetClipsChildren(true)
	AzeriteRespecFrame.Background:Hide()
	S:HandleFrame(AzeriteRespecFrame)

	local Lines = AzeriteRespecFrame:CreateTexture(nil, 'BACKGROUND')
	Lines:ClearAllPoints()
	S:Point(Lines, 'TOPLEFT', -50, 25)
	S:Point(Lines, 'BOTTOMRIGHT')
	Lines:SetTexture([[Interface\Transmogrify\EtherealLines]], true, true)
	Lines:SetHorizTile(true)
	Lines:SetVertTile(true)
	Lines:SetAlpha(0.5)

	local ItemSlot = AzeriteRespecFrame.ItemSlot
	S:Size(ItemSlot, 64, 64)
	S:Point(ItemSlot, 'CENTER', AzeriteRespecFrame)
	S:SetInside(ItemSlot.Icon)
	ItemSlot.GlowOverlay:SetAlpha(0)

	ItemSlot:SetTemplate('Transparent')
	ItemSlot:SetBackdropColor(slotColor.r, slotColor.g, slotColor.b, slotColor.a)
	ItemSlot.callbackBackdropColor = itemSlotColor
	S:HandleIcon(ItemSlot.Icon)

	local ButtonFrame = AzeriteRespecFrame.ButtonFrame
	ButtonFrame:GetRegions():Hide()
	ButtonFrame.ButtonBorder:Hide()
	ButtonFrame.ButtonBottomBorder:Hide()

	ButtonFrame.MoneyFrameEdge:Hide()
	ButtonFrame.MoneyFrame:ClearAllPoints()
	ButtonFrame.MoneyFrame:Point('BOTTOMRIGHT', ButtonFrame.MoneyFrameEdge, 7, 5)

	S:HandleButton(ButtonFrame.AzeriteRespecButton, true)
end

AS:RegisterSkin('Blizzard_AzeriteRespecUI', nil, 'ADDON_LOADED')
