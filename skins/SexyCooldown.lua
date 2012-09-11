if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("SexyCooldown2") then return end

local name = "SexyCooldownSkin"
local scd = SexyCooldown2
local c = UIPackageSkinFuncs.c

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
	cSkinFrame(bar)
end


-- Skin Icons
local function SkinSexyCooldownIcon(bar, icon)
	cSkinFrame(icon)
	icon.overlay:CreateBackdrop("Default")
	icon.tex:SetTexCoord(unpack(c.TexCoords))
	icon.tex.SetTexCoord = E.noop
	icon.overlay:SetBackdropColor(0,0,0,0)
	-- Default no background/border
	icon:SetBackdropColor(0,0,0,0)
	icon:SetBackdropBorderColor(c["media"].bordercolor)
	icon.overlay:SetBackdropBorderColor(c["media].bordercolor"])
end

local function PositionSexyCooldownBar(bar)
	if(cCheckOption("EmbedSexyCooldown")) then
		bar:ClearAllPoints()
		if IsAddOnLoaded("ElvUI") then
			bar:Point('BOTTOM', ElvUI_Bar1, 'TOP', 0, 1)
			bar:SetHeight(ElvUI_Bar1:GetHeight()/1.5)
			bar:SetWidth(ElvUI_Bar1:GetWidth())
			bar:EnableMouse(false)
		end
	end
end

--[[ Hook bar creation to add skinning ]]

local function HookSCDBar(bar)
	-- Hook bar skinning & layout
	bar.UpdateBarLook_ = bar.UpdateBarLook
	bar.UpdateBarLook = function(self)
		self:UpdateBarLook_()
		SkinSexyCooldownBar(self)
		PositionSexyCooldownBar(self)
	end
	-- Hook icon skinning
	bar.UpdateSingleIconLook_ = bar.UpdateSingleIconLook
	bar.UpdateSingleIconLook = function(self,icon)
		self:UpdateSingleIconLook_(icon)
		SkinSexyCooldownIcon(bar,icon)
	end
	bar.UpdateLabel_ = bar.UpdateLabel
	bar.UpdateLabel = function(self,label,store)
		if IsAddOnLoaded("ElvUI") then
			label:SetFont([[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]], store.fontsize, "OUTLINE")
		else
			label:SetFont([[Interface\AddOns\Tukui\medias\fonts\normal_font.ttf]], store.fontsize, "OUTLINE")
		end
	end
	-- Static skinning
	bar.settings.icon.borderInset = 1
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

cRegisterSkin(name,SkinSexyCooldown)