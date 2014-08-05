local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ExtVendor') then return end

local name = 'ExtVendorSkin'
function AS:SkinExtVendor()
	AS:SkinFrame(MerchantFrame)
	AS:SkinButton(MerchantFrameFilterButton)
	AS:SkinBackdropFrame(MerchantFrameSellJunkButton)
	AS:SkinEditBox(MerchantFrameSearchBox)

	for i = 1, 20 do
		local b = _G['MerchantItem'..i..'ItemButton']
		local t = _G['MerchantItem'..i..'ItemButtonIconTexture']
		local item_bar = _G['MerchantItem'..i]
		b:StripTextures()
		b:StyleButton(false)
		b:Point('TOPLEFT', item_bar, 'TOPLEFT', 4, -4)
		AS:SkinTexture(t)
		t:ClearAllPoints()
		t:Point('TOPLEFT', 2, -2)
		t:Point('BOTTOMRIGHT', -2, 2)
		AS:SkinFrame(item_bar)
		b:SetTemplate('Transparent', true)
	end
	MerchantFrame:HookScript('OnUpdate', function()
		for i = 1, 20 do
			if _G['MerchantItem'..i..'AltCurrencyFrame'] then
				_G['MerchantItem'..i..'AltCurrencyFrame']:SetPoint('BOTTOMLEFT', _G['MerchantItem'..i..'NameFrame'], 'BOTTOMLEFT', 3, 34)
			end
		end
	end)
	MerchantFrame:Width(690)
	ExtVendor_SellJunkPopup:SetTemplate('Transparent')
	AS:SkinButton(ExtVendor_SellJunkPopupYesButton)
	AS:SkinButton(ExtVendor_SellJunkPopupNoButton)
end

AS:RegisterSkin(name, AS.SkinExtVendor)