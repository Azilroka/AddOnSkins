local AS, L, S, R = unpack(AddOnSkins)

function R:InboxMailBag(event)
	if event ~= 'MAIL_SHOW' then return end
	S:StripTextures(InboxMailbagFrame)
	S:HandleEditBox(InboxMailbagFrameItemSearchBox)
	S:HandleCheckBox(InboxMailbagFrameItemGroupStacksCheckBox)
	S:HandleTab(MailFrameTab3)
	S:HandleScrollBar(InboxMailbagFrameScrollFrameScrollBar)

	local index = 1
	while _G['InboxMailbagFrameItem'..index] do
		local button = _G['InboxMailbagFrameItem'..index]
		S:HandleFrame(button)
		S:SetInside(button.icon)
		S:HandleIcon(button.icon)
		button.qualityOverlay:SetTexture()
		button:SetNormalTexture()
		hooksecurefunc(button.qualityOverlay, 'SetVertexColor', function(self, r, g, b, a)
			button:SetBackdropBorderColor(r, g, b)
		end)
		hooksecurefunc(button.qualityOverlay, 'Hide', function(self)
			button:SetBackdropBorderColor(unpack(S.borderColor))
		end)
		index = index + 1
	end

	AS:UnregisterSkinEvent('InboxMailBag', event)
end

AS:RegisterSkin('InboxMailBag', nil, 'MAIL_SHOW')
