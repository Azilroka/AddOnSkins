local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Titan') then return end

local name = 'TitanPanelSkin'
function AS:SkinTitanPanel()
	AS:Delay(1, function()
		AS:SkinFrame(Titan_Bar__Display_Bar, 'Default', nil, true)
		AS:SkinFrame(Titan_Bar__Display_Bar2, 'Default', nil, true)
		AS:SkinFrame(Titan_Bar__Display_AuxBar, 'Default', nil, true)
		AS:SkinFrame(Titan_Bar__Display_AuxBar2, 'Default', nil, true)
		if RaidUtility_ShowButton then
			RaidUtility_ShowButton:SetFrameStrata('TOOLTIP')
		end
	end)
end

AS:RegisterSkin(name, AS.SkinTitanPanel)