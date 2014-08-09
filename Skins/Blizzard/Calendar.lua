if not Tukui then return end
local AS = unpack(select(2, ...))

local name = 'Blizzard_Calendar'
function AS:Blizzard_Calendar(event, addon)
	if addon == name then
		for i = 1, 42 do
			_G["CalendarDayButton"..i.."OverlayFrame"]:SetAlpha(1)
			_G["CalendarDayButton"..i.."EventTexture"]:SetAlpha(1)
		end
	end
end

AS:RegisterSkin(name, AS.Blizzard_Calendar, 'ADDON_LOADED')