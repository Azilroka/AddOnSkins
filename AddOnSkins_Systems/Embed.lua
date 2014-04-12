local AS = unpack(AddOnSkins)
local L = AS.Locale

local format, gsub, pairs, ipairs, select, tinsert, tonumber = format, gsub, pairs, ipairs, select, tinsert, tonumber
local EmbedSystem_MainWindow, EmbedSystem_LeftWindow, EmbedSystem_RightWindow

function AS:CreateEmbedSystem()
	if not AS.EmbedSystemCreated then
		EmbedSystem_MainWindow = CreateFrame('Frame', 'EmbedSystem_MainWindow', UIParent)
		EmbedSystem_LeftWindow = CreateFrame('Frame', 'EmbedSystem_LeftWindow', EmbedSystem_MainWindow)
		EmbedSystem_RightWindow = CreateFrame('Frame', 'EmbedSystem_RightWindow', EmbedSystem_MainWindow)
		AS:EmbedSystem_WindowResize()

		self:RegisterEvent('PLAYER_REGEN_DISABLED', 'EmbedEnterCombat')
		self:RegisterEvent('PLAYER_REGEN_ENABLED', 'EmbedExitCombat')

		EmbedSystem_MainWindow:SetScript('OnShow', AS.Embed_Show)
		EmbedSystem_MainWindow:SetScript('OnHide', AS.Embed_Hide)

		AS:CreateToggleButton('RightToggleButton', '►', AS.InfoRight, AS.ChatBackgroundRight, L.Skins.ToggleRightChat, L.Skins.ToggleEmbed)
		RightToggleButton:Point('RIGHT', AS.InfoRight, 'RIGHT', -2, 0)

		RightToggleButton:HookScript('OnClick', function(self, button)
			if button == 'RightButton' then
				if EmbedSystem_MainWindow:IsShown() then
					EmbedSystem_MainWindow:Hide()
				else
					EmbedSystem_MainWindow:Show()
				end
			end
		end)

		AS:CreateToggleButton('LeftToggleButton', '◄', AS.InfoLeft, AS.ChatBackgroundLeft, L.Skins.ToggleLeftChat, L.Skins.ToggleOptions)
		LeftToggleButton:Point('LEFT', AS.InfoLeft, 'LEFT', 2, 0)
		LeftToggleButton:HookScript('OnClick', function(self, button)
			if button == 'RightButton' then
				Enhanced_Config[1]:ToggleConfig()
			end
		end)

		AS.EmbedSystemCreated = true
	end
end

function AS:EmbedInit()
	if AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual') then
		AS:CreateEmbedSystem()
		AS:Embed_Check(true)
	end
end

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

function AS:CheckEmbed(Embed)
	local MainEmbed, LeftEmbed, RightEmbed, Embed = strlower(AS:CheckOption('EmbedMain')), strlower(AS:CheckOption('EmbedLeft')), strlower(AS:CheckOption('EmbedRight')), strlower(Embed)
	if AS:CheckAddOn(Embed) and (strmatch(MainEmbed, Embed) or strmatch(LeftEmbed, Embed) or strmatch(RightEmbed, Embed)) then
		return true
	else
		return false
	end
end

