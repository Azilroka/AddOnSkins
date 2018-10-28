local AS = unpack(AddOnSkins)

function AS:Blizzard_ArtifactUI(event, addon)
	if addon ~= 'Blizzard_ArtifactUI' then return end

	AS:SkinBackdropFrame(ArtifactFrame)
	AS:SkinCloseButton(ArtifactFrame.CloseButton)

	for i = 1, 2 do
		AS:SkinTab(_G["ArtifactFrameTab" .. i])
	end

--	ArtifactFrameTab1:SetPoint("TOPLEFT", ArtifactFrame, "BOTTOMLEFT", 0, 0)

	ArtifactFrame.ForgeBadgeFrame.ItemIcon:Hide()
	ArtifactFrame.ForgeBadgeFrame.ForgeLevelBackground:ClearAllPoints()
	ArtifactFrame.ForgeBadgeFrame.ForgeLevelBackground:SetPoint("TOPLEFT", ArtifactFrame)

	ArtifactFrame.AppearancesTab:HookScript("OnShow", function(self)
		for i = 1, self:GetNumChildren() do
			local child = select(i, self:GetChildren())
			if child and child.appearanceID and not child.Backdrop then
				AS:SkinTexture(child.SwatchTexture, true)
				child.Border:SetAlpha(0)
				child.Background:SetAlpha(0)
				child.HighlightTexture:SetAlpha(0)
				child.HighlightTexture.SetAlpha = AS.Noop

				if child.Selected:IsShown() then
					child.backdrop:SetBackdropBorderColor(1,1,1)
				end

				child.Selected:SetAlpha(0)
				child.Selected.SetAlpha = AS.Noop

				hooksecurefunc(child.Selected, "SetShown", function(_, isActive)
					if isActive then
						child.backdrop:SetBackdropBorderColor(1,1,1)
					else
						child.backdrop:SetBackdropBorderColor(unpack(E.media.bordercolor))
					end
				end)
			end
		end
	end)
end

AS:RegisterSkin("Blizzard_ArtifactUI", AS.Blizzard_ArtifactUI, 'ADDON_LOADED')