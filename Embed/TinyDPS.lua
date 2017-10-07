local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TinyDPS') then return end

function AS:Embed_TinyDPS()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'TinyDPS' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = "tdpsFrame"

	AS:SkinFrame(tdpsFrame, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')

	tdpsFrame:SetParent(EmbedParent)
	tdpsFrame:SetFrameStrata(EmbedParent:GetFrameStrata())
	tdpsFrame:SetFrameLevel(EmbedParent:GetFrameLevel())
	tdpsAnchor:ClearAllPoints()
	tdpsAnchor:Point('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	tdpsAnchor:Point('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
	tdpsFrame:SetWidth(tdpsAnchor:GetWidth())

	tdps.hideOOC = false
	tdps.hideIC = false
	tdps.hideSolo = false
	tdps.hidePvP = false
	tdpsRefresh()
end
