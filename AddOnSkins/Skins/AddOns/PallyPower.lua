local AS, L, S, R = unpack(AddOnSkins)

local function SkinCheckBox(cb)
	if not cb or cb._ppSkinned then return end
	cb._ppSkinned = true
	for i = 1, cb:GetNumRegions() do
		local r = select(i, cb:GetRegions())
		if r and r.SetTexture then r:SetTexture(nil) end
	end
	if cb.SetNormalTexture    then cb:SetNormalTexture('') end
	if cb.SetHighlightTexture then cb:SetHighlightTexture('') end
	if cb.SetPushedTexture    then cb:SetPushedTexture('') end
	if cb.SetBackdrop         then cb:SetBackdrop(nil) end
	S:CreateBackdrop(cb)
	-- Center a 16x16 backdrop inside the original 26x26 button
	if cb.backdrop then
		cb.backdrop:SetSize(16, 16)
		cb.backdrop:ClearAllPoints()
		cb.backdrop:SetPoint('CENTER', cb, 'CENTER', 0, 0)
	end
	local blankTex = (ElvUI and ElvUI[1].media.blankTex) or [[Interface\Buttons\WHITE8X8]]
	cb:SetCheckedTexture(blankTex)
	local ct = cb:GetCheckedTexture()
	if ct then
		ct:SetVertexColor(unpack(AS.Color))
		if cb.backdrop then S:SetInside(ct, cb.backdrop) end
	end
	if cb.backdrop then
		hooksecurefunc(cb, 'SetChecked', function(f, checked)
			if f.backdrop then
				if checked then
					f.backdrop:SetBackdropBorderColor(unpack(AS.Color))
				else
					f.backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end
		end)
	end
end

-- Strip Blizzard backdrop and apply ElvUI template.
-- Does NOT touch SetBackdropColor so PallyPower can still color buttons by buff status.
local function SkinPPButton(btn)
	if not btn then return end
	S:StripTextures(btn)
	S:SetTemplate(btn)
end

local function SkinMainButtons(PP)
	SkinPPButton(_G.PallyPowerRF)
	SkinPPButton(_G.PallyPowerAuto)
	SkinPPButton(_G.PallyPowerAura)

	for i = 1, PALLYPOWER_MAXCLASSES do
		local cBtn = PP.classButtons and PP.classButtons[i]
		if cBtn then
			SkinPPButton(cBtn)
			local icon = _G[cBtn:GetName()..'ClassIcon']
			if icon then S:HandleIcon(icon) end
			local bIcon = _G[cBtn:GetName()..'BuffIcon']
			if bIcon then S:HandleIcon(bIcon) end
		end
		local pBtns = PP.playerButtons and PP.playerButtons[i]
		if pBtns then
			for j = 1, PALLYPOWER_MAXPERCLASS do
				local pBtn = pBtns[j]
				if pBtn then
					SkinPPButton(pBtn)
					local icon = _G[pBtn:GetName()..'BuffIcon']
					if icon then S:HandleIcon(icon) end
				end
			end
		end
	end
end

