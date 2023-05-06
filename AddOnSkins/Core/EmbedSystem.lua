local AS, L, S, R = unpack(AddOnSkins)

local ES = AS.EmbedSystem

local _G = _G
local format = format
local strmatch = strmatch
local strsub = strsub

local CreateFrame = CreateFrame
local FCF_IsValidChatFrame = FCF_IsValidChatFrame
local FCF_IsChatWindowIndexActive = FCF_IsChatWindowIndexActive
local FCF_GetChatWindowInfo = FCF_GetChatWindowInfo
local UIParent = UIParent

local NUM_CHAT_WINDOWS = NUM_CHAT_WINDOWS

ES.ChatFrameHider = CreateFrame('Frame')
ES.ChatFrameHider:Hide()

ES.Main = CreateFrame('Frame', 'EmbedSystem_MainWindow', UIParent)
ES.Left = CreateFrame('Frame', 'EmbedSystem_LeftWindow', ES.Main)
ES.Right = CreateFrame('Frame', 'EmbedSystem_RightWindow', ES.Main)

ES.Windows = { ES.Main, ES.Left, ES.Right }

if not FCF_IsChatWindowIndexActive then
	function FCF_IsChatWindowIndexActive(chatWindowIndex)
		local shown = select(7, FCF_GetChatWindowInfo(chatWindowIndex));
		if shown then
			return true;
		end

		local chatFrame = _G["ChatFrame"..chatWindowIndex];
		return (chatFrame and chatFrame.isDocked);
	end
end

local ChatTabInfo = { NONE = 'NONE'}
function ES:GetChatWindowInfo()
	for i = 1, NUM_CHAT_WINDOWS do
		if i ~= 2 and FCF_IsChatWindowIndexActive(i) then
			ChatTabInfo["ChatFrame"..i] = _G["ChatFrame"..i.."Tab"]:GetText()
		else
			ChatTabInfo["ChatFrame"..i] = nil
		end
	end
	return ChatTabInfo
end

function ES:ToggleChatFrame(Hide)
	local ChatFrame = AS:CheckOption('HideChatFrame')
	local frame, tab = _G[ChatFrame], _G[ChatFrame..'Tab']
	if ChatFrame == 'NONE' or not FCF_IsValidChatFrame(frame) then return end

	if Hide then
		if frame:GetParent() ~= ES.ChatFrameHider and tab:GetParent() ~= ES.ChatFrameHider then
			frame.OriginalParent, tab.OriginalParent = frame:GetParent(), tab:GetParent()
		end

		frame:SetParent(ES.ChatFrameHider)
		tab:SetParent(ES.ChatFrameHider)
	else
		if frame.OriginalParent then
			frame:SetParent(frame.OriginalParent)
			tab:SetParent(tab.OriginalParent)

			frame.OriginalParent, tab.OriginalParent = nil, nil
		end
	end
end

function ES:Initialize()
	if (AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual')) and ES.Hooks and ES.Resize then
		if (AS:CheckOption('EmbedSystem') and AS:CheckOption('EmbedSystemDual')) then
			AS:SetOption('EmbedSystem', false)
			AS:SetOption('EmbedSystemDual', false)
		end

		ES:Hooks()
		ES:Resize()
		AS:Delay(1, function() ES:Check(true) end)

		ES.Main:HookScript('OnShow', ES.Show)
		ES.Main:HookScript('OnHide', ES.Hide)

		ES:RegisterEvent('PLAYER_REGEN_ENABLED')
		ES:RegisterEvent('PLAYER_REGEN_DISABLED')

		UIParent:HookScript('OnShow', function()
			if AS:CheckOption('EmbedIsHidden') or AS:CheckOption('EmbedOoC') then
				ES:Hide()
			else
				ES:Show()
			end
		end)
	end
end

function ES:Show()
	ES.Main:Show()
	if AS:CheckOption('EmbedSystemDual') then
		ES.Left:Show()
		ES.Right:Show()
	end
	ES:ToggleChatFrame(true)
end

function ES:Hide()
	ES.Main:Hide()
	if AS:CheckOption('EmbedSystemDual') then
		ES.Left:Hide()
		ES.Right:Hide()
	end
	ES:ToggleChatFrame(false)
end

function AS:CheckEmbed(AddOn)
	if AS:CheckAddOn(AddOn) and (AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual')) and (strmatch(AS:CheckOption('EmbedMain'), AddOn) or strmatch(AS:CheckOption('EmbedLeft'), AddOn) or strmatch(AS:CheckOption('EmbedRight'), AddOn)) then
		return true
	else
		return false
	end
end

function ES:Check(Message)
	if not (AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual')) then return end

	ES:Resize()
	ES.Main:SetShown(not (AS:CheckOption('EmbedIsHidden') or AS:CheckOption('EmbedOoC')))

	for _, Window in next, ES.Windows do
		Window:SetFrameStrata(strsub(AS:CheckOption('EmbedFrameStrata'), 3))
		Window:SetFrameLevel(AS:CheckOption('EmbedFrameLevel'))
	end

	if AS:CheckEmbed('Details') then ES:Details() end
	if AS:CheckEmbed('Omen') then ES:Omen() end
	if AS:CheckEmbed('Skada') then ES:Skada() end
	if AS:CheckEmbed('TinyDPS') then ES:TinyDPS() end
	if AS:CheckEmbed('Recount') then ES:Recount() end

	if Message and AS:CheckOption('EmbedSystemMessage') then
		if AS:CheckOption('EmbedMain') then AS:Print(format("Embed System: Main: '%s'", AS:CheckOption('EmbedMain'))) end
		if AS:CheckOption('EmbedSystemDual') then AS:Print(format("Embed System: Left: '%s' | Right: '%s'", AS:CheckOption('EmbedLeft'), AS:CheckOption('EmbedRight'))) end
	end
end

function ES:PLAYER_REGEN_DISABLED()
	if AS:CheckOption('EmbedOoC') then
		ES.Main:Show()
	end
end

function ES:PLAYER_REGEN_ENABLED()
	if AS:CheckOption('EmbedOoC') then
		AS:Delay(AS:CheckOption('EmbedOoCDelay'), function()
			ES.Main:Hide()
		end)
	end
end
