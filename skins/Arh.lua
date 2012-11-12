local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = 'ArhSkin'
local function SkinArh(self,event)
	AS:SkinFrame(Arh_MainFrame)
end

AS:RegisterSkin(name,SkinArh)