function AS:Embed_Check(Message)
	if not (AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual')) then return end
	if not AS.EmbedSystemCreated then
		AS:CreateEmbedSystem()
		Message = true
	end
	AS:Embed_Toggle(Message)
	AS:EmbedSystem_WindowResize()
	if not UnitAffectingCombat('player') then
		if AS:CheckOption('EmbedOoC') then
			AS:Embed_Hide()
		else
			AS:Embed_Show()
		end
	end
	if AS:CheckEmbed('Omen') then AS:Embed_Omen() end
	if AS:CheckEmbed('Skada') then AS:Embed_Skada() end
	if AS:CheckEmbed('TinyDPS') then AS:Embed_TinyDPS() end
	if AS:CheckEmbed('Recount') then AS:Embed_Recount() end
	if AS:CheckEmbed('alDamageMeter') then AS:Embed_alDamageMeter() end
	if AS:CheckOption('EmbedCoolLine') then AS:Embed_CoolLine() end
end

function AS:Embed_Toggle(Message)
	local MainEmbed, LeftEmbed, RightEmbed = 'NONE', 'NONE', 'NONE'
	EmbedSystem_MainWindow.FrameName = nil
	EmbedSystem_LeftWindow.FrameName = nil
	EmbedSystem_RightWindow.FrameName = nil
	if AS:CheckOption('EmbedSystem') then
		local MainEmbed = strlower(AS:CheckOption('EmbedMain'))
		if MainEmbed ~= 'skada' and MainEmbed ~= 'omen' and MainEmbed ~= 'recount' and MainEmbed ~= 'tinydps' and MainEmbed ~= 'aldamagemeter' then
			EmbedSystem_MainWindow.FrameName = AS:CheckOption('EmbedMain')
		end
	end
	if AS:CheckOption('EmbedSystemDual') then
		local LeftEmbed, RightEmbed = strlower(AS:CheckOption('EmbedLeft')), strlower(AS:CheckOption('EmbedRight'))
		if LeftEmbed ~= 'skada' and LeftEmbed ~= 'omen' and LeftEmbed ~= 'recount' and LeftEmbed ~= 'tinydps' and LeftEmbed ~= 'aldamagemeter' then
			EmbedSystem_LeftWindow.FrameName = AS:CheckOption('EmbedLeft')
		end
		if RightEmbed ~= 'skada' and RightEmbed ~= 'omen' and RightEmbed ~= 'recount' and RightEmbed ~= 'tinydps' and RightEmbed ~= 'aldamagemeter' then
			EmbedSystem_RightWindow.FrameName = AS:CheckOption('EmbedRight')
		end
	end
	if EmbedSystem_MainWindow.FrameName ~= nil then
		local Frame = _G[EmbedSystem_MainWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_MainWindow)
			Frame:SetInside(EmbedSystem_MainWindow, 0, 0)
		end
	end
	if EmbedSystem_LeftWindow.FrameName ~= nil then
		local Frame = _G[EmbedSystem_LeftWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_LeftWindow)
			Frame:SetInside(EmbedSystem_LeftWindow, 0, 0)
		end
	end
	if EmbedSystem_RightWindow.FrameName ~= nil then
		local Frame = _G[EmbedSystem_RightWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_RightWindow)
			Frame:SetInside(EmbedSystem_RightWindow, 0, 0)
		end
	end
	if Message then
		local Message = format("Main: '%s'", AS:CheckOption('EmbedMain'))
		if AS:CheckOption('EmbedSystemDual') then Message = format("Left: '%s' | Right: '%s'", AS:CheckOption('EmbedLeft'), AS:CheckOption('EmbedRight')) end
		AS:Print(format('Embed System: - %s', Message))
	end
end

if AS:CheckAddOn('Recount') then
	function AS:Embed_Recount()
		local EmbedParent = EmbedSystem_MainWindow
		if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Recount' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
		EmbedParent.FrameName = "Recount_MainWindow"

		Recount_MainWindow:SetParent(EmbedParent)
		Recount_MainWindow:ClearAllPoints()
		Recount_MainWindow:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 6)
		Recount_MainWindow:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
		if Recount.MainWindow.backdrop then Recount.MainWindow.backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default') end
		if not AS:CheckOption('RecountBackdrop') then Recount.MainWindow.backdrop:Hide() end

		Recount.db.profile.Locked = true
		Recount.db.profile.Scaling = 1
		Recount.db.profile.ClampToScreen = true
		Recount.db.profile.FrameStrata = '2-LOW'
		Recount:SetStrataAndClamp()
		Recount:LockWindows(true)
		Recount:ResizeMainWindow()
	end
end

