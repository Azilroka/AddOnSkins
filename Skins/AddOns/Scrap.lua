local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Scrap') then return end

function AS:Scrap(event, addon)
	if addon == 'Scrap_Merchant' or IsAddOnLoaded('Scrap_Merchant') then
		local function skinButton()
			local Button = Scrap.Merchant
			if Button and not Button.IsSkinned then
				AS:StripTextures(Button, nil, true)
				AS:SkinButton(Button)
				Button.IsSkinned = true
			end
			if Button.border then Button.border:SetAlpha(0) end
			if Button.icon then
				AS:SkinTexture(Button.icon)
				Button.icon:SetInside()
				Button.icon:SetAlpha(1)
			end
			if MerchantFrameCoverTab then
				AS:SkinTab(MerchantFrameCoverTab)
				MerchantFrameCoverTab:SetFrameLevel(MerchantFrameTab1:GetFrameLevel()+3)
			end
			if ScrapVisualizer.tab then
				AS:SkinTab(ScrapVisualizer.tab)
			end
		end

		MerchantFrame:HookScript("OnUpdate", skinButton)

		AS:SkinFrame(ScrapVisualizer, 'Default')
		AS:StripTextures(ScrapVisualizerInset)
		AS:StripTextures(ScrapVisualizerScroll)
		AS:SkinScrollBar(ScrapVisualizerScrollBar)
		AS:SkinCloseButton(ScrapVisualizerCloseButton)
		AS:SkinTab(ScrapVisualizerTab1)
		AS:SkinTab(ScrapVisualizerTab2)
		AS:SkinButton(ScrapVisualizerButton, true)
		ScrapVisualizer:SetWidth(MerchantFrame:GetWidth() - 6)

		AS:UnregisterSkinEvent('Scrap', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('Scrap', AS.Scrap, 'ADDON_LOADED')
