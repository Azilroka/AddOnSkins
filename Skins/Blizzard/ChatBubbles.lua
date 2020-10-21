local AS = unpack(AddOnSkins)

local pairs, select = pairs, select
local wipe = wipe
local Ambiguate = Ambiguate
local C_ChatBubbles_GetAllChatBubbles = C_ChatBubbles.GetAllChatBubbles
local CreateFrame = CreateFrame
local GetPlayerInfoByGUID = GetPlayerInfoByGUID

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
			wipe(messageToGUID)
			wipe(messageToSender)
		else
			messageToGUID[msg] = guid
			messageToSender[msg] = Ambiguate(sender, "none")
		end
	end)

	local function ChatBubbleName(frame)
		local chatBubble = frame:GetChildren()
		if chatBubble and not chatBubble:IsForbidden() then
			local r, g, b = chatBubble.String:GetTextColor()
			frame:SetBackdropBorderColor(r, g, b, .8)

			local text = chatBubble.String:GetText()
			if chatBubble.name then
				chatBubble.name:SetText('')
				local guid, class = messageToGUID[text]
				if guid ~= nil and guid ~= "" then
					class = select(2, GetPlayerInfoByGUID(guid))
				end
				if messageToSender[text] then
					local color = AS:GetClassColor(class)
					chatBubble.name:SetFormattedText("|c%s%s|r", color.colorStr, messageToSender[text])
				end
			end
		end
	end

	local function SkinChatBubble(frame)
		local chatBubble = frame:GetChildren()
		if chatBubble and not chatBubble:IsForbidden() then
			chatBubble:ClearBackdrop()
			AS:SkinFrame(frame)
			chatBubble.Tail:SetTexture('')

			chatBubble.name = chatBubble:CreateFontString(nil, "BORDER")
			chatBubble.name:SetPoint("TOPLEFT", 5, 5)
			chatBubble.name:SetPoint("BOTTOMRIGHT", chatBubble, "TOPRIGHT", -5, -5)
			chatBubble.name:SetJustifyH("LEFT")
			chatBubble.name:SetFont(AS.Font, 14, 'OUTLINE')

			frame:HookScript("OnShow", ChatBubbleName)
			ChatBubbleName(frame)
			frame.isSkinned = true
		end
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
