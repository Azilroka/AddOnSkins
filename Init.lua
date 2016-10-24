local AddOnName, Engine = ...
local AddOn = LibStub('AceAddon-3.0'):NewAddon('AddOnSkins', 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0', 'AceHook-3.0')

Engine[1] = AddOn
Engine[2] = {}	-- Media
Engine[3] = {}	-- Locale
AddOnSkins = Engine

AddOn.Title = GetAddOnMetadata(AddOnName, 'Title')
AddOn.Version = GetAddOnMetadata(AddOnName, 'Version')
AddOn.LSM = LibStub('LibSharedMedia-3.0')
AddOn.TicketTracker = 'http://git.tukui.org/Azilroka/addonskins'
AddOn.MyClass = select(2, UnitClass('player'))
AddOn.MyName = UnitName('player')
AddOn.MyRealm = GetRealmName()
AddOn.Noop = function() end
AddOn.TexCoords = {.08, .92, .08, .92}
AddOn.UIScale = UIParent:GetScale()

AddOn.Resolution = ({GetScreenResolutions()})[GetCurrentResolution()] or GetCVar("gxWindowedResolution")

AddOn.ScreenHeight = tonumber(strmatch(AddOn.Resolution, "%d+x(%d+)"))
AddOn.ScreenWidth = tonumber(strmatch(AddOn.Resolution, "(%d+)x+%d"))
AddOn.Mult = 1
AddOn.skins = {}
AddOn.events = {}
AddOn.register = {}
AddOn.FrameLocks = {}

AddOn.preload = {}

AddOn.AddOns = {}

for i = 1, GetNumAddOns() do
	local Name = GetAddOnInfo(i)
	AddOn.AddOns[strlower(Name)] = GetAddOnEnableState(AddOn.MyName, Name) > 0
end

TEXTURE_ITEM_QUEST_BANG = "Interface\\AddOns\\AddOnSkins\\Media\\Textures\\UI-Icon-QuestBang"

AddOn.Hider = CreateFrame('Frame', nil, UIParent)
AddOn.Hider:Hide()
