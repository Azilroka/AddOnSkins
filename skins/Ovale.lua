local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "OvaleSkin"
function AS:SkinOvale(event)
	E:Delay(15, function()
		if not IsAddOnLoaded("Ovale") then return end
		local i = 1
		while _G["Icon"..i.."n1"] do
			_G["Icon"..i.."n1"]:StripTextures()
			_G["Icon"..i.."n1"]:CreateBackdrop()
			_G["Icon"..i.."n1"].backdrop:SetFrameLevel(0)
			_G["Icon"..i.."n1"].backdrop:SetAllPoints()
			_G["Icon"..i.."n1"].backdrop:SetBackdropColor(0,0,0,0)
			_G["Icon"..i.."n1"].icone:SetDrawLayer("OVERLAY")
			_G["Icon"..i.."n1"].icone:SetTexCoord(0.12, 0.88, 0.12, 0.88)
			_G["Icon"..i.."n1"].icone:SetInside(_G["Icon"..i.."n1"].backdrop, 1, 1)
			Icon1n1:HookScript("OnUpdate", function(s) s:GetParent():StripTextures() end)
			i = i + 1
		end
	end)
end

AS:RegisterSkin(name, AS.SkinOvale)