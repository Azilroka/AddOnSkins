local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "AraBrokerGuildFriendsSkin"
local function SkinAraBrokerGuildFriends(self)
    AraBrokerGuildFriends:HookScript("OnUpdate", function(self) AS:SkinFrame(self) end)
end
AS:RegisterSkin(name,SkinAraBrokerGuildFriends)