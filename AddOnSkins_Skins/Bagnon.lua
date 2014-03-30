local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Bagnon') then return end

local name = 'BagnonSkin'
function AS:SkinBagnon(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		ToggleBackpack()
		if BagnonFrameinventory then
			AS:SkinFrame(BagnonFrameinventory)
			AS:SkinCloseButton(BagnonFrameinventoryCloseButton)
		end
		ToggleBackpack()
	elseif event == 'BANKFRAME_OPENED' then
		AS:Delay(0, function()
			if BagnonFramebank then
				AS:SkinFrame(BagnonFramebank)
				AS:SkinCloseButton(BagnonFramebankCloseButton)
			end
		end)
		AS:UnregisterSkinEvent(name, event)
	elseif event == 'GUILDBANKFRAME_OPENED' and addon == 'Bagnon_GuildBank' then
		AS:Delay(0, function()
			if BagnonFrameguildbank then
				AS:SkinFrame(BagnonFrameguildbank)
				AS:SkinCloseButton(BagnonFrameguildbankCloseButton)
			end
		end)
		AS:UnregisterSkinEvent(name, event)
	elseif event == 'VOID_STORAGE_OPEN' and addon == 'Bagnon_VoidStorage' then
		AS:Delay(0, function()
			if BagnonFramevoidstorage then
				AS:SkinFrame(BagnonFramevoidstorage)
				AS:SkinCloseButton(BagnonFramevoidstorageCloseButton)
			end
		end)
		AS:UnregisterSkinEvent(name, event)
	end
end

AS:RegisterSkin(name, AS.SkinBagnon, 'ADDON_LOADED', 'BANKFRAME_OPENED', 'GUILDBANKFRAME_OPENED', 'VOID_STORAGE_OPEN')