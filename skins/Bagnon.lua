if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Bagnon") then return end
local U = unpack(select(2,...))
local name = 'BagnonSkin'
local function SkinBagnon(self,event)
	if event == "BANKFRAME_OPENED" then
		U.SkinFrame(BagnonFramebank)
		U.SkinCloseButton(BagnonFramebankCloseButton)
	elseif event == "GUILDBANKFRAME_OPENED" then
		print("gbank")
		U.SkinFrame(BagnonFrameguildbank)
		U.SkinCloseButton(BagnonFrameguildbankCloseButton)
	elseif event == "VOID_STORAGE_OPEN" then
		U.SkinFrame(BagnonFramevoidstorage)
		U.SkinCloseButton(BagnonFramevoidstorageCloseButton)
	elseif event == "BAG_UPDATE" then
		U.SkinFrame(BagnonFrameinventory)
		U.SkinCloseButton(BagnonFrameinventoryCloseButton)
	end
		ToggleBackpack()
		BagnonFrameinventory:HookScript("OnShow", function() U.SkinFrame(BagnonFrameinventory) end)
		U.SkinCloseButton(BagnonFrameinventoryCloseButton)
		ToggleBackpack()
end
U.RegisterSkin(name,SkinBagnon,"BAG_UPDATE","BANKFRAME_OPENED","GUILDBANKFRAME_OPENED","VOID_STORAGE_OPEN")