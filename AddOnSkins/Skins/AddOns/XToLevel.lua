-- XToLevel skin for AddOnSkins

local AS = unpack(AddOnSkins)

-- Background textures are named via $parentBackground, expanding to e.g.
-- XToLevel_AverageFrame_Blocky_PlayerFrameCounterKillsBackground.
local COUNTER_NAMES = {
	'Kills', 'Quests', 'Dungeons', 'Battles', 'Objectives',
	'PetBattles', 'Gathering', 'Digs', 'Progress', 'Timer', 'GuildProgress',
}

local function HideCounterBackgrounds(playerFrame)
	local prefix = playerFrame:GetName() .. 'Counter'
	for _, name in ipairs(COUNTER_NAMES) do
		local bg = _G[prefix .. name .. 'Background']
		if bg then bg:SetTexture(nil) end
	end
end

local function SkinProgressBar(playerFrame)
	local prefix = playerFrame:GetName() .. 'Counter'

	-- Bar track: dark backdrop behind the fill texture
	local bar = _G[prefix .. 'ProgressBar']
	if bar then
		AS:SetTemplate(bar)
	end

	-- Fill: use ElvUI accent color, set texture to solid white so vertex color shows
	local fill = _G[prefix .. 'ProgressBarColor']
	if fill then
		local blankTex = (_G.ElvUI and _G.ElvUI[1] and _G.ElvUI[1].media.blankTex)
			or [[Interface\Buttons\WHITE8X8]]
		fill:SetTexture(blankTex)
		fill:SetVertexColor(unpack(AS.Color))
		-- Ensure fill draws above the bar backdrop
		fill:SetDrawLayer('ARTWORK', 1)
	end
end

local function CreateBlockyWrapper(playerFrame)
	local PAD = 4
	-- Use FrameLevel 0 so the wrapper sits below all counter child frames
	local wrapper = CreateFrame('Frame', nil, UIParent, 'BackdropTemplate')
	wrapper:SetFrameStrata(playerFrame:GetFrameStrata())
	wrapper:SetFrameLevel(0)
	AS:SetTemplate(wrapper)
	AS:CreateShadow(wrapper)

	local function Refit()
		local w, h = playerFrame:GetWidth(), playerFrame:GetHeight()
		if w < 4 or h < 4 then return end
		wrapper:SetParent(playerFrame:GetParent())
		wrapper:ClearAllPoints()
		wrapper:SetPoint('TOPLEFT', playerFrame, 'TOPLEFT', -PAD, PAD)
		wrapper:SetPoint('BOTTOMRIGHT', playerFrame, 'BOTTOMRIGHT', PAD, -PAD)
		wrapper:SetShown(playerFrame:IsShown())
	end

	playerFrame:HookScript('OnSizeChanged', Refit)
	playerFrame:HookScript('OnShow', function() wrapper:Show() end)
	playerFrame:HookScript('OnHide', function() wrapper:Hide() end)
	Refit()
end

local function SkinBlockyFrame()
	local f = _G['XToLevel_AverageFrame_Blocky_PlayerFrame']
	if not f or f._asSkinned then return end
	f._asSkinned = true

	HideCounterBackgrounds(f)
	SkinProgressBar(f)
	CreateBlockyWrapper(f)
end

local function SkinClassicFrame()
	local f = _G['XToLevel_AverageFrame_Classic']
	if not f or f._asSkinned then return end
	f._asSkinned = true
	AS:StripTextures(f)
	AS:SetTemplate(f)
	AS:CreateShadow(f)
	hooksecurefunc(f, 'SetBackdrop', function(self)
		if self._asSkinned then AS:SetTemplate(self) end
	end)
end

function AS:XToLevel(event, addon)
	local loaded = (C_AddOns and C_AddOns.IsAddOnLoaded and C_AddOns.IsAddOnLoaded('XToLevel'))
		or (_G.IsAddOnLoaded and _G.IsAddOnLoaded('XToLevel'))
	if not loaded then return end

	C_Timer.After(0, function()
		SkinClassicFrame()
		SkinBlockyFrame()
	end)
end

AS:RegisterSkin('XToLevel', AS.XToLevel)
