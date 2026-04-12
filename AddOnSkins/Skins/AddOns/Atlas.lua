-- Atlas skin for AddOnSkins.
-- Supports the Retail-engine Atlas fork used on TBC Anniversary servers.

local AS = unpack(AddOnSkins)

local ARROW_TEX = [[Interface\AddOns\AddOnSkins\Media\Textures\Arrow]]
local ARROW_ROTATION_DOWN = 3.14

local function Safe(func, name)
	local f = type(name) == "string" and _G[name] or name
	if f then func(AS, f) end
end

-- ----------------------------------------------------------------
-- WowStyle1DropdownTemplate skin
-- ----------------------------------------------------------------

local function SkinWowStyleDropdown(name)
	local f = _G[name]
	if not f or f._atlasSkinned then return end
	f._atlasSkinned = true

	for _, child in ipairs({f:GetChildren()}) do
		child:Hide()
	end

	for i = 1, f:GetNumRegions() do
		local r = select(i, f:GetRegions())
		if r and r ~= f.Arrow and r ~= f.Text and r ~= f.Label then
			if r.SetTexture then r:SetTexture(nil) end
			if r.SetAtlas   then pcall(r.SetAtlas, r, '') end
			r:SetAlpha(0)
		end
	end

	AS:SetTemplate(f)

	if f.Arrow then
		if f.Arrow.SetAtlas then pcall(f.Arrow.SetAtlas, f.Arrow, nil) end
		f.Arrow:SetTexture(ARROW_TEX, 'CLAMPTOBLACKADDITIVE', 'CLAMPTOBLACKADDITIVE')
		f.Arrow:SetRotation(ARROW_ROTATION_DOWN)
		f.Arrow:SetVertexColor(1, 1, 1)
		f.Arrow:SetAlpha(1)

		if f.Arrow.SetAtlas then
			hooksecurefunc(f.Arrow, 'SetAtlas', function(self)
				self:SetTexture(ARROW_TEX, 'CLAMPTOBLACKADDITIVE', 'CLAMPTOBLACKADDITIVE')
				self:SetRotation(ARROW_ROTATION_DOWN)
				self:SetVertexColor(1, 1, 1)
			end)
		end

		f:HookScript('OnEnter', function()
			f.Arrow:SetVertexColor(unpack(AS.Color))
			if f.SetBackdropBorderColor then f:SetBackdropBorderColor(unpack(AS.Color)) end
		end)
		f:HookScript('OnLeave', function()
			f.Arrow:SetVertexColor(1, 1, 1)
			if f.SetBackdropBorderColor then f:SetBackdropBorderColor(unpack(AS.BorderColor)) end
		end)
	end
end

-- ----------------------------------------------------------------
-- Header layout
-- ----------------------------------------------------------------

--[[
    Header layout:

    [Cat v] [Zone v] [Options] [AtlasQuest]         [Lock][X]

    Options and AtlasQuest are centred on the visible dropdown control
    (not its label). WowStyle1DropdownTemplate has the Label anchored
    14px above the frame top, so the visible control centre sits at
    frame.CENTRE - no extra Y offset needed when anchoring to CENTER.

    Close and Lock sit flush in the top-right corner. The icon visible
    to their left (AtlasLoot/LFG) is hidden by default and not part of
    the normal header flow.
--]]

-- Apply ElvUI-style dark backdrop + accent border on hover to a button.
-- Hides all existing button textures (UIPanelButtonTemplate gloss, highlight, etc.)
-- without calling StripTextures which breaks Classic backdrop creation.
-- keepIcon: if true, skips hiding regions (for Lock/LFG which have an icon texture).
local function ApplyButtonSkin(btn, keepIcon)
	if not btn then return end
	-- Clear Blizzard template textures.
	if not keepIcon and btn.SetNormalTexture then btn:SetNormalTexture('') end
	if btn.SetHighlightTexture then btn:SetHighlightTexture('') end
	if btn.SetPushedTexture    then btn:SetPushedTexture('')    end
	if btn.SetDisabledTexture  then btn:SetDisabledTexture('')  end
	-- Hide any remaining region textures (e.g. UIPanelButtonTemplate .Center, gloss).
	if not keepIcon then
		for i = 1, btn:GetNumRegions() do
			local r = select(i, btn:GetRegions())
			if r and r.IsObjectType and r:IsObjectType('Texture') then r:Hide() end
		end
	end
	-- Apply dark backdrop + border. glossTex=false = no statusbar gloss layer.
	if not btn.SetBackdrop and BackdropTemplateMixin then
		Mixin(btn, BackdropTemplateMixin)
	end
	AS.Skins:SetTemplate(btn, nil, false)
	-- Accent border on hover, plain border on leave.
	if not btn._atlasHoverHooked then
		btn._atlasHoverHooked = true
		btn:HookScript('OnEnter', AS.Skins.SetModifiedBackdrop)
		btn:HookScript('OnLeave', AS.Skins.SetOriginalBackdrop)
	end
