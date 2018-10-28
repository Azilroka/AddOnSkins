local AS = unpack(AddOnSkins)

function AS:Blizzard_AzeriteUI(event, addon)
	if addon ~= 'Blizzard_AzeriteUI' then return end

	AS:SkinBackdropFrame(AzeriteEmpoweredItemUI)
	AS:StripTextures(AzeriteEmpoweredItemUI.BorderFrame)
	AzeriteEmpoweredItemUI.portrait:SetAlpha(0)

	AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame.Bg:Hide()
	AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame.KeyOverlay.Shadow:Hide()

	AS:SkinCloseButton(AzeriteEmpoweredItemUICloseButton)
end

local function SkinEtheralFrame(frame)
	frame.CornerTL:Hide()
	frame.CornerTR:Hide()
	frame.CornerBL:Hide()
	frame.CornerBR:Hide()

	local name = frame:GetName()
	_G[name.."LeftEdge"]:Hide()
	_G[name.."RightEdge"]:Hide()
	_G[name.."TopEdge"]:Hide()
	_G[name.."BottomEdge"]:Hide()

	local bg = select(23, frame:GetRegions())
	bg:ClearAllPoints()
	bg:SetPoint("TOPLEFT", -50, 25)
	bg:SetPoint("BOTTOMRIGHT")
	bg:SetTexture([[Interface\Transmogrify\EtherealLines]], true, true)
	bg:SetHorizTile(true)
	bg:SetVertTile(true)
	bg:SetAlpha(0.5)
end

function AS:Blizzard_AzeriteRespecUI(event, addon)
	if addon ~= 'Blizzard_AzeriteRespecUI' then return end

	local AzeriteRespecFrame = _G["AzeriteRespecFrame"]
	AzeriteRespecFrame:SetClipsChildren(true)
	AzeriteRespecFrame.Background:Hide()
	SkinEtheralFrame(AzeriteRespecFrame)

	AzeriteRespecFramePortraitFrame:Hide()
	AzeriteRespecFramePortrait:Hide()
	AzeriteRespecFrameTitleBg:Hide()
	AzeriteRespecFrameTopBorder:Hide()
	AzeriteRespecFrameTopRightCorner:Hide()
	AzeriteRespecFrameRightBorder:Hide()
	AzeriteRespecFrameLeftBorder:Hide()
	AzeriteRespecFrameBottomBorder:Hide()
	AzeriteRespecFrameBotRightCorner:Hide()
	AzeriteRespecFrameBotLeftCorner:Hide()
	AzeriteRespecFrameBg:Hide()

	local ItemSlot = AzeriteRespecFrame.ItemSlot
	ItemSlot:SetSize(64, 64)
	ItemSlot:SetPoint("CENTER", AzeriteRespecFrame)
	ItemSlot.Icon:ClearAllPoints()
	ItemSlot.Icon:SetPoint("TOPLEFT", 1, -1)
	ItemSlot.Icon:SetPoint("BOTTOMRIGHT", -1, 1)
	ItemSlot.GlowOverlay:SetAlpha(0)

	AzeriteRespecFrame.ItemSlot:CreateBackdrop("Transparent")
	AzeriteRespecFrame.ItemSlot.backdrop:SetBackdropColor(153/255, 0/255, 153/255, 0.5)
	AS:SkinTexture(AzeriteRespecFrame.ItemSlot.Icon)

	local ButtonFrame = AzeriteRespecFrame.ButtonFrame
	ButtonFrame:GetRegions():Hide()
	ButtonFrame.ButtonBorder:Hide()
	ButtonFrame.ButtonBottomBorder:Hide()

	ButtonFrame.MoneyFrameEdge:Hide()
	ButtonFrame.MoneyFrame:ClearAllPoints()
	ButtonFrame.MoneyFrame:SetPoint("BOTTOMRIGHT", ButtonFrame.MoneyFrameEdge, 7, 5)

	AzeriteRespecFrame:CreateBackdrop("Transparent")
	AzeriteRespecFrame.backdrop:SetAllPoints()

	AS:SkinButton(AzeriteRespecFrame.ButtonFrame.AzeriteRespecButton)
	AS:SkinCloseButton(AzeriteRespecFrameCloseButton)
end

AS:RegisterSkin("Blizzard_AzeriteUI", AS.Blizzard_AzeriteUI, 'ADDON_LOADED')
AS:RegisterSkin("Blizzard_AzeriteRespecUI", AS.Blizzard_AzeriteRespecUI, 'ADDON_LOADED')
