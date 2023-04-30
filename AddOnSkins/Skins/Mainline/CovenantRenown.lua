local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local hooksecurefunc = hooksecurefunc

function R:Blizzard_CovenantRenown()
	if not AS:IsSkinEnabled('Blizzard_CovenantRenown', 'covenantRenown') then return end

	local frame = _G.CovenantRenownFrame
	S:HandleCloseButton(frame.CloseButton)

	hooksecurefunc(frame, 'SetUpCovenantData', function(Frame)
		Frame.CloseButton.Border:Hide()

		if not AS:CheckOption('Parchment') then
			S:HandleFrame(Frame)
		end
	end)

	if not AS:CheckOption('Parchment') then
		S:SetTemplate(frame.TrackFrame)
	end
end

AS:RegisterSkin('Blizzard_CovenantRenown', nil, 'ADDON_LOADED')
