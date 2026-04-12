-- AtlasLootClassic skin for AddOnSkins
-- Targets the sliccer fork (AtlasLootClassic) used on TBC Anniversary servers.
-- GUI frames and BiS footer are created lazily, so skinning is deferred and hooked.

local AS = unpack(AddOnSkins)

local skinned = false
local footerSkinned = false


-- Dark backdrop + accent border on hover; no gloss, no highlight texture.
-- Mirrors ApplyButtonSkin in Atlas.lua for consistent button style.
local function SkinNoGlowBtn(btn)
	if not btn then return end
	if btn.SetNormalTexture    then btn:SetNormalTexture('')    end
	if btn.SetHighlightTexture then btn:SetHighlightTexture('') end
	if btn.SetPushedTexture    then btn:SetPushedTexture('')    end
	if btn.SetDisabledTexture  then btn:SetDisabledTexture('')  end
	for i = 1, btn:GetNumRegions() do
		local r = select(i, btn:GetRegions())
		if r and r.IsObjectType and r:IsObjectType('Texture') then r:Hide() end
	end
	if not btn.SetBackdrop and BackdropTemplateMixin then Mixin(btn, BackdropTemplateMixin) end
	AS.Skins:SetTemplate(btn, nil, false)
	if not btn._alHoverHooked then
		btn._alHoverHooked = true
		btn:HookScript('OnEnter', AS.Skins.SetModifiedBackdrop)
		btn:HookScript('OnLeave', AS.Skins.SetOriginalBackdrop)
	end
end

local function SkinALDropDownPopup()
	local i = 1
	while true do
		local f = _G['AtlasLoot-DropDown-CatFrame'..i]
		if not f then break end
		if f:IsShown() then
			-- Re-apply template every open: SetBackdrop is C-func, can't be hooked.
			-- Do NOT lock SetBackdropColor - categories use bgColor intentionally.
			AS:SetTemplate(f)
			if f.buttons then
				for _, btn in ipairs(f.buttons) do
					if not btn._asSkinned then
						btn._asSkinned = true
						btn:SetHighlightTexture(AS.NormTex or [[Interface\Buttons\UI-Listbox-Highlight]])
						local hl = btn:GetHighlightTexture()
						if hl then hl:SetVertexColor(unpack(AS.Color)); hl:SetAlpha(0.35) end
					end
				end
			end
		end
		i = i + 1
	end
end

local function SkinALDropDown(widget)
	if not widget or not widget.frame then return end
	local f = widget.frame
	AS:StripTextures(f)
	AS:SetTemplate(f)
	if f.title then
		f.title:ClearAllPoints()
		f.title:SetPoint('BOTTOMLEFT', f, 'TOPLEFT', 0, 4)
	end
	-- Lock backdrop color - AtlasLoot resets it on every SetSelected.
	-- Guard against recursion: hook calls SetBackdropColor which re-triggers hook.
	local _lockingBG = false
	hooksecurefunc(f, 'SetBackdropColor', function(self, r, g, b, a)
		if _lockingBG then return end
		local br, bg, bb, ba = unpack(AS.BackdropColor)
		if r ~= br or g ~= bg or b ~= bb then
			_lockingBG = true
			self:SetBackdropColor(br, bg, bb, ba)
			_lockingBG = false
		end
	end)

	if f.button then
		local btn = f.button
		-- Hide original button state textures directly - SetNormalTexture('') does not
		-- clear textures set via C-code on TBC client
		for _, getter in ipairs({'GetNormalTexture','GetPushedTexture','GetHighlightTexture','GetDisabledTexture'}) do
			local tex = btn[getter] and btn[getter](btn)
			if tex then tex:SetTexture(nil) tex:Hide() end
		end
		for i = 1, btn:GetNumRegions() do
			local r = select(i, btn:GetRegions())
			if r and r.SetTexture then r:SetTexture(nil) r:Hide() end
		end
		-- Draw arrow as texture on main frame so hover logic mirrors Atlas dropdowns
		local arrow = f:CreateTexture(nil, 'OVERLAY')
		arrow:SetTexture([[Interface\AddOns\AddOnSkins\Media\Textures\Arrow]])
		arrow:SetRotation(3.14)
		arrow:SetVertexColor(1, 1, 1)
		arrow:SetPoint('RIGHT', f, 'RIGHT', -4, 0)
		arrow:SetSize(12, 12)
		f._arrow = arrow
		local function onEnter()
			arrow:SetVertexColor(unpack(AS.Color))
			f:SetBackdropBorderColor(unpack(AS.Color))
		end
		local function onLeave()
			arrow:SetVertexColor(1, 1, 1)
			f:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
		f:HookScript('OnEnter', onEnter)
		f:HookScript('OnLeave', onLeave)
		-- btn sits on top of f and blocks its OnEnter - hook btn too
		btn:HookScript('OnEnter', onEnter)
		btn:HookScript('OnLeave', onLeave)
		-- Skin popup on open (hook the main frame, not the inner btn)
		f:HookScript('OnClick', function()
			C_Timer.After(0, SkinALDropDownPopup)
		end)
	end
