local AS = unpack(AddOnSkins)

if AS:CheckAddOn('ElvUI') then return end
if not AS:CheckAddOn('DXE') then return end

function AS:DXE(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then return end
	if addon ~= 'DXE' then return end
	DXE.NotifyBarTextureChanged = AS.Noop
	DXE.NotifyBorderChanged = AS.Noop
	DXE.NotifyBorderColorChanged = AS.Noop
	DXE.NotifyBorderEdgeSizeChanged = AS.Noop
	DXE.NotifyBackgroundTextureChanged = AS.Noop
	DXE.NotifyBackgroundInsetChanged = AS.Noop
	DXE.NotifyBackgroundColorChanged = AS.Noop

	local function SkinDXEBar(bar)
		bar:SetTemplate('Transparent')
		bar.bg:SetTexture(nil)
		bar.border.Show = function() end
		bar.border:Hide()
		bar.statusbar:SetStatusBarTexture(AS.NormTex)
		bar.statusbar:ClearAllPoints()
		bar.statusbar:SetInside()
		
		AS:SetTemplate(bar.righticon, 'Default')
		bar.righticon.border.Show = function() end
		bar.righticon.border:Hide()
		bar.righticon:ClearAllPoints()
		bar.righticon:SetPoint('LEFT', bar, 'RIGHT', 2, 0)
		AS:SkinTexture(bar.righticon.t)
		bar.righticon.t:ClearAllPoints()
		bar.righticon.t:SetInside()
		bar.righticon.t:SetDrawLayer('ARTWORK')
		
		AS:SetTemplate(bar.lefticon, 'Default')
		bar.lefticon.border.Show = function() end
		bar.lefticon.border:Hide()
		bar.lefticon:ClearAllPoints()
		bar.lefticon:SetPoint('RIGHT', bar, 'LEFT', -2, 0)
		AS:SkinTexture(bar.lefticon.t)
		bar.lefticon.t:ClearAllPoints()
		bar.lefticon.t:SetInside()
		bar.lefticon.t:SetDrawLayer('ARTWORK')
	end

	DXE.LayoutHealthWatchers_ = DXE.LayoutHealthWatchers
	DXE.LayoutHealthWatchers = function(frame)
		DXE:LayoutHealthWatchers_()
		for i,hw in ipairs(frame.HW) do
			if hw:IsShown() then
				hw:SetTemplate('Transparent')
				hw.border.Show = function() end
				hw.border:Hide()
				hw.healthbar:SetStatusBarTexture(AS.NormTex)
			end
		end
	end

	local function RefreshDXEBars(frame)
		if frame.refreshing then return end
		frame.refreshing = true
		local i = 1
		while _G['DXEAlertBar'..i] do
			local bar = _G['DXEAlertBar'..i]
			if not bar.skinned then
				bar:SetScale(1)
				bar.SetScale = function() return end
				SkinDXEBar(bar)
				bar.skinned = true
			end
			i = i + 1
		end
		frame.refreshing = false
	end

	local DXEAlerts = DXE:GetModule('Alerts')

	local frame = CreateFrame('Frame')
	frame.elapsed = 1
	frame:SetScript('OnUpdate', function(frame,elapsed)
		frame.elapsed = frame.elapsed + elapsed
		if(frame.elapsed >= 1) then
			RefreshDXEBars(DXEAlerts)
			frame.elapsed = 0
		end
	end)

	hooksecurefunc(DXEAlerts, 'Simple', RefreshDXEBars)
	hooksecurefunc(DXEAlerts, 'RefreshBars', RefreshDXEBars)

	DXE:LayoutHealthWatchers()
	DXE.Alerts:RefreshBars()

	if not DXEDB then DXEDB = {} end
	if not DXEDB['profiles'] then DXEDB['profiles'] = {} end
	if not DXEDB['profiles'][AS.MyName..' - '..AS.MyRealm] then DXEDB['profiles'][AS.MyName..' - '..AS.MyRealm] = {} end
	if not DXEDB['profiles'][AS.MyName..' - '..AS.MyRealm]['Globals'] then DXEDB['profiles'][AS.MyName..' - '..AS.MyRealm]['Globals'] = {} end
	DXEDB['profiles'][AS.MyName..' - '..AS.MyRealm]['Globals']['BackgroundTexture'] = AS.Blank
	DXEDB['profiles'][AS.MyName..' - '..AS.MyRealm]['Globals']['BarTexture'] = AS.NormTex
	DXEDB['profiles'][AS.MyName..' - '..AS.MyRealm]['Globals']['Border'] = 'None'
	DXEDB['profiles'][AS.MyName..' - '..AS.MyRealm]['Globals']['Font'] = AS.Font
	DXEDB['profiles'][AS.MyName..' - '..AS.MyRealm]['Globals']['TimerFont'] = AS.Font
end

AS:RegisterSkin('DXE', AS.DXE, 'ADDON_LOADED')