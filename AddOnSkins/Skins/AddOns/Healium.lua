local AS, L, S, R = unpack(AddOnSkins)

function R:Healium()
	local captionFrames = {
		'HealiumPartyFrame',
		'HealiumPetFrame',
		'HealiumMeFrame',
		'HealiumFriendsFrame',
		'HealiumDanagersFrame',
		'HealiumHealersFrame',
		'HealiumTanksFrame',
		'HealiumTargetFrame',
		'HealiumFocusFrame',
		'HealiumGroup1Frame',
		'HealiumGroup2Frame',
		'HealiumGroup3Frame',
		'HealiumGroup4Frame',
		'HealiumGroup5Frame',
		'HealiumGroup6Frame',
		'HealiumGroup7Frame',
		'HealiumGroup8Frame',
	}

	local skinnedFrames = {}
	local skinHeader = function(frame)
		if not frame or skinnedFrames[frame] then
			return
		end
		local captionbar = frame.CaptionBar
		local closebutton = frame.CaptionBar.CloseButton
		S:HandleFrame(captionbar, false, true)
		S:HandleCloseButton(closebutton)
		skinnedFrames[frame] = true
	end

	local skinUnitFrame = function(frame)
		if not frame or skinnedFrames[frame] then
			return
		end
		local predictbar = frame.PredictBar
		local healthbar = frame.HealthBar
		local manabar = frame.ManaBar
		S:StripTextures(frame)
		S:HandleStatusBar(predictbar)
		S:HandleStatusBar(healthbar)
		S:HandleStatusBar(manabar)
		predictbar:SetHeight(24)
		healthbar:SetHeight(24)
		manabar:SetHeight(24)
		predictbar:SetPoint('TOPLEFT', 7, 0)
		healthbar:SetPoint('TOPLEFT', 7, 0)
		manabar:ClearAllPoints()
		manabar:SetPoint('TOPLEFT', -4, 0)

		skinnedFrames[frame] = true
	end

	local skinHeal = function(frame)
		if not frame or skinnedFrames[frame] then
			return
		end
		local icon = frame.icon
		local texture = icon:GetTexture()
		S:HandleItemButton(frame, true)
		icon:SetTexture(texture)
		S:SetInside(icon)
		skinnedFrames[frame] = true
	end

	local skinBuff = function(frame)
		if not frame or skinnedFrames[frame] then
			return
		end
		local icon = frame.icon
		local count = frame.count
		S:HandleItemButton(frame, true)
		self:SetSize(28,28)
		S:SetInside(icon)
		count:ClearAllPoints()
		count:SetPoint('BOTTOMRIGHT', icon, 'BOTTOMRIGHT', -1, 1)
		skinnedFrames[frame] = true
	end

	local skinAllHealiumFrames = function()
		if not(Healium_Frames) then
			return
		end
		for _, frameName in pairs(captionFrames) do
			if (_G[frameName]) then
				skinHeader(_G[frameName])
			end
			for _, frame in pairs(Healium_Frames) do
				skinUnitFrame(frame)
				for v = 1, Healium_MaxButtons do
					skinHeal(_G[frame:GetName().. '_Heal' .. v])
					if v == 1 then
						_G[frame:GetName().. '_Heal' .. v]:SetPoint('LEFT', frame:GetName(), 'RIGHT', 2, 2)
					else
						_G[frame:GetName().. '_Heal' .. v]:SetPoint('LEFT', _G[frame:GetName().. '_Heal'.. (v-1)], 'RIGHT', 2, 0)
					end
				end
				for v = 1, 6 do
					skinBuff(_G[frame:GetName() .. '_Buff' .. v])
					if v == 1 then
						_G[frame:GetName().. '_Buff' .. v]:SetPoint('RIGHT', frame:GetName(), 'LEFT', -8, 2)
					else
						_G[frame:GetName().. '_Buff' .. v]:SetPoint('RIGHT', _G[frame:GetName().. '_Buff'.. (v-1)], 'LEFT', -2, 0)
					end
				end
			end
		end
	end

	skinAllHealiumFrames()

	hooksecurefunc('Healium_HealButton_OnLoad', skinHeal)
	hooksecurefunc('Healium_CreateUnitFrames', skinAllHealiumFrames)
	hooksecurefunc('HealiumUnitFrames_Button_OnLoad', skinUnitFrame)
end

AS:RegisterSkin('Healium')
