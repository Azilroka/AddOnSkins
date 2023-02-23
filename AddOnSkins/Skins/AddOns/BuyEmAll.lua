local AS, L, S, R = unpack(AddOnSkins)

if not (AS:CheckAddOn('BuyEmAll') or AS:CheckAddOn('BuyEmAllClassic')) then return end

function AS:BuyEmAll()
	S:HandleFrame(BuyEmAllFrame)
	S:HandleButton(BuyEmAllStackButton)
	S:HandleButton(BuyEmAllMaxButton)
	S:HandleButton(BuyEmAllCancelButton)
	S:HandleButton(BuyEmAllOkayButton)
end

AS:RegisterSkin('BuyEmAll', AS.BuyEmAll, '[AddonLoader]')
