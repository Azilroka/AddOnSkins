-- Camealion's Functions File
-- Added ccolor for class coloring. - Azilroka
-- Restructured Functions file. - Azilroka
-- Added Skinning features for ease of skinning and smaller size skins. - Azilroka

local addon = select(1,...)
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:NewModule('AddOnSkins','AceTimer-3.0','AceEvent-3.0')
local S = E:GetModule('Skins')
local LSM = LibStub("LibSharedMedia-3.0")
local EP = LibStub("LibElvUIPlugin-1.0")

E.AddOnSkins = AS

AS.LSM = LSM
AS.skins = {}
AS.embeds = {}
AS.events = {}
AS.register = {}
AS.addOnWatch = {}
AS.ccolor = E.myclass
AS.FrameLocks = {}
E.private.skins.addons = {}
AS.sle = IsAddOnLoaded("ElvUI_SLE")

AS.Version = GetAddOnMetadata(addon,"Version")

local function GenerateEventFunction(event)
	local eventHandler = function(self,event,...)
		for skin,funcs in pairs(self.skins) do
			if AS:CheckOption(skin) and self.events[event][skin] then
				-- pack event args
				local args = {}
				for i = 1,select('#',...) do
					local arg = select(i,...)
					if not arg then break end
					tinsert(args,arg)
				end
				for _,func in ipairs(funcs) do
					AS:Call_(skin,func,event,unpack(args))
				end
			end
		end
	end
	return eventHandler
end

function AS:Call_(skin,func,event,...)
	-- pack event args
	local args = {}
	for i = 1,select('#',...) do
		local arg = select(i,...)
		if not arg then break end
		tinsert(args,arg)
	end
	if not pcall(func,self,event,unpack(args)) then
		local message = "|cff1784d1ElvUI |rAddOnSkins: |cffff0000There was an error in the|r |cff0affff%s|r |cffff0000skin|r.  Please report this to the developers immediately."
		print(message:format(skin:gsub("Skin","")))
	end
end

function AS:Initialize()
	if self.initialized then return end -- In case this gets called twice as can sometimes happen with ElvUI

	EP:RegisterPlugin(addon, AS.GenerateOptions)

	if not E.private.skins.addons.enable then return end

	E.private.skins.addons['AlwaysTrue'] = true

	self.font = LSM:Fetch("font",E.db.general.font)
	self.pixelFont = IsAddOnLoaded("DSM") and LSM:Fetch("font","Tukui Pixel") or LSM:Fetch("font","ElvUI Pixel")
	self.datatext_font = LSM:Fetch("font",E.db.datatexts.font)

	self:RegisterEvent("PET_BATTLE_CLOSE", 'AddNonPetBattleFrames')
	self:RegisterEvent('PET_BATTLE_OPENING_START', "RemoveNonPetBattleFrames")
	self:RegisterEvent('PLAYER_REGEN_DISABLED', 'EmbedEnterCombat')
	self:RegisterEvent('PLAYER_ENTER_COMBAT','EmbedEnterCombat')
	self:RegisterEvent('PLAYER_REGEN_ENABLED','EmbedExitCombat')
	self:RegisterEvent('PLAYER_LEAVE_COMBAT','EmbedExitCombat')
	
	for skin,alldata in pairs(self.register) do
		for _,data in pairs(alldata) do
			local addon
			local sdata = self.Skins[skin]
			if sdata and sdata.addon then
				addon = sdata.addon
			else
				addon = skin:gsub("Skin","")
			end
			if skin == "AlwaysTrue" or IsAddOnLoaded(addon) then
				self:RegisterSkin_(skin,data.priority,data.func,data.events)
			end
		end
	end

	self:EmbedInit()

	for skin,funcs in pairs(AS.skins) do
		if AS:CheckOption(skin) then
			for _,func in ipairs(funcs) do
				AS:Call_(skin,func,"PLAYER_ENTERING_WORLD")
			end
		end
	end

	self.initialized = true
end

function AS:RegisterSkin_(skinName,priority,func,events)
	local events = events
	for c,_ in pairs(events) do
		if string.find(c,'%[') then
			local conflict = string.match(c,'%[([!%w_]+)%]')
			if IsAddOnLoaded(conflict) then return end
		end
	end
	if not self.skins[skinName] then self.skins[skinName] = {} end
	self.skins[skinName][priority] = func
	for event,_ in pairs(events) do
		if not string.find(event,'%[') then
			if not self.events[event] then
				self[event] = GenerateEventFunction(event)
				self:RegisterEvent(event); 
				self.events[event] = {} 
			end
			self.events[event][skinName] = true
		end
	end
