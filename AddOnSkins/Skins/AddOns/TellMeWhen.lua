-- TellMeWhen skin for AddOnSkins

local AS = unpack(AddOnSkins)

local BLANK_TEX = (_G.ElvUI and _G.ElvUI[1] and _G.ElvUI[1].media.blankTex)
	or [[Interface\Buttons\WHITE8X8]]

local function HideTMWBorder(f)
	if f and f.border and f.border.SetColor then
		f.border:SetColor(0, 0, 0, 0)
	end
end

-- CheckBox
local function SkinTMWCheckBox(cb)
	if not cb or cb._tmwBorder then return end

	if cb.SetNormalTexture    then cb:SetNormalTexture('') end
	if cb.SetHighlightTexture then cb:SetHighlightTexture('') end
	if cb.SetPushedTexture    then cb:SetPushedTexture('') end
	if cb.SetDisabledTexture  then cb:SetDisabledTexture('') end

	cb:SetCheckedTexture(BLANK_TEX)
	local ct = cb:GetCheckedTexture()
	if ct then ct:SetAlpha(0) end

	for i = 1, cb:GetNumRegions() do
		local r = select(i, cb:GetRegions())
		if r then
			local rtype; pcall(function() rtype = r:GetObjectType() end)
			if rtype ~= 'FontString' then
				if r.SetTexture then r:SetTexture(nil) end
				if r.SetAtlas   then r:SetAtlas('') end
				r:SetAlpha(0)
				if r.Hide then r:Hide() end
			end
		end
	end

	-- Outer border texture (1px, color changes with checked state)
	local border = cb:CreateTexture(nil, 'BACKGROUND')
	border:SetPoint('LEFT', cb, 'LEFT', 2, 0)
	border:SetSize(13, 13)
	border:SetTexture(BLANK_TEX)
	border:SetVertexColor(unpack(AS.BorderColor))
	cb._tmwBorder = border

	-- Fill texture (inner, shown when checked)
	local fill = cb:CreateTexture(nil, 'ARTWORK')
	fill:SetPoint('LEFT', cb, 'LEFT', 3, 0)
	fill:SetSize(11, 11)
	fill:SetTexture(BLANK_TEX)
	fill:SetVertexColor(unpack(AS.Color))
	fill:Hide()
	cb._tmwFill = fill

	local function UpdateCB(f)
		if not f._tmwBorder then return end
		if f:GetChecked() then
			f._tmwBorder:SetVertexColor(unpack(AS.Color))
			if f._tmwFill then f._tmwFill:Show() end
		else
			f._tmwBorder:SetVertexColor(unpack(AS.BorderColor))
			if f._tmwFill then f._tmwFill:Hide() end
		end
	end

	cb:HookScript('OnClick', UpdateCB)
	hooksecurefunc(cb, 'SetChecked', function(f) UpdateCB(f) end)
	C_Timer.After(0, function() UpdateCB(cb) end)
end

-- TMW DropDown
local function SkinTMWDropDown(dd)
	if not dd or dd._tmwDDSkinned then return end
	dd._tmwDDSkinned = true
	HideTMWBorder(dd)
	if dd.Background then dd.Background:SetTexture(nil) end
	AS:SetTemplate(dd)
	if dd.Button then
		local btn = dd.Button
		for _, getter in ipairs({'GetNormalTexture','GetPushedTexture','GetHighlightTexture','GetDisabledTexture'}) do
			local tex = btn[getter] and btn[getter](btn)
			if tex then tex:SetTexture(nil) tex:Hide() end
		end
		local arrow = dd:CreateTexture(nil, 'OVERLAY')
		arrow:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Arrow]])
		arrow:SetRotation(3.14)
		arrow:SetVertexColor(1, 1, 1)
		arrow:SetPoint('RIGHT', dd, 'RIGHT', -4, 0)
		arrow:SetSize(12, 12)
		dd:HookScript('OnEnter', function()
			arrow:SetVertexColor(unpack(AS.Color))
			if dd.SetBackdropBorderColor then dd:SetBackdropBorderColor(unpack(AS.Color)) end
		end)
		dd:HookScript('OnLeave', function()
			arrow:SetVertexColor(1, 1, 1)
			if dd.SetBackdropBorderColor then dd:SetBackdropBorderColor(unpack(AS.BorderColor)) end
		end)
	end
