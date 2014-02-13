local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ACP') then return end

local name = "ACPSkin"
function AS:SkinACP()
	local function cbResize(self, event, ...)
		for i = 1, 20, 1 do
			local checkbox = _G["ACP_AddonListEntry" .. i .. "Enabled"]
			local collapse = _G["ACP_AddonListEntry" .. i .. "Collapse"]
			checkbox:SetPoint("LEFT", 5, 0)
			checkbox:Size(26)
	
			if not collapse:IsShown() then
				checkbox:SetPoint("LEFT", 15, 0)
				checkbox:Size(20)
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
	AS:SkinScrollBar(ACP_AddonList_ScrollFrameScrollBar)
	AS:SkinDropDownBox(ACP_AddonListSortDropDown, 130)

	for i = 1, 20 do
		AS:SkinButton(_G["ACP_AddonListEntry"..i.."LoadNow"])
		AS:SkinCheckBox(_G["ACP_AddonListEntry"..i.."Enabled"])
	end

	ACP_AddonList_ScrollFrame:SetWidth(590)
	ACP_AddonList_ScrollFrame:SetHeight(412)
	ACP_AddonList:SetHeight(502)
	ACP_AddonListEntry1:Point("TOPLEFT", ACP_AddonList, "TOPLEFT", 47, -62)
	ACP_AddonList_ScrollFrame:Point("TOPLEFT", ACP_AddonList, "TOPLEFT", 20, -53)
	ACP_AddonListCloseButton:Point("TOPRIGHT", ACP_AddonList, "TOPRIGHT", 4, 5)
	ACP_AddonListSetButton:Point("BOTTOMLEFT", ACP_AddonList, "BOTTOMLEFT", 20, 8)
	ACP_AddonListDisableAll:Point("BOTTOMLEFT", ACP_AddonList, "BOTTOMLEFT", 90, 8)
	ACP_AddonListEnableAll:Point("BOTTOMLEFT", ACP_AddonList, "BOTTOMLEFT", 175, 8)
	ACP_AddonList_ReloadUI:Point("BOTTOMRIGHT", ACP_AddonList, "BOTTOMRIGHT", -160, 8)
	ACP_AddonListBottomClose:Point("BOTTOMRIGHT", ACP_AddonList, "BOTTOMRIGHT", -50, 8)
	ACP_AddonList:SetScale(AS.UIScale)
end

AS:RegisterSkin(name, AS.SkinACP)