end

function AS:UnregisterEvent(skinName,event)
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

function AS:RegisterForPetBattleHide(frame)
	if frame.IsVisible and frame:GetName() then
		AS.FrameLocks[frame:GetName()] = { shown = false }
	end
end

function AS:SkinFrame(frame, template, override)
	if not template then template = 'Transparent' end
	if not override then frame:StripTextures(true) end

	frame:SetTemplate(template)

	self:RegisterForPetBattleHide(frame)
end

function AS:SkinBackdropFrame(frame, template, override)
	if not template then template = "Transparent" end
	if not override then frame:StripTextures(true) end

	frame:CreateBackdrop(template)

	self:RegisterForPetBattleHide(frame)
end

function AS:SkinStatusBar(bar, ClassColor)
	bar:StripTextures(true)
	bar:SetStatusBarTexture(LSM:Fetch("statusbar",E.private.general.normTex))

	if ClassColor then
		AS:SkinBackdropFrame(bar, "ClassColor")
		local color = RAID_CLASS_COLORS[AS.ccolor]
		bar:SetStatusBarColor(color.r, color.g, color.b)
	else
		AS:SkinBackdropFrame(bar)
	end
	bar:SetStatusBarTexture(LSM:Fetch("statusbar",E.private.general.normTex))
end

function AS:SkinIconButton( iconButton, strip, style, shrinkIcon)
	if self.isSkinned then return end

	if strip then iconButton:StripTextures() end
	iconButton:CreateBackdrop("Default", true)
	if style then iconButton:StyleButton() end

	local icon = iconButton.icon
	if iconButton:GetName() and _G[iconButton:GetName().."IconTexture"] then
		icon = _G[iconButton:GetName().."IconTexture"]
	elseif iconButton:GetName() and _G[iconButton:GetName().."Icon"] then
		icon = _G[iconButton:GetName().."Icon"]
	end
	if icon then
		icon:SetDrawLayer("OVERLAY")
		icon:SetTexCoord(.08,.88,.08,.88)

		if shrinkIcon then
			iconButton.backdrop:SetAllPoints()
			icon:SetInside(iconButton)
		else
			iconButton.backdrop:SetOutside(icon)
		end
		icon:SetParent(iconButton.backdrop)
	end
	iconButton.isSkinned = true
end

function AS:SkinTooltip(tooltip)
	tooltip:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
end

function AS:Desaturate(f, point)
	for i=1, f:GetNumRegions() do
		local region = select(i, f:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetDesaturated(1)

			if region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Corner" then
				region:Kill()
			end
		end
	end

	if point then
		f:Point("TOPRIGHT", point, "TOPRIGHT", 2, 2)
	end
end

function AS:CheckOption(optionName,...)
	for i = 1,select('#',...) do
		local addon = select(i,...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end
	
	return E.private.skins.addons[optionName]
end

function AS:DisableOption(optionName)
	E.private.skins.addons[optionName] = false
end

function AS:EnableOption(optionName)
	E.private.skins.addons[optionName] = true
end

function AS:ToggleOption(optionName)
	E.private.skins.addons[optionName] = not E.private.skins.addons[optionName]
end

function AS:RegisterSkin(skinName,skinFunc,...)
	local events = {}
	local priority = 1
	for i = 1,select('#',...) do
		local event = select(i,...)
		if not event then break end
		if type(event) == 'number' then
			priority = event
		else
			events[event] = true
		end
	end
	local registerMe = { func = skinFunc, events = events, priority = priority }
	if not self.register[skinName] then self.register[skinName] = {} end
	self.register[skinName][skinFunc] = registerMe
end

function AS:AddNonPetBattleFrames()
	for frame,data in pairs(AS.FrameLocks) do
		if data.shown then
			_G[frame]:Show()
		end
	end
end

function AS:RemoveNonPetBattleFrames()
	for frame,data in pairs(AS.FrameLocks) do
		if(_G[frame]:IsVisible()) then
			data.shown = true
			_G[frame]:Hide()
		else
			data.shown = false
		end
	end
end

E:RegisterModule(AS:GetName())