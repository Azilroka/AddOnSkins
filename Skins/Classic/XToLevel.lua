local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('XToLevel') then return end

local _G = _G
local pairs = pairs

function AS:XToLevel()
	AS:SkinFrame(_G.XToLevel_AverageFrame_Classic)

	local Buttons = {
		_G.XToLevel_AverageFrame_Blocky_PlayerFrameCounterKills,
		_G.XToLevel_AverageFrame_Blocky_PlayerFrameCounterQuests,
		_G.XToLevel_AverageFrame_Blocky_PlayerFrameCounterDungeons,
		_G.XToLevel_AverageFrame_Blocky_PlayerFrameCounterBattles,
		_G.XToLevel_AverageFrame_Blocky_PlayerFrameCounterObjectives,
		_G.XToLevel_AverageFrame_Blocky_PlayerFrameCounterPetBattles,
		_G.XToLevel_AverageFrame_Blocky_PlayerFrameCounterGathering,
		_G.XToLevel_AverageFrame_Blocky_PlayerFrameCounterDigs,
		_G.XToLevel_AverageFrame_Blocky_PlayerFrameCounterProgress,
		_G.XToLevel_AverageFrame_Blocky_PlayerFrameCounterTimer,
		_G.XToLevel_AverageFrame_Blocky_PlayerFrameCounterGuildProgress,
	}

	for _, button in pairs(Buttons) do
		AS:SkinButton(button)
		AS:SetTemplate(button, "Transparent") -- Mera want transparency!
	end
end

AS:RegisterSkin('XToLevel', AS.XToLevel)
