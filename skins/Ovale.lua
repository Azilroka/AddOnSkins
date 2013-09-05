local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "OvaleSkin"
function AS:SkinOvale()
	hooksecurefunc(Ovale, 'UpdateFrame', function(self)
		if not Icon1n1 then return end
		Icon1n1:GetParent():StripTextures()
		local i = 1
		while _G["Icon"..i.."n1"] do
			if not _G["Icon"..i.."n1"].backdrop then
				AS:SkinBackdropFrame(_G["Icon"..i.."n1"], true)
				_G["Icon"..i.."n1"].backdrop:SetFrameLevel(0)
				_G["Icon"..i.."n1"].backdrop:SetAllPoints()
				_G["Icon"..i.."n1"].backdrop:SetScale(AS.UIScale)
			end
			_G['Icon'..i..'n1'].shortcut:ClearAllPoints()
			_G['Icon'..i..'n1'].shortcut:SetJustifyH('LEFT')
			_G['Icon'..i..'n1'].shortcut:SetPoint('BOTTOMLEFT', _G['Icon'..i..'n1'], 'BOTTOMLEFT', 2, 0)
			_G["Icon"..i.."n1"].icone:SetDrawLayer("ARTWORK")
			_G['Icon'..i..'n1'].aPortee:SetJustifyV('BOTTOM')
			_G['Icon'..i..'n1'].aPortee:SetPoint('BOTTOMLEFT', _G['Icon'..i..'n1'], 'BOTTOMLEFT', 2, 2)
			AS:SkinTexture(_G["Icon"..i.."n1"].icone)
			_G["Icon"..i.."n1"].icone:SetInside(_G["Icon"..i.."n1"].backdrop)
			i = i + 1
		end
	end)
end

AS:RegisterSkin(name, AS.SkinOvale)