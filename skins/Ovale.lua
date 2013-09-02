local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "OvaleSkin"
function AS:SkinOvale()
	AS:Delay(5, function()
		if not Icon1n1 then return end
		Icon1n1:GetParent():HookScript("OnUpdate", function(self) self:StripTextures() end)
		for i = 1, 10 do
			if not _G["Icon"..i.."n1"] then return end
			AS:SkinBackdropFrame(_G["Icon"..i.."n1"], true)
			_G["Icon"..i.."n1"].backdrop:SetFrameLevel(0)
			_G["Icon"..i.."n1"].backdrop:SetAllPoints()
			_G["Icon"..i.."n1"].backdrop:SetScale(AS.UIScale)
			_G["Icon"..i.."n1"].icone:SetDrawLayer("OVERLAY")
			AS:SkinTexture(_G["Icon"..i.."n1"].icone)
			_G["Icon"..i.."n1"].icone:SetInside(_G["Icon"..i.."n1"].backdrop, 1, 1)
		end
	end)
end

AS:RegisterSkin(name, AS.SkinOvale)