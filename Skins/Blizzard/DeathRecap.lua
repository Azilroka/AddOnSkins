local AS = unpack(AddOnSkins)

function AS:Blizzard_DeathRecap(event, addon)
	if addon ~= 'Blizzard_DeathRecap' then return end

	AS:SkinFrame(DeathRecapFrame)
	AS:SkinCloseButton(DeathRecapFrame.CloseXButton)
	AS:SkinButton(DeathRecapFrame.CloseButton)

	for _, Recap in pairs(DeathRecapFrame.DeathRecapEntry) do
		AS:SkinTexture(Recap.SpellInfo.Icon, true)
		Recap.SpellInfo.IconBorder:SetAlpha(0)
	end

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_DeathRecap', AS.Blizzard_DeathRecap, 'ADDON_LOADED')
