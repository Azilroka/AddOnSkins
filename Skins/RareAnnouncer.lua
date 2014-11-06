local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RareAnnouncer') then return end

function AS:RareAnnouncer()
	AS:SkinFrame(rareFrame)
	rareFrame.npcFrame:StripTextures()
	rareFrame.timeFrame:StripTextures()
end

AS:RegisterSkin('RareAnnouncer', AS.RareAnnouncer)