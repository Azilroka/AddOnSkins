local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local gsub = gsub
local hooksecurefunc = hooksecurefunc

local function ReplaceIconString(frame, text)
	if not text then text = frame:GetText() end
	if not text or text == '' then return end

	local newText, count = gsub(text, '|T(%d+):24:24[^|]*|t', ' |T%1:16:16:0:0:64:64:5:59:5:59|t')
	if count > 0 then frame:SetFormattedText('%s', newText) end
end

function R:Blizzard_GenericTraitUI()
	if not AS:IsSkinEnabled('Blizzard_GenericTraitUI', 'genericTrait') then return end

	local GenericTrait = _G.GenericTraitFrame
	if not AS:CheckOption('Parchment') then
		S:StripTextures(GenericTrait)
	end

	S:SetTemplate(GenericTrait)
	S:HandleCloseButton(GenericTrait.CloseButton)

	ReplaceIconString(GenericTrait.Currency.UnspentPointsCount)
	hooksecurefunc(GenericTrait.Currency.UnspentPointsCount, 'SetText', ReplaceIconString)
end

AS:RegisterSkin('Blizzard_GenericTraitUI', nil, 'ADDON_LOADED')
