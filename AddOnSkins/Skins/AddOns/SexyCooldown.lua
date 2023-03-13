local AS, L, S, R = unpack(AddOnSkins)

function R:SexyCooldown2()
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
		S:HandleFrame(bar)
		AS:RegisterForPetBattleHide(bar)
	end

	local function SkinSexyCooldownIcon(bar, icon)
		if not icon.skinned then
			S:HandleFrame(icon, false, true)
			S:HandleFrame(icon.overlay, true)
			icon.skinned = true
		end
		S:HandleIcon(icon.overlay.tex)
		S:HandleIcon(icon.tex)
	end

	local function SkinSexyCooldownBackdrop(bar)
		S:HandleFrame(bar, nil, true)
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

AS:RegisterSkin('SexyCooldown2')
