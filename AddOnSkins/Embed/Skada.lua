local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('Skada') then return end

-- Cache global variables
--Lua functions
local _G = _G
local pairs = pairs
local strlower = strlower
local wipe, tinsert = table.wipe, table.insert
--WoW API / Variables
-- GLOBALS:

local NumberToEmbed

AS['SkadaWindows'] = {}

function AS:EmbedSkadaWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
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
	if window.bargroup.Backdrop then
		AS:SetTemplate(window.bargroup.Backdrop, AS:CheckOption('EmbedBackdropTransparent') and "Transparent" or 'Default')
		if AS:CheckOption('EmbedBackdrop') then
			window.bargroup.Backdrop:Show()
		else
			window.bargroup.Backdrop:Hide()
		end
	end
	barmod.ApplySettings(barmod, window)
end

function AS:Embed_Skada()
	wipe(AS['SkadaWindows'])
	for _, window in pairs(_G.Skada:GetWindows()) do
		tinsert(AS.SkadaWindows, window)
	end

	NumberToEmbed = 0

	if AS:CheckOption('EmbedSystem') then
		NumberToEmbed = 1
	end

	if AS:CheckOption('EmbedSystemDual') then
		if AS:CheckOption('EmbedRight') == 'Skada' then NumberToEmbed = NumberToEmbed + 1 end
		if AS:CheckOption('EmbedLeft') == 'Skada' then NumberToEmbed = NumberToEmbed + 1 end
	end

	if NumberToEmbed == 1 then
		local EmbedParent = _G.EmbedSystem_MainWindow
		if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Skada' and _G.EmbedSystem_RightWindow or _G.EmbedSystem_LeftWindow end
		AS:EmbedSkadaWindow(AS.SkadaWindows[1], EmbedParent:GetWidth(), EmbedParent:GetHeight(), 'TOPLEFT', EmbedParent, 'TOPLEFT', 2, 0)
	elseif NumberToEmbed == 2 then
		AS:EmbedSkadaWindow(AS.SkadaWindows[1], _G.EmbedSystem_LeftWindow:GetWidth(), _G.EmbedSystem_LeftWindow:GetHeight(), 'TOPLEFT', _G.EmbedSystem_LeftWindow, 'TOPLEFT', 2, 0)
		AS:EmbedSkadaWindow(AS.SkadaWindows[2], _G.EmbedSystem_RightWindow:GetWidth(), _G.EmbedSystem_RightWindow:GetHeight(), 'TOPRIGHT', _G.EmbedSystem_RightWindow, 'TOPRIGHT', -2, 0)
	end
end
