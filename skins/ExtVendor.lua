if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) or not IsAddOnLoaded("ExtVendor") then return end
local U = unpack(select(2,...))
local name = "ExtVendorSkin"
local function SkinExtVendor(self)
	local s = U.s
	local c = U.c
	if IsAddOnLoaded("ElvUI") then
		if c.private.skins.blizzard.enable ~= true or c.private.skins.blizzard.merchant ~= true then return end
	end
	if IsAddOnLoaded("Tukui") then U.SkinFrame(MerchantFrame) end
	U.SkinButton(MerchantFrameFilterButton)
	U.SkinButton(MerchantFrameSellJunkButton)

	for i = 1, 20 do
		local b = _G["MerchantItem"..i.."ItemButton"]
		local t = _G["MerchantItem"..i.."ItemButtonIconTexture"]
		local item_bar = _G["MerchantItem"..i]
		item_bar:StripTextures(true)
		b:StripTextures()
		b:StyleButton(false)
		b:Point("TOPLEFT", item_bar, "TOPLEFT", 4, -4)
		t:SetTexCoord(.08, .92, .08, .92)
		t:ClearAllPoints()
		t:Point("TOPLEFT", 2, -2)
		t:Point("BOTTOMRIGHT", -2, 2)

		if IsAddOnLoaded("Tukui") then
			item_bar:CreateBackdrop("Transparent")
			b:SetTemplate("Transparent", true)
		end

		if IsAddOnLoaded("ElvUI") then
			item_bar:CreateBackdrop("Default")
			b:SetTemplate("Default", true)
		end

	end
	MerchantFrame:Width(690)
end

U.RegisterSkin(name,SkinExtVendor)

