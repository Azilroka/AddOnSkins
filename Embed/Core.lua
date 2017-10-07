local AS = unpack(AddOnSkins)

local format, gsub, pairs, ipairs, select, tinsert, tonumber = format, gsub, pairs, ipairs, select, tinsert, tonumber
local strlower, strmatch, strsub, floor, wipe, type = strlower, strmatch, strsub, floor, wipe, type
local _G, CreateFrame, UIParent = _G, CreateFrame, UIParent

AS.ChatFrameHider = CreateFrame('Frame')
AS.ChatFrameHider:Hide()
local EmbedSystem_MainWindow, EmbedSystem_LeftWindow, EmbedSystem_RightWindow

function AS:GetChatWindowInfo()
	local ChatTabInfo = {['NONE'] = 'NONE'}
	for i = 1, NUM_CHAT_WINDOWS do
		ChatTabInfo["ChatFrame"..i] = _G["ChatFrame"..i.."Tab"]:GetText()
	end
	return ChatTabInfo
end

function AS:ToggleChatFrame(Hide)
	if AS:CheckOption('HideChatFrame') == 'NONE' then return end
	if Hide then
		_G[AS:CheckOption('HideChatFrame')].OriginalParent = _G[AS:CheckOption('HideChatFrame')]:GetParent()
		_G[AS:CheckOption('HideChatFrame')]:SetParent(AS.ChatFrameHider)

		_G[AS:CheckOption('HideChatFrame')..'Tab'].OriginalParent = _G[AS:CheckOption('HideChatFrame')..'Tab']:GetParent()
		_G[AS:CheckOption('HideChatFrame')..'Tab']:SetParent(AS.ChatFrameHider)
	else
		if _G[AS:CheckOption('HideChatFrame')].OriginalParent then
			_G[AS:CheckOption('HideChatFrame')]:SetParent(_G[AS:CheckOption('HideChatFrame')].OriginalParent)
			_G[AS:CheckOption('HideChatFrame')..'Tab']:SetParent(_G[AS:CheckOption('HideChatFrame')..'Tab'].OriginalParent)
		end
	end
end

function AS:EmbedInit()
	if AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual') then
		if not AS.EmbedSystemCreated then
			EmbedSystem_MainWindow = CreateFrame('Frame', 'EmbedSystem_MainWindow', UIParent)
			EmbedSystem_LeftWindow = CreateFrame('Frame', 'EmbedSystem_LeftWindow', EmbedSystem_MainWindow)
			EmbedSystem_RightWindow = CreateFrame('Frame', 'EmbedSystem_RightWindow', EmbedSystem_MainWindow)

			AS.EmbedSystemCreated = true

			if (AS:CheckOption('EmbedSystem') and AS:CheckOption('EmbedSystemDual')) then
				AS:SetOption('EmbedSystem', false)
				AS:SetOption('EmbedSystemDual', false)
			end

			AS:EmbedSystemHooks()
			AS:EmbedSystem_WindowResize()
			AS:Delay(1, function() AS:Embed_Check(true) end)

			EmbedSystem_MainWindow:HookScript('OnShow', AS.Embed_Show)
			EmbedSystem_MainWindow:HookScript('OnHide', AS.Embed_Hide)
			AS:RegisterEvent('PLAYER_REGEN_DISABLED', 'EmbedEnterCombat')
			AS:RegisterEvent('PLAYER_REGEN_ENABLED', 'EmbedExitCombat')

			UIParent:HookScript('OnShow', function()
				if AS:CheckOption('EmbedIsHidden') or AS:CheckOption('EmbedOoC') then
					AS:Embed_Hide()
				else
					AS:Embed_Show()
				end
			end)

			UIParent:GetScript('OnShow')(UIParent)
		end
	end
end

function AS:Embed_Show()
	EmbedSystem_MainWindow:Show()
	if AS:CheckOption('EmbedSystem') then
		if _G[EmbedSystem_MainWindow.FrameName] then _G[EmbedSystem_MainWindow.FrameName]:Show() end
	end
	if AS:CheckOption('EmbedSystemDual') then
		EmbedSystem_LeftWindow:Show()
		EmbedSystem_RightWindow:Show()
		if _G[EmbedSystem_LeftWindow.FrameName] then _G[EmbedSystem_LeftWindow.FrameName]:Show() end
		if _G[EmbedSystem_RightWindow.FrameName] then _G[EmbedSystem_RightWindow.FrameName]:Show() end
	end
	AS:ToggleChatFrame(true)
end

function AS:Embed_Hide()
	EmbedSystem_MainWindow:Hide()
	if AS:CheckOption('EmbedSystem') then
		if _G[EmbedSystem_MainWindow.FrameName] then _G[EmbedSystem_MainWindow.FrameName]:Hide() end
	end
	if AS:CheckOption('EmbedSystemDual') then
		EmbedSystem_LeftWindow:Hide()
		EmbedSystem_RightWindow:Hide()
		if _G[EmbedSystem_LeftWindow.FrameName] then _G[EmbedSystem_LeftWindow.FrameName]:Hide() end
		if _G[EmbedSystem_RightWindow.FrameName] then _G[EmbedSystem_RightWindow.FrameName]:Hide() end
	end
	AS:ToggleChatFrame(false)
end

