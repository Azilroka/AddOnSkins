local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ExtVendor') then return end

function AS:ExtVendor()
	AS:StripTextures(MerchantFrameFilterButton, true)
	AS:SkinButton(MerchantFrameFilterButton)

	AS:SkinButton(MerchantFrameSellJunkButton)
	AS:SkinTexture(MerchantFrameSellJunkButtonIcon)

	AS:SetInside(MerchantFrameSellJunkButtonIcon)

	AS:SkinEditBox(MerchantFrameSearchBox)

	AS:SkinFrame(ExtVendor_SellJunkPopup)
	AS:SkinFrame(ExtVendor_SellJunkProgressPopup)

	AS:SkinButton(ExtVendor_SellJunkPopupYesButton)
	AS:SkinButton(ExtVendor_SellJunkPopupNoButton)

	for i = 13, 20 do
		local Slot = _G["MerchantItem"..i]
		AS:SkinFrame(Slot)
		AS:SkinFrame(Slot.ItemButton)
		AS:StyleButton(Slot.ItemButton)
		AS:SkinTexture(Slot.ItemButton.icon)
		AS:SetInside(Slot.ItemButton.icon)
		Slot.ItemButton:SetPoint("TOPLEFT", Slot, "TOPLEFT", 4, -4)
		Slot.ItemButton.IconBorder:SetAlpha(0)

		hooksecurefunc(Slot.ItemButton.IconBorder, 'SetVertexColor', function(self, r, g, b) Slot.ItemButton:SetBackdropBorderColor(r, g, b) end)
		hooksecurefunc(Slot.ItemButton.IconBorder, 'Hide', function(self) Slot.ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor)) end)

		_G["MerchantItem"..i.."MoneyFrame"]:ClearAllPoints()
		_G["MerchantItem"..i.."MoneyFrame"]:SetPoint("BOTTOMLEFT", Slot.ItemButton, "BOTTOMRIGHT", 3, 0)

		for j = 1, 3 do
			AS:CreateBackdrop(_G["MerchantItem"..i.."AltCurrencyFrameItem"..j.."Texture"])
			AS:SkinTexture(_G["MerchantItem"..i.."AltCurrencyFrameItem"..j.."Texture"])
		end
	end

	MerchantFrame:HookScript('OnShow', function(self) self:SetWidth(690) end)
end

AS:RegisterSkin('ExtVendor', AS.ExtVendor)
