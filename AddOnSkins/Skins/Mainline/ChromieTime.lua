local AS, L, S, R = unpack(AddOnSkins)

local _G = _G

function R:Blizzard_ChromieTimeUI()
	if not AS:IsSkinEnabled('Blizzard_ChromieTimeUI', 'chromieTime') then return end

	local frame = _G.ChromieTimeFrame
	S:HandleCloseButton(frame.CloseButton)
	S:HandleButton(frame.SelectButton)

	if not AS:CheckOption('Parchment') then
		S:HandleFrame(frame)
		frame.Background:Hide()

		local Title = frame.Title
		Title:DisableDrawLayer('BACKGROUND')
		S:SetTemplate(Title)

		local InfoFrame = frame.CurrentlySelectedExpansionInfoFrame
		InfoFrame:DisableDrawLayer('BACKGROUND')
		S:SetTemplate(InfoFrame)
		InfoFrame.Name:SetTextColor(1, .8, 0)
		InfoFrame.Description:SetTextColor(1, 1, 1)
	end
end

AS:RegisterSkin('Blizzard_ChromieTimeUI', nil, 'ADDON_LOADED')
