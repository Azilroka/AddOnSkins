local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "InboxMailBagSkin"
function AS:SkinInboxMailBag(event)
	if event == "PLAYER_ENTERING_WORLD" then return end
	InboxMailbagFrame:StripTextures()
	S:HandleEditBox(InboxMailbagFrameItemSearchBox)
	S:HandleCheckBox(InboxMailbagFrameItemGroupStacksCheckBox)
	S:HandleTab(MailFrameTab3)
	for i = 1, 99 do
		local name = _G["InboxMailbagFrameItem"..i]
		if not name then return end
		AS:SkinIconButton(name, true, true)
	end
	AS:UnregisterEvent(name, event)
end

AS:RegisterSkin(name, AS.SkinInboxMailBag, "MAIL_SHOW")