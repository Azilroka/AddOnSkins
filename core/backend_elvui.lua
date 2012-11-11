-- Backend for ElvUI

if not IsAddOnLoaded("ElvUI") then return end

local U = unpack(select(2,...))
local E, L, V, P, G,_ = unpack(ElvUI)
local XS = E:NewModule('ExtraSkins','AceTimer-3.0','AceEvent-3.0')
local LSM = LibStub("LibSharedMedia-3.0");
local Skins = U.Skins
XS.LSM = LSM
XS.skins = {}
XS.embeds = {}
XS.events = {}
XS.register = {}

U.x = XS
U.elv = true
U.sle = IsAddOnLoaded("ElvUI_SLE")

local exceptions = {
	"EmbedOoC", 
	"EmbedRecount", 
	"EmbedSkada", 
	"EmbedOmen", 
	"EmbedRO", 
	"EmbedTDPS", 
	"EmbedSexyCooldown"
}

P["skins"] = {
	["LootConfirmer"] = false,
	["UISkinMinimap"] = true,
	["DBMSkinHalf"] = false,
	["RecountBackdrop"] = true,
	["SkadaBackdrop"] = true,
	["PetBattles"] = false,
}

for k, _ in pairs(Skins) do
	P.skins[k] = true
end

for k, _ in pairs(exceptions) do
	P.skins[k] = false
end

E.PopupDialogs["OLD_SKIN_PACKAGE"] = {
	text = "You have the old Tukui_UIPackages_Skins addon.  This addon replaces and will conflict with it.  Press accept to disable this addon and reload your UI.",
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function() DisableAddOn("Tukui_UIPackages_Skins"); ReloadUI() end,
	timeout = 0,
	whileDead = 1,
}

local function GenerateEventFunction(event)
	local eventHandler = function(self,event)
		for skin,funcs in pairs(self.skins) do
			if U.CheckOption(skin) and self.events[event][skin] then
				for func,_ in pairs(funcs) do
					func(f,event)
				end
			end
		end
	end
	return eventHandler
end

function XS:Initialize()
	if self.frame then return end -- In case this gets called twice as can sometimes happen with ElvUI

	if (E.myname == 'Sortokk' or E.myname == 'Sagome' or E.myname == 'Norinael' or E.myname == 'Pornix' or E.myname == 'Hioxy' or E.myname == 'Gorbilix') and E.myrealm == 'Emerald Dream' then
		E.db.skins['SortSettings'] = true
	end
	if IsAddOnLoaded("Tukui_UIPackages_Skins") then E:StaticPopup_Show("OLD_SKIN_PACKAGE") end
	self.font = E["media"].normFont
	self.pixelFont = LSM:Fetch("font","ElvUI Pixel")
	self.datatext_font = LSM:Fetch("font",E.db.datatexts.font)

	self:GenerateOptions()

	self.AddNonPetBattleFrames = function(self) U.AddNonPetBattleFrames() end
	self.RemoveNonPetBattleFrames = function(self) U.RemoveNonPetBattleFrames() end

	self:RegisterEvent("PET_BATTLE_CLOSE", 'AddNonPetBattleFrames')
	self:RegisterEvent('PET_BATTLE_OPENING_START', "RemoveNonPetBattleFrames")
	
	for skin,alldata in pairs(self.register) do
		for _,data in pairs(alldata) do
			self:RegisterSkin(skin,data.func,data.events)
		end
	end

	for skin,funcs in pairs(XS.skins) do
		if U.CheckOption(skin) then
			for func,_ in pairs(funcs) do
				func(f,"PLAYER_ENTERING_WORLD")
			end
		end
	end
end

function XS:RegisterSkin(skinName,func,events)
	if not self.skins[skinName] then self.skins[skinName] = {} end
	self.skins[skinName][func] = true
	for event,_ in pairs(events) do
    	if not self.events[event] then
			self[event] = GenerateEventFunction(event)
			self:RegisterEvent(event); 
			self.events[event] = {} 
		end
		self.events[event][skinName] = true
	end
end

function XS:UnregisterEvent(skinName,event)
	if not self.events[event] then return end
	if not self.events[event][skinName] then return end

	self.events[event][skinName] = nil
	local found = false
	for skin,_ in pairs(self.events[event]) do
		if skin then
			found = true
			break
		end
	end
	if not found then
		self:UnregisterEvent(event)
	end
end

