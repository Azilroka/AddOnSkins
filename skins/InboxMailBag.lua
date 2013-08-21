local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "InboxMailBagSkin"
function AS:SkinInboxMailBag(event)
	if event == "PLAYER_ENTERING_WORLD" then return end
	InboxMailbagFrame:StripTextures()
	AS:SkinEditBox(InboxMailbagFrameItemSearchBox)
	AS:SkinCheckBox(InboxMailbagFrameItemGroupStacksCheckBox)
	AS:SkinTab(MailFrameTab3)
	for i = 1, 99 do
		local name = _G["InboxMailbagFrameItem"..i]
		if not name then return end
		AS:SkinIconButton(name)
	end
	AS:UnregisterEvent(name, event)
end

AS:RegisterSkin(name, AS.SkinInboxMailBag, "MAIL_SHOW")