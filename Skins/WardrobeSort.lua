local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WardrobeSort') then return end

function AS:WardrobeSort()
	-- AS:SkinDropDownBox(WardRobeSortDropDown)
	-- AS:SkinButton(WardRobeSortDropDownButton, true)
	-- AS:SkinDropDownBox(WardRobeSortDropDownButton)
	-- AS:SkinFrame(WardRobeSortDropDown)
	--Reposition Menu
	-- foglightmenu:ClearAllPoints()
	-- foglightmenu:Point('TOPLEFT', -19, 3)
end

AS:RegisterSkin('WardrobeSort', AS.WardrobeSort)
