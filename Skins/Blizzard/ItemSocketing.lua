local AS = unpack(AddOnSkins)

function AS:Blizzard_ItemSocketing(event, addon)
	if addon ~= 'Blizzard_ItemSocketingUI' then return end
	AS:SkinFrame(ItemSocketingFrame)
	AS:SkinFrame(ItemSocketingScrollFrame)
	AS:StripTextures(ItemSocketingFrameInset)

	for i = 1, MAX_NUM_SOCKETS do
		local button = _G["ItemSocketingSocket"..i]
		AS:SkinFrame(button)
		AS:StyleButton(button)
		AS:SkinTexture(button.icon)
		button.icon:ClearAllPoints()
		button.icon:SetInside()
		_G["ItemSocketingSocket"..i.."BracketFrame"]:Kill()
		_G["ItemSocketingSocket"..i.."Background"]:Kill()
	end

	hooksecurefunc("ItemSocketingFrame_Update", function()
		for i = 1, GetNumSockets() do
			local color = GEM_TYPE_INFO[GetSocketTypes(i)]
			_G["ItemSocketingSocket"..i]:SetBackdropColor(color.r, color.g, color.b, 0.15)
			_G["ItemSocketingSocket"..i]:SetBackdropBorderColor(color.r, color.g, color.b)			
		end
	end)

	ItemSocketingFramePortrait:Kill()
	ItemSocketingSocketButton:ClearAllPoints()
	ItemSocketingSocketButton:SetPoint("BOTTOMRIGHT", ItemSocketingFrame, "BOTTOMRIGHT", -5, 5)
	AS:SkinButton(ItemSocketingSocketButton)
	AS:SkinCloseButton(ItemSocketingFrameCloseButton)
	AS:SkinScrollBar(ItemSocketingScrollFrameScrollBar)
	AS:UnregisterSkinEvent('Blizzard_ItemSocketing', 'ADDON_LOADED')
end

AS:RegisterSkin('Blizzard_ItemSocketing', AS.Blizzard_ItemSocketing, 'ADDON_LOADED')