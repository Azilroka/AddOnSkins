local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ZygorGuidesViewer') then return end

local name = 'ZygorSkin'
function AS:SkinZygor()
	ZygorGuidesViewerFrame:StripTextures(true)
	AS:SkinFrame(ZygorGuidesViewerFrame_Border)
	AS:SkinFrame(ZygorGuidesViewer_CreatureViewer, 'Transparent', true)

	for i = 1, 6 do
		AS:SkinBackdropFrame(_G['ZygorGuidesViewerFrame_Step'..i])
	end

	if ZygorGuidesViewerFrame:IsShown() then AS:SkinFrame(ZygorGuidesViewerFrame_Border) end
	ZygorGuidesViewerFrame_Border:HookScript('OnHide', function(self) self:StripTextures(true) end)
	ZygorGuidesViewerFrame_Border:HookScript('OnShow', function(self) AS:SkinFrame(self) end)
end

AS:RegisterSkin(name, AS.SkinZygor)