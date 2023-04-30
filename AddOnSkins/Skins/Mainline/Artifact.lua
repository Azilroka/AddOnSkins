local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local next = next
local unpack = unpack
local hooksecurefunc = hooksecurefunc

function S:Blizzard_ArtifactUI()
	if not AS:IsSkinEnabled('Blizzard_ArtifactUI', 'artifact') then return end

	local ArtifactFrame = _G.ArtifactFrame
	S:HandleFrame(ArtifactFrame)
	S:StripTextures(ArtifactFrame.BorderFrame)

	for i = 1, 2 do
		S:HandleTab(_G['ArtifactFrameTab' .. i])
	end

	local ArtifactFrameTab1 = _G.ArtifactFrameTab1
	ArtifactFrameTab1:ClearAllPoints()
	S:Point(ArtifactFrameTab1, 'TOPLEFT', ArtifactFrame, 'BOTTOMLEFT', 0, 0)

	ArtifactFrame.ForgeBadgeFrame.ItemIcon:Hide()
	ArtifactFrame.ForgeBadgeFrame.ForgeLevelBackground:ClearAllPoints()
	S:Point(ArtifactFrame.ForgeBadgeFrame.ForgeLevelBackground, 'TOPLEFT', ArtifactFrame)

	ArtifactFrame.AppearancesTab:HookScript('OnShow', function(frame)
		for _, child in next, { frame:GetChildren() } do
			if child.appearanceID and not child.backdrop then
				S:CreateBackdrop(child)
				child.SwatchTexture:SetTexCoord(.20,.80,.20,.80)
				S:SetInside(child.SwatchTexture, child.backdrop)
				child.Border:SetAlpha(0)
				child.Background:SetAlpha(0)
				child.HighlightTexture:SetAlpha(0)
				child.HighlightTexture.SetAlpha = S.noop

				if child.Selected:IsShown() then
					child.backdrop:SetBackdropBorderColor(1,1,1)
				end

				child.Selected:SetAlpha(0)
				child.Selected.SetAlpha = S.noop

				hooksecurefunc(child.Selected, 'SetShown', function(_, isActive)
					if isActive then
						child.backdrop:SetBackdropBorderColor(1,1,1)
					else
						child.backdrop:SetBackdropBorderColor(unpack(S.Media.borderColor))
					end
				end)
			end
		end
	end)
end

AS:RegisterSkin('Blizzard_ArtifactUI', nil, 'ADDON_LOADED')
