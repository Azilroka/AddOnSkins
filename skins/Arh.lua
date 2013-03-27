local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = 'ArhSkin'
function AS:SkinArh(event)
	AS:SkinFrame(Arh_MainFrame)
	Arh_Tooltip:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
end

AS:RegisterSkin(name,AS.SkinArh)