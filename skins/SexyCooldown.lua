if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("SexyCooldown2") then return end
local U = unpack(select(2,...))
local name = "SexyCooldownSkin"
local scd = SexyCooldown2
local c = U.c
local s = U.s
local LSM = LibStub("LibSharedMedia-3.0")
-- Strip skinning settings from in-game GUI
local function SCDStripSkinSettings(bar)
	-- Remove conflicting options
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

-- Skin Bars
local function SkinSexyCooldownBar(bar)
	SCDStripSkinSettings(bar)
	if not bar.skinned then U.SkinFrame(bar) bar.skinned = true end
	if(U.CheckOption("EmbedSexyCooldown")) then
		bar:ClearAllPoints()
		if IsAddOnLoaded("ElvUI") then
			bar:Point('BOTTOM', ElvUI_Bar1, 'TOP', 0, 1)
			bar:SetHeight(ElvUI_Bar1:GetHeight())
			bar:SetWidth(ElvUI_Bar1:GetWidth())
		else
			bar:Point('BOTTOM', InvTukuiActionBarBackground, 'TOP', 0, 1)
			bar:SetHeight(ActionButton1:GetHeight())
			bar:SetWidth(TukuiBar1:GetWidth())
		end
		bar:EnableMouse(false)
	end
end


-- Skin Icons
local function SkinSexyCooldownIcon(bar, icon)
	if not icon.skinned then
		U.SkinFrame(icon)
		icon.overlay:CreateBackdrop("Default")
		icon.tex:SetTexCoord(0.08, 0.92, 0.08, 0.92)
		if ElvUI then icon.tex.SetTexCoord = c.noop end
		if Tukui then icon.tex.SetTexCoord = s.dummy end	
		icon.overlay:SetBackdropColor(0,0,0,0)
		-- Default no background/border
		icon:SetBackdropColor(0,0,0,0)
		icon:SetBackdropBorderColor(c["media"].bordercolor)
		icon.overlay:SetBackdropBorderColor(c["media"].bordercolor)
		icon.skinned = true
	end
end

local function SkinSexyCooldownLabel(bar,label,store)
	if not label.skinned then
		if IsAddOnLoaded("ElvUI") then
			local x = U.x
			label:SetFont(x.pixelFont, store.fontsize, "OUTLINE")
		else
			label:SetFont(c["media"].pixelfont, store.fontsize, "OUTLINE")
		end
	end
end

--[[ Hook bar creation to add skinning ]]

local function HookSCDBar(bar)
	hooksecurefunc(bar,"UpdateBarLook",SkinSexyCooldownBar)
	hooksecurefunc(bar,"UpdateSingleIconLook", SkinSexyCooldownIcon)
	hooksecurefunc(bar,"UpdateLabel",SkinSexyCooldownLabel)
	-- Static skinning
	bar.settings.icon.borderInset = 0
end

local function SkinSexyCooldown(self)
	scd.CreateBar_ = scd.CreateBar
	scd.CreateBar = function(self, settings, name)
		local bar = scd:CreateBar_(settings,name)
		HookSCDBar(bar)
		return bar
	end

	-- Skin Pre-existing bars
	for _,bar in ipairs(scd.bars) do
		HookSCDBar(bar)
		-- Force a bar update
		bar:UpdateBarLook()
	end
end

U.RegisterSkin(name,SkinSexyCooldown)