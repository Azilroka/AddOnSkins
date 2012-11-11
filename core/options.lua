local E, L, V, P, G,_ = unpack(ElvUI)
local XS = E:NewModule('ExtraSkins','AceTimer-3.0','AceEvent-3.0')

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
				name = 'AddOn Skins by Sortokk (based on work by Azilroka) - v'..self.Version,
				order = 1
			},
			misc = {
				type = 'group',
				name = 'Misc Options',
				order = 5,
				args = {
					DBMSkinHalf = {
						type = 'toggle',
						name = 'DBM Half-bar Skin',
						desc = L["TOGGLESKIN_DESC"],
						order = 1,
						disabled = function() return not IsAddOnLoaded("DBM-Core") or not E.db.skins['DBMSkin'] end
					},
					RecountBackdrop = {
						type = 'toggle',
						name = 'Recount Backdrop',
						desc = L['TOGGLESKIN_DESC'],
						order = 2,
						disabled = function() return not IsAddOnLoaded("Recount") or not E.db.skins["RecountSkin"] end,
					},
					SkadaBackdrop = {
						type = 'toggle',
						name = 'Skada Backdrop',
						desc = L['TOGGLESKIN_DESC'],
						order = 3,
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
	for skinName,_ in pairsByKeys(self.Skins) do
		E.Options.args.skins.args.addonSkins.args[skinName] = self:GenerateOptionTable(skinName,order)
		order = order + 1
	end
end
