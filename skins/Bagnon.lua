if not IsAddOnLoaded("Bagnon") then return end
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = 'BagnonSkin'
local function SkinBagnon(self,event)
	if event == "BANKFRAME_OPENED" then
		E:Delay(0, function()
			if BagnonFramebank then
				if not bagnonbankonce then
					bagnonbankonce = true
					AS:SkinFrame(BagnonFramebank)
					AS:SkinCloseButton(BagnonFramebankCloseButton)
				end
			end
		end)
	elseif event == "GUILDBANKFRAME_OPENED" then
		if BagnonFrameguildbank then
			if not bagnonguildonce then
				bagnonguildonce = true
				AS:SkinFrame(BagnonFrameguildbank)
				AS:SkinCloseButton(BagnonFrameguildbankCloseButton)
			end
		end
	elseif event == "VOID_STORAGE_OPEN" then
		if BagnonFramevoidstorage then
			if not bagnonvoidonce then
				bagnonvoidonce = true
				AS:SkinFrame(BagnonFramevoidstorage)
				AS:SkinCloseButton(BagnonFramevoidstorageCloseButton)
			end
		end
	end
	E:Delay(0, function()
		if not bagnononce then
			bagnononce = true
			ToggleBackpack()
			AS:SkinFrame(BagnonFrameinventory)
			AS:SkinCloseButton(BagnonFrameinventoryCloseButton)
			ToggleBackpack()
		end
	end)
end
AS:RegisterSkin(name,SkinBagnon,"BANKFRAME_OPENED","GUILDBANKFRAME_OPENED","VOID_STORAGE_OPEN")