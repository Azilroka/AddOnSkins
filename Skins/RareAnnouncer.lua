local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RareAnnouncer') then return end

function AS:RareAnnouncer()
	AS:SkinFrame(rareFrame)
	AS:StripTextures(rareFrame.npcFrame)
	AS:StripTextures(rareFrame.timeFrame)
end

AS:RegisterSkin('RareAnnouncer', AS.RareAnnouncer)