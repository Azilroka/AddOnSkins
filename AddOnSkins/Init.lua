local _G = _G
local format, strlower = format, strlower

local GetAddOnEnableState, GetAddOnInfo, GetAddOnMetadata, GetNumAddOns = C_AddOns.GetAddOnEnableState, C_AddOns.GetAddOnInfo, C_AddOns.GetAddOnMetadata, C_AddOns.GetNumAddOns
local UnitName, GetRealmName, UnitClass, UnitFactionGroup = UnitName, GetRealmName, UnitClass, UnitFactionGroup

local UIParent, CreateFrame = UIParent, CreateFrame
local LibStub = _G.LibStub

local AddOnName, Engine = ...
local AS, _ = LibStub('AceAddon-3.0'):NewAddon('AddOnSkins', 'AceConsole-3.0', 'AceEvent-3.0', 'AceHook-3.0', 'AceTimer-3.0')

AS.EmbedSystem = AS:NewModule('EmbedSystem', 'AceEvent-3.0', 'AceHook-3.0')
AS.Skins = AS:NewModule('Skins', 'AceTimer-3.0', 'AceHook-3.0', 'AceEvent-3.0')

_G.AddOnSkins, Engine[1], Engine[2], Engine[3], Engine[4], _G.AddOnSkinsDS = Engine, AS, {}, AS.Skins, {}, {}

AS.Retail, AS.Classic, AS.TBC, AS.Wrath = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE, WOW_PROJECT_ID == WOW_PROJECT_CLASSIC, WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC, WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC

AS.Libs = {
	AC = LibStub('AceConfig-3.0'),
	ACD = LibStub('AceConfigDialog-3.0-ElvUI', true) or LibStub('AceConfigDialog-3.0'),
	ACH = LibStub('LibAceConfigHelper'),
	ADB = LibStub('AceDB-3.0'),
	ADBO = LibStub('AceDBOptions-3.0'),
	ACL = LibStub("AceLocale-3.0-ElvUI", true) or LibStub("AceLocale-3.0"),
	EP = LibStub('LibElvUIPlugin-1.0', true),
	ACR = LibStub('AceConfigRegistry-3.0'),
	GUI = LibStub('AceGUI-3.0'),
	LCG = LibStub('LibCustomGlow-1.0', true),
	LSM = LibStub('LibSharedMedia-3.0', true),
}

AS.Title = GetAddOnMetadata(AddOnName, 'Title')
AS.Version = tonumber(GetAddOnMetadata(AddOnName, 'Version'))
AS.Authors = GetAddOnMetadata(AddOnName, 'Author'):gsub(", ", "    ")
AS.ProperVersion = format('%.2f', AS.Version)
AS.TicketTracker = 'https://github.com/Azilroka/AddOnSkins/issues'
_, AS.MyClass = UnitClass('player')
AS.MyName = UnitName('player')
AS.MyRealm = GetRealmName()
AS.Noop = function() end
AS.TexCoords = { .08, .92, .08, .92 }
AS.Faction = UnitFactionGroup('player')

AS.preload = {}
AS.skins = {}
AS.events = {}
AS.FrameLocks = {}

AS.AddOns = {}
AS.AddOnVersion = {}

for i = 1, GetNumAddOns() do
	local Name, _, _, _, Reason = GetAddOnInfo(i)
	AS.AddOns[strlower(Name)] = GetAddOnEnableState(Name, AS.MyName) == 2 and (not Reason or Reason ~= 'DEMAND_LOADED')
	AS.AddOnVersion[strlower(Name)] = GetAddOnMetadata(Name, 'Version')
end

AS.Hider = CreateFrame('Frame', nil, UIParent)
AS.Hider:Hide()