end

local selectBtnHooked = {}
local function SkinALSelectBtn(btn)
	if not btn or selectBtnHooked[btn] then return end
	selectBtnHooked[btn] = true
	-- Kill textures via alpha - hooks on Set* would affect other button types reusing same cache.
	local hl = btn.GetHighlightTexture and btn:GetHighlightTexture()
	if hl then hl:SetAlpha(0) end
	local ct = btn.GetCheckedTexture and btn:GetCheckedTexture()
	if ct then ct:SetAlpha(0) end
	if btn.label then
		btn.label:SetTextColor(1, 1, 1)
		local function applyState()
			if btn:GetChecked() then
				btn.label:SetTextColor(unpack(AS.Color))
			else
				btn.label:SetTextColor(1, 1, 1)
			end
		end
		btn:HookScript('OnEnter', function() btn.label:SetTextColor(unpack(AS.Color)) end)
		btn:HookScript('OnLeave', function() applyState() end)
		-- Use OnShow to catch state set by UpdateScroll when button is reused from cache.
		btn:HookScript('OnShow', function() C_Timer.After(0, applyState) end)
	end
end

local function SkinALSelect(widget)
	if not widget or not widget.frame then return end
	local f = widget.frame
	AS:StripTextures(f)
	AS:SetTemplate(f)
	if f.scrollbar then AS:SkinScrollBar(f.scrollbar) end
	-- Wrap OnEnterButton/OnLeaveButton on the widget object so SetScript can't kill our hook.
	widget.OnEnterButton = function(btn)
		if btn.label then btn.label:SetTextColor(unpack(AS.Color)) end
	end
	widget.OnLeaveButton = function(btn)
		if btn.label then
			if btn:GetChecked() then
				btn.label:SetTextColor(unpack(AS.Color))
			else
				btn.label:SetTextColor(1, 1, 1)
			end
		end
	end
	-- Skin existing buttons and hook UpdateContent to catch future ones.
	for _, btn in ipairs(widget.buttons or {}) do SkinALSelectBtn(btn) end
	local origUpdate = widget.UpdateContent
	widget.UpdateContent = function(self, ...)
		origUpdate(self, ...)
		for _, btn in ipairs(self.buttons or {}) do SkinALSelectBtn(btn) end
	end
end

