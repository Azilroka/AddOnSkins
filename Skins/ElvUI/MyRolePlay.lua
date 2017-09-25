local AS = unpack(AddOnSkins)

if not (AS:CheckAddOn('MyRolePlay') and AS:CheckAddOn('ElvUI')) then return end

function AS:MyRolePlayElvUI()
	if ElvUI[1].private.tooltip.enable ~= true then return end
	local TT = ElvUI[1]:GetModule('Tooltip')

	mrpSaved.Options.TooltipStyle = 6

	-- Just in case we haven't loaded the options yet
	mrp:CreateOptionsPanel()
	local f = MyRolePlayOptionsPanel
	f.ttstyle.Enable = f.ttstyle.Disable
	f.ttstyle:Disable()

	mrp._UpdateTooltip = mrp.UpdateTooltip
	mrp.UpdateTooltip = function(self, player, unit)
		if not player then
			player = UnitExists('mouseover') and UnitName('mouseover') or UnitExists('target') and UnitName('target') or UnitName('player')
			unit = UnitExists('mouseover') and 'mouseover' or UnitExists('target') and 'target' or 'player'
		end
		if not msp.char[player] then return end
		if not msp.char[player].supported then return end
		if not player and unit then return end
		self:_UpdateTooltip(player, unit)
			
		if (AS:CheckAddOn("ElvUI_SLE") and ElvUI[1].db.sle.tooltip.showFaction) then
			if (UnitIsPlayer(unit)) then
				local text = GameTooltipTextLeft1:GetText()
				local faction = UnitFactionGroup(unit)

				if not faction then faction = "Neutral" end

				GameTooltipTextLeft1:SetText("|T"..[[Interface\AddOns\ElvUI_SLE\media\textures\]]..faction..".blp:15:15:0:0:64:64:2:56:2:56|t "..text)
			end
		end
	end

	hooksecurefunc(TT, "GameTooltip_OnTooltipSetUnit", function()
		if( UnitExists("mouseover")) then -- flag style
			local player = UnitName("mouseover")
			if not msp.char[player] then return end
			if not msp.char[player].supported then return end
			local unit = "mouseover"
			mrp:UpdateTooltip( player, unit )
		end
	end)

	GameTooltipTextLeft1._SetTextColor = GameTooltipTextLeft1.SetTextColor
	GameTooltipTextLeft1.SetTextColor = function(self, r, g, b, a)
		GameTooltipTextLeft1:_SetTextColor(r, g, b, a)

		if (not UnitExists("mouseover")) then return end
		local player = UnitName("mouseover")
		if not msp.char[player] then return end
		if not msp.char[player].supported then return end
		local unit = "mouseover"
		local r, g, b = mrp:UnitColour( unit )
		GameTooltipTextLeft1:_SetTextColor( r, g, b )
	end
end

AS:RegisterSkin('MyRolePlay', AS.MyRolePlayElvUI, 2)