local function SkinBlessingsFrame()
	local BF = _G.PallyPowerBlessingsFrame
	if not BF or BF._asSkinned then return end
	BF._asSkinned = true

	S:StripTextures(BF)
	S:SetTemplate(BF)
	S:HandleCloseButton(_G.PallyPowerBlessingsFrameCloseButton)

	-- Move title up slightly
	local title = _G.PallyPowerBlessingsFrameTitle
	if title then
		title:ClearAllPoints()
		title:SetPoint('TOP', BF, 'TOP', 0, -4)
	end

	-- Bottom action buttons use GameMenuButtonTemplate
	for _, suffix in ipairs({ 'Options', 'AutoAssign', 'Clear', 'Refresh', 'Preset', 'Report' }) do
		local btn = _G['PallyPowerBlessingsFrame'..suffix]
		if btn then S:HandleButton(btn) end
	end

	-- Free Assignment checkbox
	local freeAssign = _G['PallyPowerBlessingsFrameFreeAssign']
	if freeAssign then
		SkinCheckBox(freeAssign)
		local freeText = _G['PallyPowerBlessingsFrameFreeAssignText']
		if freeText and freeAssign.backdrop then
			freeText:ClearAllPoints()
			freeText:SetPoint('LEFT', freeAssign.backdrop, 'RIGHT', 4, 0)
			freeAssign.backdrop:ClearAllPoints()
			freeAssign.backdrop:SetPoint('LEFT', freeAssign, 'LEFT', 5, 3)
		end
	end

	-- Add ElvUI backdrop behind each class icon by creating a sibling frame anchored
	-- to the ClassButton. Child frames on ClassButton break ClassGroup layout.
	for i = 1, PALLYPOWER_MAXCLASSES do
		local btn = _G['PallyPowerBlessingsFrameClassGroup'..i..'ClassButton']
		local icon = _G['PallyPowerBlessingsFrameClassGroup'..i..'ClassButtonIcon']
		if btn and icon then
			icon:Show()
			if not btn._ppBg then
				local bg = CreateFrame('Frame', nil, BF)
				bg:SetFrameLevel(btn:GetFrameLevel() - 1)
				bg:SetPoint('TOPLEFT', btn, 'TOPLEFT', 0, 0)
				bg:SetSize(84, 68)
				S:SetTemplate(bg)
				bg:SetBackdropColor(0.08, 0.08, 0.08, 0.9)
				bg:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
				btn._ppBg = bg
			end
		end
	end
	-- Same for AuraGroup header button
	local auraBtn = _G['PallyPowerBlessingsFrameAuraGroup1AuraHeader']
	if auraBtn and not auraBtn._ppBg then
		local bg = CreateFrame('Frame', nil, BF)
		bg:SetFrameLevel(auraBtn:GetFrameLevel() - 1)
		bg:SetPoint('TOPLEFT', auraBtn, 'TOPLEFT', 0, 0)
		bg:SetSize(84, 68)
		S:SetTemplate(bg)
		bg:SetBackdropColor(0.08, 0.08, 0.08, 0.9)
		bg:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
		auraBtn._ppBg = bg
	end

	-- Recolor all separator lines to ElvUI border color
	local function recolorLine(line)
		if not line then return end
		line:SetColorTexture(0.4, 0.4, 0.4, 1)
	end
	for i = 1, PALLYPOWER_MAXCLASSES do
		recolorLine(_G['PallyPowerBlessingsFrameClassGroup'..i..'Line'])
	end
	recolorLine(_G['PallyPowerBlessingsFrameAuraGroup1Line'])
	for i = 1, PALLYPOWER_MAXPERCLASS do
		local prefix = 'PallyPowerBlessingsFramePlayer'..i
		for j = 1, 11 do
			recolorLine(_G[prefix..'Line'..j])
		end
	end

	-- Center player names and sync backdrop heights after every PP grid update
	hooksecurefunc('PallyPowerBlessingsGrid_Update', function()
		for i = 1, PALLYPOWER_MAXCLASSES do
			for j = 1, PALLYPOWER_MAXPERCLASS do
				local txt = _G['PallyPowerBlessingsFrameClassGroup'..i..'PlayerButton'..j..'Text']
				if txt and not txt._ppCentered then
					txt:SetJustifyH('CENTER')
					txt:ClearAllPoints()
					txt:SetPoint('LEFT', txt:GetParent(), 'LEFT', 0, 2)
					txt._ppCentered = true
				end
			end
			-- Use Line height as ground truth - PP sets it to 56 + 13*numMaxClass
			local btn = _G['PallyPowerBlessingsFrameClassGroup'..i..'ClassButton']
			local line = _G['PallyPowerBlessingsFrameClassGroup'..i..'Line']
			if btn and btn._ppBg and line then
				btn._ppBg:SetHeight(line:GetHeight())
			end
		end
		local auraBtn = _G['PallyPowerBlessingsFrameAuraGroup1AuraHeader']
		local auraLine = _G['PallyPowerBlessingsFrameAuraGroup1Line']
		if auraBtn and auraBtn._ppBg and auraLine then
			auraBtn._ppBg:SetHeight(auraLine:GetHeight())
		end
	end)
end

function AS:PallyPower()
	local PP = _G.PallyPower
	if not PP then return end

	-- Re-skin main buttons whenever PP rebuilds its skin (skin option change)
	hooksecurefunc(PP, 'ApplySkin', function(self)
		SkinMainButtons(self)
	end)

	local BF = _G.PallyPowerBlessingsFrame
	if BF then
		BF:HookScript('OnShow', SkinBlessingsFrame)
	end

	C_Timer.After(0, function()
		SkinMainButtons(PP)
		if BF and BF:IsShown() then SkinBlessingsFrame() end
	end)
end

AS:RegisterSkin('PallyPower', AS.PallyPower)
