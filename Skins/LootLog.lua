local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('LootLog') then return end

function AS:LootLog()
	for i = 1, 10 do
		AS:SkinFrame(_G["LootEntry"..i])
	end
end

AS:RegisterSkin('LootLog', AS.LootLog)