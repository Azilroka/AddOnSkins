local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Ara_Broker_Guild_Friends') then return end

function AS:AraBrokerGuildFriends()
	AraBrokerGuildFriends:HookScript('OnUpdate', function(f) AS:SkinFrame(f) end)
end

AS:RegisterSkin('AraBrokerGuildFriends', AS.AraBrokerGuildFriends)