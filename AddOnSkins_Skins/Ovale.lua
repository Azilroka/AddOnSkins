local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Ovale') then return end

local name = 'OvaleSkin'
function AS:SkinOvale()
	hooksecurefunc(Ovale, 'UpdateFrame', function(self)
		if not Icon1n1 then return end
		Icon1n1:GetParent():StripTextures()
		local i = 1
		while _G["Icon"..i.."n1"] do
			local Backdrop = _G["Icon"..i.."n1"].backdrop or _G["Icon"..i.."n1"].Backdrop
			if not Backdrop then
				AS:SkinBackdropFrame(_G["Icon"..i.."n1"], true)
				Backdrop = _G["Icon"..i.."n1"].backdrop or _G["Icon"..i.."n1"].Backdrop
				Backdrop:SetFrameLevel(0)
				Backdrop:SetAllPoints()
				Backdrop:SetScale(AS.UIScale)
			end
			_G['Icon'..i..'n1'].shortcut:ClearAllPoints()
			_G['Icon'..i..'n1'].shortcut:SetJustifyH('LEFT')
			_G['Icon'..i..'n1'].shortcut:SetPoint('BOTTOMLEFT', _G['Icon'..i..'n1'], 'BOTTOMLEFT', 2, 0)
			_G["Icon"..i.."n1"].icone:SetDrawLayer("ARTWORK")
			_G['Icon'..i..'n1'].aPortee:SetJustifyV('BOTTOM')
			_G['Icon'..i..'n1'].aPortee:SetPoint('BOTTOMLEFT', _G['Icon'..i..'n1'], 'BOTTOMLEFT', 2, 2)
			AS:SkinTexture(_G["Icon"..i.."n1"].icone)
			_G["Icon"..i.."n1"].icone:SetInside(Backdrop)
			i = i + 1
		end
	end)
end

AS:RegisterSkin(name, AS.SkinOvale)