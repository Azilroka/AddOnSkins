local _, Engine = ...
local AddOn = _G.LibStub('AceAddon-3.0'):NewAddon('AddOnSkins', 'AceConsole-3.0', 'AceEvent-3.0', 'AceHook-3.0', 'AceTimer-3.0')

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

Engine[1] = AddOn
Engine[2] = _G.LibStub("AceLocale-3.0"):GetLocale('AddOnSkins', false)

_G.AddOnSkins = Engine
_G.AddOnSkins.Classic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
_G.AddOnSkins.Retail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
_G.AddOnSkins.TBC = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC
_G.AddOnSkins.WotLK = false

_G.AddOnSkinsDS = {}

AddOn.Title = GetAddOnMetadata(..., 'Title')
AddOn.Version = tonumber(GetAddOnMetadata(..., 'Version'))
AddOn.Authors = GetAddOnMetadata(..., 'Author'):gsub(", ", "    ")
AddOn.ProperVersion = format('%.2f', AddOn.Version)
AddOn.TicketTracker = 'https://github.com/Azilroka/AddOnSkins/issues'
AddOn.MyClass = select(2, UnitClass('player'))
AddOn.MyName = UnitName('player')
AddOn.MyRealm = GetRealmName()
AddOn.Noop = function() end
AddOn.TexCoords = { .075, .925, .075, .925 }
AddOn.UIScale = UIParent:GetScale()
AddOn.Faction = UnitFactionGroup('player')
AddOn.Mult = 1
AddOn.ScreenWidth, AddOn.ScreenHeight = GetPhysicalScreenSize()

AddOn.Libs = {
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

local Color = _G.RAID_CLASS_COLORS[AddOn.MyClass]
AddOn.ClassColor = { Color.r, Color.g, Color.b }
AddOn.Color = { 0, 0.44, .87, 1 }

AddOn.skins = {}
AddOn.events = {}
AddOn.register = {}
AddOn.FrameLocks = {}

AddOn.preload = {}

AddOn.AddOns = {}
AddOn.AddOnVersion = {}

for i = 1, GetNumAddOns() do
	local Name, _, _, _, Reason = GetAddOnInfo(i)
	AddOn.AddOns[strlower(Name)] = GetAddOnEnableState(AddOn.MyName, Name) == 2 and (not Reason or Reason ~= 'DEMAND_LOADED')
	AddOn.AddOnVersion[strlower(Name)] = GetAddOnMetadata(Name, 'Version')
end

AddOn.Media = {
	Textures = {
		Plus = [[Interface\AddOns\AddOnSkins\Media\Textures\Plus]],
		Minus = [[Interface\AddOns\AddOnSkins\Media\Textures\Minus]],
		QuestBang = [[Interface\AddOns\AddOnSkins\Media\Textures\UI-Icon-QuestBang]]
	}
}

AddOn.Hider = CreateFrame('Frame', nil, UIParent)
AddOn.Hider:Hide()
