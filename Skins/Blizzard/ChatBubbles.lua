local AS = unpack(AddOnSkins)

function AS:Blizzard_ChatBubbles()
	--local noscalemult = AS.Mult * UIParent:GetScale()
	local tslu = 0
	local numkids = 0
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
		for i = 1, frame:GetNumRegions() do
			local region = select(i, frame:GetRegions())
			if (region.GetTexture and region:GetTexture() and type(region:GetTexture() == "string") and strlower(region:GetTexture()) == [[interface\tooltips\chatbubble-background]]) then return true end;
		end
		return false
	end

	WorldFrame:HookScript("OnUpdate", function(self, elapsed)
		tslu = tslu + elapsed

		if tslu > .05 then
			tslu = 0

			local newnumkids = WorldFrame:GetNumChildren()
			if newnumkids ~= numkids then
				for i = numkids + 1, newnumkids do
					local frame = select(i, WorldFrame:GetChildren())

					if IsChatBubble(frame) then
						SkinChatBubble(frame)
					end
				end
				numkids = newnumkids
			end

			for i, frame in next, bubbles do
				local r, g, b = frame.text:GetTextColor()
				frame:SetBackdropBorderColor(r, g, b, .8)
			end
		end
	end)
end

AS:RegisterSkin('Blizzard_ChatBubbles', AS.Blizzard_ChatBubbles)