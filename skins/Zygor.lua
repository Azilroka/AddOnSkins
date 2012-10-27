LoadAddOn("ZygorGuidesViewer")
if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("ZygorGuidesViewer") then return end
local U = unpack(select(2,...))
local name = "ZygorSkin"
local function SkinZygor(self)
	ZygorGuidesViewerFrame:StripTextures(True)
	ZygorGuidesViewerFrame_Border:StripTextures(True)
	ZygorGuidesViewer_CreatureViewer:SetTemplate("Transparent")

	for i = 1, 6 do
		_G["ZygorGuidesViewerFrame_Step"..i]:StripTextures(True)
		_G["ZygorGuidesViewerFrame_Step"..i]:CreateBackdrop()
	end

	if ZygorGuidesViewerFrame:IsShown() then ZygorGuidesViewerFrame_Border:SetTemplate("Transparent") end
	ZygorGuidesViewerFrame_Border:HookScript("OnHide", function(self) self:StripTextures(True) end)
	ZygorGuidesViewerFrame_Border:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)

end

U.RegisterSkin(name,SkinZygor)