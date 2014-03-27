local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

V['addonskins'] = {
-- Embeds
	['EmbedOoC'] = false, 
	['EmbedCoolLine'] = false,
	['EmbedSexyCooldown'] = false,
	['EmbedSystem'] = false,
	['EmbedSystemDual'] = false,
	['EmbedMain'] = 'Skada',
	['EmbedLeft'] = 'Skada',
	['EmbedRight'] = 'Skada',
	['EmbedLeftWidth'] = 200,
	['EmbedBelowTop'] = false,
	['TransparentEmbed'] = false,
-- Misc
	['RecountBackdrop'] = true,
	['SkadaBackdrop'] = true,
	['OmenBackdrop'] = true,
	['MiscFixes'] = true,
	['DBMSkinHalf'] = false,
	['DBMFont'] = 'ElvUI Norm',
	['DBMFontSize'] = 12,
	['DBMFontFlag'] = 'OUTLINE',
	['EmbedLeftChat'] = false,
	['WeakAuraAuraBar'] = false,
	['WeakAuraIconCooldown'] = true,
	['AuctionHouse'] = true,
	['ParchmentRemover'] = false,
	['IntegrateMyRolePlayTooltip'] = true,
}

do
	for k, _ in pairs(AS.register) do
		if k:match('.+Skin') then
			if not V['addonskins'][k] then
				V['addonskins'][k] = true
			end
		end
	end
end