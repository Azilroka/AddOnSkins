local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('xMerchant') then return end

function AS:xMerchant()
	AS:SkinCheckBox(NuuhMerchantFrameTooltipSearching)
	AS:StripTextures(NuuhMerchantFrame, true)
	AS:SkinFrame(NuuhMerchantFrameSearch, 'Default')
	AS:SkinScrollBar(NuuhMerchantScrollFrameScrollBar)
	for i = 1, 10, 1 do
		AS:SkinTexture(_G['NuuhMerchantFrame'..i].icon)
	end
end

AS:RegisterSkin('xMerchant', AS.xMerchant)