local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('GroupCalendar5') then return end

local name = 'GroupCalendar5Skin'
function AS:SkinGroupCalendar5(event, addon)
    GroupCalendar5Window:HookScript('OnShow', function(self)
        AS:SkinFrame(self)
        AS:SkinCloseButton(self.CloseButton)
        for i = 1,9 do
            AS:SkinTab(_G['MC2UIElementsLibTab'..i])
        end
		MC2UIElementsLibTab1:ClearAllPoints()
		MC2UIElementsLibTab1:Point('BOTTOMLEFT', GroupCalendar5Window, 'BOTTOMLEFT', 0, -30)
		AS:SkinFrame(GroupCalendar5Window.DaySidebar)
		AS:SkinCloseButton(GroupCalendar5Window.DaySidebar.CloseButton)
		GroupCalendar5Window.DaySidebar.NewEventButton:StripTextures(true)
		GroupCalendar5Window.DaySidebar.PasteEventButton:StripTextures(true)
		AS:SkinButton(GroupCalendar5Window.DaySidebar.NewEventButton)
		AS:SkinButton(GroupCalendar5Window.DaySidebar.PasteEventButton)
		GroupCalendar5Window.DaySidebar.ScrollingList.ScrollbarTrench:StripTextures(true)
		GroupCalendar5Window.DaySidebar.NewEventButton:ClearAllPoints()
		GroupCalendar5Window.DaySidebar.NewEventButton:Point('BOTTOMRIGHT', GroupCalendar5Window.DaySidebar, 'BOTTOMRIGHT', -13 , 7)
		AS:SkinScrollBar(MC2UIElementsLibScrollFrame5ScrollBar)

		AS:SkinFrame(GroupCalendar5Window.EventSidebar, nil, nil, true)
		AS:SkinCloseButton(GroupCalendar5Window.EventSidebar.CloseButton)
		GroupCalendar5Window.EventSidebar.DeleteButton:StripTextures(true)
		AS:SkinButton(GroupCalendar5Window.EventSidebar.DeleteButton)
    end)
end

AS:RegisterSkin(name, AS.SkinGroupCalendar5)