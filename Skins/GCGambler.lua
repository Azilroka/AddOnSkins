local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('GCGambler') then return end

function AS:GCGambler()
	AS:SkinFrame(GCGambler_Frame)
	AS:SkinButton(GCGambler_CHAT_Button)
	AS:SkinEditBox(GCGambler_EditBox)
	GCGambler_EditBox:SetHeight(12)
	GCGambler_EditBox:SetWidth(86)
	GCGambler_EditBox:DisableDrawLayer('BACKGROUND')
	GCGambler_EditBox:ClearAllPoints()
	GCGambler_EditBox:SetPoint('TOP', GCGambler_CHAT_Button, 'BOTTOM', 0, -3)
	AS:SkinButton(GCGambler_AcceptOnes_Button)
	AS:SkinButton(GCGambler_LASTCALL_Button)
	AS:SkinButton(GCGambler_ROLL_Button)
	AS:SkinButton(GCGambler_STATS_Button)
	AS:SkinCloseButton(GCGambler_Close)
	GCGambler_Close:ClearAllPoints()
	GCGambler_Close:SetPoint('TOPRIGHT', GCGambler_Frame, 'TOPRIGHT', 11, 7)
end

AS:RegisterSkin('GCGambler', AS.GCGambler)