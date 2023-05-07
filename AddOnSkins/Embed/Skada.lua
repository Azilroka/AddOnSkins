local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('Skada') then return end

local ES = AS.EmbedSystem

local _G = _G
local pairs = pairs
local wipe, tinsert = table.wipe, table.insert

local NumberToEmbed

ES.SkadaWindows = {}

function ES:SkadaWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
	if not window then return end
	local barmod = _G.Skada.displays['bar']
	if window.db.reversegrowth then
		ofsy = 2
	else
		ofsy = 2 + (window.db.enabletitle and window.db.title.height or 0)
	end
	window.db.barwidth = width - 4
	window.db.background.height = height - (window.db.enabletitle and window.db.title.height or 0) - AS:AdjustForTheme(4)
	window.db.spark = false
	window.db.barslocked = true
	window.db.background.bordertexture = "None"
	window.db.background.strata = relativeFrame:GetFrameStrata()
	window.db.strata = relativeFrame:GetFrameStrata()
	window.bargroup.ClearAllPoints = nil
	window.bargroup:ClearAllPoints()
	window.bargroup.ClearAllPoints = function() end
	window.bargroup.SetPoint = nil
	window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, -ofsy)
	window.bargroup.SetPoint = function() end
	window.bargroup:SetParent(relativeFrame)
	window.bargroup:SetFrameLevel(relativeFrame:GetFrameLevel())
	window.bargroup:SetBackdrop(nil)
	if window.bargroup.backdrop then
		AS:SetTemplate(window.bargroup.backdrop, AS:CheckOption('EmbedBackdropTransparent') and 'Transparent')
		if AS:CheckOption('EmbedBackdrop') then
			window.bargroup.backdrop:Show()
		else
			window.bargroup.backdrop:Hide()
		end
	end
	barmod.ApplySettings(barmod, window)
end

function ES:Skada()
	wipe(ES.SkadaWindows)
	for _, window in pairs(_G.Skada:GetWindows()) do
		tinsert(ES.SkadaWindows, window)
	end

	NumberToEmbed = AS:CheckOption('EmbedSystem') and 1 or 0

	if AS:CheckOption('EmbedSystemDual') then
		if AS:CheckOption('EmbedRight') == 'Skada' then NumberToEmbed = NumberToEmbed + 1 end
		if AS:CheckOption('EmbedLeft') == 'Skada' then NumberToEmbed = NumberToEmbed + 1 end
	end

	if NumberToEmbed == 1 then
		local EmbedParent = AS:CheckOption('EmbedSystemDual') and (AS:CheckOption('EmbedRight') == 'Skada' and ES.Right or ES.Left) or ES.Main
		ES:SkadaWindow(ES.SkadaWindows[1], EmbedParent:GetWidth(), EmbedParent:GetHeight(), 'TOPLEFT', EmbedParent, 'TOPLEFT', 2, 0)
	elseif NumberToEmbed == 2 then
		ES:SkadaWindow(ES.SkadaWindows[1], ES.Left:GetWidth(), ES.Left:GetHeight(), 'TOPLEFT', ES.Left, 'TOPLEFT', 2, 0)
		ES:SkadaWindow(ES.SkadaWindows[2], ES.Right:GetWidth(), ES.Right:GetHeight(), 'TOPRIGHT', ES.Right, 'TOPRIGHT', -2, 0)
	end
end
