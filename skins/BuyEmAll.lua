if not IsAddOnLoaded("BuyEmAll") then return end
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "BuyEmAllSkin"
local function SkinBuyEmAll(self)
	AS:SkinFrame(BuyEmAllFrame)
	AS:SkinButton(BuyEmAllStackButton)
	AS:SkinButton(BuyEmAllMaxButton)
	AS:SkinButton(BuyEmAllCancelButton)
	AS:SkinButton(BuyEmAllOkayButton)
end

AS:RegisterSkin(name,SkinBuyEmAll)