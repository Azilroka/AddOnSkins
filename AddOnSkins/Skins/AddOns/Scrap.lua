local AS, L, S, R = unpack(AddOnSkins)

function R:Scrap(event, addon)
	if addon == 'Scrap_Merchant' or IsAddOnLoaded('Scrap_Merchant') then
		local function skinButton()
			local Button = Scrap.Merchant
			if Button and not Button.IsSkinned then
				S:StripTextures(Button, nil, true)
				S:HandleButton(Button)
				Button.IsSkinned = true
			end
			if Button.border then Button.border:SetAlpha(0) end
			if Button.icon then
				S:HandleIcon(Button.icon)
				Button.icon:SetInside()
				Button.icon:SetAlpha(1)
			end
			if MerchantFrameCoverTab then
				S:HandleTab(MerchantFrameCoverTab)
				MerchantFrameCoverTab:SetFrameLevel(MerchantFrameTab1:GetFrameLevel()+3)
			end
			if ScrapVisualizer.tab then
				S:HandleTab(ScrapVisualizer.tab)
			end
		end

		MerchantFrame:HookScript("OnUpdate", skinButton)

		S:HandleFrame(ScrapVisualizer, 'Default')
		S:StripTextures(ScrapVisualizerInset)
		S:StripTextures(ScrapVisualizerScroll)
		S:HandleScrollBar(ScrapVisualizerScrollBar)
		S:HandleCloseButton(ScrapVisualizerCloseButton)
		S:HandleTab(ScrapVisualizerTab1)
		S:HandleTab(ScrapVisualizerTab2)
		S:HandleButton(ScrapVisualizerButton, true)
		ScrapVisualizer:SetWidth(MerchantFrame:GetWidth() - 6)

		AS:UnregisterSkinEvent('Scrap', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('Scrap', nil, 'ADDON_LOADED')
