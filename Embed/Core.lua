local AS = unpack(AddOnSkins)

local format, pairs = format, pairs
local strlower, strmatch, strsub = strlower, strmatch, strsub
local _G, CreateFrame, UIParent = _G, CreateFrame, UIParent

AS.ChatFrameHider = CreateFrame('Frame')
AS.ChatFrameHider:Hide()
local EmbedSystem_MainWindow, EmbedSystem_LeftWindow, EmbedSystem_RightWindow

function AS:GetChatWindowInfo()
	local ChatTabInfo = {['NONE'] = 'NONE'}
	for i = 1, FCF_GetNumActiveChatFrames() do
		ChatTabInfo["ChatFrame"..i] = _G["ChatFrame"..i.."Tab"]:GetText()
	end
	return ChatTabInfo
end

function AS:ToggleChatFrame(Hide)
	local ChatFrame = AS:CheckOption('HideChatFrame')
	if ChatFrame == 'NONE' then return end
	if Hide then
		if _G[ChatFrame]:GetParent() ~= AS.ChatFrameHider and _G[ChatFrame..'Tab']:GetParent() ~= AS.ChatFrameHider then
			_G[ChatFrame].OriginalParent = _G[ChatFrame]:GetParent()
			_G[ChatFrame..'Tab'].OriginalParent = _G[ChatFrame..'Tab']:GetParent()
		end

		_G[ChatFrame]:SetParent(AS.ChatFrameHider)
		_G[ChatFrame..'Tab']:SetParent(AS.ChatFrameHider)
	else
		if _G[ChatFrame].OriginalParent then
			_G[ChatFrame]:SetParent(_G[ChatFrame].OriginalParent)
			_G[ChatFrame..'Tab']:SetParent(_G[ChatFrame..'Tab'].OriginalParent)

			_G[ChatFrame].OriginalParent = nil
			_G[ChatFrame..'Tab'].OriginalParent = nil
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

			if AS:CheckOption('HideChatFrame') ~= 'NONE' and not FCF_IsValidChatFrame(_G[AS:CheckOption('HideChatFrame')]) then
				AS:SetOption('HideChatFrame', 'NONE')
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

			for _, Function in pairs({"FCF_Close", "FCF_OpenNewWindow", "FCF_SetWindowName"}) do
				hooksecurefunc(Function, function()
					if AS:CheckOption('HideChatFrame') ~= 'NONE' and not FCF_IsValidChatFrame(_G[AS:CheckOption('HideChatFrame')]) then
						AS:SetOption('HideChatFrame', 'NONE')
					end
					AS.Options.args.embed.args.HideChatFrame.values = AS:GetChatWindowInfo()
				end)
			end
		end
	end
end

function AS:Embed_Show()
	EmbedSystem_MainWindow:Show()
	if AS:CheckOption('EmbedSystemDual') then
		EmbedSystem_LeftWindow:Show()
		EmbedSystem_RightWindow:Show()
	end
	AS:ToggleChatFrame(true)
end

function AS:Embed_Hide()
	EmbedSystem_MainWindow:Hide()
	if AS:CheckOption('EmbedSystemDual') then
		EmbedSystem_LeftWindow:Hide()
		EmbedSystem_RightWindow:Hide()
	end
	AS:ToggleChatFrame(false)
end

function AS:CheckEmbed(AddOn)
	AddOn = strlower(AddOn)
	if AS:CheckAddOn(AddOn) and (AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual')) and (strmatch(strlower(AS:CheckOption('EmbedMain')), AddOn) or strmatch(strlower(AS:CheckOption('EmbedLeft')), AddOn) or strmatch(strlower(AS:CheckOption('EmbedRight')), AddOn)) then
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
	if AS:CheckOption('EmbedCoolLine', 'CoolLine') then AS:Embed_CoolLine() end

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
