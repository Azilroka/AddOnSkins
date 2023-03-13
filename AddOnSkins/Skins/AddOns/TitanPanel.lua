local AS, L, S, R = unpack(AddOnSkins)

function R:Titan()
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

AS:RegisterSkin('Titan')
