local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "OvaleSkin"
function AS:SkinOvale(event)
	if event == "PLAYER_ENTERING_WORLD" then return end
	if not IsAddOnLoaded("Ovale") then return end
	E:Delay(15, function()
		Icon1n1:HookScript("OnUpdate", function(s) s:GetParent():StripTextures() end)
		for i = 1, 3 do
			AS:SkinBackdropFrame(_G["Icon"..i.."n1"], true)
			_G["Icon"..i.."n1"].backdrop:SetFrameLevel(0)
			_G["Icon"..i.."n1"].backdrop:SetAllPoints()
			_G["Icon"..i.."n1"].icone:SetInside(_G["Icon"..i.."n1"].backdrop, 1, 1)
		end
	end)
end

AS:RegisterSkin(name,AS.SkinOvale, "ADDON_LOADED")