end

local function SkinNoGlowBtn(btn)
	ApplyButtonSkin(btn, false)
end
AS.ApplyAtlasButtonSkin = ApplyButtonSkin  -- exposed for dependent skins (AtlasQuest)

local function SkinTransparentBtn(btn)
	if not btn then return end
	-- Kill glow/highlight: SetHighlightTexture('') may not work on XML-defined textures,
	-- so also hide the texture object directly.
	if btn.SetHighlightTexture then btn:SetHighlightTexture('') end
	if btn.SetPushedTexture    then btn:SetPushedTexture('')    end
	if btn.SetDisabledTexture  then btn:SetDisabledTexture('')  end
	local ht = btn.GetHighlightTexture and btn:GetHighlightTexture()
	if ht then ht:SetTexture(nil); ht:Hide() end
	-- Apply backdrop for border-only hover (no fill, border hidden until hover).
	if not btn.SetBackdrop and BackdropTemplateMixin then Mixin(btn, BackdropTemplateMixin) end
	AS.Skins:SetTemplate(btn, nil, false)
	btn:SetBackdropColor(0, 0, 0, 0)
	btn:SetBackdropBorderColor(0, 0, 0, 0)
	if btn.iborder then btn.iborder:Hide() end
	if btn.oborder then btn.oborder:Hide() end
	-- Border-only hover (no glow).
	if not btn._transparentHoverHooked then
		btn._transparentHoverHooked = true
		btn._atlasHoverHooked = true
		btn:HookScript('OnEnter', function(self)
			self:SetBackdropBorderColor(unpack(AS.Color))
		end)
		btn:HookScript('OnLeave', function(self)
			self:SetBackdropBorderColor(0, 0, 0, 0)
		end)
	end
end

