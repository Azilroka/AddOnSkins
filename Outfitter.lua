if not IsAddOnLoaded("Outfitter") then return end

OutfitterFrame:HookScript("OnShow", function( self ) self:StripTextures() self:SetTemplate("Transparent") end)

OutfitterMainFrameScrollbarTrench:StripTextures()
OutfitterFrameTab1:StripTextures()
OutfitterFrameTab2:StripTextures()
OutfitterFrameTab3:StripTextures()
OutfitterFrameTab1:ClearAllPoints()
OutfitterFrameTab2:ClearAllPoints()
OutfitterFrameTab3:ClearAllPoints()
OutfitterFrameTab1:Point("TOPLEFT", OutfitterFrame, "BOTTOMRIGHT", -90, -2)
OutfitterFrameTab2:Point("TOPLEFT", OutfitterFrame, "BOTTOMRIGHT", -170, -2)
OutfitterFrameTab3:Point("TOPLEFT", OutfitterFrame, "BOTTOMRIGHT", -250, -2)
cSkinButton(OutfitterFrameTab1)
cSkinButton(OutfitterFrameTab2)
cSkinButton(OutfitterFrameTab3)
cSkinScrollBar(OutfitterMainFrameScrollFrameScrollBar)
cSkinCloseButton(OutfitterCloseButton)
cSkinButton(OutfitterNewButton)
cSkinButton(OutfitterEnableNone)
cSkinButton(OutfitterEnableAll)

OutfitterSlotEnables:SetFrameStrata("HIGH")
