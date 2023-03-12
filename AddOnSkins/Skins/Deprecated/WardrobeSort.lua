local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('WardrobeSort') then return end

function AS:WardrobeSort()
	-- S:HandleDropDownBox(WardRobeSortDropDown)
	-- S:HandleButton(WardRobeSortDropDownButton, true)
	-- S:HandleDropDownBox(WardRobeSortDropDownButton)
	-- S:HandleFrame(WardRobeSortDropDown)
	--Reposition Menu
	-- foglightmenu:ClearAllPoints()
	-- foglightmenu:SetPoint('TOPLEFT', -19, 3)
end

AS:RegisterSkin('WardrobeSort', AS.WardrobeSort)
