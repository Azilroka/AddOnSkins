local AS, L, S, R = unpack(AddOnSkins)

function R:LuckyCharms2(event, addon)
	local function StyleButton(self)
		local name = self:GetName()
		local button = self
		local icon = _G[name.."Icon"]

		if not button.isSkinned then
			S:CreateBackdrop(button)
			S:StyleButton(button)
			button.backdrop:SetAllPoints()
			S:HandleIcon(icon)
			S:SetInside(icon)
			button.isSkinned = true
		end
	end

	S:HandleFrame(_G["LuckyCharmAnchorBar"])
	S:HandleFrame(_G["LuckyCharmBar"])
	S:HandleFrame(_G["LuckyCharmsFlares_main"])

	StyleButton(_G["LCBDragButton"])

	S:HandleButton(_G["LCRCButton"])
	S:HandleButton(_G["LCKOButton"])

	local i = 0
	while _G["LuckyCharm"..i] do
		StyleButton(_G["LuckyCharm"..i])
		i = i + 1
	end

	i = 1
	while _G["LuckyCharm2Flare"..i] do
		StyleButton(_G["LuckyCharm2Flare"..i])
		i = i + 1
	end

	local c = 1
	while _G["LCKillOrder_C"..c] do
		StyleButton(_G["LCKillOrder_C"..c])
		c = c + 1
	end

	LuckyCharms.SetTexCoords()
	LuckyCharms.Flares.SetTexCoords()
end

AS:RegisterSkin('LuckyCharms2')
