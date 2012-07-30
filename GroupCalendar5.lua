if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) then end
if not IsAddOnLoaded("GroupCalendar5") then return end
local SkinGC5 = CreateFrame("Frame")
	SkinGC5:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinGC5:SetScript( "OnEvent", function(self)
--	if (UISkinOptions.GC5Skin == "Disabled") then return end
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c
	GroupCalendar5Window:HookScript("OnShow", function(self)
		self:StripTextures()
		self:SetTemplate("Transparent")
		cSkinCloseButton(self.CloseButton)
		for i = 1,9 do
			cSkinTab(_G["MC2UIElementsLibTab"..i])
		end
	MC2UIElementsLibTab1:ClearAllPoints()
	MC2UIElementsLibTab1:Point("BOTTOMLEFT", GroupCalendar5Window, "BOTTOMLEFT", 0, -30)
	GroupCalendar5Window.DaySidebar:StripTextures(true)
	GroupCalendar5Window.DaySidebar:SetTemplate("Transparent")
	cSkinCloseButton(GroupCalendar5Window.DaySidebar.CloseButton)
	GroupCalendar5Window.DaySidebar.NewEventButton:StripTextures(true)
	GroupCalendar5Window.DaySidebar.PasteEventButton:StripTextures(true)
	cSkinButton(GroupCalendar5Window.DaySidebar.NewEventButton)
	cSkinButton(GroupCalendar5Window.DaySidebar.PasteEventButton)
	GroupCalendar5Window.DaySidebar.ScrollingList.ScrollbarTrench:StripTextures(true)
	GroupCalendar5Window.DaySidebar.NewEventButton:ClearAllPoints()
	GroupCalendar5Window.DaySidebar.NewEventButton:Point("BOTTOMRIGHT", GroupCalendar5Window.DaySidebar, "BOTTOMRIGHT", -13 , 7)
	cSkinScrollBar(MC2UIElementsLibScrollFrame5ScrollBar)

	GroupCalendar5Window.EventSidebar:StripTextures(true)
	GroupCalendar5Window.EventSidebar:SetTemplate("Transparent")
	cSkinCloseButton(GroupCalendar5Window.EventSidebar.CloseButton)
	GroupCalendar5Window.EventSidebar.DeleteButton:StripTextures(true)
	cSkinButton(GroupCalendar5Window.EventSidebar.DeleteButton)

	end)

end)