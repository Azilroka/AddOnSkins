local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Scrap') then return end

local AddOnCount = 0
function AS:Scrap(event, addon)
	if addon == 'Scrap_Merchant' or IsAddOnLoaded('Scrap_Merchant') then
		if Scrap and Scrap:IsObjectType('Button') and not Scrap.IsSkinned then
			AS:StyleButton(Scrap)
			Scrap:SetTemplate('Default', true)
			ScrapBorder:SetTexture(nil)
			ScrapIcon:SetTexture('Interface\\Addons\\Scrap\\Art\\Enabled Icon')
			ScrapIcon:SetAllPoints()
			local numTabs = MerchantFrame.numTabs
			for i = numTabs, 1, -1 do
				tab = _G[('MerchantFrameTab%d'):format(i)]
				if tab then
					if tab:GetText() == 'Scrap' then
						AS:SkinTab(tab)
						break
					end
				else
					break
				end
			end
			Scrap.IsSkinned = true
			AddOnCount = AddOnCount + 1
		end
	end
	
	if addon == 'Scrap_Visualizer' or IsAddOnLoaded('Scrap_Visualizer')then
		AS:SkinFrame(ScrapVisualizer, 'Default')
		AS:StripTextures(ScrapVisualizerInset)
		AS:StripTextures(ScrapVisualizerScroll)
		AS:SkinScrollBar(ScrapVisualizerScrollBar)
		AS:SkinCloseButton(ScrapVisualizerCloseButton)
		AS:SkinTab(ScrapVisualizerTab1)
		AS:SkinTab(ScrapVisualizerTab2)
		AS:SkinButton(ScrapVisualizerButton, true)
		ScrapVisualizer:SetWidth(MerchantFrame:GetWidth()-6)
		AddOnCount = AddOnCount + 1
	end

	if AddOnCount == 2 then
		AS:UnregisterSkinEvent('Scrap', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('Scrap', AS.Scrap, 'ADDON_LOADED')