local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('BattlePetBreedID') then return end

function R:BattlePetBreedID()
	local function SkinTooltip(Parent, SpeciesID, BreedID, Rareness)
		local Tooltip, Rarity, R, G, B
		if (Parent == FloatingBattlePetTooltip) then
			Tooltip = _G["BPBID_BreedTooltip2"]
		else
			Tooltip = _G["BPBID_BreedTooltip"]
		end
		Rarity = Rareness or 4
		if Rarity > 4 then
			R, G, B = ITEM_QUALITY_COLORS[Rarity - 1]
		end
		if Tooltip then
			S:HandleFrame(Tooltip)
			local a, b, c, d, e = Tooltip:GetPoint()
			Tooltip:SetPoint(a, b, c, d, -1)
		end
	end

	hooksecurefunc(_G, "BPBID_SetBreedTooltip", SkinTooltip)
end

AS:RegisterSkin('BattlePetBreedID', R.BattlePetBreedID)
