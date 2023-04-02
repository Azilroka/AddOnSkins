local AS, L, S, R = unpack(AddOnSkins)

local _G = _G

function R:Blizzard_AnimaDiversionUI()
	if not AS:IsSkinEnabled('Blizzard_AnimaDiversionUI', 'animaDiversion') then return end

	local frame = _G.AnimaDiversionFrame
	S:HandleFrame(frame)

	frame.CloseButton:ClearAllPoints()
	S:Point(frame.CloseButton, 'TOPRIGHT', frame, 'TOPRIGHT', 4, 4) --default is -5, -5
	frame.AnimaDiversionCurrencyFrame.Background:SetAlpha(0)

	S:HandleButton(frame.ReinforceInfoFrame.AnimaNodeReinforceButton)
end

AS:RegisterSkin('Blizzard_AnimaDiversionUI', nil, 'ADDON_LOADED')
