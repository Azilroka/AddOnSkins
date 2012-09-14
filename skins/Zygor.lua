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

	for i = 1, 25 do
		if _G["ZygorGuidesViewerFrame_Step1_Line"..i.."Back"] then _G["ZygorGuidesViewerFrame_Step1_Line"..i.."Back"]:StripTextures(True) end
		if _G["ZygorGuidesViewerFrame_Step2_Line"..i.."Back"] then _G["ZygorGuidesViewerFrame_Step2_Line"..i.."Back"]:StripTextures(True) end
		if _G["ZygorGuidesViewerFrame_Step3_Line"..i.."Back"] then _G["ZygorGuidesViewerFrame_Step3_Line"..i.."Back"]:StripTextures(True) end
		if _G["ZygorGuidesViewerFrame_Step4_Line"..i.."Back"] then _G["ZygorGuidesViewerFrame_Step4_Line"..i.."Back"]:StripTextures(True) end
		if _G["ZygorGuidesViewerFrame_Step5_Line"..i.."Back"] then _G["ZygorGuidesViewerFrame_Step5_Line"..i.."Back"]:StripTextures(True) end
		if _G["ZygorGuidesViewerFrame_Step6_Line"..i.."Back"] then _G["ZygorGuidesViewerFrame_Step6_Line"..i.."Back"]:StripTextures(True) end
	end

	ZygorGuidesViewerFrame_Border:HookScript("OnHide", function(self) self:StripTextures(True) end)
	ZygorGuidesViewerFrame_Border:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)

end

U.RegisterSkin(name,SkinZygor)