local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'SkadaSkin'
function AS:SkinSkada()
	local L = LibStub('AceLocale-3.0'):GetLocale('Skada', false)

	function Skada:ShowPopup()
		AS:AcceptFrame(L['Do you want to reset Skada?'], function(self) Skada:Reset() self:GetParent():Hide() end)
	end
	
	local barmod = Skada.displays['bar']

	hooksecurefunc(barmod, 'AddDisplayOptions', function(self, win, options)
		options.baroptions.args.barspacing = nil
		options.titleoptions.args.texture = nil
		options.titleoptions.args.bordertexture = nil
		options.titleoptions.args.thickness = nil
		options.titleoptions.args.margin = nil
		options.titleoptions.args.color = nil
		options.windowoptions = nil
	end)

	hooksecurefunc(barmod, 'ApplySettings', function(self, win)
		local skada = win.bargroup
		skada:SetSpacing(1)
		skada:SetFrameLevel(5)
		skada:SetBackdrop(nil)
		if win.db.enabletitle then
			skada.button:SetTemplate()
		end
		if not skada.button.backdrop then
			AS:SkinBackdropFrame(skada.button)
			skada.button.backdrop:SetAllPoints()
		end
		if not skada.backdrop then
			AS:SkinBackdropFrame(skada)
		end
		if skada.backdrop then
			skada.backdrop:ClearAllPoints()
			skada.backdrop:Point('TOPLEFT', win.db.enabletitle and skada.button or skada, 'TOPLEFT', -2, 2)
			skada.backdrop:Point('BOTTOMRIGHT', skada, 'BOTTOMRIGHT', 2, -2)
		end
	end)
end

AS:RegisterSkin(name, AS.SkinSkada)