local function LayoutHeader(atlas)
	local pn = atlas:GetName()
	local mf = _G[pn..'MapFrame']

	-- Dropdowns: keep their original TOPLEFT anchor (set by Atlas Templates.lua).
	-- We only override the X to flush left; Y stays as Atlas placed them.
	local cat  = _G[pn..'DropDownType']
	local zone = _G[pn..'DropDown']
	if cat then
		cat:ClearAllPoints()
		cat:SetPoint('TOPLEFT', atlas, 'TOPLEFT', 4, -44)
	end
	if cat and zone then
		zone:ClearAllPoints()
		zone:SetPoint('LEFT', cat, 'RIGHT', 8, 0)
	end

	local ref = zone or cat

	-- Options and Close/Lock: all deferred so GetBottom() returns real values.
	local optsBtn  = _G[pn..'OptionsButton']
	local closeBtn = _G[pn..'CloseButton']
	local lockBtn  = _G[pn..'LockButton']

	if optsBtn  then SkinNoGlowBtn(optsBtn);  optsBtn:SetSize(80, 20)  end
	if closeBtn then closeBtn:SetSize(32, 32) end
	if lockBtn  then lockBtn:SetSize(20, 20);  SkinTransparentBtn(lockBtn)  end
	local lfgBtn = _G[pn..'LFGButton']
	if lfgBtn   then lfgBtn:SetSize(20, 20);   SkinTransparentBtn(lfgBtn)   end
	-- Add proper border-highlight hover to close, lock, lfg.


	C_Timer.After(0, function()
		if not ref then return end

		-- Options/AQ: centre on dropdown control.
		-- Dropdown h=24, button h=20 -> bottom of button must be 2px above dd bottom
		-- so their centres align: dd_centre = dd_bot+12, btn_centre = btn_bot+10 -> offset=2.
		local btnCentreOffset = (ref:GetHeight() - 20) / 2
		if optsBtn then
			optsBtn:ClearAllPoints()
			optsBtn:SetPoint('LEFT',   ref, 'RIGHT',  10, 0)
			optsBtn:SetPoint('BOTTOM', ref, 'BOTTOM',  0, btnCentreOffset)
		end

		-- Close/Lock/LFG: centred on AtlasFrameTitleContainer (the dark title bar).
		local titleBar = _G[pn..'TitleContainer'] or _G[pn..'TitleBg']
		local function TopOffsetHeader(btn)
			if titleBar then
				local tCentre = titleBar:GetTop() - titleBar:GetHeight() / 2
				return tCentre - atlas:GetTop() + btn:GetHeight() / 2
			else
				-- Fallback: use header strip centre
				local hH = atlas:GetTop() - (mf and mf:GetTop() or (atlas:GetTop() - 74))
				return -(hH / 2 - btn:GetHeight() / 2)
			end
		end
		if closeBtn then
			closeBtn:ClearAllPoints()
			closeBtn:SetPoint('RIGHT', atlas, 'RIGHT', 0, 0)
			closeBtn:SetPoint('TOP',   atlas, 'TOP',    0, TopOffsetHeader(closeBtn))
		end
		if lockBtn and closeBtn then
			lockBtn:ClearAllPoints()
			lockBtn:SetPoint('RIGHT', closeBtn, 'LEFT', 4, 0)
			lockBtn:SetPoint('TOP',   atlas,    'TOP',   0, TopOffsetHeader(lockBtn))
		end
		local lfg = _G[pn..'LFGButton']
		if lfg and lockBtn then
			lfg:ClearAllPoints()
			lfg:SetPoint('RIGHT', lockBtn, 'LEFT', -4, 0)
			lfg:SetPoint('TOP',   atlas,   'TOP',   0, TopOffsetHeader(lfg))
		end
	end)

	-- AtlasQuest button is a child of AtlasQuestButtonFrame which resets its
	-- XML anchor on every Show. Hook AtlasFrame:OnShow to reapply our layout.
	local function PositionAQButton()
		local aqBtn = _G['AQ_AtlasToggle']
		if not aqBtn or not ref then return end
		aqBtn:SetSize(90, 20)
		local anchor = optsBtn or ref
		local ddCY   = ref:GetBottom() + ref:GetHeight() / 2
		local topOff = ddCY - atlas:GetTop() + aqBtn:GetHeight() / 2
		aqBtn:ClearAllPoints()
		aqBtn:SetPoint('LEFT', anchor, 'RIGHT', 4, 0)
		aqBtn:SetPoint('TOP',  atlas,  'TOP',   0, topOff)

		-- Clear Blizzard template textures every call (AQ restores them on Show).
		if aqBtn.SetNormalTexture    then aqBtn:SetNormalTexture('')    end
		if aqBtn.SetHighlightTexture then aqBtn:SetHighlightTexture('') end
		if aqBtn.SetPushedTexture    then aqBtn:SetPushedTexture('')    end
		for i = 1, aqBtn:GetNumRegions() do
			local r = select(i, aqBtn:GetRegions())
			if r and r.IsObjectType and r:IsObjectType('Texture') then r:Hide() end
		end
		-- Backdrop as a sibling frame so AtlasQuestInsideFrame can't cover it.
		if not aqBtn._asBD then
			-- Parent to aqBtn so it moves with it; frameLevel 0 within the button
			-- ensures it draws behind the button's own FontString regions.
			local bd = CreateFrame('Frame', nil, aqBtn, 'BackdropTemplate')
			bd:SetAllPoints(aqBtn)
			bd:SetFrameLevel(0)
			AS.Skins:SetTemplate(bd, nil, false)
			aqBtn._asBD = bd
			aqBtn:HookScript('OnEnter', function()
				bd:SetBackdropBorderColor(unpack(AS.Color))
			end)
			aqBtn:HookScript('OnLeave', function()
				bd:SetBackdropBorderColor(unpack(AS.BorderColor))
			end)
		end


		-- Block AtlasQuest from restoring textures — hook once per button object.
		if not aqBtn._aqTexHooked then
			aqBtn._aqTexHooked = true
			hooksecurefunc(aqBtn, 'SetNormalTexture', function(self, tex)
				if tex ~= '' and not self._aqSkipHook then
					self._aqSkipHook = true
					self:SetNormalTexture('')
					self._aqSkipHook = false
				end
			end)
			hooksecurefunc(aqBtn, 'SetHighlightTexture', function(self, tex)
				if tex ~= '' and not self._aqSkipHook then
					self._aqSkipHook = true
					self:SetHighlightTexture('')
					self._aqSkipHook = false
				end
			end)
		end

		-- Re-apply backdrop when AtlasQuestInsideFrame shows (actual parent of the button).
		local aqInsideFrame = _G['AtlasQuestInsideFrame']
		if aqInsideFrame and not aqInsideFrame._asSkinHooked then
			aqInsideFrame._asSkinHooked = true
			aqInsideFrame:HookScript('OnShow', function()
				local btn = _G['AQ_AtlasToggle']
				if btn then AS.Skins:SetTemplate(btn, nil, false) end
			end)
		end
	end
	-- AQ loads after Atlas; defer initial placement and reapply on every Show.
	C_Timer.After(1, PositionAQButton)
	atlas:HookScript('OnShow', function() C_Timer.After(0, PositionAQButton) end)
