local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "BuyEmAllSkin"
function AS:SkinBuyEmAll()
	AS:SkinFrame(BuyEmAllFrame)
	AS:SkinButton(BuyEmAllStackButton)
	AS:SkinButton(BuyEmAllMaxButton)
	AS:SkinButton(BuyEmAllCancelButton)
	AS:SkinButton(BuyEmAllOkayButton)
end

AS:RegisterSkin(name, AS.SkinBuyEmAll)