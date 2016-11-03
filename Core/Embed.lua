local AS, ASL = unpack(AddOnSkins)

local format, gsub, pairs, ipairs, select, tinsert, tonumber = format, gsub, pairs, ipairs, select, tinsert, tonumber

AS.ChatFrameHider = CreateFrame('Frame')
AS.ChatFrameHider:Hide()
local EmbedSystem_MainWindow, EmbedSystem_LeftWindow, EmbedSystem_RightWindow

function AS:GetChatWindowInfo()
	local ChatTabInfo = {['NONE'] = 'NONE'}
	for i = 1, NUM_CHAT_WINDOWS do
		ChatTabInfo["ChatFrame"..i] = _G["ChatFrame"..i.."Tab"]:GetText()
	end
	return ChatTabInfo
end

function AS:ToggleChatFrame(Hide)
	if AS:CheckOption('HideChatFrame') == 'NONE' then return end
	if Hide then
		_G[AS:CheckOption('HideChatFrame')].OriginalParent = _G[AS:CheckOption('HideChatFrame')]:GetParent()
		_G[AS:CheckOption('HideChatFrame')]:SetParent(AS.ChatFrameHider)

		_G[AS:CheckOption('HideChatFrame')..'Tab'].OriginalParent = _G[AS:CheckOption('HideChatFrame')..'Tab']:GetParent()
		_G[AS:CheckOption('HideChatFrame')..'Tab']:SetParent(AS.ChatFrameHider)
	else
		if _G[AS:CheckOption('HideChatFrame')].OriginalParent then
			_G[AS:CheckOption('HideChatFrame')]:SetParent(_G[AS:CheckOption('HideChatFrame')].OriginalParent)
			_G[AS:CheckOption('HideChatFrame')..'Tab']:SetParent(_G[AS:CheckOption('HideChatFrame')..'Tab'].OriginalParent)
		end
	end
end

function AS:EmbedInit()
	if AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual') then
		if not AS.EmbedSystemCreated then
			EmbedSystem_MainWindow = CreateFrame('Frame', 'EmbedSystem_MainWindow', UIParent)
			EmbedSystem_LeftWindow = CreateFrame('Frame', 'EmbedSystem_LeftWindow', EmbedSystem_MainWindow)
			EmbedSystem_RightWindow = CreateFrame('Frame', 'EmbedSystem_RightWindow', EmbedSystem_MainWindow)

			AS.EmbedSystemCreated = true

			if (AS:CheckOption('EmbedSystem') and AS:CheckOption('EmbedSystemDual')) then
				AS:DisableOption('EmbedSystem')
				AS:DisableOption('EmbedSystemDual')
			end

			AS:EmbedSystemHooks()
			AS:EmbedSystem_WindowResize()
			AS:Delay(1, function() AS:Embed_Check(true) end)

			EmbedSystem_MainWindow:HookScript('OnShow', AS.Embed_Show)
			EmbedSystem_MainWindow:HookScript('OnHide', AS.Embed_Hide)
			AS:RegisterEvent('PLAYER_REGEN_DISABLED', 'EmbedEnterCombat')
			AS:RegisterEvent('PLAYER_REGEN_ENABLED', 'EmbedExitCombat')

			UIParent:HookScript('OnShow', function()
				if AS:CheckOption('EmbedIsHidden') or AS:CheckOption('EmbedOoC') then
					AS:Embed_Hide()
				else
					AS:Embed_Show()
				end
			end)

			UIParent:GetScript('OnShow')(UIParent)
		end
	end
end

function AS:Embed_Show()
	EmbedSystem_MainWindow:Show();
	if AS:CheckOption('EmbedSystem') then
		if _G[EmbedSystem_MainWindow.FrameName] then _G[EmbedSystem_MainWindow.FrameName]:Show() end
	end
	if AS:CheckOption('EmbedSystemDual') then
		EmbedSystem_LeftWindow:Show()
		EmbedSystem_RightWindow:Show()
		if _G[EmbedSystem_LeftWindow.FrameName] then _G[EmbedSystem_LeftWindow.FrameName]:Show() end
		if _G[EmbedSystem_RightWindow.FrameName] then _G[EmbedSystem_RightWindow.FrameName]:Show() end
	end
	AS:ToggleChatFrame(true)
