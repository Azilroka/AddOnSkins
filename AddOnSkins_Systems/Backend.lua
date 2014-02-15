local AS = unpack(AddOnSkins)

local format, gsub, strmatch, strfind = format, gsub, strmatch, strfind
local tinsert, pairs, ipairs, unpack, select, pcall = tinsert, pairs, ipairs, unpack, select, pcall
local GetAddOnInfo = GetAddOnInfo

AS.skins = {}
AS.events = {}
AS.register = {}
AS.TicketTracker = 'http://git.tukui.org/Azilroka/addonskins'

function AS:CheckAddOn(addon)
	return select(4, GetAddOnInfo(addon))
end

function AS:Init()
	if self.frame then return end

	self.frame = CreateFrame('Frame')
	self.frame:RegisterEvent('PET_BATTLE_CLOSE')
	self.frame:RegisterEvent('PET_BATTLE_OPENING_START')
	self.frame:RegisterEvent('PLAYER_ENTERING_WORLD')
	self.frame:RegisterEvent('PLAYER_LOGIN')
	self.frame:SetScript('OnEvent', function(self, event, ...)
		if event == 'PLAYER_LOGIN' then
			if AS:CheckOption('RecountBackdrop') == nil then AS:EnableOption('RecountBackdrop') end
			if AS:CheckOption('SkadaBackdrop') == nil then AS:EnableOption('SkadaBackdrop') end
			if AS:CheckOption('OmenBackdrop') == nil then AS:EnableOption('OmenBackdrop') end
			if AS:CheckOption('DBMSkinHalf') == nil then AS:DisableOption('DBMSkinHalf') end
			if AS:CheckOption('EmbedOoC') == nil then AS:DisableOption('EmbedOoC') end
			if AS:CheckOption('EmbedOmen') == nil then AS:DisableOption('EmbedOmen') end
			if AS:CheckOption('EmbedTinyDPS') == nil then AS:DisableOption('EmbedTinyDPS') end
			if AS:CheckOption('EmbedSkada') == nil then AS:DisableOption('EmbedSkada') end
			if AS:CheckOption('EmbedRecount') == nil then AS:DisableOption('EmbedRecount') end
			if AS:CheckOption('EmbedCoolLine') == nil then AS:DisableOption('EmbedCoolLine') end
			if AS:CheckOption('EmbedMain') == nil then AS:SetOption('EmbedMain', 'Recount') end
			if AS:CheckOption('EmbedLeft') == nil then AS:SetOption('EmbedLeft', 'Skada') end
			if AS:CheckOption('EmbedRight') == nil then AS:SetOption('EmbedRight', 'Skada') end
			if AS:CheckOption('TransparentEmbed') == nil then AS:DisableOption('TransparentEmbed') end
			if AS:CheckOption('EmbedSystem') == nil then AS:DisableOption('EmbedSystem') end
			if AS:CheckOption('EmbedSystemDual') == nil then AS:DisableOption('EmbedSystemDual') end
			if AS:CheckOption('EmbedLeftWidth') == nil then AS:SetOption('EmbedLeftWidth', 200) end
			if AS:CheckOption('DBMFont') == nil then AS:SetOption('DBMFont', 'Tukui') end
			if AS:CheckOption('DBMFontSize') == nil then AS:SetOption('DBMFontSize', 12) end
			if AS:CheckOption('DBMFontFlag') == nil then AS:SetOption('DBMFontFlag', 'OUTLINE') end
			AS:EnableOption('MiscFixes')
			for skin, alldata in AS:OrderedPairs(AS.register) do
				for _, data in pairs(alldata) do
					local addon = gsub(skin, 'Skin', '')
					if AS:CheckOption(skin) == nil then AS:EnableOption(skin) end
					AS:RegisteredSkin(skin, data.priority, data.func, data.events)
				end
			end
		end
		if event == 'PLAYER_ENTERING_WORLD' then
			for skin, funcs in AS:OrderedPairs(AS.skins) do
				if AS:CheckOption(skin) then
					for _, func in ipairs(funcs) do
						AS:CallSkin(skin, func, event)
					end
				end
			end
			AS:Embed_Init()
			AS:Ace3Options()
			AS:Print(format("by |cFFFF7D0AAzilroka|r - Version: |cFF1784D1%s|r Loaded!", AS.Version))
			self:UnregisterEvent(event)
		end
		if event == 'PET_BATTLE_CLOSE' then AS:AddNonPetBattleFrames() end
		if event == 'PET_BATTLE_OPENING_START' then AS:RemoveNonPetBattleFrames() end
		for skin, funcs in AS:OrderedPairs(AS.skins) do
			if AS:CheckOption(skin) and AS.events[event] and AS.events[event][skin] then
				for _, func in ipairs(funcs) do
					local args = {}
					for i = 1, select('#',...) do
						local arg = select(i, ...)
						if not arg then break end
						tinsert(args, arg)
					end
					AS:CallSkin(skin, func, event, unpack(args))
				end
			end
		end
	end)
end

function AS:CallSkin(skin, func, event, ...)
	local pass, error = pcall(func, self, event, ...)
	if not pass then
		local message = '%s %s: |cfFFF0000There was an error in the|r |cff0AFFFF%s|r |cffFF0000skin|r.  Please report this to Azilroka immediately @ %s'
		local errormessage = '%s Error: %s'
		local Skin = gsub(skin, 'Skin', '')
		print(format(message, AS.Title, AS.Version, Skin, AS:PrintURL(AS.TicketTracker)))
		print(format(errormessage, Skin, error))
	end
end

function AS:RegisteredSkin(skinName, priority, func, events)
    local events = events
	for c,_ in pairs(events) do
		if strfind(c,'%[') then
			local conflict = strmatch(c,'%[([!%w_]+)%]')
			if IsAddOnLoaded(conflict) then return end
		end
	end
	if not self.skins[skinName] then self.skins[skinName] = {} end
	self.skins[skinName][priority] = func
	for event, _ in pairs(events) do
		if not strfind(event,'%[') then
			if not self.events[event] then
				self.frame:RegisterEvent(event)
				self.events[event] = {}
			end
			self.events[event][skinName] = true
		end
    end
end

function AS:UnregisterEvent(skinName, event)
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
		self.frame:UnregisterEvent(event)
	end
end

AS:Init()