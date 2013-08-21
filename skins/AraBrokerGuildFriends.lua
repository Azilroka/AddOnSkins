local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "AraBrokerGuildFriendsSkin"
function AS:SkinAraBrokerGuildFriends()
	AraBrokerGuildFriends:HookScript("OnUpdate", function(f) AS:SkinFrame(f) end)
end

AS:RegisterSkin(name, AS.SkinAraBrokerGuildFriends)