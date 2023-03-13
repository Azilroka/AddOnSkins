local AS, L, S, R = unpack(AddOnSkins)

function R:ExtVendor()
	S:StripTextures(MerchantFrameFilterButton, true)
	S:HandleButton(MerchantFrameFilterButton)

	S:HandleButton(MerchantFrameSellJunkButton)
	S:HandleIcon(MerchantFrameSellJunkButtonIcon)

	S:SetInside(MerchantFrameSellJunkButtonIcon)

	S:HandleEditBox(MerchantFrameSearchBox)

	S:HandleFrame(ExtVendor_SellJunkPopup)
	S:HandleFrame(ExtVendor_SellJunkProgressPopup)

	S:HandleButton(ExtVendor_SellJunkPopupYesButton)
	S:HandleButton(ExtVendor_SellJunkPopupNoButton)

	for i = 13, 20 do
		local Slot = _G["MerchantItem"..i]
		S:HandleFrame(Slot)
		S:HandleFrame(Slot.ItemButton)
		S:StyleButton(Slot.ItemButton)
		S:HandleIcon(Slot.ItemButton.icon)
		S:SetInside(Slot.ItemButton.icon)
		Slot.ItemButton:SetPoint("TOPLEFT", Slot, "TOPLEFT", 4, -4)
		Slot.ItemButton.IconBorder:SetAlpha(0)

		hooksecurefunc(Slot.ItemButton.IconBorder, 'SetVertexColor', function(_, r, g, b) Slot.ItemButton:SetBackdropBorderColor(r, g, b) end)
		hooksecurefunc(Slot.ItemButton.IconBorder, 'Hide', function() Slot.ItemButton:SetBackdropBorderColor(unpack(AS.BorderColor)) end)

		_G["MerchantItem"..i.."MoneyFrame"]:ClearAllPoints()
		_G["MerchantItem"..i.."MoneyFrame"]:SetPoint("BOTTOMLEFT", Slot.ItemButton, "BOTTOMRIGHT", 3, 0)

		for j = 1, 3 do
			S:CreateBackdrop(_G["MerchantItem"..i.."AltCurrencyFrameItem"..j.."Texture"])
			S:HandleIcon(_G["MerchantItem"..i.."AltCurrencyFrameItem"..j.."Texture"])
		end
	end

	MerchantFrame:HookScript('OnShow', function(s) s:SetWidth(690) end)
end

AS:RegisterSkin('ExtVendor')
