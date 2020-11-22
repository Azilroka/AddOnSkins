local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Scrap') then return end

function AS:Scrap(event, addon)
	if addon == 'Scrap_Merchant' or IsAddOnLoaded('Scrap_Merchant') then
		local Button = Scrap.Merchant
		if Button and not Button.IsSkinned then
			Button:OnEnable()
			AS:StyleButton(Button)
			AS:SetTemplate(Button, nil, true)
			Button.border:SetTexture()
			Button.icon:SetTexture([[Interface\Addons\Scrap\Art\Enabled Icon]])
			Button.icon:SetAllPoints()
			for _, tab in ipairs(MerchantFrame.numTabs) do
				AS:SkinTab(tab)
			end
			Button.IsSkinned = true
		end

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