function AS:CheckEmbed(AddOn)
	local MainEmbed, LeftEmbed, RightEmbed, Embed = strlower(AS:CheckOption('EmbedMain')), strlower(AS:CheckOption('EmbedLeft')), strlower(AS:CheckOption('EmbedRight')), strlower(AddOn)
	if AS:CheckAddOn(AddOn) and ((AS:CheckOption('EmbedSystem') and strmatch(MainEmbed, Embed)) or AS:CheckOption('EmbedSystemDual') and (strmatch(LeftEmbed, Embed) or strmatch(RightEmbed, Embed))) then
		return true
	else
		return false
	end
end

function AS:Embed_Check(Message)
	if not (AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual')) then return end
	if not AS.EmbedSystemCreated then
		AS:EmbedInit()
		Message = true
	end
	AS:Embed_Toggle(Message)
	AS:EmbedSystem_WindowResize()

	for _, Window in pairs({EmbedSystem_MainWindow, EmbedSystem_LeftWindow, EmbedSystem_RightWindow}) do
		Window:SetFrameStrata(strsub(AS:CheckOption('EmbedFrameStrata'), 3))
		Window:SetFrameLevel(AS:CheckOption('EmbedFrameLevel'))
	end

	if AS:CheckEmbed('Details') then AS:Embed_Details() end
	if AS:CheckEmbed('Omen') then AS:Embed_Omen() end
	if AS:CheckEmbed('Skada') then AS:Embed_Skada() end
	if AS:CheckEmbed('TinyDPS') then AS:Embed_TinyDPS() end
	if AS:CheckEmbed('Recount') then AS:Embed_Recount() end
	if AS:CheckEmbed('alDamageMeter') then AS:Embed_alDamageMeter() end
	if AS:CheckOption('EmbedCoolLine', 'CoolLine') then AS:Embed_CoolLine() end
end

function AS:Embed_Toggle(Message)
	local MainEmbed, LeftEmbed, RightEmbed = 'NONE', 'NONE', 'NONE'
	EmbedSystem_MainWindow.FrameName = nil
	EmbedSystem_LeftWindow.FrameName = nil
	EmbedSystem_RightWindow.FrameName = nil
	if AS:CheckOption('EmbedSystem') then
		local MainEmbed = strlower(AS:CheckOption('EmbedMain'))
		if MainEmbed ~= 'details' and MainEmbed ~= 'skada' and MainEmbed ~= 'omen' and MainEmbed ~= 'recount' and MainEmbed ~= 'tinydps' and MainEmbed ~= 'aldamagemeter' then
			EmbedSystem_MainWindow.FrameName = AS:CheckOption('EmbedMain')
		end
	end
	if AS:CheckOption('EmbedSystemDual') then
		local LeftEmbed, RightEmbed = strlower(AS:CheckOption('EmbedLeft')), strlower(AS:CheckOption('EmbedRight'))
		if LeftEmbed ~= 'details' and LeftEmbed ~= 'skada' and LeftEmbed ~= 'omen' and LeftEmbed ~= 'recount' and LeftEmbed ~= 'tinydps' and LeftEmbed ~= 'aldamagemeter' then
			EmbedSystem_LeftWindow.FrameName = AS:CheckOption('EmbedLeft')
		end
		if RightEmbed ~= 'details' and RightEmbed ~= 'skada' and RightEmbed ~= 'omen' and RightEmbed ~= 'recount' and RightEmbed ~= 'tinydps' and RightEmbed ~= 'aldamagemeter' then
			EmbedSystem_RightWindow.FrameName = AS:CheckOption('EmbedRight')
		end
	end
	if EmbedSystem_MainWindow.FrameName ~= nil then
		local Frame = _G[EmbedSystem_MainWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_MainWindow)
			Frame:SetInside(EmbedSystem_MainWindow, 0, 0)
		end
	end
	if EmbedSystem_LeftWindow.FrameName ~= nil then
		local Frame = _G[EmbedSystem_LeftWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_LeftWindow)
			Frame:SetInside(EmbedSystem_LeftWindow, 0, 0)
		end
	end
	if EmbedSystem_RightWindow.FrameName ~= nil then
		local Frame = _G[EmbedSystem_RightWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_RightWindow)
			Frame:SetInside(EmbedSystem_RightWindow, 0, 0)
		end
	end
	if Message and AS:CheckOption('EmbedSystemMessage') then
		Message = format("Main: '%s'", AS:CheckOption('EmbedMain'))
		if AS:CheckOption('EmbedSystemDual') then Message = format("Left: '%s' | Right: '%s'", AS:CheckOption('EmbedLeft'), AS:CheckOption('EmbedRight')) end
		AS:Print(format('Embed System: - %s', Message))
	end
end

local EmbedOoCCombatStart
function AS:EmbedEnterCombat()
	EmbedOoCCombatStart = true
	if AS:CheckOption('EmbedOoC') then
		EmbedSystem_MainWindow:Show()
	end
end

function AS:EmbedExitCombat()
	EmbedOoCCombatStart = false
	if AS:CheckOption('EmbedOoC') then
		AS:Delay(AS:CheckOption('EmbedOoCDelay'), function()
			if not EmbedOoCCombatStart then
				EmbedSystem_MainWindow:Hide()
			end
		end)
	end
end