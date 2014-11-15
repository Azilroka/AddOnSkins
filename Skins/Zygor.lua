local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ZygorGuidesViewer') then return end

function AS:Zygor()
	AS:StripTextures(ZygorGuidesViewerFrame, true)
	AS:SkinFrame(ZygorGuidesViewerFrame_Border)
	AS:SkinFrame(ZygorGuidesViewer_CreatureViewer, 'Transparent', true)

	for i = 1, 6 do
		AS:SkinBackdropFrame(_G['ZygorGuidesViewerFrame_Step'..i])
	end

	if ZygorGuidesViewerFrame:IsShown() then AS:SkinFrame(ZygorGuidesViewerFrame_Border) end
	ZygorGuidesViewerFrame_Border:HookScript('OnHide', function(self) AS:StripTextures(self, true) end)
	ZygorGuidesViewerFrame_Border:HookScript('OnShow', function(self) AS:SkinFrame(self) end)
end

AS:RegisterSkin('Zygor', AS.Zygor)