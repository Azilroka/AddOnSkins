ZoneTextFrame.Texture = ZoneTextFrame:CreateTexture(nil, 'ARTWORK')
ZoneTextFrame.Texture:SetPoint('CENTER')
local ZoneTextSkin = CreateFrame('Frame')
ZoneTextSkin:RegisterEvent("ZONE_CHANGED")
ZoneTextSkin:RegisterEvent("ZONE_CHANGED_INDOORS")
ZoneTextSkin:RegisterEvent("ZONE_CHANGED_NEW_AREA")
ZoneTextSkin:SetScript('OnEvent', function()
	--PVPArenaTextString
	--PVPInfoTextString
	--SubZoneTextString
	--ZoneTextString
	ZoneTextFrame.Texture:Hide()
	local pvpType, isSubZonePvP, factionName = GetZonePVPInfo()
	if pvpType == "arena" or pvpType == "friendly" or pvpType == "hostile" or pvpType == "contested" or pvpType == "combat" then
		local Point, Frame, Relative, X, Y = 'CENTER', ZoneTextFrame, 'CENTER', 0, 0
		if PVPInfoTextString:GetText() ~= nil then
			Point, Frame, Relative, X, Y = PVPInfoTextString:GetPoint()
		end
		if PVPArenaTextString:GetText() ~= nil then
			Point, Frame, Relative, X, Y = PVPInfoTextString:GetPoint()
		end
		local Texture = [[Interface\AddOns\Tukui_Skins\Media\Crests\]]..factionName
		if pvpType == "arena" or pvpType == "contested" or pvpType == "combat" then
			Texture = [[Interface\AddOns\Tukui_Skins\Media\Crests\Orc]]
		end
		ZoneTextFrame.Texture:SetPoint('CENTER', Frame, Relative, X, Y)
		ZoneTextFrame.Texture:Show()
		ZoneTextFrame.Texture:SetTexture(Texture)
	end
end)