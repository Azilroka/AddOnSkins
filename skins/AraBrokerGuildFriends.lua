local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "AraBrokerGuildFriendsSkin"
function AS:SkinAraBrokerGuildFriends()
    AraBrokerGuildFriends:HookScript("OnUpdate", function(self) AS:SkinFrame(self) end)
end
AS:RegisterSkin(name,AS.SkinAraBrokerGuildFriends)