local AS, L, S, R = unpack(AddOnSkins)

function R:BuyEmAll()
	S:HandleFrame(BuyEmAllFrame)
	S:HandleButton(BuyEmAllStackButton)
	S:HandleButton(BuyEmAllMaxButton)
	S:HandleButton(BuyEmAllCancelButton)
	S:HandleButton(BuyEmAllOkayButton)
end

AS:RegisterSkin('BuyEmAll')
