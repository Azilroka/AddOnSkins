local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('EnchantCheck') then return end

function AS:EnchantCheck()
	AS:SkinButton(CharacterFrameEnchantCheckButton)
	AS:SkinButton(InspectFrameEnchantCheckButton)
	AS:SkinButton(InspectFrameInviteButton)
	CharacterFrameEnchantCheckButton:Size(112, 20)

	--Reposition Expand/Collapse Button
	CharacterFrameEnchantCheckButton:ClearAllPoints()
	CharacterFrameEnchantCheckButton:Point('RIGHT', CharacterMainHandSlot, 'LEFT', -8, -15)
end

AS:RegisterSkin('EnchantCheck', AS.EnchantCheck)