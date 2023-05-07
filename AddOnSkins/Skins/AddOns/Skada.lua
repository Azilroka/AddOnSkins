local AS, L, S, R = unpack(AddOnSkins)
local ES = AS.EmbedSystem

function R:Skada()
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
			S:HandleFrame(skada.button, 'Default')
			local color = win.db.title.color
			skada.button:SetBackdropColor(color.r, color.g, color.b, color.a or 1)
		end
		if not skada.backdrop then
			S:HandleFrame(skada, true)
		end
		if skada.backdrop then
			skada.backdrop:ClearAllPoints()
			if win.db.reversegrowth then
				skada.backdrop:SetPoint('TOPLEFT', skada, 'TOPLEFT', -2, 2)
				skada.backdrop:SetPoint('BOTTOMRIGHT', win.db.enabletitle and skada.button or skada, 'BOTTOMRIGHT', 2, -2)
			else
				skada.backdrop:SetPoint('TOPLEFT', win.db.enabletitle and skada.button or skada, 'TOPLEFT', -2, 2)
				skada.backdrop:SetPoint('BOTTOMRIGHT', skada, 'BOTTOMRIGHT', 2, -2)
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
			ES:Skada()
		end
	end)
	hooksecurefunc(Skada, 'DeleteWindow', function()
		if AS:CheckEmbed('Skada') then
			ES:Skada()
		end
	end)
	hooksecurefunc(Skada, 'UpdateDisplay', function()
		if AS:CheckEmbed('Skada') and not InCombatLockdown() then
			ES:Skada()
		end
	end)
end

AS:RegisterSkin('Skada')
