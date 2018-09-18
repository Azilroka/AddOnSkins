local AS = unpack(AddOnSkins)

function AS:Blizzard_ItemSocketingUI(event, addon)
	if addon ~= 'Blizzard_ItemSocketingUI' then return end

	AS:SkinFrame(ItemSocketingFrame)
	ItemSocketingFrame.portrait:SetAlpha(0)
	AS:SkinFrame(ItemSocketingScrollFrame)
	AS:StripTextures(ItemSocketingFrame.Inset)
	AS:SkinCloseButton(ItemSocketingFrame.CloseButton)

	for i = 1, MAX_NUM_SOCKETS do
		local button = _G["ItemSocketingSocket"..i]
		AS:SkinFrame(button)
		AS:StyleButton(button)
		AS:SkinTexture(button.icon)
		button.icon:ClearAllPoints()
		button.icon:SetInside()
		_G["ItemSocketingSocket"..i.."BracketFrame"]:SetAlpha(0)
		_G["ItemSocketingSocket"..i.."Background"]:SetAlpha(0)
	end

	hooksecurefunc("ItemSocketingFrame_Update", function()
		for i = 1, GetNumSockets() do
			local color = GEM_TYPE_INFO[GetSocketTypes(i)]
			_G["ItemSocketingSocket"..i]:SetBackdropColor(color.r, color.g, color.b, 0.15)
			_G["ItemSocketingSocket"..i]:SetBackdropBorderColor(color.r, color.g, color.b)
		end
	end)

	ItemSocketingSocketButton:ClearAllPoints()
	ItemSocketingSocketButton:SetPoint("BOTTOMRIGHT", ItemSocketingFrame, "BOTTOMRIGHT", -5, 5)
	AS:SkinButton(ItemSocketingSocketButton)
	AS:SkinScrollBar(ItemSocketingScrollFrameScrollBar)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_ItemSocketingUI', AS.Blizzard_ItemSocketingUI, 'ADDON_LOADED')
