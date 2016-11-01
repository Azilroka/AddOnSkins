local AS = unpack(AddOnSkins)

if AS:CheckAddOn('ElvUI') then return end
if not AS:CheckAddOn('SexyCooldown2') then return end

function AS:SexyCooldown()
	local function SCDStripSkinSettings(bar)
		bar.optionsTable.args.icon.args.borderheader = nil
		bar.optionsTable.args.icon.args.border = nil
		bar.optionsTable.args.icon.args.borderColor = nil
		bar.optionsTable.args.icon.args.borderSize = nil
		bar.optionsTable.args.icon.args.borderInset = nil
		--bar.optionsTable.args.icon.args.sizeOffset = nil
		bar.optionsTable.args.bar.args.bnbheader = nil
		bar.optionsTable.args.bar.args.texture = nil
		bar.optionsTable.args.bar.args.backgroundColor = nil
		bar.optionsTable.args.bar.args.border = nil
		bar.optionsTable.args.bar.args.borderColor = nil
		bar.optionsTable.args.bar.args.borderSize = nil
		bar.optionsTable.args.bar.args.borderInset = nil
	end

	local function SkinSexyCooldownBar(bar)
		SCDStripSkinSettings(bar)
		AS:SkinFrame(bar)
		AS:RegisterForPetBattleHide(bar)
		if AS:CheckOption('EmbedSexyCooldown') then
			bar:ClearAllPoints()
			AS.ActionBar2:HookScript('OnShow', function() 
				bar:SetPoint('BOTTOM', AS.ActionBar2, 'TOP', 0, 1)
				bar:SetHeight(ActionButton1:GetHeight())
				bar:SetWidth(AS.ActionBar2:GetWidth())
			end)
			AS.ActionBar2:HookScript('OnHide', function() 
				bar:SetPoint('BOTTOM', AS.ActionBar1, 'TOP', 0, 1)
				bar:SetHeight(ActionButton1:GetHeight())
				bar:SetWidth(AS.ActionBar1:GetWidth())
			end)
		end
	end

	local function SkinSexyCooldownIcon(bar, icon)
		if not icon.skinned then
			AS:SkinFrame(icon, false, true)
			AS:SkinBackdropFrame(icon.overlay, false, true)
			icon.skinned = true
		end
		AS:SkinTexture(icon.overlay.tex)
		AS:SkinTexture(icon.tex)
	end

	local function SkinSexyCooldownBackdrop(bar)
		AS:SkinFrame(bar, nil, true)
	end

	local function HookSCDBar(bar)
		if bar.hooked then return end
		hooksecurefunc(bar, 'UpdateBarLook', SkinSexyCooldownBar)
		hooksecurefunc(bar, 'UpdateSingleIconLook', SkinSexyCooldownIcon)
		hooksecurefunc(bar, 'UpdateBarBackdrop', SkinSexyCooldownBackdrop)
		bar.settings.icon.borderInset = 0
		bar.hooked = true
	end

	for _, bar in ipairs(SexyCooldown2.bars) do
		HookSCDBar(bar)
		bar:UpdateBarLook()
	end

	hooksecurefunc(SexyCooldown2, 'CreateBar', function(self)
		for _, bar in ipairs(self.bars) do
			HookSCDBar(bar)
			bar:UpdateBarLook()
		end
	end)
end

AS:RegisterSkin('SexyCooldown', AS.SexyCooldown)