end

-- Button
local function SkinTMWButton(btn)
	if not btn or btn.isSkinned then return end
	HideTMWBorder(btn)
	if btn.Background then btn.Background:SetTexture(nil) end
	AS:SkinButton(btn)
end

-- EditBox
local function SkinTMWEditBox(eb)
	if not eb or eb.Backdrop then return end
	HideTMWBorder(eb)
	if eb.background then eb.background:SetTexture(nil) end
	AS:SkinEditBox(eb)
end

-- Recursive scanner
local function SkinChildren(parent)
	if not parent then return end
	local ok, children = pcall(function() return {parent:GetChildren()} end)
	if not ok then return end
	for _, child in ipairs(children) do
		local t
		pcall(function() t = child:GetObjectType() end)
		if t == 'CheckButton' then
			SkinTMWCheckBox(child)
		elseif child.Background and child.Button and child.Text then
			SkinTMWDropDown(child)
		elseif t == 'Button' and child.Background and child.border then
			SkinTMWButton(child)
		elseif t == 'EditBox' and (child.background or child.border) then
			SkinTMWEditBox(child)
		end
		SkinChildren(child)
	end
end

-- Dialog windows
local function SkinSimpleDialog(f)
	if not f or f._tmwDialogSkinned then return end
	f._tmwDialogSkinned = true
	HideTMWBorder(f)
	AS:StripTextures(f)
	AS:SetTemplate(f)
	AS:CreateShadow(f)
	if f.CloseButton then AS:SkinCloseButton(f.CloseButton) end
end

-- In-game group borders
local function SkinGroupBorder(frame)
	if not frame or frame._asBorderSkinned then return end
	-- border may be a parentKey or a child frame
	local border = frame.border
	if not border then
		for _, child in ipairs({frame:GetChildren()}) do
			if child.SetColor and child.SetBorderSize then
				border = child
				break
			end
		end
	end
	if not border or not border.SetColor then return end
	frame._asBorderSkinned = true
	border:SetColor(unpack(AS.BorderColor))
end

local function SkinAllGroupBorders()
	local TMW = _G['TMW']
	if not TMW then return end
	for _, child in ipairs({TMW:GetChildren()}) do
		SkinGroupBorder(child)
		-- Hook OnShow so newly created groups get skinned when they appear
		if child.border and not child._tmwGroupHooked then
			child._tmwGroupHooked = true
			child:HookScript('OnShow', function(f) SkinGroupBorder(f) end)
		end
	end
	-- Also hook CreateFrame to catch groups created after initial scan
	if not _G._tmwGroupCreateHooked then
		_G._tmwGroupCreateHooked = true
		hooksecurefunc('CreateFrame', function(ftype, fname, parent)
			if ftype ~= 'Frame' then return end
			local p = parent
			while p do
				if p == TMW then
					C_Timer.After(0, function()
						local f = fname and _G[fname]
						if f then SkinGroupBorder(f) end
					end)
					return
				end
				p = p.GetParent and p:GetParent()
			end
		end)
	end
end

-- Global CreateFrame hook for CheckButtons
local cfHooked = false
local function HookCreateFrame()
	if cfHooked then return end
	cfHooked = true
	hooksecurefunc('CreateFrame', function(frameType, frameName, parent)
		if frameType ~= 'CheckButton' then return end
		C_Timer.After(0, function()
			local f = frameName and _G[frameName]
			if not f then return end
			local p = f:GetParent()
			while p do
				local n = p.GetName and p:GetName() or ''
				if n:find('TellMeWhen', 1, true) or n:find('TMW', 1, true) then
					SkinTMWCheckBox(f)
					return
				end
				p = p.GetParent and p:GetParent()
			end
		end)
	end)
end

-- Ticker
local scanTicker
local function StopScan() if scanTicker then scanTicker:Cancel() scanTicker = nil end end

local function ScanEditorAndPages(editor)
	local pages = _G['TellMeWhen_IconEditorPages']
	SkinChildren(editor)
	if pages then SkinChildren(pages) end
end

