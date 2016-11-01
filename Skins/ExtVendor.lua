local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ExtVendor') then return end

function AS:ExtVendor()
	AS:StripTextures(MerchantFrameFilterButton, true)
	AS:SkinButton(MerchantFrameFilterButton)
	AS:SkinButton(MerchantFrameSellJunkButton)
	AS:SkinTexture(MerchantFrameSellJunkButtonIcon)
	MerchantFrameSellJunkButtonIcon:SetInside()
	AS:SkinEditBox(MerchantFrameSearchBox)

	for i = 13, 20 do
		local Slot = _G["MerchantItem"..i]
		local Button = _G["MerchantItem"..i.."ItemButton"]
		AS:SkinBackdropFrame(Slot, nil, nil, true)
		AS:SkinFrame(Button)
		AS:StyleButton(Button)
		AS:SkinTexture(Button.icon)
		Button.icon:SetInside()

		Button:SetPoint("TOPLEFT", Slot, "TOPLEFT", 4, -4)

		_G["MerchantItem"..i.."MoneyFrame"]:ClearAllPoints()
		_G["MerchantItem"..i.."MoneyFrame"]:Point("BOTTOMLEFT", Button, "BOTTOMRIGHT", 3, 0)

		for j = 1, 3 do
			AS:CreateBackdrop(_G["MerchantItem"..i.."AltCurrencyFrameItem"..j])
			_G["MerchantItem"..i.."AltCurrencyFrameItem"..j].Backdrop:SetOutside(_G["MerchantItem"..i.."AltCurrencyFrameItem"..j.."Texture"])
			AS:SkinTexture(_G["MerchantItem"..i.."AltCurrencyFrameItem"..j.."Texture"])
		end
	end

	MerchantFrame:HookScript('OnUpdate', function()
		for i = 13, 20 do
			if _G['MerchantItem'..i..'AltCurrencyFrame'] then
				_G['MerchantItem'..i..'AltCurrencyFrame']:SetPoint('BOTTOMLEFT', _G['MerchantItem'..i..'NameFrame'], 'BOTTOMLEFT', 3, 34)
			end
		end
	end)

	MerchantFrame:HookScript('OnShow', function(self) self:SetWidth(690) end)

	AS:SkinButton(ExtVendor_SellJunkPopupYesButton)
	AS:SkinButton(ExtVendor_SellJunkPopupNoButton)
end

AS:RegisterSkin('ExtVendor', AS.ExtVendor)