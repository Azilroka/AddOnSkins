local _G = _G
local format, strlower, select = format, strlower, select

local C_AddOns = C_AddOns

-- TBC Anniversary: C_AddOns namespace exists but legacy globals may be nil.
-- Restore them so skin files and libraries that reference the globals directly work.
if not _G.IsAddOnLoaded       and C_AddOns and C_AddOns.IsAddOnLoaded       then _G.IsAddOnLoaded       = C_AddOns.IsAddOnLoaded       end
if not _G.GetAddOnMetadata    and C_AddOns and C_AddOns.GetAddOnMetadata    then _G.GetAddOnMetadata    = C_AddOns.GetAddOnMetadata    end
if not _G.GetAddOnInfo        and C_AddOns and C_AddOns.GetAddOnInfo        then _G.GetAddOnInfo        = C_AddOns.GetAddOnInfo        end
if not _G.GetNumAddOns        and C_AddOns and C_AddOns.GetNumAddOns        then _G.GetNumAddOns        = C_AddOns.GetNumAddOns        end
-- Do NOT alias C_AddOns.GetAddOnEnableState into the legacy global: they have
-- opposite argument orders. Callers that need the legacy (character, name)
-- signature must use _G.GetAddOnEnableState directly; callers that use the
-- C_AddOns namespace call it as (name, character).
if not _G.GetAddOnEnableState and C_AddOns and C_AddOns.GetAddOnEnableState then
	_G.GetAddOnEnableState = function(character, name) return C_AddOns.GetAddOnEnableState(name, character) end
end

local GetAddOnInfo        = (C_AddOns and C_AddOns.GetAddOnInfo)        or _G.GetAddOnInfo
local GetAddOnMetadata    = (C_AddOns and C_AddOns.GetAddOnMetadata)    or _G.GetAddOnMetadata
local GetNumAddOns        = (C_AddOns and C_AddOns.GetNumAddOns)        or _G.GetNumAddOns
local IsAddOnLoaded       = (C_AddOns and C_AddOns.IsAddOnLoaded)       or _G.IsAddOnLoaded

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

local screenW, screenH = GetPhysicalScreenSize and GetPhysicalScreenSize()
AS.ScreenWidth  = screenW or 1920
AS.ScreenHeight = screenH or 1080
AS.UIScale = UIParent:GetScale()
AS.Mult = 1

local classColor = _G.RAID_CLASS_COLORS[AS.MyClass]
AS.ClassColor = { classColor.r, classColor.g, classColor.b }

AS.preload = {}
AS.skins = {}
AS.events = {}
AS.FrameLocks = {}

AS.AddOns = {}
AS.AddOnVersion = {}
AS.AlreadyLoaded = {}

for i = 1, GetNumAddOns() do
	local Name, _, _, _, Reason = GetAddOnInfo(i)
	local LoweredName = strlower(Name)
	local enableState
	if C_AddOns and C_AddOns.GetAddOnEnableState then
		enableState = C_AddOns.GetAddOnEnableState(Name, AS.MyName)
	else
		enableState = _G.GetAddOnEnableState and _G.GetAddOnEnableState(AS.MyName, Name)
	end
	AS.AddOns[LoweredName] = (enableState or 0) > 0 and (not Reason or Reason ~= 'DEMAND_LOADED')
	AS.AlreadyLoaded[Name] = IsAddOnLoaded and IsAddOnLoaded(Name) or false
	AS.AddOnVersion[LoweredName] = GetAddOnMetadata(Name, 'Version')
end

AS.Hider = CreateFrame('Frame', nil, UIParent)
AS.Hider:Hide()
