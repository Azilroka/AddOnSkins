local AS, L, S, R = unpack(AddOnSkins)

local _G = _G

-- credit: Aftermathh, edited by Simpy
function R:Blizzard_CombatLog()
	local bar = _G.CombatLogQuickButtonFrame_Custom
	S:HandleFrame(bar)

	bar:ClearAllPoints()
	S:Point(bar, 'BOTTOMLEFT', _G.ChatFrame2, 'TOPLEFT', -3, 2)
	S:Point(bar, 'BOTTOMRIGHT', _G.ChatFrame2, 'TOPRIGHT', 3, 0)

	local progress = _G.CombatLogQuickButtonFrame_CustomProgressBar
	progress:SetStatusBarTexture(S.Media.StatusBar)
	S:SetInside(progress, bar)

	S:HandleNextPrevButton(_G.CombatLogQuickButtonFrame_CustomAdditionalFilterButton)
	_G.CombatLogQuickButtonFrame_CustomAdditionalFilterButton:ClearAllPoints()
	S:Point(_G.CombatLogQuickButtonFrame_CustomAdditionalFilterButton, 'TOPRIGHT', bar, 'TOPRIGHT', -2, -2)
	_G.CombatLogQuickButtonFrame_CustomAdditionalFilterButton:SetHitRectInsets(0,0,0,0)
	_G.CombatLogQuickButtonFrame_CustomAdditionalFilterButton:SetFrameLevel(bar:GetFrameLevel() + 3)
	S:Size(_G.CombatLogQuickButtonFrame_CustomAdditionalFilterButton, 20)
	_G.CombatLogQuickButtonFrame_CustomTexture:Hide()
end

AS:RegisterSkin('Blizzard_CombatLog', nil, 'ADDON_LOADED')
