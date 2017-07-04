local AS = unpack(AddOnSkins)

function AS:Blizzard_ChatBubbles()
	--local noscalemult = AS.Mult * UIParent:GetScale()
	local bubbles = {}

	local function SkinChatBubble(frame)
		for i = 1, frame:GetNumRegions() do
			local region = select(i, frame:GetRegions())
			if region:GetObjectType() == "Texture" then
				region:SetTexture(nil)
			elseif region:GetObjectType() == "FontString" then
				frame.text = region
			end
		end

		frame:SetBackdrop({
			bgFile = AS.Blank,
			edgeFile = AS.Blank,
			tile = false, tileSize = 0, edgeSize = AS.Mult,
			insets = {left = -AS.Mult, right = -AS.Mult, top = -AS.Mult, bottom = -AS.Mult}
		})
		frame:SetBackdropBorderColor(unpack(AS.BorderColor))
		frame:SetBackdropColor(.1, .1, .1, .8)

		frame.text:SetFont(AS.Font, 14)
		
		tinsert(bubbles, frame)
	end

	local function IsChatBubble(frame)
		if not frame:IsForbidden() then
			for i = 1, frame:GetNumRegions() do
				local region = select(i, frame:GetRegions()) 
				if region.GetTexture and region:GetTexture() and type(region:GetTexture() == "string") then
					if strfind(strlower(region:GetTexture()), "chatbubble%-background") then
						return true
					end;
				end
			end
		end
		return false
	end

	local LastUpdate = -2
	local Children = 0
	
	WorldFrame:HookScript("OnUpdate", function(self, elapsed)
		LastUpdate = LastUpdate + elapsed
		if (LastUpdate < .1) then return end
		LastUpdate = 0

		local Count = WorldFrame:GetNumChildren()
		if (Count ~= Children) then
			for i = Children + 1, Count do
				local frame = select(i, WorldFrame:GetChildren())

				if IsChatBubble(frame) then
					SkinChatBubble(frame)
				end
			end
			numChildren = count
		end

		for i, frame in next, bubbles do
			local r, g, b = frame.text:GetTextColor()
			frame:SetBackdropBorderColor(r, g, b, .8)
		end
	end)
end

AS:RegisterSkin('Blizzard_ChatBubbles', AS.Blizzard_ChatBubbles)