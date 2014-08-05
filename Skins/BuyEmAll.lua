local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BuyEmAll') then return end

local name = 'BuyEmAllSkin'
function AS:SkinBuyEmAll()
	AS:SkinFrame(BuyEmAllFrame)
	AS:SkinButton(BuyEmAllStackButton)
	AS:SkinButton(BuyEmAllMaxButton)
	AS:SkinButton(BuyEmAllCancelButton)
	AS:SkinButton(BuyEmAllOkayButton)
end

AS:RegisterSkin(name, AS.SkinBuyEmAll)