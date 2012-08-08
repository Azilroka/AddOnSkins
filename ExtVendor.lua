if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) and not IsAddOnLoaded("ExtVendor") then return end
local SkinExtVendor = CreateFrame("Frame")
	SkinExtVendor:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinExtVendor:SetScript("OnEvent", function(self)
	if (UISkinOptions.ExtVendorSkin == "Disabled") then return end

	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c
	if IsAddOnLoaded("ElvUI") then
		if c.private.skins.blizzard.enable ~= true or c.private.skins.blizzard.merchant ~= true then return end
	end
	if IsAddOnLoaded("Tukui") then cSkinFrame(MerchantFrame) end
	cSkinButton(MerchantFrameFilterButton)
	cSkinButton(MerchantFrameSellJunkButton)

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
	end)