end

-- ----------------------------------------------------------------
-- Main skin
-- ----------------------------------------------------------------

function AS:Atlas(event, addon)
	local loaded = (C_AddOns and C_AddOns.IsAddOnLoaded and C_AddOns.IsAddOnLoaded('Atlas'))
		or (_G.IsAddOnLoaded and _G.IsAddOnLoaded('Atlas'))
	if not loaded then return end

	local AtlasFrame      = _G['AtlasFrame']
	local AtlasFrameSmall = _G['AtlasFrameSmall']

	-- NineSlice piece names created by PortraitFrameTemplate.
	local NINE_SLICE = {
		'TopLeftCorner','TopRightCorner','BottomLeftCorner','BottomRightCorner',
		'TopEdge','BottomEdge','LeftEdge','RightEdge','Center',
		'TopBorder','BottomBorder','LeftBorder','RightBorder',
		'TopLeftBorder','TopRightBorder','BottomLeftBorder','BottomRightBorder',
	}
	local function HideNineSlice(f)
		if not f then return end
		for _, piece in ipairs(NINE_SLICE) do
			local p = _G[f:GetName()..piece]
			if p then p:Hide() end
		end
	end

	local function SkinAtlasFrame(f, mapFrameName)
		if not f then return end
		AS:StripTextures(f)
		HideNineSlice(f)
		-- CreateBackdrop instead of SetTemplate: the backdrop frame sits at
		-- frameLevel-1, below MapFrame children, so it won't tint the map.
		-- SetTemplate creates a Center texture on AtlasFrame itself which
		-- shares frameLevel with MapFrame and draws over the map image.
		if f.SetBackdrop then f:SetBackdrop(nil) end
		if f.Center then f.Center:Hide() end
		AS:CreateBackdrop(f)
		if f.oborder then f.oborder:Hide() end
		AS:CreateShadow(f)
		if f.Portrait          then f.Portrait:Hide() end
		if f.PortraitContainer then f.PortraitContainer:Hide() end
		-- Hide named PortraitFrameTemplate textures StripTextures may miss.
		local pn = f:GetName()
		if pn then
			for _, suffix in ipairs({
				'Bg', 'TitleBg', 'Portrait', 'PortraitFrame', 'TitleText',
				'TopTileStreaks', 'BotLeftCorner', 'BotRightCorner',
			}) do
				local tex = _G[pn..suffix]
				if tex and tex.Hide then tex:Hide() end
			end
		end
		local mf = _G[mapFrameName]
		if mf then
			if mf.NineSlice then mf.NineSlice:Hide() end
			if mf.backdrop    then mf.backdrop:Hide() end
			if mf.SetBackdrop then mf:SetBackdrop(nil) end
		end
	end

	SkinAtlasFrame(AtlasFrame, 'AtlasFrameMapFrame')
	SkinAtlasFrame(AtlasFrameSmall, 'AtlasFrameSmallMapFrame')
	-- Keep NineSlice hidden even if Atlas re-shows it on refresh.
	for _, f in ipairs({ AtlasFrame, AtlasFrameSmall }) do
		if f and f.NineSlice then
			f:HookScript('OnShow', function() f.NineSlice:Hide() end)
		end
	end
	-- Raise SmallMapFrame above AtlasFrameSmall's backdrop so it doesn't bleed through
	local smf = _G['AtlasFrameSmallMapFrame']
	if smf and AtlasFrameSmall then
		-- backdrop is placed at parent level-1; children default to parent+1.
		-- We need smf above the backdrop, so raise it well above AtlasFrameSmall.
		smf:SetFrameLevel(AtlasFrameSmall:GetFrameLevel() + 10)
	end

	-- Strip inset border textures and create ElvUI backdrops
	local function SkinInset(name)
		local f = _G[name]
		if not f then return end
		if f.NineSlice then f.NineSlice:Hide() end
		local bg = _G[name..'Bg']
		if bg then bg:Hide() end
		AS:CreateBackdrop(f)
	end
	SkinInset('AtlasFrameTopInset')
	SkinInset('AtlasFrameBottomInset')
	-- Hide ScrollBox Shadows in BottomInset (they cover the backdrop making it opaque)
	do
		local bi = _G['AtlasFrameBottomInset']
		if bi then
			local sbSkinned = false
			local function FixBotInset()
				if bi.ScrollBox and bi.ScrollBox.Shadows then
					bi.ScrollBox.Shadows:Hide()
				end
				if bi.backdrop then
					-- Lighten slightly: ScrollBox content bleeds through at default alpha.
					local r, g, b, a = bi.backdrop:GetBackdropColor()
					if r then
						bi.backdrop:SetBackdropColor(r + 0.06, g + 0.06, b + 0.06, a)
					end
				end
				-- Skin the WowClassicScrollBar and stretch ScrollBox to fill botInset.
				if not sbSkinned and bi.ScrollBox then
					local sb
					for _, child in ipairs({bi:GetChildren()}) do
						if child.Track and child.GetThumb then
							sb = child
							break
						end
					end
					if sb then
						AS.Skins:HandleTrimScrollBar(sb)
						-- Stretch both ScrollBox and scrollbar to fill botInset.
						local sbW = sb:GetWidth()
						sb:ClearAllPoints()
						sb:SetPoint('TOPRIGHT',    bi, 'TOPRIGHT',    -2, -5)
						sb:SetPoint('BOTTOMRIGHT', bi, 'BOTTOMRIGHT', -2,  5)
						bi.ScrollBox:ClearAllPoints()
						bi.ScrollBox:SetPoint('TOPLEFT',     bi, 'TOPLEFT',     15,        -5)
						bi.ScrollBox:SetPoint('BOTTOMRIGHT', bi, 'BOTTOMRIGHT', -(sbW+4),   5)
						sbSkinned = true
					end
				end
			end
			AtlasFrame:HookScript('OnShow', FixBotInset)
			FixBotInset()
		end
	end

	-- Atlas XML leaves a 6px gap on the right of TopInset/BottomInset.
	-- Anchor their right edge to the frame edge to match the 2px left margin.
	local topInset = _G['AtlasFrameTopInset']
	local botInset = _G['AtlasFrameBottomInset']
	local atlMapFrame = _G['AtlasFrameMapFrame']
	if topInset and atlMapFrame and AtlasFrame then
		topInset:ClearAllPoints()
		topInset:SetPoint('TOPLEFT',  atlMapFrame, 'TOPRIGHT',        0,  0)
		topInset:SetPoint('TOPRIGHT', AtlasFrame,  'TOPRIGHT',       -2,  -74)
		-- Height stays as-is via content; don't set BOTTOM to avoid breaking scroll
		topInset:SetHeight(120)
	end
	if botInset and topInset and AtlasFrame then
		botInset:ClearAllPoints()
		botInset:SetPoint('TOPLEFT',     topInset,  'BOTTOMLEFT',      0,  0)
		botInset:SetPoint('BOTTOMRIGHT', AtlasFrame,'BOTTOMRIGHT',    -2,  0)
	end

	Safe(AS.SkinCloseButton, 'AtlasFrameCloseButton')
	Safe(AS.SkinCloseButton, 'AtlasFrameSmallCloseButton')
	do
		local cb = _G['AtlasFrameCloseButton']
		if cb then cb:SetSize(32, 32) end
		local cbs = _G['AtlasFrameSmallCloseButton']
		if cbs then cbs:SetSize(32, 32) end
	end

	-- AtlasQuestButtonFrame is a 1x1 mouse-capturing frame anchored TOPRIGHT
	-- that would intercept clicks in the corner; its child AQ_AtlasToggle is
	-- repositioned into the header row, so the container frame can be hidden.
	C_Timer.After(1, function()
		local aqf = _G['AtlasQuestButtonFrame']
		if aqf then aqf:EnableMouse(false) end
	end)

	SkinNoGlowBtn(_G['AtlasFrameSwitchButton'])
	SkinNoGlowBtn(_G['AtlasFrameSmallSwitchButton'])

	local ARROW_LEFT  =  math.pi / 2
	local ARROW_RIGHT = -math.pi / 2

	local function SkinCollapseBtn(btn, mf, rotation)
		if not btn then return end
		btn:SetSize(20, 20)
		-- Arrow only, no backdrop, with padding matching other nav buttons
		local PAD = 4
		local arrow = btn:CreateTexture(nil, 'OVERLAY', nil, 7)
		arrow:SetTexture(ARROW_TEX, 'CLAMPTOBLACKADDITIVE', 'CLAMPTOBLACKADDITIVE')
		arrow:SetRotation(rotation)
		arrow:SetPoint('TOPLEFT',     btn, 'TOPLEFT',     PAD,  -PAD)
		arrow:SetPoint('BOTTOMRIGHT', btn, 'BOTTOMRIGHT', -PAD,  PAD)
		btn._arrow = arrow
		-- Hide all native textures by alpha so WoW restoring them has no effect
		local function KillNativeTex()
			local getters = {'GetNormalTexture','GetPushedTexture','GetHighlightTexture','GetDisabledTexture'}
			for _, g in ipairs(getters) do
				local t = btn[g] and btn[g](btn)
				if t and t ~= arrow then t:SetAlpha(0) end
			end
			for i = 1, btn:GetNumRegions() do
				local r = select(i, btn:GetRegions())
				if r and r ~= arrow and r.IsObjectType and r:IsObjectType('Texture') then
					r:SetAlpha(0)
				end
			end
		end
		KillNativeTex()
		-- Run on every possible state change
		btn:HookScript('OnShow',      KillNativeTex)
		btn:HookScript('OnMouseDown', KillNativeTex)
		btn:HookScript('OnMouseUp',   KillNativeTex)
		-- Hover: tint arrow only
		btn:HookScript('OnEnter', function(self)
			self._arrow:SetVertexColor(unpack(AS.Color))
		end)
		btn:HookScript('OnLeave', function(self)
			self._arrow:SetVertexColor(1, 1, 1)
		end)
		if mf then
			btn:ClearAllPoints()
			btn:SetPoint('BOTTOMRIGHT', mf, 'BOTTOMRIGHT', -6, 6)
			btn:SetFrameLevel(mf:GetFrameLevel() + 25)
		end
	end

	local mfMain  = _G['AtlasFrameMapFrame']
	local mfSmall = _G['AtlasFrameSmallMapFrame']
	-- CollapseButton on large frame: legend visible → arrow points left (collapse)
	-- ExpandButton on small frame: legend hidden → arrow points right (expand)
	SkinCollapseBtn(_G['AtlasFrameCollapseButton'],    mfMain,  ARROW_LEFT)
	SkinCollapseBtn(_G['AtlasFrameSmallExpandButton'], mfSmall, ARROW_RIGHT)

	for _, names in ipairs({
		{ 'AtlasFramePrevNextContainer', 'AtlasFrameSwitchButton', 'AtlasFrameSwitchDropdown', 'AtlasFrameMapFrame', AtlasFrame },
		{ 'AtlasFrameSmallPrevNextContainer', 'AtlasFrameSmallSwitchButton', 'AtlasFrameSmallSwitchDropdown', 'AtlasFrameSmallMapFrame', AtlasFrameSmall },
	}) do
		local container  = _G[names[1]]
		local switchBtn  = _G[names[2]]
		local switchDD   = _G[names[3]]
		local mapFrame   = _G[names[4]]
		local atlasFrame = names[5]
		local navPrev    = container and container.PrevMap
		local navNext    = container and container.NextMap
		if container then
			local prev = navPrev
			local next = navNext
			local function SkinNav(btn, dir)
				if not btn then return end
				AS:SkinArrowButton(btn, dir)
				btn:SetSize(24, 24)
				btn._navHovered = false
				local function applyTint()
					if not btn._navHovered then return end
					local t = btn:GetNormalTexture()
					if t then t:SetVertexColor(unpack(AS.Color)) end
					if btn.SetBackdropBorderColor then btn:SetBackdropBorderColor(unpack(AS.Color)) end
				end
				btn:HookScript('OnEnter', function(self)
					self._navHovered = true
					applyTint()
				end)
				btn:HookScript('OnLeave', function(self)
					self._navHovered = false
					local t = self:GetNormalTexture()
					if t then t:SetVertexColor(1, 1, 1) end
					if self.SetBackdropBorderColor then self:SetBackdropBorderColor(unpack(AS.BorderColor)) end
				end)
				-- Re-apply tint whenever Atlas resets the texture.
				hooksecurefunc(btn, 'SetNormalTexture', function() applyTint() end)
			end
			SkinNav(prev, 'left')
			SkinNav(next, 'right')
		end

	end

	for _, parent in ipairs({AtlasFrame, AtlasFrameSmall}) do
		if parent then
			local pn = parent:GetName()
			local aj  = parent.AdventureJournalMap or _G[pn..'AdventureJournalMapButton']
			local ej  = parent.AdventureJournal    or _G[pn..'AdventureJournalButton']
			local al  = parent.AtlasLoot            or _G[pn..'AtlasLootButton']
			if aj then AS:SkinIconButton(aj) end
			if ej then AS:SkinIconButton(ej) end
			if al then AS:SkinIconButton(al) end

			-- LFG: skin and resize; position is handled in LayoutHeader deferred block.
			local lfg = _G[pn..'LFGButton']
			if lfg then
				SkinTransparentBtn(lfg)
				local eyeTex = lfg:GetName() and _G[lfg:GetName()..'Texture']
				if eyeTex then eyeTex:SetAlpha(1); AS:SetInside(eyeTex, lfg) end
				lfg:SetSize(20, 20)
			end
		end
	end

	local search = _G['AtlasSearchEditBox']
	if search and AtlasFrame then
		AS:SkinEditBox(search)
		search:ClearAllPoints()
		search:SetSize(180, 20)
		-- Align vertically with Options/AtlasQuest buttons in the header row.
		-- Buttons bottom = atlas.top - 66; search is 20px tall so same bottom.
		-- Keep X position on the right side, just move Y up to header level.
		C_Timer.After(0.5, function()
			local ref2 = _G['AtlasFrameDropDown']
			if ref2 and AtlasFrame then
				local ddCY   = ref2:GetBottom() + ref2:GetHeight() / 2
				local topOff = ddCY - AtlasFrame:GetTop() + search:GetHeight() / 2
				search:ClearAllPoints()
				search:SetPoint('RIGHT', AtlasFrame, 'RIGHT', -10, 0)
				search:SetPoint('TOP',   AtlasFrame, 'TOP',     0, topOff)
			end
		end)
	end

	-- Skin + reposition dropdowns, then lay out the full header row
	C_Timer.After(0, function()
		for _, name in ipairs({
			'AtlasFrameDropDownType', 'AtlasFrameDropDown',
			'AtlasFrameSmallDropDownType', 'AtlasFrameSmallDropDown',
		}) do
			SkinWowStyleDropdown(name)
		end

		for _, f in ipairs({AtlasFrame, AtlasFrameSmall}) do
			if f then
				for _, child in ipairs({f:GetChildren()}) do
					local n = child.GetName and child:GetName()
					if n and n:find('SwitchDropdown') then SkinWowStyleDropdown(n) end
				end
			end
		end

		if AtlasFrame      then LayoutHeader(AtlasFrame)      end
		if AtlasFrameSmall then LayoutHeader(AtlasFrameSmall) end
	end)

	local function SkinBossButtons()
		local function SkinSeries(prefix)
			local i, btn = 1, _G[prefix..1]
			while btn do
				if not btn._asSkinned then btn._asSkinned = true; btn.isSkinned = nil; SkinNoGlowBtn(btn) end
				i = i + 1; btn = _G[prefix..i]
			end
		end
		SkinSeries('AtlasMapBossButton')
		SkinSeries('AtlasMapBossButtonS')
	end

	if _G['Atlas_MapRefresh'] then
		hooksecurefunc('Atlas_MapRefresh', function() C_Timer.After(0, SkinBossButtons) end)
	end
end

AS:RegisterSkin('Atlas', AS.Atlas)