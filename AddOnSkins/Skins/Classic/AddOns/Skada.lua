local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Skada') then return end

function AS:Skada()
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
		skada:SetSpacing(1)
		skada:SetFrameLevel(5)
		skada:SetBackdrop(nil)
		if win.db.enabletitle then
			AS:SkinFrame(skada.button, 'Default')
			local color = win.db.title.color
			skada.button:SetBackdropColor(color.r, color.g, color.b, color.a or 1)
		end
		if not skada.Backdrop then
			AS:SkinBackdropFrame(skada)
		end
		if skada.Backdrop then
			skada.Backdrop:ClearAllPoints()
			if win.db.reversegrowth then
				skada.Backdrop:SetPoint('TOPLEFT', skada, 'TOPLEFT', -2, 2)
				skada.Backdrop:SetPoint('BOTTOMRIGHT', win.db.enabletitle and skada.button or skada, 'BOTTOMRIGHT', 2, -2)
			else
				skada.Backdrop:SetPoint('TOPLEFT', win.db.enabletitle and skada.button or skada, 'TOPLEFT', -2, 2)
				skada.Backdrop:SetPoint('BOTTOMRIGHT', skada, 'BOTTOMRIGHT', 2, -2)
			end
		end
	end)

	hooksecurefunc(Skada, 'ToggleWindow', function()
		if not (AS:CheckEmbed('Skada') and AS.EmbedSystemCreated) then return end
		for i, win in ipairs(Skada:GetWindows()) do
			if win:IsShown() then
				AS:SetOption('EmbedIsHidden', false)
				EmbedSystem_MainWindow:Show()
			else
				AS:SetOption('EmbedIsHidden', true)
				EmbedSystem_MainWindow:Hide()
			end
		end
	end)

	hooksecurefunc(Skada, 'CreateWindow', function()
		if AS:CheckEmbed('Skada') then
			AS:Embed_Skada()
		end
	end)
	hooksecurefunc(Skada, 'DeleteWindow', function()
		if AS:CheckEmbed('Skada') then
			AS:Embed_Skada()
		end
	end)
	hooksecurefunc(Skada, 'UpdateDisplay', function()
		if AS:CheckEmbed('Skada') and not InCombatLockdown() then
			AS:Embed_Skada()
		end
	end)
end

AS:RegisterSkin('Skada', AS.Skada)
