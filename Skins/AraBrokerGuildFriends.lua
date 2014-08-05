local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Ara_Broker_Guild_Friends') then return end

local name = 'AraBrokerGuildFriendsSkin'
function AS:SkinAraBrokerGuildFriends()
	AraBrokerGuildFriends:HookScript('OnUpdate', function(f) AS:SkinFrame(f) end)
end

AS:RegisterSkin(name, AS.SkinAraBrokerGuildFriends)