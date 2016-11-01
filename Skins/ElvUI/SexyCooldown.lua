local AS = unpack(AddOnSkins)

if not (AS:CheckAddOn('SexyCooldown2') and AS:CheckAddOn('ElvUI')) then return end

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
		if AS:CheckOption("EmbedSexyCooldown") then
			bar:ClearAllPoints()
			bar:SetPoint('BOTTOMRIGHT', ElvUI_Bar1, 'TOPRIGHT', 0, 2)
			bar:SetPoint("BOTTOMLEFT", ElvUI_Bar1, "TOPLEFT", 0, 2)
			bar:SetHeight(ElvUI_Bar1Button1:GetHeight())
			local activated
			ElvUI_Bar1:HookScript("OnShow", function() bar:Show() end)
			ElvUI_Bar1:HookScript("OnHide", function() if (not activated) then bar:Hide() end end)
			hooksecurefunc(ElvUI_Bar1, "SetAlpha", function(_, alpha)
				if (not activated) then
					bar:SetAlpha(alpha)
				end
			end)
			hooksecurefunc(bar, "Activate", function()
				activated = true
			end)
			hooksecurefunc(bar, "Deactivate", function()
				activated = false
				if (not ElvUI_Bar1:IsShown()) then
					bar:Hide()
				end
				bar:SetAlpha(ElvUI_Bar1:GetAlpha())
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
		AS:SetTemplate(bar, 'Transparent')
	end

	local function HookSCDBar(bar)
		if bar.hooked then return end
		hooksecurefunc(bar, "UpdateBarLook", SkinSexyCooldownBar)
		hooksecurefunc(bar, "UpdateSingleIconLook", SkinSexyCooldownIcon)
		hooksecurefunc(bar, "UpdateBarBackdrop", SkinSexyCooldownBackdrop)
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