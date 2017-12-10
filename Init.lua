local AddOnName, Engine = ...
local AddOn = LibStub('AceAddon-3.0'):NewAddon('AddOnSkins', 'AceEvent-3.0', 'AceHook-3.0')

Engine[1] = AddOn
Engine[2] = {}	-- Media
Engine[3] = {}	-- Locale
_G.AddOnSkins = Engine

AddOn.Title = GetAddOnMetadata(AddOnName, 'Title')
AddOn.Version = GetAddOnMetadata(AddOnName, 'Version')
AddOn.Authors = GetAddOnMetadata(AddOnName, 'Author'):gsub(", ", "    ")
AddOn.LSM = LibStub('LibSharedMedia-3.0')
AddOn.TicketTracker = 'https://git.tukui.org/Azilroka/AddOnSkins/issues'
AddOn.MyClass = select(2, UnitClass('player'))
AddOn.MyName = UnitName('player')
AddOn.MyRealm = GetRealmName()
AddOn.Noop = function() end
AddOn.TexCoords = {.08, .92, .08, .92}
AddOn.UIScale = UIParent:GetScale()

AddOn.ScreenWidth, AddOn.ScreenHeight = GetPhysicalScreenSize()

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
