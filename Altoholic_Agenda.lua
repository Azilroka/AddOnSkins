local Altoholic = _G.Altoholic
local function LoadSkin()

AltoholicFrameCalendarScrollFrame:StripTextures()
AltoholicFrameCalendarScrollFrame:SetTemplate("Default")
cSkinScrollBar(AltoholicFrameCalendarScrollFrameScrollBar)
--Agenda
cSkinNextPrevButton(AltoholicFrameCalendar_NextMonth)
cSkinNextPrevButton(AltoholicFrameCalendar_PrevMonth)
AltoholicTabAgendaMenuItem1:StripTextures()
AltoholicTabAgendaMenuItem1:SetTemplate("Default")

for i = 1, 14 do
	_G["AltoholicFrameCalendarEntry"..i]:StripTextures()
	_G["AltoholicFrameCalendarEntry"..i]:SetTemplate("Default")
end

end
if (IsAddOnLoaded("Tukui") and IsAddOnLoaded("Altoholic")) then 
	s.SkinFuncs["Altoholic_Agenda"] = LoadSkin
end
if (IsAddOnLoaded("ElvUI") and IsAddOnLoaded("Altoholic")) then 
	c:GetModule('Skins')
	s:RegisterSkin('Altoholic_Agenda', LoadSkin)
end
