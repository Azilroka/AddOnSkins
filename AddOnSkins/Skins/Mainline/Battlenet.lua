local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local next = next

function R:Blizzard_BattleNetFrames()
	if not AS:IsSkinEnabled('Blizzard_BattleNetFrames', 'misc') then return end

	local skins = {
		_G.BNToastFrame,
		_G.TimeAlertFrame,
		_G.TicketStatusFrameButton.NineSlice -- Ticket Frames (not GMTicketFrames)
	}

	for i = 1, #skins do
		S:SetTemplate(skins[i])
	end

	local ReportFrame = _G.ReportFrame
	S:HandleFrame(ReportFrame)
	S:HandleDropDownBox(ReportFrame.ReportingMajorCategoryDropdown)
	S:HandleButton(ReportFrame.ReportButton)
	S:HandleEditBox(ReportFrame.Comment)

	-- Fill me with LOVE <3

	local ReportCheatingDialog = _G.ReportCheatingDialog
	S:StripTextures(ReportCheatingDialog)
	_G.ReportCheatingDialogCommentFrame:StripTextures()
	S:HandleButton(_G.ReportCheatingDialogReportButton)
	S:HandleButton(_G.ReportCheatingDialogCancelButton)
	S:SetTemplate(ReportCheatingDialog)
	S:HandleEditBox(_G.ReportCheatingDialogCommentFrameEditBox)

	local BattleTagInviteFrame = _G.BattleTagInviteFrame
	S:StripTextures(BattleTagInviteFrame)
	S:SetTemplate(BattleTagInviteFrame)

	for _, child in next, { BattleTagInviteFrame:GetChildren() } do
		if child:IsObjectType('Button') then
			S:HandleButton(child)
		end
	end
end

AS:RegisterSkin('Blizzard_BattleNetFrames')
