local AS, ASL = unpack(AddOnSkins)
local tinsert, sort, pairs, format, gsub, strfind = tinsert, sort, pairs, format, gsub, strfind

local Defaults = {
-- Embeds
	['EmbedOoC'] = false,
	['EmbedOoCDelay'] = 10,
	['EmbedCoolLine'] = false,
	['EmbedSexyCooldown'] = false,
	['EmbedSystem'] = false,
	['EmbedSystemDual'] = false,
	['EmbedMain'] = 'Skada',
	['EmbedLeft'] = 'Skada',
	['EmbedRight'] = 'Skada',
	['EmbedRightChat'] = true,
	['EmbedLeftWidth'] = 200,
	['EmbedBelowTop'] = false,
	['TransparentEmbed'] = false,
-- Misc
	['RecountBackdrop'] = true,
	['SkadaBackdrop'] = true,
	['OmenBackdrop'] = true,
	['DetailsBackdrop'] = true,
	['MiscFixes'] = true,
	['DBMSkinHalf'] = false,
	['DBMFont'] = 'Tukui',
	['DBMFontSize'] = 12,
	['DBMFontFlag'] = 'OUTLINE',
	['WeakAuraAuraBar'] = false,
	['WeakAuraIconCooldown'] = false,
	['SkinTemplate'] = 'Transparent',
	['HideChatFrame'] = 'NONE',
	['SkinDebug'] = false,
}

AddOnSkinsOptions = CopyTable(Defaults)

local DEVELOPER_STRING = ""
local LINE_BREAK = "\n"

local DEVELOPERS = {
	"Affli",
	"Arstraea",
	"Azilroka",
	"Blazeflack",
	"Cadayron",
	"Camealion",
	"Catok",
	"CJO",
	"Darth Predator",
	"Dec",
	"Drii",
	"Edoc",
	"efaref",
	"Elv",
	"Jasje",
	"Kemat1an",
	"Kkthnx",
	"Konungr",
	"Lockslap",
	"luminnas",
	"lolarennt",
	"MaXiMUS",
	"Merith",
	"MrRuben5",
	"Outofammo",
	"Pat",
	"Pezzer13",
	"Rakkhin",
	"Repooc",
	"Roktaal",
	"Shestak",
	"Shadowcall",
	"Sinaris",
	"Sortokk",
	"Tercioo",
	"Tukz",
	"Warmexx",
}

sort(DEVELOPERS, function(a, b) return strlower(a) < strlower(b) end)
for _, devName in pairs(DEVELOPERS) do
	DEVELOPER_STRING = DEVELOPER_STRING..LINE_BREAK..devName
end

