local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('xMerchant') then return end

function R:xMerchant()
	S:HandleCheckBox(NuuhMerchantFrameTooltipSearching)
	S:StripTextures(NuuhMerchantFrame, true)
	S:HandleFrame(NuuhMerchantFrameSearch, 'Default')
	S:HandleScrollBar(NuuhMerchantScrollFrameScrollBar)
	for i = 1, 10, 1 do
		S:HandleIcon(_G['NuuhMerchantFrame'..i].icon)
	end
end

AS:RegisterSkin('xMerchant', R.xMerchant)
