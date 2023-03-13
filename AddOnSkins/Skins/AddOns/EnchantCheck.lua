local AS, L, S, R = unpack(AddOnSkins)

function R:EnchantCheck()
	S:HandleButton(CharacterFrameEnchantCheckButton)
	S:HandleButton(InspectFrameEnchantCheckButton)
	S:HandleButton(InspectFrameInviteButton)
	CharacterFrameEnchantCheckButton:SetSize(112, 20)

	--Reposition Expand/Collapse Button
	CharacterFrameEnchantCheckButton:ClearAllPoints()
	CharacterFrameEnchantCheckButton:SetPoint('RIGHT', CharacterMainHandSlot, 'LEFT', -8, -15)
end

AS:RegisterSkin('EnchantCheck')
