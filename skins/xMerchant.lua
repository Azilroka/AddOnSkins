local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'xMerchantSkin'
function AS:SkinxMerchant()
	AS:SkinCheckBox(NuuhMerchantFrameTooltipSearching)
	AS:SkinFrameD(NuuhMerchantFrameSearch)
	AS:SkinScrollBar(NuuhMerchantScrollFrameScrollBar)
end

AS:RegisterSkin(name, AS.SkinxMerchant)