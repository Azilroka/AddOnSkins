local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "AraBrokerTradeskillsSkin"
local function SkinAraTradeskills(self)
	AraSkills:HookScript("OnUpdate", function(self) AS:SkinFrame(self) end)
end

AS:RegisterSkin(name,SkinAraTradeskills)