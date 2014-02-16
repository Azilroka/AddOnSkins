local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RareAnnouncer') then return end

local name = 'RareAnnouncerSkin'
function AS:SkinRareAnnouncer()
	AS:SkinFrame(rareFrame)
	rareFrame.npcFrame:StripTextures()
	rareFrame.timeFrame:StripTextures()
end

AS:RegisterSkin(name, AS.SkinRareAnnouncer)