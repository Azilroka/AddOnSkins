local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('WeakAuras') then return end

local name = "WeakAurasSkin"
function AS:SkinWeakAuras()
	local function Skin_WeakAuras(frame, ftype)
		if not frame.backdrop then
			frame:CreateBackdrop('Default')
			frame.icon.OldAlpha = frame.icon.SetAlpha
			frame.icon.SetAlpha = function(self, ...)
				frame.icon.OldAlpha(self, ...)
				frame.backdrop:SetAlpha(...)
			end
		end

		if ftype == 'icon' then
			ElvUI[1]:RegisterCooldown(frame.cooldown)
		end

		AS:SkinTexture(frame.icon)
		frame.icon.SetTexCoord = function() end
	end
	
	local function Create_Icon(parent, data)
		local region = WeakAuras.regionTypes.icon.OldCreate(parent, data)
		Skin_WeakAuras(region, 'icon')
		
		return region
	end
	
	local function Create_Aurabar(parent)
		local region = WeakAuras.regionTypes.aurabar.OldCreate(parent)
		if AS:CheckOption('WeakAuraAuraBar') then
			Skin_WeakAuras(region, 'aurabar')
		end
		return region
	end

	local function Modify_Icon(parent, region, data)
		WeakAuras.regionTypes.icon.OldModify(parent, region, data)

		Skin_WeakAuras(region, 'icon')
	end
	
	local function Modify_Aurabar(parent, region, data)
		WeakAuras.regionTypes.aurabar.OldModify(parent, region, data)
		if AS:CheckOption('WeakAuraAuraBar') then
			Skin_WeakAuras(region, 'aurabar')
		end
	end
	
	WeakAuras.regionTypes.icon.OldCreate = WeakAuras.regionTypes.icon.create
	WeakAuras.regionTypes.icon.create = Create_Icon
	
	WeakAuras.regionTypes.aurabar.OldCreate = WeakAuras.regionTypes.aurabar.create
	WeakAuras.regionTypes.aurabar.create = Create_Aurabar
	
	WeakAuras.regionTypes.icon.OldModify = WeakAuras.regionTypes.icon.modify
	WeakAuras.regionTypes.icon.modify = Modify_Icon
	
	WeakAuras.regionTypes.aurabar.OldModify = WeakAuras.regionTypes.aurabar.modify
	WeakAuras.regionTypes.aurabar.modify = Modify_Aurabar
	
	for weakAura, _ in pairs(WeakAuras.regions) do
		if WeakAuras.regions[weakAura].regionType == 'icon'
		   or WeakAuras.regions[weakAura].regionType == 'aurabar' then
			Skin_WeakAuras(WeakAuras.regions[weakAura].region, WeakAuras.regions[weakAura].regionType)
		end
	end
end

AS:RegisterSkin(name, AS.SkinWeakAuras)