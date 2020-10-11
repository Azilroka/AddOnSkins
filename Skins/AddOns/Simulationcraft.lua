local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Simulationcraft') then return end

function AS:Simulationcraft()
	local Simulationcraft = LibStub("AceAddon-3.0"):GetAddon("Simulationcraft")
	hooksecurefunc(Simulationcraft, 'GetMainFrame', function()
		if not SimcFrame.isSkinned then
			AS:SkinFrame(SimcFrame)
			AS:SkinButton(SimcFrameButton)
			AS:SkinScrollBar(SimcScrollFrameScrollBar)
		end
	end)
end

AS:RegisterSkin('Simulationcraft', AS.Simulationcraft)
