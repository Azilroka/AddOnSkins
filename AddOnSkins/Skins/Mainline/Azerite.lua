local AS, L, S, R = unpack(AddOnSkins)

local _G = _G

function R:Blizzard_AzeriteUI()
	if not AS:IsSkinEnabled('Blizzard_AzeriteUI', 'azerite') then return end

	_G.AzeriteEmpoweredItemUIPortrait:Hide()
	S:HandleFrame(_G.AzeriteEmpoweredItemUI)
	_G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame.Bg:Hide()
end

AS:RegisterSkin('Blizzard_AzeriteUI', nil, 'ADDON_LOADED')
