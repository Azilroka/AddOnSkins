local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('EPGP') then return end

function AS:EPGP(event, addon)
	local function SkinEPGP()
		AS:SkinFrame(EPGPFrame)
		AS:SkinFrame(EPGPLogFrame, nil, true)
		AS:SkinFrame(EPGPScrollFrame, nil, true)
		AS:SkinFrame(EPGPExportImportFrame, nil, true)
		AS:SkinFrame(EPGPSideFrame, nil, true)
		AS:StripTextures(EPGPScrollFrameScrollBar)
		AS:StripTextures(EPGPScrollFrameScrollBarBorder)

		AS:SkinScrollBar(EPGPScrollFrameScrollBar)
		AS:SkinDropDownBox(EPGPSideFrameGPControlDropDown)
		AS:SkinDropDownBox(EPGPSideFrameEPControlDropDown)
		AS:SkinDropDownBox(EPGPSideFrame2EPControlDropDown)
	end

	hooksecurefunc(EPGP, 'ToggleUI', SkinEPGP)
end

AS:RegisterSkin('EPGP', AS.EPGP)