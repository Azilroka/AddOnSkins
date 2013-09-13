local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "WeakAurasSkin"
function AS:SkinWeakAuras()
	local function Skin_WeakAuras(frame)
		if not frame.backdrop then
			frame:CreateBackdrop('Default')
			frame.icon.OldAlpha = frame.icon.SetAlpha
			frame.icon.SetAlpha = function(self, ...)
				frame.icon.OldAlpha(self, ...)
				frame.backdrop:SetAlpha(...)
			end
		end

		ElvUI[1]:RegisterCooldown(frame.cooldown)

		AS:SkinTexture(frame.icon)
		frame.icon.SetTexCoord = function() end
	end

	local function Create_WeakAuras(parent, data)
		local region = WeakAuras.regionTypes.icon.OldCreate(parent, data)
		Skin_WeakAuras(region)
		
		return region
	end

	local function Modify_WeakAuras(parent, region, data)
		WeakAuras.regionTypes.icon.OldModify(parent, region, data)

		Skin_WeakAuras(region)
	end
	WeakAuras.regionTypes.icon.OldCreate = WeakAuras.regionTypes.icon.create
	WeakAuras.regionTypes.icon.create = Create_WeakAuras
	
	WeakAuras.regionTypes.icon.OldModify = WeakAuras.regionTypes.icon.modify
	WeakAuras.regionTypes.icon.modify = Modify_WeakAuras
	
	for weakAura, _ in pairs(WeakAuras.regions) do
		if WeakAuras.regions[weakAura].regionType == 'icon' then
			Skin_WeakAuras(WeakAuras.regions[weakAura].region)
		end
	end
end

AS:RegisterSkin(name, AS.SkinWeakAuras)