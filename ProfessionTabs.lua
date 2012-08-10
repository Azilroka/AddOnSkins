if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("ProfessionTabs") then return end
function ProfessionTabs:CreateTab(Table, Parent)
	local Tab = CreateFrame("CheckButton", nil, Parent, "SpellBookSkillLineTabTemplate SecureActionButtonTemplate")
	Tab:SetPoint("TOPLEFT", Parent, "TOPRIGHT", (Parent == ATSWFrame or Parent == TradeFrame) and -32 or 2, (Parent == TradeFrame and -32 or -24) + -44 * #Table)

	Tab:GetRegions():SetSize(.1,.1)
	Tab:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
	Tab:GetNormalTexture():ClearAllPoints()
	Tab:GetNormalTexture():Point("TOPLEFT", 2, -2)
	Tab:GetNormalTexture():Point("BOTTOMRIGHT", -2, 2)
	Tab:CreateBackdrop("Transparent")
	Tab.backdrop:SetAllPoints()
	Tab:StyleButton(True)

	Tab:SetScript("OnEnter", Tab_OnEnter)
	Tab:SetScript("OnLeave", Tab_OnLeave)
	
	Table[#Table + 1] = Tab
	return Tab
end
