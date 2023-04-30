local AS, L, S, R = unpack(AddOnSkins)

local _G = _G

function R:Blizzard_FlightMap()
	if not AS:IsSkinEnabled('Blizzard_FlightMap', 'taxi') then return end

	S:HandlePortraitFrame(_G.FlightMapFrame)
end

AS:RegisterSkin('Blizzard_FlightMap', nil, 'ADDON_LOADED')