end

function AS:Embed_Hide()
	EmbedSystem_MainWindow:Hide();
	if AS:CheckOption('EmbedSystem') then
		if _G[EmbedSystem_MainWindow.FrameName] then _G[EmbedSystem_MainWindow.FrameName]:Hide() end
	end
	if AS:CheckOption('EmbedSystemDual') then
		EmbedSystem_LeftWindow:Hide()
		EmbedSystem_RightWindow:Hide()
		if _G[EmbedSystem_LeftWindow.FrameName] then _G[EmbedSystem_LeftWindow.FrameName]:Hide() end
		if _G[EmbedSystem_RightWindow.FrameName] then _G[EmbedSystem_RightWindow.FrameName]:Hide() end
	end
	AS:ToggleChatFrame(false)
end

function AS:CheckEmbed(AddOn)
	local MainEmbed, LeftEmbed, RightEmbed, Embed = strlower(AS:CheckOption('EmbedMain')), strlower(AS:CheckOption('EmbedLeft')), strlower(AS:CheckOption('EmbedRight')), strlower(AddOn)
	if AS:CheckAddOn(AddOn) and ((AS:CheckOption('EmbedSystem') and strmatch(MainEmbed, Embed)) or AS:CheckOption('EmbedSystemDual') and (strmatch(LeftEmbed, Embed) or strmatch(RightEmbed, Embed))) then
		return true
	else
		return false
	end
end

