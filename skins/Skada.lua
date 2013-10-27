local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'SkadaSkin'
function AS:SkinSkada()
	local L = LibStub('AceLocale-3.0'):GetLocale('Skada', false)

	function Skada:ShowPopup()
		AS:AcceptFrame(L['Do you want to reset Skada?'], function(self) Skada:Reset() self:GetParent():Hide() end)
	end
	
	local SkadaDisplayBar = Skada.displays['bar']

	hooksecurefunc(SkadaDisplayBar, 'AddDisplayOptions', function(self, win, options)
		options.baroptions.args.barspacing = nil
		options.titleoptions.args.texture = nil
		options.titleoptions.args.bordertexture = nil
		options.titleoptions.args.thickness = nil
		options.titleoptions.args.margin = nil
		options.titleoptions.args.color = nil
		options.windowoptions = nil
	end)

	hooksecurefunc(SkadaDisplayBar, 'ApplySettings', function(self, win)
		local skada = win.bargroup
		skada:SetFrameLevel(5)
		skada:SetBackdrop(nil)
		if win.db.enabletitle then
			skada.button:SetTemplate('Default', true)
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

	hooksecurefunc(Skada, 'ToggleWindow', function()
		if not AS:CheckOption('EmbedSkada') then return end
		for i, win in ipairs(Skada:GetWindows()) do
			if win:IsShown() then
				EmbedSystem_MainWindow:Show()
			else
				EmbedSystem_MainWindow:Hide()
			end
		end
	end)

	hooksecurefunc(Skada, 'CreateWindow', function()
		if AS:CheckOption('EmbedSkada') then
			AS:Embed_Skada()
		end
	end)
	hooksecurefunc(Skada, 'DeleteWindow', function()
		if AS:CheckOption('EmbedSkada') then
			AS:Embed_Skada()
		end
	end)
	hooksecurefunc(Skada, 'UpdateDisplay', function()
		if AS:CheckOption('EmbedSkada') and not InCombatLockdown() then
			AS:Embed_Skada()
		end
	end)
end

AS:RegisterSkin(name, AS.SkinSkada)