function AS:GetOptions()
	local function GenerateOptionTable(skinName, order)
		local text = strtrim(skinName:gsub("^Blizzard_(.+)","%1"):gsub("(%l)(%u%l)","%1 %2"))
		local options = {
			type = "toggle",
			name = text,
			order = order,
			desc = ASL.OptionsPanel.SkinDesc,
		}
		if AS:CheckAddOn('ElvUI') then
			options.confirm = true
			if strfind(skinName, "Blizzard_") then
				options.desc = ASL.OptionsPanel.ElvUIDesc
			end
			options.set = function(info, value) AS:SetOption(info[#info], value) AS:DisableElvUIOption(info[#info]) end
		end
		return options
	end

	local Options = {
		order = 100,
		type = "group",
		name = AS.Title,
		args = {
			addons = {
				order = 0,
				type = "group",
				name = ASL["AddOn Skins"],
				get = function(info) return AS:CheckOption(info[#info]) end,
				set = function(info, value) AS:SetOption(info[#info], value) end,
				guiInline = true,
				args = {},
			},
			blizzard = {
				order = 1,
				type = "group",
				name = ASL["Blizzard Skins"],
				get = function(info) return AS:CheckOption(info[#info]) end,
				set = function(info, value) AS:SetOption(info[#info], value) end,
				guiInline = true,
				args = {},
			},
			bossmods = {
				type = "group",
				name = ASL["BossMod Options"],
				order = 2,
				get = function(info) return AS:CheckOption(info[#info]) end,
				set = function(info, value) AS:SetOption(info[#info], value) end,
				guiInline = false,
				args = {
					DBMFont = {
						type = "select", dialogControl = "LSM30_Font",
						order = 1,
						name = ASL["DBM|VEM Font"],
						values = AceGUIWidgetLSMlists.font, 
					},
					DBMFontSize = {
						type = "range",
						order = 2,
						name = ASL["DBM|VEM Font Size"],
						min = 8, max = 18, step = 1, 
					},
					DBMFontFlag = {
						name = ASL["DBM|VEM Font Flag"],
						order = 3,
						type = "select",
						values = {
							["NONE"] = "None",
							["OUTLINE"] = "OUTLINE",
							["THICKOUTLINE"] = "THICKOUTLINE",
							["MONOCHROME"] = "MONOCHROME",
							["MONOCHROMEOUTLINE"] = "MONOCHROMEOUTLINE",
						},
					},
					DBMSkinHalf = {
						type = "toggle",
						name = ASL["DBM|VEM Half-bar Skin"],
						order = 4,
					},
					BigWigsHalfBar = {
						type = "toggle",
						name = ASL["BigWigs Half-Bar"],
						order = 4,
						disabled = function() return not AS:CheckOption("BigWigs", "BigWigs") end
					},
				},
			},
			embed = {
				order = 3,
				type = "group",
				name = ASL["Embed Settings"],
				get = function(info) return AS:CheckOption(info[#info]) end,
				set = function(info, value) AS:SetOption(info[#info], value) AS:Embed_Check() end,
				args = {
					desc = {
						type = "description",
						name = ASL["Settings to control Embedded AddOns:\n\nAvailable Embeds: alDamageMeter | Details | Omen | Skada | Recount | TinyDPS"],
						order = 1
					},
					EmbedSystem = {
						type = "toggle",
						name = ASL["Single Embed System"],
						order = 2,
						disabled = function() return AS:CheckOption("EmbedSystemDual") end,
					},
					EmbedMain = {
						type = "input",
						width = "full",
						name = ASL["Embed for Main Panel"],
						disabled = function() return not AS:CheckOption("EmbedSystem") end,
						order = 3,
					},
					EmbedSystemDual = {
						type = "toggle",
						name = ASL["Dual Embed System"],
						order = 4,
						disabled = function() return AS:CheckOption("EmbedSystem") end,
					},
					EmbedLeft = {
						type = "input",
						width = "full",
						name = ASL["Embed for Left Window"],
						disabled = function() return not AS:CheckOption("EmbedSystemDual") end,
						order = 5,
					},
					EmbedRight = {
						type = "input",
						width = "full",
						name = ASL["Embed for Right Window"],
						disabled = function() return not AS:CheckOption("EmbedSystemDual") end,
						order = 6,
					},
					EmbedLeftWidth = {
						type = "range",
						order = 7,
						name = ASL["Embed Left Window Width"],
						min = 100,
						max = 300,
						step = 1,
						disabled = function() return not AS:CheckOption("EmbedSystemDual") end,
						width = "full",
					},
					EmbedOoC = {
						type = "toggle",
						name = ASL["Out of Combat (Hide)"],
						order = 8,
					},
					EmbedOoCDelay = {
						name = ASL["Embed OoC Delay"],
						order = 9,
						type = "range",
						min = 1,
						max = 30,
						step = 1,
						disabled = function() return not ((AS:CheckOption("EmbedSystemDual") or AS:CheckOption("EmbedSystem")) and AS:CheckOption("EmbedOoC")) end,
					},
					HideChatFrame = {
						name = ASL["Hide Chat Frame"],
						order = 10,
						type = "select",
						values = AS:GetChatWindowInfo(),
						disabled = function() return not (AS:CheckOption("EmbedSystemDual") or AS:CheckOption("EmbedSystem")) end,
					},
					EmbedSexyCooldown = {
						type = "toggle",
						name = ASL["Attach SexyCD to action bar"],
						order = 11,
						disabled = function() return not AS:CheckOption("SexyCooldown", "SexyCooldown2") end,
					},
					EmbedCoolLine = {
						type = "toggle",
						name = ASL["Attach CoolLine to action bar"],
						order = 12,
						disabled = function() return not AS:CheckOption("CoolLine", "CoolLine") end,
					},
					EmbedRightChat = {
						type = "toggle",
						name = ASL["Embed into Right Chat Panel"],
						order = 13,
					},
					TransparentEmbed = {
						type = "toggle",
						name = ASL["Embed Transparancy"],
						order = 14,
					},
					EmbedBelowTop = {
						type = "toggle",
						name = ASL["Embed Below Top Tab"],
						order = 15,
					},
					DetailsBackdrop = { 
						type = "toggle", 
						name = ASL["Details Backdrop"], 
						order = 16, 
						disabled = function() return not (AS:CheckOption("Details", "Details") and AS:CheckEmbed("Details")) end 
					},
					RecountBackdrop = {
						type = "toggle",
						name = ASL["Recount Backdrop"],
						order = 16,
						disabled = function() return not (AS:CheckOption("Recount", "Recount") and AS:CheckEmbed("Recount")) end
					},
					SkadaBackdrop = {
						type = "toggle",
						name = ASL["Skada Backdrop"],
						order = 17,
						disabled = function() return not (AS:CheckOption("Skada", "Skada") and AS:CheckEmbed("Skada")) end
					},
					OmenBackdrop = {
						type = "toggle",
						name = ASL["Omen Backdrop"],
						order = 18,
						disabled = function() return not (AS:CheckOption("Omen", "Omen") and AS:CheckEmbed("Omen")) end
					},
				},
			},
			misc = {
				type = "group",
				name = MISCELLANEOUS,
				order = 4,
				get = function(info) return AS:CheckOption(info[#info]) end,
				set = function(info, value) AS:SetOption(info[#info], value) end,
				args = {
					SkinTemplate = {
						name = ASL["Skin Template"],
						order = 0,
						type = "select",
						values = {
							["Transparent"] = "Transparent",
							["Default"] = "Default",
						}
					},
					WeakAuraAuraBar = {
						type = "toggle",
						name = ASL["WeakAura AuraBar"],
						order = 1,
						disabled = function() return not AS:CheckOption("WeakAuras", "WeakAuras") end,
					},
					Parchment = {
						type = "toggle",
						name = ASL["Parchment"],
						order = 2,
					},
					SkinDebug = {
						type = "toggle",
						name = ASL["Enable Skin Debugging"],
						order = 3,
					},
				},
			},
			faq = {
				type = "group",
				name = ASL["FAQ's"],
				order = 5,
				args = {
					question1 = {
						type = "description",
						name = "|cffc41f3b[Q] "..ASL["DBM/VEM Half-Bar Skin Spacing looks wrong. How can I fix it?"],
						order = 1,
						fontSize = "medium",
					},
					answer1 = {
						type = "description",
						name = "|cffabd473[A] "..ASL["To use the DBM/VEM Half-Bar skin. You must change the DBM/VEM Options. Offset Y needs to be at least 15."],
						order = 2,
						fontSize = "medium",
					},
				},
			},
			credits = {
				type = "group",
				name = ASL["Credits"],
				order = -1,
				args = {
					desc = {
						order = 1,
						type = "description",
						name = format(ASL["Credits:"].."%s", DEVELOPER_STRING),
						fontSize = "medium",
					},
				},
			},
			about = {
				type = "group",
				name = ASL["About/Help"],
				order = -2,
				args = {
					desc = {
						order = 1,
						type = "description",
						fontSize = "medium",
						name = ASL["This is where you can find out more of AddOnSkins."],
					},
					tukuilink = {
						type = "input",
						width = "full",
						name = ASL["Download Link"],
						get = function(info) return "http://www.tukui.org/addons/index.php?act=view&id=128" end,
						order = 2,
					},
					changeloglink = {
						type = "input",
						width = "full",
						name = ASL["Changelog Link"],
						get = function(info) return "http://www.tukui.org/forums/topic.php?id=30607" end,
						order = 3,
					},
					gitlablink = {
						type = "input",
						width = "full",
						name = ASL["GitLab Link / Report Errors"],
						get = function(info) return "http://git.tukui.org/Azilroka/addonskins" end,
						order = 4,
					},
					skinlink = {
						type = "input",
						width = "full",
						name = ASL["Available Skins / Skin Requests"],
						get = function(info) return "http://www.tukui.org/forums/topic.php?id=28550" end,
						order = 5,
					},
					header = {
						order = 6,
						type = 'header',
						name = '',
					},
					desc = {
						order = 7,
						type = "description",
						fontSize = "medium",
						name = CONFIRM_RESET_SETTINGS,
					},
					resetsettings = {
						type = 'execute',
						order = 8,
						name = ASL['Reset Settings'],
						confirm = true,
						func = function() AddOnSkinsOptions = CopyTable(Defaults) end,
					},
				},
			},
		},
	}

	local order, blizzorder = 0, 0
	for skinName, _ in AS:OrderedPairs(AS.register) do
		if strfind(skinName, "Blizzard_") then
			Options.args.blizzard.args[skinName] = GenerateOptionTable(skinName, blizzorder)
			blizzorder = blizzorder + 1
		else
			Options.args.addons.args[skinName] = GenerateOptionTable(skinName, order)
			order = order + 1
		end
	end

	if IsAddOnLoaded("ElvUI") then
		Options.args.misc.args.WeakAuraIconCooldown = {
			type = "toggle",
			name = ASL["WeakAura Cooldowns"],
			order = 1,
			disabled = function() return not AS:CheckOption("WeakAuras", "WeakAuras") end,
		}
		Options.args.about.args.resetsettings.func = function() ElvUI[1].private.addonskins = CopyTable(Defaults) end
	end

	local EP = LibStub('LibElvUIPlugin-1.0', true)
	if EP then
		local Ace3OptionsPanel = IsAddOnLoaded("ElvUI") and ElvUI[1] or Enhanced_Config and Enhanced_Config[1]
		Ace3OptionsPanel.Options.args.addonskins = Options
	else
		local ACR, ACD = LibStub("AceConfigRegistry-3.0", true), LibStub("AceConfigDialog-3.0", true)
		if not (ACR or ACD) then return end
		ACR:RegisterOptionsTable("AddOnSkins", Options)
		ACD:AddToBlizOptions("AddOnSkins", "AddOnSkins", nil, "about")
		for k, v in AS:OrderedPairs(Options.args) do
			if k ~= 'about' then
				ACD:AddToBlizOptions("AddOnSkins", v.name, "AddOnSkins", k)
			end
		end
	end
end