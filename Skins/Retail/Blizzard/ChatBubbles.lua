if AddOnSkins.Classic then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
local pairs, select, type, unpack = pairs, select, type, unpack
local strfind, strlower = strfind, strlower
local twipe = table.wipe
--WoW API / Variables
local Ambiguate = Ambiguate
local C_ChatBubbles_GetAllChatBubbles = C_ChatBubbles.GetAllChatBubbles
local CUSTOM_CLASS_COLORS, RAID_CLASS_COLORS = CUSTOM_CLASS_COLORS, RAID_CLASS_COLORS
local CreateFrame = CreateFrame
local GetPlayerInfoByGUID = GetPlayerInfoByGUID
-- GLOBALS:

function AS:Blizzard_ChatBubbles()
	local messageToGUID, messageToSender = {}, {}

	local EventFrame = CreateFrame('Frame')
	EventFrame:RegisterEvent("CHAT_MSG_SAY")
	EventFrame:RegisterEvent("CHAT_MSG_YELL")
	EventFrame:RegisterEvent("CHAT_MSG_MONSTER_SAY")
	EventFrame:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	EventFrame:SetScript("OnEvent", function(self, event, msg, sender, _, _, _, _, _, _, _, _, _, guid)
		if event == 'PLAYER_ENTERING_WORLD' then
			twipe(messageToGUID)
			twipe(messageToSender)
		else
			messageToGUID[msg] = guid
			messageToSender[msg] = Ambiguate(sender, "none")
		end
	end)

	local ChatBackdrop = {
			bgFile = AS.Blank,
			edgeFile = AS.Blank,
			tile = false, tileSize = 0, edgeSize = AS.Mult,
			insets = {left = -AS.Mult, right = -AS.Mult, top = -AS.Mult, bottom = -AS.Mult}
		}

	local function SkinChatBubble(frame)
		for i = 1, frame:GetNumRegions() do
			local region = select(i, frame:GetRegions())
			if region:GetObjectType() == "Texture" then
				region:SetTexture()
			elseif region:GetObjectType() == "FontString" then
				frame.text = region
			end
		end

		frame:SetBackdrop(ChatBackdrop)
		frame:SetBackdropBorderColor(unpack(AS.BorderColor))
		frame:SetBackdropColor(.1, .1, .1, .8)

		frame.name = frame:CreateFontString(nil, "BORDER")
		frame.name:SetPoint("TOPLEFT", 5, 5)
		frame.name:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", -5, -5)
		frame.name:SetJustifyH("LEFT")
		frame.name:SetFont(AS.Font, 14, 'OUTLINE')

		frame:HookScript("OnUpdate", function(self)
			local r, g, b = self.text:GetTextColor()
			frame:SetBackdropBorderColor(r, g, b, .8)

			local text = self.text:GetText()
			if self.name then
				self.name:SetText("")
				local color
				local guid = messageToGUID[text]
				if guid ~= nil and guid ~= "" then
					local _, class = GetPlayerInfoByGUID(guid)
					if class then
						color = (CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] and CUSTOM_CLASS_COLORS[class].colorStr) or (RAID_CLASS_COLORS[class] and RAID_CLASS_COLORS[class].colorStr)
					end
				end
				if messageToSender[text] then
					self.name:SetFormattedText("|c%s%s|r", color or "ffffffff", messageToSender[text])
				end
			end
		end)

		frame.isSkinned = true
	end

	local function IsChatBubble(frame)
		if not frame:IsForbidden() then
			for i = 1, frame:GetNumRegions() do
				local region = select(i, frame:GetRegions())
				if region.GetTexture and region:GetTexture() and type(region:GetTexture() == "string") then
					if strfind(strlower(region:GetTexture()), "chatbubble%-background") then
						return true
					end
				end
			end
		end
		return false
	end

	AS:ScheduleRepeatingTimer(function()
		for _, chatBubble in pairs(C_ChatBubbles_GetAllChatBubbles()) do
			if not chatBubble.isSkinned then
				SkinChatBubble(chatBubble)
			end
		end
	end, .1)
end

AS:RegisterSkin('Blizzard_ChatBubbles', AS.Blizzard_ChatBubbles)