local function SkinCheckBoxElvUI(cb)
	if not cb or cb._asSkinned then return end
	cb._asSkinned = true  -- own guard; do NOT set isSkinned here - AS:SkinCheckBox checks it
	if cb.SetNormalTexture    then cb:SetNormalTexture('') end
	if cb.SetHighlightTexture then cb:SetHighlightTexture('') end
	if cb.SetPushedTexture    then cb:SetPushedTexture('') end
	if cb.SetDisabledTexture  then cb:SetDisabledTexture('') end
	local function kill(tex)
		if not tex then return end
		if tex.SetTexture then tex:SetTexture(nil) end
		if tex.SetAtlas   then tex:SetAtlas('') end
		tex:SetAlpha(0) tex:Hide()
	end
	kill(cb.GetNormalTexture    and cb:GetNormalTexture())
	kill(cb.GetHighlightTexture and cb:GetHighlightTexture())
	kill(cb.GetPushedTexture    and cb:GetPushedTexture())
	for i = 1, cb:GetNumRegions() do
		local r = select(i, cb:GetRegions())
		if r then
			if r.SetTexture then r:SetTexture(nil) end
			if r.SetAtlas   then r:SetAtlas('') end
		end
	end
	if cb.SetBackdrop then cb:SetBackdrop(nil) end
	AS:SkinCheckBox(cb)
	local blankTex = (_G.ElvUI and _G.ElvUI[1].media.blankTex) or [[Interface\Buttons\WHITE8X8]]
	cb:SetCheckedTexture(blankTex)
	local ct = cb.GetCheckedTexture and cb:GetCheckedTexture()
	if ct then
		ct:SetVertexColor(unpack(AS.Color))
		ct:SetAlpha(1)
		if cb.Backdrop then AS:SetInside(ct, cb.Backdrop) end
	end
	if cb.Backdrop then
		cb:HookScript('OnShow', function(f)
			if f:GetChecked() then
				f.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
			else
				f.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
		hooksecurefunc(cb, 'SetChecked', function(f, checked)
			if f.Backdrop then
				if checked then
					f.Backdrop:SetBackdropBorderColor(unpack(AS.Color))
				else
					f.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end
		end)
	end
end

local function SkinCheckButtonsInFrame(parent)
	if not parent then return end
	-- footer -> centerGroup -> CheckButtons (two levels max)
	for _, child in ipairs({parent:GetChildren()}) do
		if child.GetObjectType and child:GetObjectType() == 'CheckButton' then
			if child:GetScale() ~= 1 then child:SetScale(1) end
			SkinCheckBoxElvUI(child)
		else
			for _, grandchild in ipairs({child:GetChildren()}) do
				if grandchild.GetObjectType and grandchild:GetObjectType() == 'CheckButton' then
					if grandchild:GetScale() ~= 1 then grandchild:SetScale(1) end
					SkinCheckBoxElvUI(grandchild)
				end
			end
		end
	end
end

local function SkinFooter()
	if footerSkinned then return end
	local footer = _G['AtlasLoot_BiS_Footer']
	if not footer then return end
	footerSkinned = true
	AS:StripTextures(footer)
	AS:CreateBackdrop(footer)
	-- Footer sits flush under the main frame; suppress the top border so it
	-- doesn't double up with the main frame's bottom border.
	if footer.Backdrop then
		footer.Backdrop:SetBackdropBorderColor(0, 0, 0, 0)
	end
	SkinCheckButtonsInFrame(footer)

	-- centerGroup is 44px tall designed for scale(1.5) children inside a 24px footer.
	-- After resetting child scale to 1, expand footer and re-center the group.
	footer:SetHeight(60)
	local cg = ({footer:GetChildren()})[1]
	if cg and cg:GetNumPoints() > 0 then
		local _, rel = cg:GetPoint()
		cg:SetHeight(44)
		cg:ClearAllPoints()
		cg:SetPoint('CENTER', rel or footer, 'CENTER', 0, 0)
	end
	-- Move footer 1px below main frame so its top border sits just under the main frame's border.
	local parentFrame = _G['AtlasLoot_GUI-Frame']
	if parentFrame then
		footer:ClearAllPoints()
		footer:SetPoint('TOPLEFT', parentFrame, 'BOTTOMLEFT', 0, -1)
		footer:SetPoint('TOPRIGHT', parentFrame, 'BOTTOMRIGHT', 0, -1)
	end
end

-- Skin the class filter selection popup (created on first right-click)
local function SkinClassFilterPopup(clasFilterButton)
	if not clasFilterButton then return end
	local origOnClick = clasFilterButton:GetScript('OnClick')
	if not origOnClick then return end
	clasFilterButton:HookScript('OnClick', function(self, mouseButton)
		if mouseButton ~= 'RightButton' then return end
		local sf = self.selectionFrame
		if not sf or sf._asSkinned then return end
		sf._asSkinned = true
		AS:StripTextures(sf)
		AS:SetTemplate(sf)
		if sf.buttons then
			for _, btn in ipairs(sf.buttons) do
				AS:StripTextures(btn)
				AS:SetTemplate(btn)
				if btn.icon then AS:SkinTexture(btn.icon) end
				btn:SetHighlightTexture(AS.NormTex or [[Interface\Buttons\UI-Listbox-Highlight]])
				local hl = btn:GetHighlightTexture()
				if hl then
					hl:SetVertexColor(unpack(AS.Color))
					hl:SetAlpha(0.35)
				end
			end
		end
	end)
end

-- Skin the game version selection popup (created on first click)
local function SkinGameVersionPopup(gvButton)
	if not gvButton then return end
	gvButton:HookScript('OnClick', function(self)
		local sf = self.selectionFrame
		if not sf or sf._asSkinned then return end
		sf._asSkinned = true
		AS:StripTextures(sf)
		AS:SetTemplate(sf)
		for _, btn in ipairs(sf.buttons or {}) do
			local hl = btn.GetHighlightTexture and btn:GetHighlightTexture()
			if hl then hl:SetAlpha(0) end
			AS:CreateBackdrop(btn)
			local bd = btn.backdrop or btn.Backdrop
			if bd then
				btn:HookScript('OnEnter', function(self)
					local b = self.backdrop or self.Backdrop
					if b then b:SetBackdropBorderColor(unpack(AS.Color)) end
				end)
				btn:HookScript('OnLeave', function(self)
					local b = self.backdrop or self.Backdrop
					if b then b:SetBackdropBorderColor(unpack(AS.BorderColor)) end
				end)
			end
			if btn.texture then
				AS:SkinTexture(btn.texture)
				AS:SetInside(btn.texture, btn.backdrop or btn.Backdrop or btn)
			end
		end
	end)
end

local function SkinAtlasLoot()
	if skinned then return end
	local ALFrame = _G['AtlasLoot_GUI-Frame']
	if not ALFrame then return end
	skinned = true

	local AL = AtlasLoot
	local GUI = AL and AL.GUI

	-- contentFrame is 510px tall anchored at -70 from top = 580px used; frame is 600px → 20px gap at bottom.
	ALFrame:SetHeight(ALFrame:GetHeight() - 16)
	AS:SkinFrame(ALFrame)
	if ALFrame.titleFrame then
		AS:StripTextures(ALFrame.titleFrame)
		if ALFrame.titleFrame.SetBackdrop then ALFrame.titleFrame:SetBackdrop(nil) end
		-- Tighten titleFrame: remove top gap, reduce height to match Atlas titlebar.
		ALFrame.titleFrame:ClearAllPoints()
		ALFrame.titleFrame:SetPoint('TOPLEFT',  ALFrame, 'TOPLEFT',  10, -2)
		ALFrame.titleFrame:SetPoint('TOPRIGHT', ALFrame, 'TOPRIGHT', -30, -2)
		ALFrame.titleFrame:SetHeight(18)
		-- Match Atlas title style: same font object as PortraitFrameTemplate TitleText.
		if ALFrame.titleFrame.text then
			local ref = AtlasFrame and AtlasFrame.TitleText
			if ref then
				local font, size, flags = ref:GetFont()
				if font then ALFrame.titleFrame.text:SetFont(font, size, flags) end
				local r, g, b, a = ref:GetTextColor()
				ALFrame.titleFrame.text:SetTextColor(r, g, b, a)
			else
				ALFrame.titleFrame.text:SetFontObject(GameFontNormal)
			end
		end
		if ALFrame.titleFrame.version then
			local ver = ALFrame.titleFrame.version
			ver:ClearAllPoints()
			ver:SetPoint('LEFT', ALFrame.titleFrame, 'LEFT', 8, 0)
			ver:SetJustifyH('LEFT')
		end
	end
	local closeBtn = _G['AtlasLoot_GUI-Frame-CloseButton']
	if closeBtn then
		AS:SkinCloseButton(closeBtn)
		closeBtn:SetSize(32, 32)
	end
	if ALFrame.titleFrame and ALFrame.titleFrame.infoButton then
		local ib = ALFrame.titleFrame.infoButton
		if ib.SetHighlightTexture then ib:SetHighlightTexture('') end
		if ib.SetPushedTexture    then ib:SetPushedTexture('') end
		if ib.SetDisabledTexture  then ib:SetDisabledTexture('') end
		local ht = ib.GetHighlightTexture and ib:GetHighlightTexture()
		if ht then ht:SetTexture(nil); ht:Hide() end

		ib:SetSize(16, 16)
		-- Texture is anchored TOPLEFT in XML, not SetAllPoints — fix after resize.
		local ibtex = ib.texture
		if ibtex then
			ibtex:SetAllPoints(ib)
			-- Block OnMouseDown offset script.
			ib:HookScript('OnMouseDown', function() ibtex:SetAllPoints(ib) end)
			ib:HookScript('OnMouseUp',   function() ibtex:SetAllPoints(ib) end)
		end
		do
			local bd = CreateFrame('Frame', nil, ib, BackdropTemplateMixin and 'BackdropTemplate' or nil)
			bd:SetAllPoints(ib)
			bd:SetFrameLevel(max(0, ib:GetFrameLevel() - 1))
			AS.Skins:SetTemplate(bd, nil, false)
			bd:SetBackdropColor(0, 0, 0, 0)
			bd:SetBackdropBorderColor(0, 0, 0, 0)
			ib:HookScript('OnEnter', function() bd:SetBackdropBorderColor(unpack(AS.Color)) end)
			ib:HookScript('OnLeave', function() bd:SetBackdropBorderColor(0, 0, 0, 0) end)
		end
	end
	C_Timer.After(0, function()
		local tf = ALFrame.titleFrame
		if not tf then return end
		local tCentreY = tf:GetTop() - tf:GetHeight() / 2
		local function yOff(btn)
			return tCentreY - ALFrame:GetTop() + btn:GetHeight() / 2
		end
		if closeBtn then
			closeBtn:ClearAllPoints()
			closeBtn:SetPoint('RIGHT', ALFrame, 'RIGHT', 0, 0)
			closeBtn:SetPoint('TOP',   ALFrame, 'TOP',   0, yOff(closeBtn))
		end
		local ib = tf.infoButton
		if ib and closeBtn then
			ib:ClearAllPoints()
			ib:SetPoint('CENTER', closeBtn, 'CENTER', -(closeBtn:GetWidth()/2 + 2 + ib:GetWidth()/2), 0)
		end
	end)

	if GUI and GUI.frame then
		SkinALDropDown(GUI.frame.moduleSelect)
		SkinALDropDown(GUI.frame.subCatSelect)
		SkinALSelect(GUI.frame.difficulty)
		SkinALSelect(GUI.frame.boss)
		SkinALSelect(GUI.frame.extra)

		-- Game version button
		local gvBtn = GUI.frame.gameVersionButton
		if gvBtn then
			if gvBtn.Box then
				for _, line in ipairs(gvBtn.Box) do line:Hide() end
			end
			local gvHl = gvBtn.GetHighlightTexture and gvBtn:GetHighlightTexture()
			if gvHl then gvHl:SetAlpha(0) end
			AS:CreateBackdrop(gvBtn)
			gvBtn:HookScript('OnEnter', function(self)
				local bd = self.backdrop or self.Backdrop
				if bd and bd.SetBackdropBorderColor then bd:SetBackdropBorderColor(unpack(AS.Color)) end
			end)
			gvBtn:HookScript('OnLeave', function(self)
				local bd = self.backdrop or self.Backdrop
				if bd and bd.SetBackdropBorderColor then bd:SetBackdropBorderColor(unpack(AS.BorderColor)) end
			end)
			local tex = gvBtn.texture or GUI.frame.gameVersionLogo
			if tex then AS:SetInside(tex, gvBtn.Backdrop or gvBtn) end
			SkinGameVersionPopup(gvBtn)
		end
	end

	local contentFrame = _G['AtlasLoot_GUI-ItemFrame']
	if contentFrame then
		AS:CreateBackdrop(contentFrame)

		-- Hide the AtlasLoot background textures; the backdrop replaces them.
		-- Also hook SetAlpha/SetColorTexture to prevent RefreshContentBackGround from restoring them.
		for _, key in ipairs({'topBG', 'downBG', 'itemBG'}) do
			local tex = contentFrame[key]
			if tex then
				tex:SetAlpha(0)
				tex:Hide()
				hooksecurefunc(tex, 'SetAlpha', function(self) if self:GetAlpha() > 0 then self:Hide() end end)
				hooksecurefunc(tex, 'SetColorTexture', function(self) self:Hide() end)
			end
		end

		-- Unified button height for the bottom bar.
		-- Text buttons: 22px. Icon buttons: 20px (CreateBackdrop adds 1px border each side).
		local BTN_H  = 22
		local ICON_H = 20

		local function SkinPageBtn(btn, dir)
			if not btn then return end
			AS:SkinArrowButton(btn, dir)
			btn:SetSize(BTN_H, BTN_H)
			btn._navHovered = false
			local function applyTint()
				if not btn._navHovered then return end
				local t = btn:GetNormalTexture()
				if t then t:SetVertexColor(unpack(AS.Color)) end
				if btn.SetBackdropBorderColor then btn:SetBackdropBorderColor(unpack(AS.Color)) end
			end
			btn:HookScript('OnEnter', function(self) self._navHovered = true; applyTint() end)
			btn:HookScript('OnLeave', function(self)
				self._navHovered = false
				local t = self:GetNormalTexture()
				if t then t:SetVertexColor(1, 1, 1) end
				if self.SetBackdropBorderColor then self:SetBackdropBorderColor(unpack(AS.BorderColor)) end
			end)
			hooksecurefunc(btn, 'SetNormalTexture', function() applyTint() end)
		end
		SkinPageBtn(contentFrame.prevPageButton, 'left')
		SkinPageBtn(contentFrame.nextPageButton, 'right')
		if contentFrame.itemsButton   then SkinNoGlowBtn(contentFrame.itemsButton);   contentFrame.itemsButton:SetHeight(BTN_H)   end
		if contentFrame.modelButton   then SkinNoGlowBtn(contentFrame.modelButton);   contentFrame.modelButton:SetHeight(BTN_H)   end
		if contentFrame.soundsButton  then SkinNoGlowBtn(contentFrame.soundsButton);  contentFrame.soundsButton:SetHeight(BTN_H)  end

		-- Icon buttons: ICON_H size, backdrop with border hover, skinned texture.
		local function SkinIconBtn(btn, popupFn)
			if not btn then return end
			btn:SetSize(ICON_H, ICON_H)
			local hl = btn.GetHighlightTexture and btn:GetHighlightTexture()
			if hl then hl:SetAlpha(0) end
			AS:CreateBackdrop(btn)
			local function hoverEnter(self)
				local bd = self.backdrop or self.Backdrop
				if bd then bd:SetBackdropBorderColor(unpack(AS.Color)) end
			end
			local function hoverLeave(self)
				local bd = self.backdrop or self.Backdrop
				if bd then bd:SetBackdropBorderColor(unpack(AS.BorderColor)) end
			end
			btn:HookScript('OnEnter', hoverEnter)
			btn:HookScript('OnLeave', hoverLeave)
			if btn.texture then
				AS:SkinTexture(btn.texture)
				AS:SetInside(btn.texture, btn.backdrop or btn.Backdrop or btn)
			end
			if popupFn then popupFn(btn) end
		end
		SkinIconBtn(contentFrame.clasFilterButton, SkinClassFilterPopup)
		SkinIconBtn(contentFrame.contentPhaseButton)

		if contentFrame.mapButton then
			local mb = contentFrame.mapButton
			SkinIconBtn(mb)
			if mb.highlight then mb.highlight:Hide() end
			local tex = mb.texture
			if tex then
				tex:ClearAllPoints()
				local bd = mb.backdrop or mb.Backdrop
				tex:SetAllPoints(bd or mb)
				AS:SkinTexture(tex)
				local function fixTexCoord(self)
					tex:SetTexCoord(0.125, 0.875, 0.0, 0.5)
					local b = self.backdrop or self.Backdrop
					tex:SetAllPoints(b or self)
				end
				mb:HookScript('OnShow',    fixTexCoord)
				mb:HookScript('OnMouseUp', fixTexCoord)
				fixTexCoord(mb)
			end
			-- Add gap between mapButton and modelButton (natively 0px).
			if contentFrame.modelButton then
				contentFrame.modelButton:ClearAllPoints()
				contentFrame.modelButton:SetPoint('RIGHT', mb, 'LEFT', -4, 0)
			end
		end

		if contentFrame.searchBox then
			AS:SkinEditBox(contentFrame.searchBox)
			contentFrame.searchBox:SetHeight(20)
			contentFrame.searchBox:SetWidth(160)
		end
	end

	if GUI and GUI.Create then
		hooksecurefunc(GUI, 'Create', function()
			C_Timer.After(0, SkinFooter)
		end)
	end

	SkinFooter()
end

function AS:AtlasLoot(event, addon)
	local loaded = (C_AddOns and C_AddOns.IsAddOnLoaded and C_AddOns.IsAddOnLoaded('AtlasLootClassic'))
		or (_G.IsAddOnLoaded and _G.IsAddOnLoaded('AtlasLootClassic'))
	if not loaded then return end

	C_Timer.After(0, function()
		SkinAtlasLoot()

		if not skinned and AtlasLoot and AtlasLoot.GUI and AtlasLoot.GUI.Toggle then
			hooksecurefunc(AtlasLoot.GUI, 'Toggle', function()
				SkinAtlasLoot()
				C_Timer.After(0, SkinFooter)
			end)
		end
	end)
end

AS:RegisterSkin('AtlasLootClassic', AS.AtlasLoot)

-- -----------------------------------------------------------------------
-- Atlas integration: "AtlasLoot" button next to AtlasQuest
-- -----------------------------------------------------------------------
local alAtlasBtn

local function OpenAtlasLootForCurrentMap()
	if not AtlasLoot or not AtlasLoot.GUI then return end
	local atlas = Atlas
	if not atlas or not atlas.db then return end

	-- Get current zoneID from Atlas dropdown selection.
	local profile = atlas.db.profile
	local mod  = profile.options.dropdowns.module
	local zone = profile.options.dropdowns.zone
	local zoneID = ATLAS_DROPDOWNS and ATLAS_DROPDOWNS[mod] and ATLAS_DROPDOWNS[mod][zone]
	if not zoneID then return end

	-- Search all AtlasLoot modules for a record whose AtlasMapFile contains zoneID.
	local foundModule, foundDataID
	for modName, modData in pairs(AtlasLoot.ItemDB.Storage or {}) do
		if type(modData) == 'table' then
			for dataID, entry in pairs(modData) do
				if type(entry) == 'table' and entry.AtlasMapFile then
					local files = entry.AtlasMapFile
					if type(files) == 'string' then files = {files} end
					for _, f in ipairs(files) do
						if f == zoneID then
							foundModule = modName
							foundDataID = dataID
							break
						end
					end
				end
				if foundDataID then break end
			end
		end
		if foundDataID then break end
	end

	local db = AtlasLoot.db.GUI
	if not AtlasLoot.GUI.frame:IsVisible() then
		AtlasLoot.GUI.frame:Show()
	end

	if foundModule and foundDataID then
		if foundModule ~= db.selected[1] then
			AtlasLoot.GUI.frame.moduleSelect:SetSelected(foundModule)
		end
		if foundDataID ~= db.selected[2] then
			AtlasLoot.GUI.frame.subCatSelect:SetSelected(foundDataID)
		end
		AtlasLoot.GUI.ItemFrame:Refresh(true)
	end
end

local function CreateAtlasLootAtlasButton()
	if alAtlasBtn then return end
	local atlas = _G['AtlasFrame']
	if not atlas then return end
	local aqBtn = _G['AQ_AtlasToggle']
	if not aqBtn then return end

	alAtlasBtn = CreateFrame('Button', 'AS_AtlasLootButton', atlas)
	alAtlasBtn:SetSize(90, 20)
	alAtlasBtn:SetPoint('LEFT', aqBtn, 'RIGHT', 4, 0)
	alAtlasBtn:SetPoint('TOP',  aqBtn, 'TOP',   0, 0)

	-- FontString (same style as AQ_AtlasToggle which uses UIPanelButtonTemplate)
	local fs = alAtlasBtn:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	fs:SetAllPoints(alAtlasBtn)
	fs:SetText('AtlasLoot')

	-- Backdrop as child at frameLevel 0 — draws behind FontString, same as AQ pattern.
	local bd = CreateFrame('Frame', nil, alAtlasBtn, 'BackdropTemplate')
	bd:SetAllPoints(alAtlasBtn)
	bd:SetFrameLevel(0)
	AS.Skins:SetTemplate(bd, nil, false)

	-- Normal text color from GameFontNormal (ElvUI sets this to orange).
	local nr, ng, nb = GameFontNormal:GetTextColor()
	fs:SetTextColor(nr, ng, nb)
	alAtlasBtn:HookScript('OnEnter', function()
		bd:SetBackdropBorderColor(unpack(AS.Color))
		fs:SetTextColor(1, 1, 1)
	end)
	alAtlasBtn:HookScript('OnLeave', function()
		bd:SetBackdropBorderColor(unpack(AS.BorderColor))
		fs:SetTextColor(nr, ng, nb)
	end)
	alAtlasBtn:SetScript('OnClick', OpenAtlasLootForCurrentMap)
end

-- Register hook: create button once both Atlas and AtlasLootClassic are loaded.
local alAtlasFrame = CreateFrame('Frame')
alAtlasFrame:RegisterEvent('ADDON_LOADED')
alAtlasFrame:SetScript('OnEvent', function(self, event, name)
	if name == 'AtlasLootClassic' or name == 'Atlas' or name == 'AtlasQuest' then
		local atlasLoaded = (C_AddOns and C_AddOns.IsAddOnLoaded or IsAddOnLoaded)('Atlas')
		local alLoaded    = (C_AddOns and C_AddOns.IsAddOnLoaded or IsAddOnLoaded)('AtlasLootClassic')
		if atlasLoaded and alLoaded then
			-- Defer until AQ_AtlasToggle exists (AtlasQuest may load slightly later).
			C_Timer.After(2, CreateAtlasLootAtlasButton)
			self:UnregisterEvent('ADDON_LOADED')
		end
	end
end)