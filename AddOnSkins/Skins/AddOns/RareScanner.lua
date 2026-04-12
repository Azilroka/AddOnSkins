local AS = unpack(AddOnSkins)

local function SkinRareScanner()
	local btn = _G['RARESCANNER_BUTTON']
	if not btn or btn._asSkinned then return end
	btn._asSkinned = true

	-- Replace parchment background and default tooltip border with ElvUI style
	btn:SetNormalTexture('')
	btn:SetPushedTexture('')
	btn:SetHighlightTexture('')
	AS:StripTextures(btn)
	AS:SetTemplate(btn)
	AS:CreateShadow(btn)

	-- Close button
	if btn.CloseButton then
		AS:SkinCloseButton(btn.CloseButton)
		btn.CloseButton:ClearAllPoints()
		btn.CloseButton:SetPoint('TOPRIGHT', btn, 'TOPRIGHT', -4, -4)
	end

	-- Filter buttons use custom icon textures from RareScanner media - only skin the frame border
	if btn.FilterEntityButton then
		AS:CreateBackdrop(btn.FilterEntityButton)
	end
	if btn.UnFilterEntityButton then
		AS:CreateBackdrop(btn.UnFilterEntityButton)
	end
end

function AS:RareScanner(event, addon)
	local loaded = (C_AddOns and C_AddOns.IsAddOnLoaded and C_AddOns.IsAddOnLoaded('RareScanner'))
		or (_G.IsAddOnLoaded and _G.IsAddOnLoaded('RareScanner'))
	if not loaded then return end

	C_Timer.After(0, SkinRareScanner)
end

AS:RegisterSkin('RareScanner', AS.RareScanner)
