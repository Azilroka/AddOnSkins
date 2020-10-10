local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Simulationcraft') then return end

function AS:Simulationcraft()

	AS:SkinFrame(SimcFrame)
	AS:SkinButton(SimcFrameButton)
	AS:SkinScrollBar(SimcFrameScrollScrollBar)
end

AS:RegisterSkin('Simulationcraft', AS.Simulationcraft)
