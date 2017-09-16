local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('InboxMailBag') then return end

function AS:InboxMailBag(event)
	if event ~= 'MAIL_SHOW' then return end
	AS:StripTextures(InboxMailbagFrame)
	AS:SkinEditBox(InboxMailbagFrameItemSearchBox)
	AS:SkinCheckBox(InboxMailbagFrameItemGroupStacksCheckBox)
	AS:SkinTab(MailFrameTab3)
	AS:SkinScrollBar(InboxMailbagFrameScrollFrameScrollBar)

	local index = 1
	while _G['InboxMailbagFrameItem'..index] do
		local button = _G['InboxMailbagFrameItem'..index]
		AS:SkinFrame(button)
		button.icon:SetInside()
		AS:SkinTexture(button.icon)
		button.qualityOverlay:SetTexture(nil)
		button:SetNormalTexture(nil)
		hooksecurefunc(button.qualityOverlay, 'SetVertexColor', function(self, r, g, b, a)
			button:SetBackdropBorderColor(r, g, b)
		end)
		hooksecurefunc(button.qualityOverlay, 'Hide', function(self)
			button:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)
		index = index + 1
	end
	AS:UnregisterSkinEvent('InboxMailBag', event)
end

AS:RegisterSkin('InboxMailBag', AS.InboxMailBag, 'MAIL_SHOW')