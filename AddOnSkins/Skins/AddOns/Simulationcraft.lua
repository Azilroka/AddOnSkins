local AS, L, S, R = unpack(AddOnSkins)

function R:Simulationcraft()
	local Simulationcraft = LibStub("AceAddon-3.0"):GetAddon("Simulationcraft")
	hooksecurefunc(Simulationcraft, 'GetMainFrame', function()
		if not SimcFrame.isSkinned then
			S:HandleFrame(SimcFrame)
			S:HandleButton(SimcFrameButton)
			S:HandleScrollBar(SimcScrollFrameScrollBar)
		end
	end)
end

AS:RegisterSkin('Simulationcraft')