if AS:CheckAddOn('Omen') then
	function AS:Embed_Omen()
		local EmbedParent = EmbedSystem_MainWindow
		if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Omen' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
		EmbedParent.FrameName = "OmenAnchor"

		AS:SkinTitleBar(OmenTitle, 'Default')
		AS:SkinFrame(OmenBarList, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
		if not AS:CheckOption('OmenBackdrop') then OmenBarList:StripTextures() end

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

		OmenAnchor:SetParent(EmbedParent)
		OmenAnchor:ClearAllPoints()
		OmenAnchor:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
		OmenAnchor:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
		local Backdrop = OmenAnchor.backdrop or OmenAnchor.Backdrop
		if not Backdrop then
			OmenAnchor:CreateBackdrop()
			Backdrop = OmenAnchor.backdrop or OmenAnchor.Backdrop
			Backdrop:SetOutside(OmenAnchor, 0, 0)
		end
	end
end

if AS:CheckAddOn('TinyDPS') then
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
end

if AS:CheckAddOn('alDamageMeter') then
	function AS:Embed_alDamageMeter()
		local EmbedParent = EmbedSystem_MainWindow
		if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'alDamageMeter' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
		EmbedParent.FrameName = "alDamageMeterFrame"

		dmconf.barheight = floor((EmbedParent:GetHeight() / dmconf.maxbars) - dmconf.spacing)
		dmconf.width = EmbedParent:GetWidth()
		local Backdrop = alDamageMeterFrame.backdrop or alDamageMeterFrame.Backdrop
		Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
		alDamageMeterFrame.bg:Kill()
		alDamageMeterFrame:ClearAllPoints()
		alDamageMeterFrame:SetInside(EmbedParent, 2, 2)
		alDamageMeterFrame:SetParent(EmbedParent)
		alDamageMeterFrame:SetFrameStrata('LOW')
	end
end

if AS:CheckAddOn('Skada') then
	function AS:Embed_Skada()
		AS.SkadaWindows = {}
		for k, window in pairs(Skada:GetWindows()) do
			tinsert(AS.SkadaWindows, window)
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
			local offsety = (window.db.enabletitle and window.db.title.height or 0) + 2
			window.db.barwidth = width - 4
			window.db.background.height = height - (window.db.enabletitle and window.db.title.height or 0) - 4
			window.db.spark = false
			window.db.barslocked = true
			window.bargroup:ClearAllPoints()
			window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, -offsety)
			window.bargroup:SetParent(relativeFrame)
			window.bargroup:SetFrameStrata('LOW')
			window.bargroup:SetBackdrop(nil)
			local Backdrop = window.bargroup.backdrop or window.bargroup.Backdrop
			if Backdrop then
				Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and "Transparent" or 'Default')
				if not AS:CheckOption('SkadaBackdrop') then Backdrop:Hide() else Backdrop:Show() end
			end
			barmod.ApplySettings(barmod, window)
		end
		
		if NumberToEmbed == 1 then
			local EmbedParent = EmbedSystem_MainWindow
			if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Skada' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
			EmbedWindow(AS.SkadaWindows[1], EmbedParent:GetWidth(), EmbedParent:GetHeight(), 'TOPLEFT', EmbedParent, 'TOPLEFT', 2, 0)
		elseif NumberToEmbed == 2 then
			EmbedWindow(AS.SkadaWindows[1], EmbedSystem_LeftWindow:GetWidth(), EmbedSystem_LeftWindow:GetHeight(), 'TOPLEFT', EmbedSystem_LeftWindow, 'TOPLEFT', 2, 0)
			EmbedWindow(AS.SkadaWindows[2], EmbedSystem_RightWindow:GetWidth(), EmbedSystem_RightWindow:GetHeight(), 'TOPLEFT', EmbedSystem_RightWindow, 'TOPLEFT', 2, 0)
		end
	end
end

if AS:CheckAddOn('CoolLine') then
	function AS:Embed_CoolLine()
		if not CoolLineDB.vertical then
			if DuffedUI then
				CoolLine:Point('BOTTOM', AS.ActionBar2, 'TOP', 0, 3)
				CoolLineDB.h = ActionButton1:GetHeight()
				CoolLineDB.w = AS.ActionBar2:GetWidth()
			elseif Tukui then
				local function OnShow()
					CoolLine:Point('BOTTOM', AS.ActionBar4, 'TOP', 0, 1)
					CoolLineDB.h = ActionButton1:GetHeight()
					CoolLineDB.w = AS.ActionBar4:GetWidth()
					CoolLine.updatelook()
				end

				local function OnHide()
					CoolLine:Point('BOTTOM', AS.ActionBar1, 'TOP', 0, 1)
					CoolLineDB.h = ActionButton1:GetHeight()
					CoolLineDB.w = AS.ActionBar1:GetWidth()
					CoolLine.updatelook()
				end

				if AS.ActionBar4:IsShown() then
					OnShow()
				else
					OnHide()
				end
				AS.ActionBar4:HookScript('OnShow', OnShow)
				AS.ActionBar4:HookScript('OnHide', OnHide)
			end
			CoolLine.updatelook()
		end
	end
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