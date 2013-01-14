local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "OvaleSkin"
local function SkinOvale(self)
	E.Delay(15, function()
		Icon1n1:GetParent():StripTextures()
		for i = 1, 3 do
			AS:SkinBackdropFrame(_G["Icon"..i.."n1"], true)
			_G["Icon"..i.."n1"].backdrop:SetFrameLevel(0)
			_G["Icon"..i.."n1"].backdrop:SetAllPoints()
			--_G["Icon"..i.."n1"].backdrop:SetScale(c["general"].uiscale)
			_G["Icon"..i.."n1"].icone:SetInside(_G["Icon"..i.."n1"].backdrop, 1, 1)
		end
	end)
end

AS:RegisterSkin(name,SkinOvale)