function AS:Embed_Check(Message)
	if not (AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual')) then return end
	if not AS.EmbedSystemCreated then
		AS:EmbedInit()
		Message = true
	end
	AS:Embed_Toggle(Message)
	AS:EmbedSystem_WindowResize()

	for _, Window in pairs({EmbedSystem_MainWindow, EmbedSystem_LeftWindow, EmbedSystem_RightWindow}) do
		Window:SetFrameStrata(strsub(AS:CheckOption('EmbedFrameStrata'), 3))
		Window:SetFrameLevel(AS:CheckOption('EmbedFrameLevel'))
	end

	if AS:CheckEmbed('Details') then AS:Embed_Details() end
	if AS:CheckEmbed('Omen') then AS:Embed_Omen() end
	if AS:CheckEmbed('Skada') then AS:Embed_Skada() end
	if AS:CheckEmbed('TinyDPS') then AS:Embed_TinyDPS() end
	if AS:CheckEmbed('Recount') then AS:Embed_Recount() end
	if AS:CheckEmbed('alDamageMeter') then AS:Embed_alDamageMeter() end
	if AS:CheckOption('EmbedCoolLine', 'CoolLine') then AS:Embed_CoolLine() end
end

function AS:Embed_Toggle(Message)
	local MainEmbed, LeftEmbed, RightEmbed = 'NONE', 'NONE', 'NONE'
	EmbedSystem_MainWindow.FrameName = nil
	EmbedSystem_LeftWindow.FrameName = nil
	EmbedSystem_RightWindow.FrameName = nil
	if AS:CheckOption('EmbedSystem') then
		local MainEmbed = strlower(AS:CheckOption('EmbedMain'))
		if MainEmbed ~= 'details' and MainEmbed ~= 'skada' and MainEmbed ~= 'omen' and MainEmbed ~= 'recount' and MainEmbed ~= 'tinydps' and MainEmbed ~= 'aldamagemeter' then
			EmbedSystem_MainWindow.FrameName = AS:CheckOption('EmbedMain')
		end
	end
	if AS:CheckOption('EmbedSystemDual') then
		local LeftEmbed, RightEmbed = strlower(AS:CheckOption('EmbedLeft')), strlower(AS:CheckOption('EmbedRight'))
		if LeftEmbed ~= 'details' and LeftEmbed ~= 'skada' and LeftEmbed ~= 'omen' and LeftEmbed ~= 'recount' and LeftEmbed ~= 'tinydps' and LeftEmbed ~= 'aldamagemeter' then
			EmbedSystem_LeftWindow.FrameName = AS:CheckOption('EmbedLeft')
		end
		if RightEmbed ~= 'details' and RightEmbed ~= 'skada' and RightEmbed ~= 'omen' and RightEmbed ~= 'recount' and RightEmbed ~= 'tinydps' and RightEmbed ~= 'aldamagemeter' then
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
	if Message and AS:CheckOption('EmbedSystemMessage') then
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
		Recount_MainWindow:SetFrameLevel(AS:CheckOption('EmbedFrameLevel'))

		if AS:CheckOption('Recount') then
			if Recount_MainWindow.Backdrop then
				Recount_MainWindow.Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
				if AS:CheckOption('RecountBackdrop') then
					Recount_MainWindow.Backdrop:Show()
				else
					Recount_MainWindow.Backdrop:Hide()
				end
			end
		end

		Recount.db.profile.Locked = true
		Recount.db.profile.Scaling = 1
		Recount.db.profile.ClampToScreen = true
		Recount.db.profile.FrameStrata = AS:CheckOption('EmbedFrameStrata')
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

		Omen.BarList.SetBackdrop = nil
		Omen.BarList.SetBackdropColor = nil
		Omen.BarList.SetBackdropBorderColor = nil

		if AS:CheckOption('OmenBackdrop') then
			AS:SkinFrame(Omen.BarList, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
		else
			AS:StripTextures(Omen.BarList)
		end

		Omen.BarList.SetBackdrop = AS.Noop
		Omen.BarList.SetBackdropColor = AS.Noop
		Omen.BarList.SetBackdropBorderColor = AS.Noop

		local db = Omen.db
		db.profile.Scale = 1
		db.profile.Bar.Spacing = 1
		db.profile.Background.EdgeSize = 1
		db.profile.Background.BarInset = 2
		db.profile.TitleBar.UseSameBG = true
		db.profile.ShowWith.UseShowWith = false
		db.profile.Locked = true
		db.profile.TitleBar.ShowTitleBar = true
		db.profile.FrameStrata = AS:CheckOption('EmbedFrameStrata')
		Omen:OnProfileChanged(nil, db)

		OmenAnchor:SetParent(EmbedParent)
		OmenAnchor:SetTemplate()
		OmenAnchor:SetFrameLevel(AS:CheckOption('EmbedFrameLevel'))
		OmenAnchor:SetBackdropColor(0,0,0,0)
		OmenAnchor:ClearAllPoints()
		OmenAnchor:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
		OmenAnchor:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
	end
end

if AS:CheckAddOn('TinyDPS') then
	function AS:Embed_TinyDPS()
		local EmbedParent = EmbedSystem_MainWindow
		if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'TinyDPS' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
		EmbedParent.FrameName = "tdpsFrame"

		AS:SkinFrame(tdpsFrame, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')

		tdpsFrame:SetParent(EmbedParent)
		tdpsFrame:SetFrameStrata(EmbedParent:GetFrameStrata())
		tdpsFrame:SetFrameLevel(EmbedParent:GetFrameLevel())
		tdpsAnchor:ClearAllPoints()
		tdpsAnchor:Point('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
		tdpsAnchor:Point('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
		tdpsFrame:SetWidth(tdpsAnchor:GetWidth())

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
		if AS:CheckOption('TinyDPS') then
			alDamageMeterFrame.Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
			alDamageMeterFrame.bg:Kill()
		end
		alDamageMeterFrame:ClearAllPoints()
		alDamageMeterFrame:SetInside(EmbedParent, 2, 2)
		alDamageMeterFrame:SetParent(EmbedParent)
		alDamageMeterFrame:SetFrameStrata(EmbedParent:GetFrameStrata())
		alDamageMeterFrame:SetFrameLevel(EmbedParent:GetFrameLevel())
	end
end

if AS:CheckAddOn('Skada') then
	AS['SkadaWindows'] = {}
	function AS:Embed_Skada()
		wipe(AS['SkadaWindows'])
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
			local offsety
			if window.db.reversegrowth then
				offsety = 2
			else
				offsety = 2 + (window.db.enabletitle and window.db.title.height or 0)
			end
			window.db.barwidth = width - 4
			window.db.background.height = height - (window.db.enabletitle and window.db.title.height or 0) - (AS.PixelMode and 4 or 5)
			window.db.spark = false
			window.db.barslocked = true
			window.db.background.bordertexture = "None"
			window.db.background.strata = relativeFrame:GetFrameStrata()
			window.db.strata = relativeFrame:GetFrameStrata()
			window.bargroup.ClearAllPoints = nil
			window.bargroup:ClearAllPoints()
			window.bargroup.ClearAllPoints = function() end
			window.bargroup.SetPoint = nil
			window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, -offsety)
			window.bargroup.SetPoint = function() end
			window.bargroup:SetParent(relativeFrame)
			window.bargroup:SetFrameLevel(relativeFrame:GetFrameLevel())
			window.bargroup:SetBackdrop(nil)
			if window.bargroup.Backdrop then
				window.bargroup.Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and "Transparent" or 'Default')
				if AS:CheckOption('SkadaBackdrop') then
					window.bargroup.Backdrop:Show()
				else
					window.bargroup.Backdrop:Hide()
				end
			end
			barmod.ApplySettings(barmod, window)
		end
		
		if NumberToEmbed == 1 then
			local EmbedParent = EmbedSystem_MainWindow
			if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Skada' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
			EmbedWindow(AS.SkadaWindows[1], EmbedParent:GetWidth(), EmbedParent:GetHeight(), 'TOPLEFT', EmbedParent, 'TOPLEFT', 2, 0)
		elseif NumberToEmbed == 2 then
			EmbedWindow(AS.SkadaWindows[1], EmbedSystem_LeftWindow:GetWidth(), EmbedSystem_LeftWindow:GetHeight(), 'TOPLEFT', EmbedSystem_LeftWindow, 'TOPLEFT', 2, 0)
			EmbedWindow(AS.SkadaWindows[2], EmbedSystem_RightWindow:GetWidth(), EmbedSystem_RightWindow:GetHeight(), 'TOPRIGHT', EmbedSystem_RightWindow, 'TOPRIGHT', -2, 0)
		end
	end
end

if AS:CheckAddOn('Details') then
	AS['DetailsInstances'] = {}
	function AS:Embed_Details()
		wipe(AS['DetailsInstances'])
		local Details = _G._detalhes --> get the addon object
		--> internally in Details!, a window is called 'instance'.
		--> instances can be opened and closed at any time.
		for inumber, instance in Details:ListInstances() do
			tinsert(AS.DetailsInstances, instance)
		end

		local NumberToEmbed = 0
		if AS:CheckOption('EmbedSystem') then
			NumberToEmbed = 1
		end

		if AS:CheckOption('EmbedSystemDual') then
			if AS:CheckOption('EmbedRight') == 'Details' then NumberToEmbed = NumberToEmbed + 1 end
			if AS:CheckOption('EmbedLeft') == 'Details' then NumberToEmbed = NumberToEmbed + 1 end
		end

		--> raise max window amount if ElvUI needs more windows them the limit on Details!
		--> this limit controls how many windows the player can create, the minimum is 1 the max is 30 the default is 5. The value can be changed on options panel.
		if (Details:GetMaxInstancesAmount() < NumberToEmbed) then
			Details:SetMaxInstancesAmount(NumberToEmbed)
		end

		--> get how many windows already are created
		local instances_amount = Details:GetNumInstancesAmount()

		--> create extra windows if needed
		for i = instances_amount+1, NumberToEmbed do
			local new_instance = Details:CreateInstance (i)
			--> just check is the instance is created okey
			if (type(new_instance) == "table") then
				tinsert(AS.DetailsInstances, new_instance)
			end
		end

		--> remove tooltip borders
		Details:SetTooltipBackdrop("Blizzard Tooltip", 16, {1, 1, 1, 0})

		--> enable bar animations and make the update speed faster
		--Details:SetUseAnimations (true)

		local function EmbedWindow (window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
			if not window then return end

			--> check if the window isn't close.
			if (not window:IsEnabled()) then
				window:EnableInstance()
			end

			window._ElvUIEmbed = true

			local offsety
			if window.bars_grow_direction == 2 then --> bottom to top (reverse)
				offsety = 2
			else
				offsety = 20  --20 is the default height for the title bar
			end

			--> break the group or window 2 will mess with the setpoint
			window:UngroupInstance()

			--> set the skin to ElvUI if not using already
			if (not window.skin:find("ElvUI") and not window.skin:find("Forced")) then
				window:ChangeSkin("ElvUI Style II")
				window:AttributeMenu(true, -19, 5, "ElvUI Font", 11)
				window:SetBarTextSettings(10, "ElvUI Font")
				window:ToolbarMenuSetButtons(true, true, true, true, true, false)
			end

			--> set the point and save the position
			window.baseframe:ClearAllPoints()
			window.baseframe:SetParent(relativeFrame)
			window.baseframe:SetFrameStrata(relativeFrame:GetFrameStrata())
			window.baseframe:SetFrameLevel(relativeFrame:GetFrameLevel())

			ofsx = ofsx - 1 --> wasn't fitting correctly, with -1 it get aligned.
			if (window.skin == "Forced Square") then
				ofsx = ofsx - 1
				if (window:GetId() == 2) then
					window:SetSize(width+1, height - 20)
				else
					window:SetSize(width, height - 20)
				end
				
			elseif (window.skin == "ElvUI Frame Style") then
				if (window:GetId() == 2) then
					window:SetSize(width-1, height - 20)
				else
					if NumberToEmbed == 1 then
						window:SetSize(width-2, height - 20)
					else
						window:SetSize(width, height - 20)
					end
				end
			
			elseif (window.skin == "ElvUI Style II") then
				if (window:GetId() == 2) then
					window:SetSize(width, height - 20)
				else
					if NumberToEmbed == 1 then
						window:SetSize(width-2, height - 20)
					else
						window:SetSize(width-1, height - 20)
					end
				end
			else
				window:SetSize(width, height - 20)
			end
			
			window.baseframe:SetPoint(point, relativeFrame, relativePoint, ofsx, -offsety)
			window:SaveMainWindowPosition()
			window:RestoreMainWindowPosition()

			--> lock it
			window:LockInstance(true)

			--> if is this the second window, remake the group with window 1
			if (window:GetId() == 2) then
				window:MakeInstanceGroup({1}) --> instance number on [1] left [2] bottom [3] right [4] top
			end

			--> setting rowframe as a child of baseframe, this makes the show/hide feature possible on embed.
			if (window:GetId() == 1) then
				DetailsRowFrame1:SetParent (DetailsBaseFrame1)
				DetailsRowFrame1:SetFrameLevel (DetailsBaseFrame1:GetFrameLevel()+1)
			elseif (window:GetId() == 2) then
				DetailsRowFrame2:SetParent (DetailsBaseFrame2)
				DetailsRowFrame2:SetFrameLevel (DetailsBaseFrame2:GetFrameLevel()+1)
			end

			--> reload everything - when calling ChangeSkin without parameter, it uses the same skin and reaply all configs from the window's config table.
			window:ChangeSkin()
			
			if (window.skin ~= "Forced Square") then
				if (AS:CheckOption("DetailsBackdrop")) then
					window:SetBackgroundAlpha (1)
					window:ShowSideBars()
				else
					window:SetBackgroundAlpha (0)
					window:HideSideBars()
					
					local skin = Details.skins [window.skin]
					
					window.row_info.space.left = skin.instance_cprops.row_info.space.left
					window.row_info.space.right = skin.instance_cprops.row_info.space.right
					
					window:InstanceWallpaper (false)
					
					window:SetBarGrowDirection()
				end
			
			elseif (window.skin == "Forced Square") then
				if (AS:CheckOption("DetailsBackdrop")) then
					window:ShowSideBars()
					window:InstanceColor (1, 1, 1, 1, nil, true)
					
					local skin = Details.skins [window.skin]
					window:SetBackgroundAlpha (skin.instance_cprops.bg_alpha)
				else
					window:HideSideBars()
					window:InstanceColor (1, 1, 1, 0, nil, true)
					
					local skin = Details.skins [window.skin]
					
					window.row_info.space.left = skin.instance_cprops.row_info.space.left
					window.row_info.space.right = skin.instance_cprops.row_info.space.right
					
					window:InstanceWallpaper (false)
					window:SetBackgroundAlpha (0)
					
					window:SetBarGrowDirection()
				end
			end

			--> check if the window is in current segment - segment 0 = current / -1 = overall / 1 - 25 = past segments
			if (window:GetSegment() ~= 0) then
				window:SetDisplay (0)
			end
		end
		
		if NumberToEmbed == 1 then
			local EmbedParent = EmbedSystem_MainWindow
			if AS:CheckOption('EmbedSystemDual') then 
				EmbedParent = AS:CheckOption('EmbedRight') == 'Details' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow 
			end
			EmbedWindow(AS.DetailsInstances[1], EmbedParent:GetWidth(), EmbedParent:GetHeight(), 'TOPLEFT', EmbedParent, 'TOPLEFT', 2, 0)
			
			if (AS.DetailsInstances[2]) then
				AS.DetailsInstances[2]._ElvUIEmbed = nil
			end
			
		elseif NumberToEmbed == 2 then
			EmbedWindow(AS.DetailsInstances[1], EmbedSystem_LeftWindow:GetWidth(), EmbedSystem_LeftWindow:GetHeight(), 'TOPLEFT', EmbedSystem_LeftWindow, 'TOPLEFT', 2, 0)
			EmbedWindow(AS.DetailsInstances[2], EmbedSystem_RightWindow:GetWidth(), EmbedSystem_RightWindow:GetHeight(), 'TOPRIGHT', EmbedSystem_RightWindow, 'TOPRIGHT', -2, 0)
			
		end
		
		--> internal events
		local listener = Details:CreateEventListener()
		listener:RegisterEvent("DETAILS_INSTANCE_OPEN")
		listener:RegisterEvent("DETAILS_INSTANCE_CLOSE")

		function listener:OnDetailsEvent (event, ...)
			if (event == "DETAILS_INSTANCE_CLOSE") then
				local instance = select (1, ...)
				--> alert the used about closing an window embed: if the window is hidden from the UI because out of combat on ElvUI, it shows as opened under Details! Options panel.
				if (instance._ElvUIEmbed and _G.DetailsOptionsWindow and _G.DetailsOptionsWindow:IsShown()) then
					Details:Msg("You just closed a window Embed on ElvUI, if wasn't intended click on Reopen.") --> need localization
				end
			elseif (event == "DETAILS_INSTANCE_OPEN") then
				local instance = select(1, ...)
				if (instance._ElvUIEmbed) then
					--> when a window is closed, it is removed from the window group, we need to add the window back to the group.
					if (NumberToEmbed == 2) then
						AS.DetailsInstances[1]:UngroupInstance()
						AS.DetailsInstances[2]:UngroupInstance()
						
						AS.DetailsInstances[1].baseframe:ClearAllPoints()
						AS.DetailsInstances[2].baseframe:ClearAllPoints()
						
						AS.DetailsInstances[1]:RestoreMainWindowPosition()
						AS.DetailsInstances[2]:RestoreMainWindowPosition()

						AS.DetailsInstances[2]:MakeInstanceGroup({1})
					end
				end
			end
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
		AS:Delay(AS:CheckOption('EmbedOoCDelay'), function()
			if not EmbedOoCCombatStart then
				EmbedSystem_MainWindow:Hide()
			end
		end)
	end
end