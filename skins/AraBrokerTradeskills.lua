local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local function SkinAraTS(self, event, ...)
    local AraTradeskills = _G["AraSkills"]
    AraTradeskills:StripTextures()
    AraTradeskills:SetTemplate("Transparent")
end


local name = "AraBrokerTradeskillsSkin"
local function SkinAraTradeskills(self)
    local AraTradeskills = _G["AraSkills"]
    AraTradeskills:SetScript("OnUpdate", SkinAraTS)
end

AS:RegisterSkin(name,SkinAraTradeskills)