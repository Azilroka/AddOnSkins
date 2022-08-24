local _, Engine = ...
local AS = _G.LibStub('AceAddon-3.0'):NewAddon('AddOnSkins', 'AceConsole-3.0', 'AceEvent-3.0', 'AceHook-3.0', 'AceTimer-3.0')

local _G = _G
local select = select
local format = format
local strlower = strlower
local CreateFrame = CreateFrame
local GetAddOnEnableState = GetAddOnEnableState
local GetAddOnInfo = GetAddOnInfo
local GetAddOnMetadata = GetAddOnMetadata
local GetNumAddOns = GetNumAddOns
local GetPhysicalScreenSize = GetPhysicalScreenSize
local GetRealmName = GetRealmName
local UIParent = UIParent
local UnitClass = UnitClass
local UnitName = UnitName
local UnitFactionGroup = UnitFactionGroup

Engine[1] = AS
Engine[2] = _G.LibStub("AceLocale-3.0"):GetLocale('AddOnSkins', false)

_G.AddOnSkins = Engine
_G.AddOnSkinsDS = {}

local _, _, _, wowtoc = GetBuildInfo() -- TODO: Move back to Core.lua

AS.Classic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
AS.Retail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
AS.TBC = wowtoc >= 20504 and wowtoc < 30000
AS.Wrath = wowtoc >= 30400 and wowtoc < 40000

AS.Title = GetAddOnMetadata(..., 'Title')
AS.Version = tonumber(GetAddOnMetadata(..., 'Version'))
AS.Authors = GetAddOnMetadata(..., 'Author'):gsub(", ", "    ")
AS.ProperVersion = format('%.2f', AS.Version)
AS.TicketTracker = 'https://github.com/Azilroka/AddOnSkins/issues'
AS.MyClass = select(2, UnitClass('player'))
AS.MyName = UnitName('player')
AS.MyRealm = GetRealmName()
AS.Noop = function() end
AS.TexCoords = { .075, .925, .075, .925 }
AS.UIScale = UIParent:GetScale()
AS.Faction = UnitFactionGroup('player')
AS.Mult = 1
AS.ScreenWidth, AS.ScreenHeight = GetPhysicalScreenSize()

AS.Libs = {
	ACH = _G.LibStub('LibAceConfigHelper'),
	LSM = _G.LibStub('LibSharedMedia-3.0', true),
	LCG = _G.LibStub('LibCustomGlow-1.0', true),
	AC = _G.LibStub('AceConfig-3.0'),
	GUI = _G.LibStub('AceGUI-3.0'),
	ACR = _G.LibStub('AceConfigRegistry-3.0'),
	ACD = _G.LibStub('AceConfigDialog-3.0'),
	ACL = Engine[2],
	ADB = _G.LibStub('AceDB-3.0'),
}

local Color = _G.RAID_CLASS_COLORS[AS.MyClass]
AS.ClassColor = { Color.r, Color.g, Color.b }
AS.Color = { 0, 0.44, .87, 1 }

AS.skins = {}
AS.events = {}
AS.register = {}
AS.FrameLocks = {}

AS.preload = {}

AS.AddOns = {}
AS.AddOnVersion = {}

for i = 1, GetNumAddOns() do
	local Name, _, _, _, Reason = GetAddOnInfo(i)
	AS.AddOns[strlower(Name)] = GetAddOnEnableState(AS.MyName, Name) == 2 and (not Reason or Reason ~= 'DEMAND_LOADED')
	AS.AddOnVersion[strlower(Name)] = GetAddOnMetadata(Name, 'Version')
end

AS.Media = {
	Textures = {
		Plus = [[Interface\AddOns\AddOnSkins\Media\Textures\Plus]],
		Minus = [[Interface\AddOns\AddOnSkins\Media\Textures\Minus]],
		QuestBang = [[Interface\AddOns\AddOnSkins\Media\Textures\UI-Icon-QuestBang]]
	}
}

AS.Hider = CreateFrame('Frame', nil, UIParent)
AS.Hider:Hide()
