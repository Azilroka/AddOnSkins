local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('InboxMailBag') then return end

local name = 'InboxMailBagSkin'
function AS:SkinInboxMailBag(event)
	if event == 'PLAYER_ENTERING_WORLD' then return end
	InboxMailbagFrame:StripTextures()
	AS:SkinEditBox(InboxMailbagFrameItemSearchBox)
	AS:SkinCheckBox(InboxMailbagFrameItemGroupStacksCheckBox)
	AS:SkinTab(MailFrameTab3)
	AS:SkinScrollBar(InboxMailbagFrameScrollFrameScrollBar)
	for i = 1, 99 do
		local button = _G['InboxMailbagFrameItem'..i]
		if not button then return end
		button:CreateBackdrop('Default', true)
		button:StyleButton()
		button:DisableDrawLayer('BORDER')
		button.icon:SetDrawLayer('ARTWORK')
		button.icon:SetTexCoord(unpack(AS.TexCoords))
		button.qualityOverlay:SetTexture(nil)
		button.qualityOverlay.SetTexture = AS.Noop
		local backdrop = button.backdrop or button.Backdrop
		button:SetNormalTexture(nil)
		button.SetNormalTexture = AS.Noop
		backdrop:SetOutside(button.icon)
		button.icon:SetParent(backdrop)
		button:HookScript('OnUpdate', function()
			if MAILBAGDB["QUALITY_COLORS"] and button.qualityOverlay:IsShown() and not button.searchOverlay:IsShown() then
				backdrop:SetBackdropBorderColor(button.qualityOverlay:GetVertexColor())
			else
				backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end
		end)
	end
	AS:UnregisterSkinEvent(name, event)
end

AS:RegisterSkin(name, AS.SkinInboxMailBag, 'MAIL_SHOW')