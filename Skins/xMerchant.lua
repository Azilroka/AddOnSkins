local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('xMerchant') then return end

local name = 'xMerchantSkin'
function AS:SkinxMerchant()
	AS:SkinCheckBox(NuuhMerchantFrameTooltipSearching)
	NuuhMerchantFrame:StripTextures(true)
	AS:SkinFrame(NuuhMerchantFrameSearch, 'Default')
	AS:SkinScrollBar(NuuhMerchantScrollFrameScrollBar)
	for i = 1, 10, 1 do
		AS:SkinTexture(_G['NuuhMerchantFrame'..i].icon)
	end
end

AS:RegisterSkin(name, AS.SkinxMerchant)