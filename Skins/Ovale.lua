local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Ovale') then return end

function AS:Ovale()
	hooksecurefunc(Ovale, 'UpdateFrame', function(self)
		if not Icon1n1 then return end
		Icon1n1:GetParent():StripTextures()
		local i = 1
		while _G["Icon"..i.."n1"] do
			if not _G["Icon"..i.."n1"].Backdrop then
				AS:SkinBackdropFrame(_G["Icon"..i.."n1"], true)
				_G["Icon"..i.."n1"].Backdrop:SetFrameLevel(0)
				_G["Icon"..i.."n1"].Backdrop:SetAllPoints()
				_G["Icon"..i.."n1"].Backdrop:SetScale(AS.UIScale)
			end
			_G['Icon'..i..'n1'].shortcut:ClearAllPoints()
			_G['Icon'..i..'n1'].shortcut:SetPoint('TOPLEFT', _G['Icon'..i..'n1'], 'TOPLEFT', -1, -3)
			_G["Icon"..i.."n1"].icone:SetDrawLayer("ARTWORK")
			AS:SkinTexture(_G["Icon"..i.."n1"].icone)
			_G["Icon"..i.."n1"].icone:SetInside(_G["Icon"..i.."n1"].Backdrop)
			i = i + 1
		end
	end)
end

AS:RegisterSkin('Ovale', AS.Ovale)