local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('PetTracker') then return end

local name = "PetTrackerSkin"
function AS:SkinPetTracker()
	local frame = PetTracker.Tracker.usedFrames[1].Anchor -- Used to just be Anchor, but he overwrote __index and now we have to do this
	AS:SkinFrame(frame.Overlay)
	for i = 1, PetTracker.MaxQuality do
		AS:SkinStatusBar(frame[i])
	end

	AS:SkinFrame(PetTrackerSwap)
	AS:SkinCloseButton(PetTrackerSwapCloseButton)
	PetTrackerSwap:HookScript('OnUpdate', function(self)
		PetTrackerSwapInset:StripTextures()
		for i = 1, self:GetNumChildren() do
			local Region = select(i, self:GetChildren())
			if Region and Region:GetObjectType() == 'Frame' and not Region.IsSkinned then
				local a, b, c, d, e = Region:GetPoint()
				if a == 'TOP' and c == 'TOP' and d == 0 and e == 2 then
					Region:Kill()
					Region.IsSkinned = true
				end
			end
		end
		for i = 1, 6 do
			if not _G['PetTrackerBattleSlot'..i].IsSkinned then
				_G['PetTrackerBattleSlot'..i]:SetTemplate('Transparent')
				_G['PetTrackerBattleSlot'..i].Bg:Hide()
				AS:SkinTexture(_G['PetTrackerBattleSlot'..i].Icon)
				_G['PetTrackerBattleSlot'..i].IconBorder:Hide()
				AS:SkinStatusBar(_G['PetTrackerBattleSlot'..i].Health)
				AS:SkinStatusBar(_G['PetTrackerBattleSlot'..i].Xp)
				_G['PetTrackerBattleSlot'..i].IsSkinned = true
				for i = 1, 18 do
					local Ability = _G['PetTrackerAbilityButton'..i]
					for i = 1, Ability:GetNumRegions() do
						local Region = select(i, Ability:GetRegions())
						if Region and Region:GetObjectType() == 'Texture' then
							if Region:GetTexture() == 'Interface\\Spellbook\\Spellbook-Parts' then
								Region:SetTexture(nil)
							end
						end
					end
					AS:SkinTexture(_G['PetTrackerAbilityButton'..i].Icon)
				end
			end
		end
	end)
	for i = 1, 3 do
        local button = _G[("PetTrackerAbilityAction%d"):format(i)]
        if button then
            AS:SkinIconButton(button)
			AS:SkinTexture(button.Icon)
        end
    end
end

AS:RegisterSkin(name, AS.SkinPetTracker)