function XS:GenerateOptionTable(skinName,order)
	local data = Skins[skinName]
	local addon = data.addon
	local text = data.buttonText or addon
	local options = {
		type = 'toggle',
		name = text,
		desc = L['TOGGLESKIN_DESC'],
		order = order,
		disabled = function() if addon then return not IsAddOnLoaded(addon) else return false end end,
	}
	return options
end

function XS:GenerateOptions()
	local function pairsByKeys (t, f)
      local a = {}
      for n in pairs(t) do table.insert(a, n) end
      table.sort(a, f)
      local i = 0      -- iterator variable
      local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
      end
      return iter
    end
	E.Options.args.skins.args.addonSkins = {
		order = 10,
		type = 'group',
		name = 'AddOns',
		get = function(info) return E.db.skins[ info[#info] ] end,
		set = function(info,value)  E.db.skins[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,
		args = {
			desc = {
				type = 'description',
				name = 'AddOn Skins by Azilroka & Sortokk - v'..U.Version,
				order = 1
			},
			misc = {
				type = 'group',
				name = 'Misc Options',
				order = 5,
				args = {
					LootConfirmer = {
						type = 'toggle',
						name = 'Auto confirm loot',
						desc = L['TOGGLESKIN_DESC'],
						order = 1,
					},
					UISkinMinimap = {
						type = 'toggle',
						name = 'Square minimap icons',
						desc = L['TOGGLESKIN_DESC'],
						order = 2,
					},
					PetBattles = {
						type = 'toggle',
						name = 'Pet Battle Dump/Glow',
						desc = L['TOGGLESKIN_DESC'],
						order = 3,
					}
					DBMSkinHalf = {
						type = 'toggle',
						name = 'DBM Half-bar Skin',
						desc = L["TOGGLESKIN_DESC"],
						order = 4,
						disabled = function() return not E.db.skins['DBMSkin'] end
					},
					RecountBackdrop = {
						type = 'toggle',
						name = 'Recount Backdrop',
						desc = L['TOGGLESKIN_DESC'],
						order = 5,
						disabled = function() return not IsAddOnLoaded("Recount") or not E.db.skins["RecountSkin"] end,
					},
					SkadaBackdrop = {
						type = 'toggle',
						name = 'Skada Backdrop',
						desc = L['TOGGLESKIN_DESC'],
						order = 6,
						disabled = function() return not IsAddOnLoaded("Skada") or not E.db.skins["SkadaSkin"] end,
					},
				}
			},
			embed = {
				order = 10,
				type = 'group',
				name = 'Embed Settings',
				get = function(info) return E.db.skins[ info[#info] ] end,
				set = function(info,value)  E.db.skins[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,
				args = {
					desc = {
						type = 'description',
						name = 'Settings to control addons embedded in right chat panel',
						order = 1
					},
					EmbedRecount = {
						type = 'toggle',
						name = 'Recount',
						desc = L['TOGGLESKIN_DESC'],
						order = 2,
						disabled = function() return not IsAddOnLoaded("Recount") end,
					},
					EmbedSkada = {
						type = 'toggle',
						name = 'Skada',
						desc = L['TOGGLESKIN_DESC'],
						order = 4,
						disabled = function() return not IsAddOnLoaded("Skada") end,
					},
					EmbedOmen = {
						type = 'toggle',
						name = 'Omen',
						desc = L['TOGGLESKIN_DESC'],
						order = 6,
						disabled = function() return not IsAddOnLoaded("Omen") end,
					},
					EmbedRO = {
						type = 'toggle',
						name = 'Recount & Omen',
						desc = L['TOGGLESKIN_DESC'],
						order = 8,
						disabled = function() return not IsAddOnLoaded("Omen") or not IsAddOnLoaded("Recount") end,
					},
					EmbedTDPS = {
						type = 'toggle',
						name = 'TinyDPS',
						desc = L['TOGGLESKIN_DESC'],
						order = 9,
						disabled = function() return not IsAddOnLoaded("TinyDPS") end,
					},
					EmbedOoC = {
						type = 'toggle',
						name = 'Hide while out of combat',
						desc = L['TOGGLESKIN_DESC'],
						order = 10,
					},
					EmbedSexyCooldown = {
						type = 'toggle',
						name = 'Attach SexyCD to action bar',
						desc = L['TOGGLESKIN_DESC'],
						order = 11,
						disabled = function() return not IsAddOnLoaded("SexyCooldown2") end,
					}
				}
			}
		}
	}
	local order = 2
	for skinName,_ in pairsByKeys(Skins) do
		E.Options.args.skins.args.addonSkins.args[skinName] = self:GenerateOptionTable(skinName,order)
		order = order + 1
	end
end

E:RegisterModule(XS:GetName())
