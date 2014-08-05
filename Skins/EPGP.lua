local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('EPGP') then return end

local name = 'EPGPSkin'
function AS:SkinEPGP(event, addon)
	local function SkinEPGP()
		AS:SkinFrame(EPGPFrame)
		AS:SkinFrame(EPGPLogFrame, nil, true)
		AS:SkinFrame(EPGPScrollFrame, nil, true)
		AS:SkinFrame(EPGPExportImportFrame, nil, true)
		AS:SkinFrame(EPGPSideFrame, nil, true)
		EPGPScrollFrameScrollBar:StripTextures()
		EPGPScrollFrameScrollBarBorder:StripTextures()

		AS:SkinScrollBar(EPGPScrollFrameScrollBar)
		AS:SkinDropDownBox(EPGPSideFrameGPControlDropDown)
		AS:SkinDropDownBox(EPGPSideFrameEPControlDropDown)
		AS:SkinDropDownBox(EPGPSideFrame2EPControlDropDown)
	end

	hooksecurefunc(EPGP, 'ToggleUI', SkinEPGP)
end

AS:RegisterSkin(name, AS.SkinEPGP)