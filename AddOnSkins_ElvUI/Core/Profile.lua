local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

V['addonskins'] = {
-- Embeds
	['EmbedCoolLine'] = false,
	['EmbedOoC'] = false, 
	['EmbedOmen'] = false, 
	['EmbedRecount'] = false, 
	['EmbedSexyCooldown'] = false,
	['EmbedSkada'] = false, 
	['EmbedTinyDPS'] = false,
	['EmbedSystem'] = false,
	['EmbedSystemDual'] = false,
	['EmbedMain'] = 'Recount',
	['EmbedLeft'] = 'Skada',
	['EmbedRight'] = 'Skada',
	['EmbedLeftWidth'] = 200,
	['EmbedBelowTop'] = false,
	['RecountBackdrop'] = true,
	['SkadaBackdrop'] = true,
	['OmenBackdrop'] = true,
	['TransparentEmbed'] = false,
-- Misc
	['MiscFixes'] = true,
	['DBMSkinHalf'] = false,
	['DBMFont'] = 'ElvUI Norm',
	['DBMFontSize'] = 12,
	['DBMFontFlag'] = 'OUTLINE',
	['ParchmentRemover'] = false,
	['EmbedLeftChat'] = false,
	['WeakAuraAuraBar'] = false,
	['AuctionHouse'] = true,
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