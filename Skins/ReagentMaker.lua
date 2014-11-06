local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ReagentMaker') then return end

function AS:ReagentMaker()
	GameTooltip:HookScript('OnShow', function()
		if ReagentMaker_tooltipRecipe and not ReagentMaker_tooltipRecipe.IsSkinned then
			AS:SkinTooltip(ReagentMaker_tooltipRecipe)
			ReagentMaker_tooltipRecipe:HookScript('OnUpdate', function(self) self:ClearAllPoints() self:SetPoint('BOTTOMLEFT', GameTooltip, 'BOTTOMRIGHT', 2, 0) end)
			ReagentMaker_tooltipRecipe.IsSkinned = true
		end
	end)
end

AS:RegisterSkin('ReagentMaker', AS.ReagentMaker)