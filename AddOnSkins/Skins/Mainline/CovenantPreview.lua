local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local hooksecurefunc = hooksecurefunc

function R:Blizzard_CovenantPreviewUI()
	if not AS:IsSkinEnabled('Blizzard_CovenantPreviewUI', 'covenantPreview') then return end

	local frame = _G.CovenantPreviewFrame

	if not AS:CheckOption('Parchment') then
		frame.InfoPanel.Name:SetTextColor(1, 1, 1)
		frame.InfoPanel.Location:SetTextColor(1, 1, 1)
		frame.InfoPanel.Description:SetTextColor(1, 1, 1)
		frame.InfoPanel.AbilitiesFrame.AbilitiesLabel:SetTextColor(1, .8, 0)
		frame.InfoPanel.SoulbindsFrame.SoulbindsLabel:SetTextColor(1, .8, 0)
		frame.InfoPanel.CovenantFeatureFrame.Label:SetTextColor(1, .8, 0)
	end

	hooksecurefunc(frame, 'TryShow', function(covenantInfo)
		if covenantInfo and not frame.IsSkinned then
			S:SetTemplate(frame)

			frame.ModelSceneContainer.ModelSceneBorder:SetAlpha(0)
			S:SetTemplate(frame.InfoPanel)

			if not AS:CheckOption('Parchment') then
				frame.Title:DisableDrawLayer('BACKGROUND')
				frame.Title.Text:SetTextColor(1, .8, 0)
				S:SetTemplate(frame.Title)
				frame.Background:SetAlpha(0)
				frame.BorderFrame:SetAlpha(0)
				frame.InfoPanel.Parchment:SetAlpha(0)
			end

			S:Kill(frame.CloseButton.Border)
			S:HandleCloseButton(frame.CloseButton)
			S:HandleButton(frame.SelectButton)

			frame.IsSkinned = true
		end
	end)

	frame.ModelSceneContainer.Background:SetTexCoord(0.00970873786408, 0.99029126213592, 0.0092807424594, 0.9907192575406)

	S:HandleCheckBox(_G.TransmogAndMountDressupFrame.ShowMountCheckButton)
end

AS:RegisterSkin('Blizzard_CovenantPreviewUI', nil, 'ADDON_LOADED')
