local AS, L, S, R = unpack(AddOnSkins)

if not (AS:CheckAddOn('Titan') or AS:CheckAddOn('TitanClassic')) then return end

function R:TitanPanel()
	AS:Delay(1, function()
		S:HandleFrame(Titan_Bar__Display_Bar, 'Default', nil, true)
		S:HandleFrame(Titan_Bar__Display_Bar2, 'Default', nil, true)
		S:HandleFrame(Titan_Bar__Display_AuxBar, 'Default', nil, true)
		S:HandleFrame(Titan_Bar__Display_AuxBar2, 'Default', nil, true)
		if RaidUtility_ShowButton then
			RaidUtility_ShowButton:SetFrameStrata('TOOLTIP')
		end
	end)
end

AS:RegisterSkin('TitanPanel', R.TitanPanel)
