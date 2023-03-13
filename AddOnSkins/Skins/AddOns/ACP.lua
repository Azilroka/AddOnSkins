local AS, L, S, R = unpack(AddOnSkins)

function R:ACP()
	local function cbResize(self, event, ...)
		for i = 1, 20 do
			local checkbox = _G["ACP_AddonListEntry" .. i .. "Enabled"]
			local collapse = _G["ACP_AddonListEntry" .. i .. "Collapse"]
			checkbox:SetPoint("LEFT", 5, 0)
			checkbox:SetSize(26, 26)

			if not collapse:IsShown() then
				checkbox:SetPoint("LEFT", 15, 0)
				checkbox:SetSize(20, 20)
			end
		end
	end

	hooksecurefunc(ACP, 'AddonList_OnShow_Fast', cbResize)
	S:HandleFrame(ACP_AddonList, true, nil, 10, nil, -30)
	S:HandleFrame(ACP_AddonList_ScrollFrame)

	S:HandleButton(ACP_AddonListSetButton)
	S:HandleButton(ACP_AddonListDisableAll)
	S:HandleButton(ACP_AddonListEnableAll)
	S:HandleButton(ACP_AddonList_ReloadUI)
	S:HandleButton(ACP_AddonListBottomClose)
	S:HandleCheckBox(ACP_AddonList_NoRecurse)
	S:HandleCheckBox(ACPAddonListForceLoad)
	S:HandleScrollBar(ACP_AddonList_ScrollFrameScrollBar)
	S:HandleDropDownBox(ACP_AddonListSortDropDown)

	for i = 1, 20 do
		S:HandleButton(_G["ACP_AddonListEntry"..i.."LoadNow"])
		S:HandleCheckBox(_G["ACP_AddonListEntry"..i.."Enabled"])
	end

	ACP_AddonListBottomClose:SetPoint("BOTTOMRIGHT", ACP_AddonList, "BOTTOMRIGHT", -74, 20)
end

AS:RegisterSkin('ACP')
