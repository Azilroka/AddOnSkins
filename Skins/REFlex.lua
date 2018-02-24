local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('REFlex') then return end

function AS:REFlex()
	AS:SkinFrame(REFlexFrame)
	AS:SkinFrame(REFlex.TableBG.frame, nil, true)
	AS:StripTextures(_G[REFlex.TableBG.frame:GetName()..'ScrollTrough'], true)
	AS:SkinScrollBar(_G[REFlex.TableBG.frame:GetName()..'ScrollFrameScrollBar'])
	AS:SkinFrame(REFlex.TableArena.frame, nil, true)
	AS:StripTextures(_G[REFlex.TableArena.frame:GetName()..'ScrollTrough'], true)
	AS:SkinScrollBar(_G[REFlex.TableArena.frame:GetName()..'ScrollFrameScrollBar'])
	AS:SkinButton(REFlexFrame_DumpButton)
	AS:SkinCloseButton(REFlexFrame_CloseButton)
	AS:StripTextures(REFlexFrame_HKBar)
	AS:SkinStatusBar(REFlexFrame_HKBar_I)
	for i = 1, REFlexFrame.numTabs do
		AS:SkinTab(_G["REFlexFrameTab"..i])
	end
	REFlexFrame_Title:SetPoint('TOP', 0, -10)
	REFlexFrame_HKBar:SetPoint('BOTTOM', 0, 19)
end

AS:RegisterSkin('REFlex', AS.REFlex)
