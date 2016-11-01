local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WeakAuras') then return end

function AS:WeakAuras()
	local function Skin_WeakAuras(frame, ftype)
		if not frame.Backdrop then
			AS:CreateBackdrop(frame, 'Transparent')
			AS:SkinTexture(frame.icon)
			frame.icon.SetTexCoord = AS.Noop
			if ftype == 'icon' then
				frame.Backdrop:HookScript('OnUpdate', function(self)
					self:SetAlpha(self:GetParent().icon:GetAlpha())
				end)
			end
		end

		if ftype == 'aurabar' then
			if not AS:CheckOption('WeakAuraAuraBar')then
				frame.Backdrop:Hide()
			else
				frame.Backdrop:Show()
			end
		end

		if ftype == 'icon' then
			if AS:CheckAddOn('ElvUI') and AS:CheckOption('WeakAuraIconCooldown') then ElvUI[1]:RegisterCooldown(frame.cooldown) end
		end
	end

	local Create_Icon, Modify_Icon = WeakAuras.regionTypes.icon.create, WeakAuras.regionTypes.icon.modify
	local Create_AuraBar, Modify_AuraBar = WeakAuras.regionTypes.aurabar.create, WeakAuras.regionTypes.aurabar.modify

	WeakAuras.regionTypes.icon.create = function(parent, data)
		local region = Create_Icon(parent, data)
		Skin_WeakAuras(region, 'icon')
		return region
	end
	
	WeakAuras.regionTypes.aurabar.create = function(parent)
		local region = Create_AuraBar(parent)
		Skin_WeakAuras(region, 'aurabar')
		return region
	end
	
	WeakAuras.regionTypes.icon.modify = function(parent, region, data)
		Modify_Icon(parent, region, data)
		Skin_WeakAuras(region, 'icon')
	end
	
	WeakAuras.regionTypes.aurabar.modify = function(parent, region, data)
		Modify_AuraBar(parent, region, data)
		Skin_WeakAuras(region, 'aurabar')
	end
	
	for weakAura, _ in pairs(WeakAuras.regions) do
		if WeakAuras.regions[weakAura].regionType == 'icon'
		   or WeakAuras.regions[weakAura].regionType == 'aurabar' then
			Skin_WeakAuras(WeakAuras.regions[weakAura].region, WeakAuras.regions[weakAura].regionType)
		end
	end
end

AS:RegisterSkin('WeakAuras', AS.WeakAuras)