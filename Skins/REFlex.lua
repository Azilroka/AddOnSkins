local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('REFlex') then return end

function AS:REFlex()
	AS:SkinFrame(REFlex)
	AS:SkinFrame(REFlexNamespace.TableBG.frame, nil, true)
	AS:StripTextures(_G[REFlexNamespace.TableBG.frame:GetName()..'ScrollTrough'], true)
	AS:SkinScrollBar(_G[REFlexNamespace.TableBG.frame:GetName()..'ScrollFrameScrollBar'])
	AS:SkinFrame(REFlexNamespace.TableArena.frame, nil, true)
	AS:StripTextures(_G[REFlexNamespace.TableArena.frame:GetName()..'ScrollTrough'], true)
	AS:SkinScrollBar(_G[REFlexNamespace.TableArena.frame:GetName()..'ScrollFrameScrollBar'])
	AS:SkinButton(REFlex_DumpButton)
	AS:SkinCloseButton(REFlex_CloseButton)
	AS:StripTextures(REFlex_HKBar)
	AS:SkinStatusBar(REFlex_HKBar_I)
	for i = 1, REFlex.numTabs do
		AS:SkinTab(_G["REFlexTab"..i])
	end
	REFlex_Title:SetPoint('TOP', 0, -10)
	REFlex_HKBar:SetPoint('BOTTOM', 0, 19)
end

AS:RegisterSkin('REFlex', AS.REFlex)