local function SkinEditorButtons(editor)
	for _, key in ipairs({'ResetButton','UndoButton','RedoButton','OkayButton'}) do
		local btn = editor[key]
		if btn and not btn.isSkinned then
			AS:SkinButton(btn)
		end
	end
	for _, child in ipairs({editor:GetChildren()}) do
		if child:GetObjectType() == 'EditBox' and not child.Backdrop then
			AS:SkinEditBox(child)
		end
	end
end

local function StartEditorScan(editor)
	SkinSimpleDialog(editor)
	SkinEditorButtons(editor)
	ScanEditorAndPages(editor)
	StopScan()
	scanTicker = C_Timer.NewTicker(0.25, function()
		ScanEditorAndPages(editor)
		if not editor:IsShown() then StopScan() end
	end)
end

local tmwOptionsHooked = false

local function SetupTMWOptions()
	if tmwOptionsHooked then return end
	local editor = _G['TellMeWhen_IconEditor']
	if not editor then return end
	tmwOptionsHooked = true

	editor:HookScript('OnShow', function() StartEditorScan(editor) end)
	editor:HookScript('OnHide', StopScan)
	if editor:IsShown() then StartEditorScan(editor) end

	local dialogs = {
		'TellMeWhen_ColorPicker',
		'TellMeWhen_ConfigWarning',
		'TellMeWhen_DBRestoredNofication',
		'TellMeWhen_GUIDConflictResolveDialog',
		'TellMeWhen_ConfirmImportedLuaDialog',
		'TellMeWhen_CpuProfileDialog',
	}
	for _, name in ipairs(dialogs) do
		local f = _G[name]
		if f then
			f:HookScript('OnShow', function()
				SkinSimpleDialog(f)
				SkinChildren(f)
			end)
			if f:IsShown() then
				SkinSimpleDialog(f)
				SkinChildren(f)
			end
		end
	end
end

local function SetTMWIconBorderShown(icon, shown)
	if icon._tmwConfigBorder then
		icon._tmwConfigBorder:SetShown(shown)
	end
end

local function SkinTMWIcon(icon)
	if not icon then return end
	if not TMW or TMW.Locked then return end
	-- In config mode icons use Disabled.blp texture - add ElvUI border around them
	if not icon._tmwConfigBorder then
		local border = CreateFrame('Frame', nil, icon, 'BackdropTemplate')
		border:SetPoint('TOPLEFT', icon, 'TOPLEFT', -1, 1)
		border:SetPoint('BOTTOMRIGHT', icon, 'BOTTOMRIGHT', 1, -1)
		border:SetFrameLevel(icon:GetFrameLevel() - 1)
		AS:SetTemplate(border)
		icon._tmwConfigBorder = border
	end
	icon._tmwConfigBorder:Show()
end

local function HookTMWIconSetup()
	local TMW = _G['TMW']
	if not TMW or not TMW.RegisterCallback then return end
	TMW:RegisterCallback('TMW_ICON_SETUP_POST', function(_, icon)
		-- Show border only in config mode; hide it when locked (normal play)
		if TMW.Locked then
			SetTMWIconBorderShown(icon, false)
		else
			C_Timer.After(0, function() SkinTMWIcon(icon) end)
		end
	end)
	TMW:RegisterCallback('TMW_LOCK_TOGGLED', function(_, locked)
		-- Hide all config borders when entering normal mode
		for _, group in ipairs({TMW:GetChildren()}) do
			for _, icon in ipairs({group:GetChildren()}) do
				SetTMWIconBorderShown(icon, not locked)
			end
		end
	end)
end

-- Entry point
function AS:TellMeWhen(event, addon)
	local loaded = (C_AddOns and C_AddOns.IsAddOnLoaded and C_AddOns.IsAddOnLoaded('TellMeWhen'))
		or (_G.IsAddOnLoaded and _G.IsAddOnLoaded('TellMeWhen'))
	if not loaded then return end

	HookCreateFrame()

	C_Timer.After(0, function()
		SkinAllGroupBorders()
		HookTMWIconSetup()
		if _G['TellMeWhen_IconEditor'] then
			SetupTMWOptions()
		else
			AS:RegisterEvent('ADDON_LOADED', function(_, addonName)
				if addonName == 'TellMeWhen_Options' then
					C_Timer.After(0, SetupTMWOptions)
					AS:UnregisterEvent('ADDON_LOADED')
				end
			end)
		end
	end)
end

AS:RegisterSkin('TellMeWhen', AS.TellMeWhen)
