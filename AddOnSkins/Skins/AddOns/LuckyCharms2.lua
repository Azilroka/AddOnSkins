local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('LuckyCharms2') then return end

function AS:LuckyCharms2(event, addon)
	local function StyleButton(self)
		local name = self:GetName()
		local button = self
		local icon = _G[name.."Icon"]

		if not button.isSkinned then
			AS:CreateBackdrop(button)
			AS:StyleButton(button)
			button.Backdrop:SetAllPoints()
			AS:SkinTexture(icon)
			AS:SetInside(icon)
			button.isSkinned = true
		end
	end

	AS:SkinFrame(_G["LuckyCharmAnchorBar"])
	AS:SkinFrame(_G["LuckyCharmBar"])
	AS:SkinFrame(_G["LuckyCharmsFlares_main"])

	StyleButton(_G["LCBDragButton"])

	AS:SkinButton(_G["LCRCButton"])
	AS:SkinButton(_G["LCKOButton"])

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

AS:RegisterSkin('LuckyCharms2', AS.LuckyCharms2)
