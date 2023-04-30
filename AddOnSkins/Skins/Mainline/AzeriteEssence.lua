local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local pairs = pairs
local C_AzeriteEssence_CanOpenUI = C_AzeriteEssence.CanOpenUI

function R:Blizzard_AzeriteEssenceUI()
	if not AS:IsSkinEnabled('Blizzard_AzeriteEssenceUI', 'azeriteEssence') then return end
	if not C_AzeriteEssence_CanOpenUI() then return end

	local AzeriteEssenceUI = _G.AzeriteEssenceUI
	S:HandlePortraitFrame(AzeriteEssenceUI)

	-- Reposition the Level Badge
	AzeriteEssenceUI.PowerLevelBadgeFrame:ClearAllPoints()
	S:Point(AzeriteEssenceUI.PowerLevelBadgeFrame, 'TOPLEFT')
	AzeriteEssenceUI.PowerLevelBadgeFrame.Ring:Hide()
	AzeriteEssenceUI.PowerLevelBadgeFrame.BackgroundBlack:Hide()

	AzeriteEssenceUI.OrbBackground:SetAllPoints(AzeriteEssenceUI.ItemModelScene)
	S:Size(AzeriteEssenceUI.OrbRing, 483, 480)

	S:HandleScrollBar(AzeriteEssenceUI.EssenceList.ScrollBar)

	-- Essence List on the right
	for _, button in pairs(AzeriteEssenceUI.EssenceList.buttons) do
		button:DisableDrawLayer('ARTWORK')
		S:StyleButton(button)

		S:HandleIcon(button.Icon)
		S:Point(button.Icon, 'LEFT', button, 'LEFT', 6, 0)

		S:CreateBackdrop(button)
		S:Point(button.backdrop,'TOPLEFT', 2, -3)
		S:Point(button.backdrop, 'BOTTOMRIGHT', -2, 3)
	end

	-- Header on the Essence List
	AzeriteEssenceUI:HookScript('OnShow', function(s)
		S:HandleFrame(s.EssenceList.HeaderButton)
	end)
end

AS:RegisterSkin('Blizzard_AzeriteEssenceUI', nil, 'ADDON_LOADED')
