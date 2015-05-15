local AS = unpack(AddOnSkins)

function AS:Blizzard_DeathRecap(event, addon)
	if addon ~= 'Blizzard_DeathRecap' then return end
	AS:SkinFrame(DeathRecapFrame)
	AS:SkinCloseButton(DeathRecapFrame.CloseXButton)
	-- AS:SkinButton(DeathRecapFrame.CloseButton) Broken till 6.2
	for i = 1, DeathRecapFrame:GetNumChildren() do
		local object = select(i, DeathRecapFrame:GetChildren())
		if object and object:IsObjectType('Button') and object:GetText() == CLOSE then
			AS:SkinButton(object)
		end
	end
	for i = 1, 5 do
		local Recap = DeathRecapFrame['Recap'..i]
		AS:CreateBackdrop(Recap.SpellInfo)
		AS:SkinTexture(Recap.SpellInfo.Icon)
		Recap.SpellInfo.Backdrop:SetOutside(Recap.SpellInfo.Icon)
		Recap.SpellInfo.IconBorder:SetAlpha(0)
	end
end

AS:RegisterSkin('Blizzard_DeathRecap', AS.Blizzard_DeathRecap, 'ADDON_LOADED')