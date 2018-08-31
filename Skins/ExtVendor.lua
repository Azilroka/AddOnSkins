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
		AS:SkinBackdropFrame(Slot, nil, nil, true)
		AS:SkinFrame(Slot.ItemButton)
		AS:StyleButton(Slot.ItemButton)
		AS:SkinTexture(Slot.ItemButton.icon)
		Slot.ItemButton.icon:SetInside()
		Slot.ItemButton.IconBorder:SetAlpha(0)

		Slot.ItemButton:SetPoint("TOPLEFT", Slot, "TOPLEFT", 4, -4)

		_G["MerchantItem"..i.."MoneyFrame"]:ClearAllPoints()
		_G["MerchantItem"..i.."MoneyFrame"]:SetPoint("BOTTOMLEFT", Slot.ItemButton, "BOTTOMRIGHT", 3, 0)

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
