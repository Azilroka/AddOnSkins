local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local format, gsub, pairs, ipairs, select, tinsert, tonumber = format, gsub, pairs, ipairs, select, tinsert, tonumber

local SkadaWindows = {}
local EmbedSystem_MainWindow = CreateFrame('Frame', 'EmbedSystem_MainWindow', UIParent)
local EmbedSystem_LeftWindow = CreateFrame('Frame', 'EmbedSystem_LeftWindow', EmbedSystem_MainWindow)
local EmbedSystem_RightWindow = CreateFrame('Frame', 'EmbedSystem_RightWindow', EmbedSystem_MainWindow)
local ChatHeight, ChatWidth = E.db.chat.panelHeight, E.db.chat.panelWidth

function AS:Embed_Show()
	if AS:CheckOption('EmbedSystem') then
		if _G[EmbedSystem_MainWindow.FrameName] then _G[EmbedSystem_MainWindow.FrameName]:Show() end
	end
	if AS:CheckOption('EmbedSystemDual') then
		EmbedSystem_LeftWindow:Show()
		EmbedSystem_RightWindow:Show()
		if _G[EmbedSystem_LeftWindow.FrameName] then _G[EmbedSystem_LeftWindow.FrameName]:Show() end
		if _G[EmbedSystem_RightWindow.FrameName] then _G[EmbedSystem_RightWindow.FrameName]:Show() end
	end
end

function AS:Embed_Hide()
	EmbedSystem_LeftWindow:Hide()
	EmbedSystem_RightWindow:Hide()
end

function AS:EmbedSystem_WindowResize()
	if InCombatLockdown() then return end
	local DataTextSize = AS:CheckOption('EmbedLeftChat') and E.db.datatexts.leftChatPanel and LeftChatDataPanel:GetHeight() or E.db.datatexts.rightChatPanel and RightChatDataPanel:GetHeight() or 0
	local ChatTabSize = AS:CheckOption('EmbedBelowTop') and RightChatTab:GetHeight() or 0
	local Width = AS.SLE and (E.PixelMode and 4 or 6) or E.PixelMode and 6 or 10
	local Height = E.PixelMode and 2 or 4
	local Spacing = AS.SLE and (E.PixelMode and 2 or 3) or E.PixelMode and 2 or 7
	local Total = AS.SLE and ((E.PixelMode and 4 or 6) + ChatTabSize) or ((E.PixelMode and 6 or 12) + ChatTabSize + DataTextSize)

	local ChatPanel = AS:CheckOption('EmbedLeftChat') and LeftChatPanel or RightChatPanel

	EmbedSystem_MainWindow:SetSize(ChatPanel:GetWidth() - Width, ChatPanel:GetHeight() - Total)
	EmbedSystem_LeftWindow:SetSize(AS:CheckOption('EmbedLeftWidth') + (E.PixelMode and 1 or 0), EmbedSystem_MainWindow:GetHeight() - Height)
	EmbedSystem_RightWindow:SetSize((EmbedSystem_MainWindow:GetWidth() - AS:CheckOption('EmbedLeftWidth')) - 1, EmbedSystem_MainWindow:GetHeight() - Height)

	EmbedSystem_LeftWindow:SetPoint('RIGHT', EmbedSystem_RightWindow, 'LEFT', (E.PixelMode and 0 or -1), 0)
	EmbedSystem_RightWindow:SetPoint('RIGHT', EmbedSystem_MainWindow, 'RIGHT', 0, 0)
	EmbedSystem_MainWindow:SetPoint('BOTTOM', ChatPanel, 'BOTTOM', 0, (AS.SLE and Spacing or (Spacing + DataTextSize)))

	-- Dynamic Range
	if IsAddOnLoaded("ElvUI_Config") then
		E.Options.args.addonskins.args.embed.args.EmbedLeftWidth.min = floor(EmbedSystem_MainWindow:GetWidth() * .25)
		E.Options.args.addonskins.args.embed.args.EmbedLeftWidth.max = floor(EmbedSystem_MainWindow:GetWidth() * .75)
	end
end

