local AS, _, S, R = unpack(AddOnSkins)
if not AS:CheckAddOn('ElvUI') then return end

local _G = _G

local hooksecurefunc = hooksecurefunc
local UIFrameFadeIn, UIFrameFadeOut = UIFrameFadeIn, UIFrameFadeOut
local UnitAffectingCombat = UnitAffectingCombat

local ES = AS.EmbedSystem

local E, L = unpack(ElvUI)

function AS:UpdateMedia()
	S.Media.Blank = AS.Libs.LSM:Fetch('background', 'ElvUI Blank')
	S.Media.StatusBar = AS.Libs.LSM:Fetch('statusbar', E.private.general.normTex)

	S.Media.defaultBackdrop = E.media.backdropcolor
	S.Media.transparentBackdrop = E.media.backdropfadecolor
	S.Media.borderColor = E.media.bordercolor
	S.Media.valueColor = E.media.rgbvaluecolor

	S.Media.TexCoords = { 0, 1, 0, 1 }
	local modifier = 0.04 * E.db.general.cropIcon
	for i, v in ipairs(S.Media.TexCoords) do
		if i % 2 == 0 then
			S.Media.TexCoords[i] = v - modifier
		else
			S.Media.TexCoords[i] = v + modifier
		end
	end
end

function ES:Hooks()
	if not E then
		E, L = unpack(ElvUI)
	end

	hooksecurefunc(E:GetModule('Chat'), 'PositionChat', function(_, override)
		if override then
			ES:Check()
		end
	end)
	hooksecurefunc(E:GetModule('Layout'), 'ToggleChatPanels', function() ES:Check() end)

	if RightChatToggleButton then
		RightChatToggleButton:RegisterForClicks('AnyDown')
		RightChatToggleButton:SetScript('OnClick', function(s, btn)
			if btn == 'RightButton' then
				if ES.Main:IsShown() then
					AS:SetOption('EmbedIsHidden', true)
				else
					AS:SetOption('EmbedIsHidden', false)
				end

				ES.Main:SetShown(not AS:CheckOption('EmbedIsHidden'))
			else
				if E.db[s.parent:GetName()..'Faded'] then
					E.db[s.parent:GetName()..'Faded'] = nil
					UIFrameFadeIn(s.parent, 0.2, s.parent:GetAlpha(), 1)
					UIFrameFadeIn(s, 0.2, s:GetAlpha(), 1)
					if not AS:CheckOption('EmbedIsHidden') then
						ES.Main:Show()
					end
				else
					E.db[s.parent:GetName()..'Faded'] = true
					UIFrameFadeOut(s.parent, 0.2, s.parent:GetAlpha(), 0)
					UIFrameFadeOut(s, 0.2, s:GetAlpha(), 0)
					s.parent.fadeInfo.finishedFunc = s.parent.fadeFunc
				end
			end
		end)

		RightChatToggleButton:SetScript('OnEnter', function(s)
			if E.db[s.parent:GetName()..'Faded'] then
				s.parent:Show()
				UIFrameFadeIn(s.parent, 0.2, s.parent:GetAlpha(), 1)
				UIFrameFadeIn(s, 0.2, s:GetAlpha(), 1)
				if not AS:CheckOption('EmbedIsHidden') then
					ES.Main:Show()
				end
			end

			if not s.parent.editboxforced then
				_G.GameTooltip:SetOwner(s, 'ANCHOR_TOPLEFT', 0, 4)
				_G.GameTooltip:ClearLines()
				_G.GameTooltip:AddDoubleLine(L["Left Click:"], L["Toggle Chat Frame"], 1, 1, 1)
				_G.GameTooltip:AddDoubleLine(L["Right Click:"], L["Toggle Embedded Addon"], 1, 1, 1)
				_G.GameTooltip:Show()
			end
		end)
	end
end

function ES:Resize()
	if UnitAffectingCombat('player') then return end
	local ChatPanel = AS:CheckOption('EmbedRightChat') and _G.RightChatPanel or _G.LeftChatPanel
	local ChatTab = AS:CheckOption('EmbedRightChat') and _G.RightChatTab or _G.LeftChatTab

	ES.Main:SetParent(ChatPanel)
	ES.Main:ClearAllPoints()
	ES.Main:SetPoint('TOPRIGHT', ChatTab, AS:CheckOption('EmbedBelowTop') and 'BOTTOMRIGHT' or 'TOPRIGHT', 0, AS:CheckOption('EmbedBelowTop') and -1 or 0)
	ES.Main:SetPoint('BOTTOMLEFT', ChatPanel, 'BOTTOMLEFT', 0, (E.PixelMode and 0 or -1))

	ES.Left:SetSize(AS:CheckOption('EmbedLeftWidth'), ES.Main:GetHeight())
	ES.Right:SetSize((ES.Main:GetWidth() - AS:CheckOption('EmbedLeftWidth')) - 1, ES.Main:GetHeight())

	ES.Left:SetPoint('LEFT', ES.Main, 'LEFT', 0, 0)
	ES.Left:SetPoint('RIGHT', ES.Right, 'LEFT', 0, 0)
	ES.Right:SetPoint('RIGHT', ES.Main, 'RIGHT', 0, 0)
end
