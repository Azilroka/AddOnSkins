local s = UIPackageSkinFuncs.s
local c = UIPackageSkinFuncs.c
local Altoholic = _G.Altoholic
local function LoadSkin()

AltoholicFrameCalendarScrollFrame:StripTextures()
AltoholicFrameCalendarScrollFrame:CreateBackdrop("Transparent")
cSkinScrollBar(AltoholicFrameCalendarScrollFrameScrollBar)
--Agenda
cSkinNextPrevButton(AltoholicFrameCalendar_NextMonth)
cSkinNextPrevButton(AltoholicFrameCalendar_PrevMonth)
AltoholicTabAgendaMenuItem1:StripTextures()
AltoholicTabAgendaMenuItem1:SetTemplate("Transparent")

for i = 1, 14 do
	_G["AltoholicFrameCalendarEntry"..i]:StripTextures()
	_G["AltoholicFrameCalendarEntry"..i]:SetTemplate("Transparent")
end

end
if (IsAddOnLoaded("Tukui") and IsAddOnLoaded("Altoholic")) then 
	local SkinAltoholic = CreateFrame("Frame")
	SkinAltoholic:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinAltoholic:SetScript( "OnEvent", function(self)
	if (UISkinOptions.AltoholicSkin == "Disabled") then return end
	s.SkinFuncs["Altoholic_Agenda"] = LoadSkin
	end)
end
if (IsAddOnLoaded("ElvUI") and IsAddOnLoaded("Altoholic")) then 
if IsAddOnLoaded("ElvUI_SLE") then return end --Repooc and Darth Predator has a modified skin to fit the UI
	c:GetModule('Skins')
	s:RegisterSkin('Altoholic_Agenda', LoadSkin)
end
