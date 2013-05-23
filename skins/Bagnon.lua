local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = 'BagnonSkin'
function AS:SkinBagnon(event)
	if event == "PLAYER_ENTERING_WORLD" then
		ToggleBackpack()
		AS:SkinFrame(BagnonFrameinventory)
		S:HandleCloseButton(BagnonFrameinventoryCloseButton)
		ToggleBackpack()
	elseif event == "BANKFRAME_OPENED" then
		AS:SkinFrame(BagnonFramebank)
		S:HandleCloseButton(BagnonFramebankCloseButton)
		AS:UnregisterEvent(name, event)
	elseif event == "GUILDBANKFRAME_OPENED" and IsAddOnLoaded("Bagnon_GuildBank") then
		E:Delay(0, function()
			AS:SkinFrame(BagnonFrameguildbank)
			S:HandleCloseButton(BagnonFrameguildbankCloseButton)
			AS:UnregisterEvent(name, "GUILDBANKFRAME_OPENED")
		end)
	elseif event == "VOID_STORAGE_OPEN" and IsAddOnLoaded("Bagnon_VoidStorage") then
		E:Delay(0, function()
			AS:SkinFrame(BagnonFramevoidstorage)
			S:HandleCloseButton(BagnonFramevoidstorageCloseButton)
			AS:UnregisterEvent(name, "VOID_STORAGE_OPEN")
		end)
	end
end

AS:RegisterSkin(name, AS.SkinBagnon, "ADDON_LOADED", "BANKFRAME_OPENED", "GUILDBANKFRAME_OPENED", "VOID_STORAGE_OPEN")