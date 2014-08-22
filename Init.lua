local AddOnName, Engine = ...
local AddOn = LibStub('AceAddon-3.0'):NewAddon('AddOnSkins', 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0', 'AceHook-3.0')

Engine[1] = AddOn
Engine[2] = {}	-- Media
Engine[3] = {}	-- Locale
AddOnSkins = Engine

AddOn.Title = select(2, GetAddOnInfo(AddOnName))
AddOn.Version = GetAddOnMetadata(AddOnName, 'Version')
AddOn.LSM = LibStub('LibSharedMedia-3.0')
AddOn.SLE = select(4, GetAddOnInfo('ElvUI_SLE'))
AddOn.TicketTracker = 'http://git.tukui.org/Azilroka/addonskins'
AddOn.MyClass = select(2, UnitClass('player'))
AddOn.MyName = UnitName('player')
AddOn.MyRealm = GetRealmName()
AddOn.Noop = function() return end
AddOn.TexCoords = {.08, .92, .08, .92}
AddOn.UIScale = UIParent:GetScale()
AddOn.Mult = 768/strmatch(GetCVar('gxResolution'), '%d+x(%d+)')/AddOn.UIScale
AddOn.skins = {}
AddOn.events = {}
AddOn.register = {}
AddOn.FrameLocks = {}