function AS:Embed_Check(Message)
	if not (AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual')) then return end
	AS:Embed_Toggle(Message)
	if AS:CheckOption('EmbedOmen', 'Omen') then AS:Embed_Omen() end
	if AS:CheckOption('EmbedSkada', 'Skada') then AS:Embed_Skada() end
	if AS:CheckOption('EmbedTinyDPS', 'TinyDPS') then AS:Embed_TinyDPS() end
	if AS:CheckOption('EmbedRecount', 'Recount') then AS:Embed_Recount() end
	if AS:CheckOption('EmbedalDamageMeter', 'alDamageMeter') then AS:Embed_alDamageMeter() end
end

function AS:Embed_Toggle(Message)
	local MainEmbed, LeftEmbed, RightEmbed = 'NONE', 'NONE', 'NONE'
	EmbedSystem_MainWindow.FrameName = nil
	EmbedSystem_LeftWindow.FrameName = nil
	EmbedSystem_RightWindow.FrameName = nil
	if AS:CheckOption('EmbedSystem') then
		MainEmbed = AS:CheckOption('EmbedMain')
		if MainEmbed ~= 'Skada' and MainEmbed ~= 'Omen' and MainEmbed ~= 'Recount' and MainEmbed ~= 'TinyDPS' and MainEmbed ~= 'alDamageMeter' then
			EmbedSystem_MainWindow.FrameName = MainEmbed
		end
	end
	if AS:CheckOption('EmbedSystemDual') then
		LeftEmbed, RightEmbed = AS:CheckOption('EmbedLeft'), AS:CheckOption('EmbedRight')
		if LeftEmbed ~= 'Skada' and LeftEmbed ~= 'Omen' and LeftEmbed ~= 'Recount' and LeftEmbed ~= 'TinyDPS' and LeftEmbed ~= 'alDamageMeter' then
			EmbedSystem_LeftWindow.FrameName = LeftEmbed
		end
		if RightEmbed ~= 'Skada' and RightEmbed ~= 'Omen' and RightEmbed ~= 'Recount' and RightEmbed ~= 'TinyDPS' and RightEmbed ~= 'alDamageMeter' then
			EmbedSystem_RightWindow.FrameName = RightEmbed
		end
	end
	AS:DisableOption('EmbedalDamageMeter')
	AS:DisableOption('EmbedOmen')
	AS:DisableOption('EmbedRecount')
	AS:DisableOption('EmbedTinyDPS')
	AS:DisableOption('EmbedSkada')
	local Frame = nil
	if EmbedSystem_MainWindow.FrameName ~= nil then
		Frame = _G[EmbedSystem_MainWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_MainWindow)
			Frame:SetInside(EmbedSystem_MainWindow, 0, 0)
		end
	end
	if EmbedSystem_LeftWindow.FrameName ~= nil then
		Frame = _G[EmbedSystem_LeftWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_LeftWindow)
			Frame:SetInside(EmbedSystem_LeftWindow, 0, 0)
		end
	end
	if EmbedSystem_RightWindow.FrameName ~= nil then
		Frame = _G[EmbedSystem_RightWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_RightWindow)
			Frame:SetInside(EmbedSystem_RightWindow, 0, 0)
		end
	end
	if MainEmbed == 'Skada' or LeftEmbed == 'Skada' or RightEmbed == 'Skada' then
		AS:EnableOption('EmbedSkada')
	end
	if MainEmbed == 'Omen' or LeftEmbed == 'Omen' or RightEmbed == 'Omen' then
		AS:EnableOption('EmbedOmen')
	end
	if MainEmbed == 'Recount' or LeftEmbed == 'Recount' or RightEmbed == 'Recount' then
		AS:EnableOption('EmbedRecount')
	end
	if MainEmbed == 'TinyDPS' or LeftEmbed  == 'TinyDPS' or RightEmbed == 'TinyDPS' then
		AS:EnableOption('EmbedTinyDPS')
	end
	if MainEmbed == 'alDamageMeter' or LeftEmbed  == 'alDamageMeter' or RightEmbed == 'alDamageMeter' then
		AS:EnableOption('EmbedalDamageMeter')
	end
	if Message then
		local Message = format("Main: '%s'", AS:CheckOption('EmbedMain'))
		if AS:CheckOption('EmbedSystemDual') then Message = format("Left: '%s' | Right: '%s'", AS:CheckOption('EmbedLeft'), AS:CheckOption('EmbedRight')) end
		AS:Print(format("Embed System: - %s", Message))
	end
end

function AS:Embed_Recount()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Recount' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = "Recount_MainWindow"

	Recount_MainWindow:SetParent(EmbedParent)
	Recount_MainWindow:ClearAllPoints()
	Recount_MainWindow:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 6)
	Recount_MainWindow:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)

	local Backdrop = Recount.MainWindow.backdrop
	if AS:CheckOption('RecountBackdrop') then
		Backdrop:Show()
		Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	else
		Backdrop:Hide()
	end

	Recount.db.profile.Locked = true
	Recount.db.profile.Scaling = 1
	Recount.db.profile.ClampToScreen = true
	Recount.db.profile.FrameStrata = '2-LOW'
	Recount:SetStrataAndClamp()
	Recount:LockWindows(true)
	Recount:ResizeMainWindow()
