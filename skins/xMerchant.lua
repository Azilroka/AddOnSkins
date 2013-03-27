local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = 'xMerchantSkin'
function AS:SkinxMerchant()

	S:HandleCheckBox(NuuhMerchantFrameTooltipSearching)
	AS:SkinFrame(NuuhMerchantFrameSearch, 'Default') S:HandleScrollBar(NuuhMerchantScrollFrameScrollBar)

end

AS:RegisterSkin(name, AS.SkinxMerchant)