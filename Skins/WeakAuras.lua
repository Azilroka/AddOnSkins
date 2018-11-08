local AS, ASL = unpack(AddOnSkins)

if not AS:CheckAddOn('WeakAuras') then return end

function AS:WeakAuras()
	if not WeakAuras.regionTypes then
		AS:AcceptFrame('WeakAuras was updated while WoW was open. Close & Relaunch WoW.')
		return
	end

	local function Skin_WeakAuras(frame, ftype)
		if not frame.Backdrop then
			AS:CreateBackdrop(frame)
			if ftype == 'icon' then
				frame.Backdrop:SetBackdropColor(0, 0, 0, 0)
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

		if frame.icon then
			if frame.keepAspectRatio == true then
				frame.icon.SetTexCoord = nil
			else
				AS:SkinTexture(frame.icon)
				frame.icon.SetTexCoord = AS.Noop
			end
			if frame.cooldown and AS:CheckOption('WeakAuraIconCooldown', 'ElvUI') then
				ElvUI[1]:RegisterCooldown(frame.cooldown)
				ElvUI[1]:UpdateCooldownSettings('global')
			end
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
		if WeakAuras.regions[weakAura].regionType == 'icon' or WeakAuras.regions[weakAura].regionType == 'aurabar' then
			Skin_WeakAuras(WeakAuras.regions[weakAura].region, WeakAuras.regions[weakAura].regionType)
		end
	end

	AS.Options.args.general.args.WeakAuras = {
		type = 'group',
		name = 'WeakAuras',
		guiInline = true,
		order = -1,
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) AS.NeedReload = true end,
		args = {
			WeakAuraAuraBar = {
				type = 'toggle',
				name = 'WeakAura AuraBar',
				order = -1,
				disabled = function() return not AS:CheckOption('WeakAuras', 'WeakAuras') end,
			},
			WeakAuraIconCooldown = {
				type = 'toggle',
				name = 'WeakAura Cooldowns',
				order = -2,
				disabled = function() return not (AS:CheckOption('WeakAuras', 'WeakAuras') and AS:CheckAddOn('ElvUI')) end,
			},
		},
	}
end

AS:RegisterSkinForPreload('WeakAuras', AS.WeakAuras)
