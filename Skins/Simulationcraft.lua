local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Simulationcraft') then return end

function AS:Simulationcraft()

	AS:SkinFrame(SimcCopyFrame)
	AS:SkinButton(SimcCopyFrameButton)
	AS:SkinScrollBar(SimcCopyFrameScrollScrollBar)
end

AS:RegisterSkin('Simulationcraft', AS.Simulationcraft)