end

function AS:Embed_Omen()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Omen' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = "OmenAnchor"

	local db = Omen.db
	db.profile.Scale = 1
	db.profile.Bar.Spacing = 1
	db.profile.Background.EdgeSize = 2
	db.profile.Background.BarInset = 2
	db.profile.TitleBar.UseSameBG = true
	db.profile.ShowWith.UseShowWith = false
	db.profile.Locked = true
	db.profile.TitleBar.ShowTitleBar = true
	db.profile.FrameStrata = '2-LOW'
	Omen:OnProfileChanged(nil, db)

	OmenAnchor:StripTextures()
	AS:SkinTitleBar(OmenTitle, 'Default')
	if AS:CheckOption('OmenBackdrop') then
		AS:SkinFrame(OmenBarList, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	else
		OmenBarList:StripTextures()
	end

	OmenAnchor:SetParent(EmbedParent)
	OmenAnchor:ClearAllPoints()
	OmenAnchor:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	OmenAnchor:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
end

function AS:Embed_TinyDPS()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'TinyDPS' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = "tdpsFrame"

	AS:SkinFrame(tdpsFrame, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	tdpsFrame:SetParent(EmbedParent)
	tdpsFrame:SetFrameStrata('LOW')
	tdpsAnchor:ClearAllPoints()
	tdpsAnchor:Point('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	tdpsAnchor:Point('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)

	tdps.hideOOC = false
	tdps.hideIC = false
	tdps.hideSolo = false
	tdps.hidePvP = false
	tdpsRefresh()
end

function AS:Embed_alDamageMeter()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'alDamageMeter' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = "alDamagerMeterFrame"

	dmconf.barheight = floor((EmbedParent:GetHeight() / dmconf.maxbars) - dmconf.spacing)
	dmconf.width = EmbedParent:GetWidth()

	alDamageMeterFrame.backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	alDamageMeterFrame.bg:Kill()
	alDamageMeterFrame:ClearAllPoints()
	alDamageMeterFrame:SetInside(EmbedParent)
	alDamageMeterFrame:SetParent(EmbedParent)
	alDamageMeterFrame:SetFrameStrata('LOW')
end

function AS:Embed_Skada()
	wipe(SkadaWindows)
	for k, window in pairs(Skada:GetWindows()) do
		tinsert(SkadaWindows, window)
	end

	local NumberToEmbed = 0
	if AS:CheckOption('EmbedSystem') then
		NumberToEmbed = 1
	end
	if AS:CheckOption('EmbedSystemDual') then
		if AS:CheckOption('EmbedRight') == 'Skada' then NumberToEmbed = NumberToEmbed + 1 end
		if AS:CheckOption('EmbedLeft') == 'Skada' then NumberToEmbed = NumberToEmbed + 1 end
	end

	local function EmbedWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
		if not window then return end
		local barmod = Skada.displays['bar']
		local offsety = (window.db.enabletitle and window.db.title.height or 0) + (E.PixelMode and 1 or 0)
		window.db.barspacing = 1
		window.db.barwidth = width - 4
		window.db.background.height = height - (window.db.enabletitle and window.db.title.height or 0) - (E.PixelMode and 1 or 0)
		window.db.spark = false
		window.db.barslocked = true
		window.bargroup:ClearAllPoints()
		window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, -offsety)
		window.bargroup:SetParent(relativeFrame)
		window.bargroup:SetFrameStrata('LOW')
		local Backdrop = window.bargroup.backdrop
		if Backdrop then
			if AS:CheckOption('SkadaBackdrop') then
				Backdrop:Show()
				Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
			else
				Backdrop:Hide()
			end
		end
		barmod.ApplySettings(barmod, window)
	end

	if NumberToEmbed == 1 then
		local EmbedParent = EmbedSystem_MainWindow
		if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Skada' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
		EmbedWindow(SkadaWindows[1], EmbedParent:GetWidth(), EmbedParent:GetHeight(), 'TOPLEFT', EmbedParent, 'TOPLEFT', 2, 0)
	elseif NumberToEmbed == 2 then
		EmbedWindow(SkadaWindows[1], EmbedSystem_LeftWindow:GetWidth(), EmbedSystem_LeftWindow:GetHeight(), 'TOPLEFT', EmbedSystem_LeftWindow, 'TOPLEFT', 2, 0)
		EmbedWindow(SkadaWindows[2], EmbedSystem_RightWindow:GetWidth(), EmbedSystem_RightWindow:GetHeight(), 'TOPLEFT', EmbedSystem_RightWindow, 'TOPLEFT', 2, 0)
	end
end

function AS:EmbedInit()
	AS:EmbedSystem_WindowResize()
	AS:Embed_Check(true)
	EmbedSystem_MainWindow:SetScript('OnShow', AS.Embed_Show)
	EmbedSystem_MainWindow:SetScript('OnHide', AS.Embed_Hide)
	if AS:CheckOption('EmbedOoC') and not InCombatLockdown() then AS:Embed_Hide() end

	local ChatPanel = AS:CheckOption('EmbedLeftChat') and LeftChatPanel or RightChatPanel
	local ToggleButton = AS:CheckOption('EmbedLeftChat') and LeftChatToggleButton or RightChatToggleButton

	hooksecurefunc(ChatPanel, 'SetSize', function()
		if ChatHeight ~= E.db.chat.panelHeight or ChatWidth ~= E.db.chat.panelWidth then
			ChatHeight, ChatWidth = E.db.chat.panelHeight, E.db.chat.panelWidth
			AS:EmbedSystem_WindowResize()
			AS:Embed_Check()
		end
	end)
	ToggleButton:SetScript('OnClick', function(self, btn)
		if btn == 'RightButton' then
			if EmbedSystem_MainWindow:IsShown() then
				EmbedSystem_MainWindow:Hide()
			else
				EmbedSystem_MainWindow:Show()
			end
		else
			if E.db[self.parent:GetName()..'Faded'] then
				E.db[self.parent:GetName()..'Faded'] = nil
				UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
				UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
			else
				E.db[self.parent:GetName()..'Faded'] = true
				UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
				UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
				self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
			end
		end
	end)

	ToggleButton:HookScript('OnEnter', function(self, ...)
		GameTooltip:AddDoubleLine(L['Right Click:'], L['Toggle Embedded Addon'], 1, 1, 1)
		GameTooltip:Show()
	end)
end

local EmbedOoCCombatStart
function AS:EmbedEnterCombat(event)
	EmbedOoCCombatStart = true
	if AS:CheckOption('EmbedOoC') then
		EmbedSystem_MainWindow:Show()
	end
end

function AS:EmbedExitCombat(event)
	EmbedOoCCombatStart = false
	if AS:CheckOption('EmbedOoC') then
		AS:Delay(10, function()
			if not EmbedOoCCombatStart then
				EmbedSystem_MainWindow:Hide()
			end
		end)
	end
end
