local AS = ElvUI[1]:GetModule('AddOnSkins')
local TT = ElvUI[1]:GetModule('Tooltip')

if not AS:CheckAddOn('MyRolePlay') then return end

local name = "MyRolePlaySkin"
function AS:SkinMyRolePlayElvUI()
	if (AS:CheckOption("IntegrateMyRolePlayTooltip")) then
		mrpSaved.Options.TooltipStyle = 6

		-- Just in case we haven't loaded the options yet
		mrp:CreateOptionsPanel()
		local f = MyRolePlayOptionsPanel
		f.ttstyle.Enable = f.ttstyle.Disable
		f.ttstyle:Disable();

		mrp._UpdateTooltip = mrp.UpdateTooltip;
		mrp.UpdateTooltip = function(self, player, unit)
			if not (msp.char and msp.char[player] and msp.char[player].supported) then return end;
			self:_UpdateTooltip(player, unit);
		end

		hooksecurefunc(TT, "GameTooltip_OnTooltipSetUnit", function()
			if( UnitExists("mouseover")) then -- flag style
				local player = UnitName("mouseover");
				if not (msp.char and msp.char[player] and msp.char[player].supported) then return end;
				local unit = "mouseover";
				mrp:UpdateTooltip( player, unit );
			end
		end)

		GameTooltipTextLeft1._SetTextColor = GameTooltipTextLeft1.SetTextColor;
		GameTooltipTextLeft1.SetTextColor = function(self, r, g, b, a)
			GameTooltipTextLeft1:_SetTextColor(r, g, b, a);

			if (not UnitExists("mouseover")) then return end;
			local player = UnitName("mouseover");
			if not (msp.char and msp.char[player] and msp.char[player].supported) then return end;
			local unit = "mouseover"
			local r, g, b = mrp:UnitColour( unit )
			GameTooltipTextLeft1:_SetTextColor( r, g, b )
		end
	end
end

AS:RegisterSkin(name, AS.SkinMyRolePlayElvUI, 2)