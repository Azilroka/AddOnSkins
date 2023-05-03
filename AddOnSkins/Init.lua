local _G = _G
local select = select
local format = format
local strlower = strlower
local CreateFrame = CreateFrame
local GetAddOnEnableState = GetAddOnEnableState
local GetAddOnInfo = GetAddOnInfo
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local GetNumAddOns = GetNumAddOns
local GetRealmName = GetRealmName
local UIParent = UIParent
local UnitClass = UnitClass
local UnitName = UnitName
local UnitFactionGroup = UnitFactionGroup

local AddOnName, Engine = ...
local AS = _G.LibStub('AceAddon-3.0'):NewAddon('AddOnSkins', 'AceConsole-3.0', 'AceEvent-3.0', 'AceHook-3.0', 'AceTimer-3.0')

AS.EmbedSystem = AS:NewModule('EmbedSystem', 'AceEvent-3.0', 'AceHook-3.0')
AS.Skins = AS:NewModule('Skins', 'AceTimer-3.0', 'AceHook-3.0', 'AceEvent-3.0')

Engine[1] = AS
Engine[2] = {}
Engine[3] = AS.Skins
Engine[4] = {}

_G.AddOnSkins = Engine
_G.AddOnSkinsDS = {}

AS.Classic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
AS.Retail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
AS.TBC = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC
AS.Wrath = WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC

AS.Libs = {
	AC = _G.LibStub('AceConfig-3.0'),
	ACD = _G.LibStub('AceConfigDialog-3.0-ElvUI', true) or _G.LibStub('AceConfigDialog-3.0'),
	ACH = _G.LibStub('LibAceConfigHelper'),
	ADB = _G.LibStub('AceDB-3.0'),
	ADBO = _G.LibStub('AceDBOptions-3.0'),
	ACL = _G.LibStub("AceLocale-3.0-ElvUI", true) or _G.LibStub("AceLocale-3.0"),
	EP = _G.LibStub('LibElvUIPlugin-1.0', true),
	ACR = _G.LibStub('AceConfigRegistry-3.0'),
	GUI = _G.LibStub('AceGUI-3.0'),
	LCG = _G.LibStub('LibCustomGlow-1.0', true),
	LSM = _G.LibStub('LibSharedMedia-3.0', true),
}

AS.Title = GetAddOnMetadata(AddOnName, 'Title')
AS.Version = tonumber(GetAddOnMetadata(AddOnName, 'Version'))
AS.Authors = GetAddOnMetadata(AddOnName, 'Author'):gsub(", ", "    ")
AS.ProperVersion = format('%.2f', AS.Version)
AS.TicketTracker = 'https://github.com/Azilroka/AddOnSkins/issues'
AS.MyClass = select(2, UnitClass('player'))
AS.MyName = UnitName('player')
AS.MyRealm = GetRealmName()
AS.Noop = function() end
AS.TexCoords = { .075, .925, .075, .925 }
AS.Faction = UnitFactionGroup('player')

AS.preload = {}
AS.skins = {}
AS.events = {}
AS.FrameLocks = {}

AS.AddOns = {}
AS.AddOnVersion = {}

for i = 1, GetNumAddOns() do
	local Name, _, _, _, Reason = GetAddOnInfo(i)
	AS.AddOns[strlower(Name)] = GetAddOnEnableState(AS.MyName, Name) == 2 and (not Reason or Reason ~= 'DEMAND_LOADED')
	AS.AddOnVersion[strlower(Name)] = GetAddOnMetadata(Name, 'Version')
end

AS.Libs.LSM:Register('statusbar', 'Solid', [[Interface\Buttons\WHITE8X8]])

AS.Hider = CreateFrame('Frame', nil, UIParent)
AS.Hider:Hide()
