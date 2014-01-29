local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('PetTracker') then return end

local name = "PetTrackerSkin"
function AS:SkinPetTracker()
	local frame = PetTracker.Tracker.usedFrames[1].Anchor -- Used to just be Anchor, but he overwrote __index and now we have to do this
	AS:SkinBackdropFrame(frame)
	frame.Overlay:StripTextures(true)
	for i = 1, PetTracker.MaxQuality do
		frame[i]:SetStatusBarTexture(AS.NormTex)
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
	AS:SkinEditBox(PetTrackerMapFilter)
	AS:SkinTooltip(PetTrackerMapFilterSuggestions)
	AS:SkinTooltip(PetTrackerMapTip1)
	AS:SkinTooltip(PetTrackerMapTip2)
	for i = 1, PetTrackerMapFilterSuggestions:GetNumChildren() do
		local Button = select(i, PetTrackerMapFilterSuggestions:GetChildren())
		Button:SetFrameLevel(PetTrackerMapFilterSuggestions:GetFrameLevel() + 1)
	end
	WorldMapShowDropDownButton:HookScript('OnClick', function()
		if SushiDropdownFrame1.IsDone then return end
		for i = 1, SushiDropdownFrame1:GetNumChildren() do
			local Region = select(i, SushiDropdownFrame1:GetChildren())
			if Region:GetObjectType() == 'Frame' then
				Region:StripTextures()
				SushiDropdownFrame1:ClearAllPoints()
				SushiDropdownFrame1:SetPoint('BOTTOMRIGHT', WorldMapShowDropDownButton, 'TOPRIGHT', 0, 4)
				SushiDropdownFrame1:CreateBackdrop('Transparent')
				SushiDropdownFrame1.IsDone = true
			end
		end
	end)
end

AS:RegisterSkin(name, AS.SkinPetTracker)