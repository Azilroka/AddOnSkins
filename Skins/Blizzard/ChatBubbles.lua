local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local pairs, select = pairs, select
local twipe = table.wipe
--WoW API / Variables
local Ambiguate = Ambiguate
local C_ChatBubbles_GetAllChatBubbles = C_ChatBubbles.GetAllChatBubbles
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

	local function SkinChatBubble(frame)
		for i = 1, frame:GetNumRegions() do
			local region = select(i, frame:GetRegions())
			if region:GetObjectType() == "Texture" then
				region:SetTexture()
			elseif region:GetObjectType() == "FontString" then
				frame.text = region
			end
		end

		AS:SetTemplate(frame)

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
				local color = 'ffffffff'
				local guid = messageToGUID[text]
				if guid ~= nil and guid ~= "" then
					local _, class = GetPlayerInfoByGUID(guid)
					if class then
						local classcolor = AS:GetClassColor(class)
						if classcolor then color = classcolor.colorStr end
					end
				end
				if messageToSender[text] then
					self.name:SetFormattedText("|c%s%s|r", color, messageToSender[text])
				end
			end
		end)

		frame.isSkinned = true
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
