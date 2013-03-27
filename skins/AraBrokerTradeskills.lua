local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "AraBrokerTradeskillsSkin"
function AS:SkinAraTradeskills()
	AraSkills:HookScript("OnUpdate", function(self) AS:SkinFrame(self) end)
end

AS:RegisterSkin(name,AS.SkinAraTradeskills)