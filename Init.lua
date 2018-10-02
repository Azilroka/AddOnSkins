local AddOnName, Engine = ...

if IsAddOnLoaded('Tukui') and not IsAddOnLoaded('ProjectAzilroka') then
	StaticPopupDialogs['ADDONSKINS'] = {
		text = "AddOnSkins: You will need ProjectAzilroka, https://www.tukui.org/addons.php?id=79",
		button1 = 'OK',
		button2 = 'Cancel',
		timeout = 0,
		hasEditBox = 1,
		whileDead = 1,
		hideOnEscape = 1,
		showAlert = 1,
		maxLetters = 38,
		EditBoxOnEscapePressed = function(self)
			self:GetParent():Hide()
		end,
		OnShow = function(self)
			self.editBox:SetText("https://www.tukui.org/addons.php?id=79")
			self.editBox:SetFocus()
		end,
	}

	_G.StaticPopup_Show('ADDONSKINS')

	return
end

local AddOn = LibStub('AceAddon-3.0'):NewAddon('AddOnSkins', 'AceEvent-3.0', 'AceHook-3.0', 'AceTimer-3.0')

Engine[1] = AddOn
Engine[2] = LibStub("AceLocale-3.0"):GetLocale('AddOnSkins', false)

_G.AddOnSkins = Engine
AddOnSkinsDS = {}

AddOn.Title = GetAddOnMetadata('AddOnSkins', 'Title')
AddOn.Version = tonumber(GetAddOnMetadata('AddOnSkins', 'Version'))
AddOn.Authors = GetAddOnMetadata('AddOnSkins', 'Author'):gsub(", ", "    ")
AddOn.LSM = LibStub('LibSharedMedia-3.0')
AddOn.TicketTracker = 'https://git.tukui.org/Azilroka/AddOnSkins/issues'
AddOn.MyClass = select(2, UnitClass('player'))
AddOn.MyName = UnitName('player')
AddOn.MyRealm = GetRealmName()
AddOn.Noop = function() end
AddOn.TexCoords = {.08, .92, .08, .92}
AddOn.UIScale = UIParent:GetScale()
AddOn.Faction = UnitFactionGroup("player")

AddOn.ScreenWidth, AddOn.ScreenHeight = GetPhysicalScreenSize()

local Color = RAID_CLASS_COLORS[AddOn.MyClass]
AddOn.ClassColor = { Color.r, Color.g, Color.b }
AddOn.Color = { 0, 0.44, .87, 1 }
AddOn.Mult = 1
AddOn.skins = {}
AddOn.events = {}
AddOn.register = {}
AddOn.FrameLocks = {}

AddOn.preload = {}

AddOn.AddOns = {}
AddOn.AddOnVersion = {}

for i = 1, GetNumAddOns() do
	local Name = GetAddOnInfo(i)
	AddOn.AddOns[strlower(Name)] = GetAddOnEnableState(AddOn.MyName, Name) == 2
	AddOn.AddOnVersion[strlower(Name)] = GetAddOnMetadata(Name, "Version")
end

TEXTURE_ITEM_QUEST_BANG = [[Interface\AddOns\AddOnSkins\Media\Textures\UI-Icon-QuestBang]]

AddOn.Hider = CreateFrame('Frame', nil, UIParent)
AddOn.Hider:Hide()
