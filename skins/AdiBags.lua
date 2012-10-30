if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("AdiBags") then return end
local U = unpack(select(2,...))
local s = U.s
local c = U.c

local name = 'AdiBagsSkin'
local function SkinFrame(frame)
	local region = frame.HeaderRightRegion
	frame:StripTextures()
	frame:SetTemplate('Transparent')
	_G[frame:GetName()..'Bags']:StripTextures()
	_G[frame:GetName()..'Bags']:SetTemplate('Transparent')
	U.SkinCloseButton(frame.CloseButton)
	for i = 1, 3 do
		U.SkinButton(region.widgets[i].widget, true)
	end
end

local function AdiSkin(self,event)
	if event == 'PLAYER_ENTERING_WORLD' or event == 'BANKFRAME_OPENED' or event == "PLAYER_REGEN_DISABLED" or event == "PLAYER_REGEN_ENABLED" or event == "PLAYER_UPDATE_RESTING" or event == "UNIT_AURA" then
		print(event)
		if not AdiBagsContainer1 then ToggleBackpack() ToggleBackpack() end
		if AdiBagsContainer1 then
			SkinFrame(AdiBagsContainer1)
			U.SkinEditBox(AdiBagsContainer1SearchBox)
			AdiBagsContainer1SearchBox:Point("TOPRIGHT", AdiBagsSimpleLayeredRegion2, "TOPRIGHT", -75, -1)
		end
		U.UnregisterEvent("PLAYER_REGEN_DISABLED")
		U.UnregisterEvent("PLAYER_REGEN_ENABLED")
		U.UnregisterEvent("PLAYER_UPDATE_RESTING")
		U.UnregisterEvent("UNIT_AURA")
	elseif event == 'BANKFRAME_OPENED' then
		SkinFrame(AdiBagsContainer2)
		U.UnregisterEvent("BANKFRAME_OPENED")
	end
end

U.RegisterSkin(name,AdiSkin,"BANKFRAME_OPENED", "PLAYER_REGEN_DISABLED", "PLAYER_REGEN_ENABLED", "PLAYER_UPDATE_RESTING","UNIT_AURA")