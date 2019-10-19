local AS = unpack(AddOnSkins)

if not (AS:CheckAddOn('BuyEmAll') or AS:CheckAddOn('BuyEmAllClassic')) then return end

function AS:BuyEmAll()
	AS:SkinFrame(BuyEmAllFrame)
	AS:SkinButton(BuyEmAllStackButton)
	AS:SkinButton(BuyEmAllMaxButton)
	AS:SkinButton(BuyEmAllCancelButton)
	AS:SkinButton(BuyEmAllOkayButton)
end

AS:RegisterSkin('BuyEmAll', AS.BuyEmAll, '[AddonLoader]')
