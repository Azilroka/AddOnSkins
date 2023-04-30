local AS, L, S, R = unpack(AddOnSkins)

local _G = _G

function R:Blizzard_DeathRecap()
	if not AS:IsSkinEnabled('Blizzard_DeathRecap', 'deathRecap') then return end

	local DeathRecapFrame = _G.DeathRecapFrame
	S:StripTextures(DeathRecapFrame)
	S:SetTemplate(DeathRecapFrame)
	DeathRecapFrame.CloseButton:SetFrameLevel(5)
	S:HandleCloseButton(DeathRecapFrame.CloseXButton)
	S:HandleButton(DeathRecapFrame.CloseButton)

	for i = 1, 5 do
		local recap = DeathRecapFrame['Recap'..i].SpellInfo
		S:HandleIcon(recap.Icon, true)
		recap.IconBorder:Kill()
	end
end

AS:RegisterSkin('Blizzard_DeathRecap', nil, 'ADDON_LOADED')
