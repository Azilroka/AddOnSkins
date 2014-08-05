local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('LootLog') then return end

local name = 'LootLogSkin'
function AS:SkinLootLog()
	for i = 1, 10 do
		AS:SkinFrame(_G["LootEntry"..i])
	end
end

AS:RegisterSkin(name, AS.SkinLootLog)