local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local next = next

local function HandlePanel(panel)
	if panel.DragonridingPanel then
		S:HandleButton(panel.DragonridingPanel.SkillsButton)
	end

	if panel.CloseButton then
		S:HandleCloseButton(panel.CloseButton)
	end
end

function R:Blizzard_ExpansionLandingPage()
	if not AS:IsSkinEnabled('Blizzard_ExpansionLandingPage', 'expansionLanding') then return end

	local frame = _G.ExpansionLandingPage
	if frame.Overlay then
		for _, child in next, { frame.Overlay:GetChildren() } do
			if not AS:CheckOption('Parchment') then
				S:StripTextures(child)
				S:SetTemplate(child)
			end

			if child.DragonridingPanel then
				HandlePanel(child)
			end

			if child.MajorFactionList then
				S:HandleTrimScrollBar(child.MajorFactionList.ScrollBar)
			end
		end
	end
end

AS:RegisterSkin('Blizzard_ExpansionLandingPage', nil, 'ADDON_LOADED')
