local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ACP') then return end

function AS:ACP()
	local function cbResize(self, event, ...)
		for i = 1, 20, 1 do
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
	AS:SkinFrame(ACP_AddonList)
	AS:SkinFrame(ACP_AddonList_ScrollFrame)
	AS:SkinButton(ACP_AddonListSetButton)
	AS:SkinButton(ACP_AddonListDisableAll)
	AS:SkinButton(ACP_AddonListEnableAll)
	AS:SkinButton(ACP_AddonList_ReloadUI)
	AS:SkinButton(ACP_AddonListBottomClose)
	AS:SkinCloseButton(ACP_AddonListCloseButton)
	AS:SkinCheckBox(ACP_AddonList_NoRecurse)
	AS:SkinCheckBox(ACPAddonListForceLoad)
	AS:SkinScrollBar(ACP_AddonList_ScrollFrameScrollBar)
	AS:SkinDropDownBox(ACP_AddonListSortDropDown)

	for i = 1, 20 do
		AS:SkinButton(_G["ACP_AddonListEntry"..i.."LoadNow"])
		AS:SkinCheckBox(_G["ACP_AddonListEntry"..i.."Enabled"])
	end

	ACP_AddonList_ScrollFrame:SetWidth(590)
	ACP_AddonList_ScrollFrame:SetHeight(412)
	ACP_AddonList:SetHeight(502)
	ACP_AddonListEntry1:SetPoint("TOPLEFT", ACP_AddonList, "TOPLEFT", 47, -62)
	ACP_AddonList_ScrollFrame:SetPoint("TOPLEFT", ACP_AddonList, "TOPLEFT", 20, -53)
	ACP_AddonListCloseButton:SetPoint("TOPRIGHT", ACP_AddonList, "TOPRIGHT", -7, -7)
	ACP_AddonListSetButton:SetPoint("BOTTOMLEFT", ACP_AddonList, "BOTTOMLEFT", 20, 8)
	ACP_AddonListDisableAll:SetPoint("BOTTOMLEFT", ACP_AddonList, "BOTTOMLEFT", 90, 8)
	ACP_AddonListEnableAll:SetPoint("BOTTOMLEFT", ACP_AddonList, "BOTTOMLEFT", 175, 8)
	ACP_AddonList_ReloadUI:SetPoint("BOTTOMRIGHT", ACP_AddonList, "BOTTOMRIGHT", -160, 8)
	ACP_AddonListBottomClose:SetPoint("BOTTOMRIGHT", ACP_AddonList, "BOTTOMRIGHT", -50, 8)
	ACP_AddonList:SetScale(UIParent:GetScale())
end

AS:RegisterSkin('ACP', AS.ACP)
