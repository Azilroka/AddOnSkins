local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('GroupCalendar5') then return end

function AS:GroupCalendar5(event, addon)
    GroupCalendar5Window:HookScript('OnShow', function(self)
        AS:SkinFrame(self)
        AS:SkinCloseButton(self.CloseButton)
        for i = 1,9 do
            AS:SkinTab(_G['MC2UIElementsLibTab'..i])
        end
		MC2UIElementsLibTab1:ClearAllPoints()
		MC2UIElementsLibTab1:SetPoint('BOTTOMLEFT', GroupCalendar5Window, 'BOTTOMLEFT', 0, -30)
		AS:SkinFrame(GroupCalendar5Window.DaySidebar)
		AS:SkinCloseButton(GroupCalendar5Window.DaySidebar.CloseButton)
		AS:StripTextures(GroupCalendar5Window.DaySidebar.NewEventButton, true)
		AS:StripTextures(GroupCalendar5Window.DaySidebar.PasteEventButton, true)
		AS:SkinButton(GroupCalendar5Window.DaySidebar.NewEventButton)
		AS:SkinButton(GroupCalendar5Window.DaySidebar.PasteEventButton)
		AS:StripTextures(GroupCalendar5Window.DaySidebar.ScrollingList.ScrollbarTrench, true)
		GroupCalendar5Window.DaySidebar.NewEventButton:ClearAllPoints()
		GroupCalendar5Window.DaySidebar.NewEventButton:SetPoint('BOTTOMRIGHT', GroupCalendar5Window.DaySidebar, 'BOTTOMRIGHT', -13 , 7)
		AS:SkinScrollBar(MC2UIElementsLibScrollFrame5ScrollBar)

		AS:SkinFrame(GroupCalendar5Window.EventSidebar, nil, nil, true)
		AS:SkinCloseButton(GroupCalendar5Window.EventSidebar.CloseButton)
		AS:StripTextures(GroupCalendar5Window.EventSidebar.DeleteButton, true)
		AS:SkinButton(GroupCalendar5Window.EventSidebar.DeleteButton)
    end)
end

AS:RegisterSkin('GroupCalendar5', AS.GroupCalendar5)