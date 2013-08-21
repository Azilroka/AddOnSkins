local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "ReforgeradeSkin"
function AS:SkinReforgerade()
	AS:SkinFrame(ReforgeradeInputFrame.frame)
	AS:SkinButton(ReforgeCompareButton)
	AS:SkinButton(ReforgeItButton)
	AS:SkinCloseButton(ReforgeradeCloseButton)
	AS:SkinScrollBar(ExportScrollScrollBar)
	ExportScroll:CreateBackdrop()
	ExportScrollScrollBar:SetPoint("TOPLEFT", ExportScroll, "TOPRIGHT", 4, -15)
	AS:SkinTooltip(ReforgeradeTooltip)
end

AS:RegisterSkin(name, AS.SkinReforgerade)