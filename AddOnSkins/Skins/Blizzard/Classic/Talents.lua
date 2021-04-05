if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_TalentUI(event, addon)
	if addon ~= 'Blizzard_TalentUI' then return end

	AS:SkinBackdropFrame(TalentFrame)
	TalentFramePortrait:Hide()
	AS:SkinCloseButton(TalentFrameCloseButton)
	TalentFrame.Backdrop:SetPoint('TOPLEFT', 13, -12)
	TalentFrame.Backdrop:SetPoint('BOTTOMRIGHT', -31, 76)

	for i = 1, 5 do
		AS:SkinTab(_G["TalentFrameTab"..i])
	end

	AS:SkinButton(TalentFrameCancelButton)

	AS:StripTextures(TalentFrameScrollFrame)

	AS:SkinScrollBar(TalentFrameScrollFrameScrollBar)
	TalentFrameScrollFrameScrollBar:SetPoint('TOPLEFT', TalentFrameScrollFrame, 'TOPRIGHT', 10, -16)

	TalentFrameSpentPoints:SetPoint('TOP', 0, -42)
	TalentFrameTalentPointsText:SetPoint('BOTTOMRIGHT', TalentFrame, 'BOTTOMLEFT', 220, 84)

	for i = 1, MAX_NUM_TALENTS do
		local talent = _G['TalentFrameTalent'..i]
		local icon = _G['TalentFrameTalent'..i..'IconTexture']
		local rank = _G['TalentFrameTalent'..i..'Rank']

		if talent then
			AS:SkinBackdropFrame(talent)
			AS:StyleButton(talent)
			talent.Backdrop:SetFrameStrata('LOW')
			talent.Backdrop:SetFrameLevel(talent:GetFrameLevel() - 1)

			AS:SetInside(icon, talent.Backdrop, 2, 2)
			AS:SkinTexture(icon)
			icon:SetDrawLayer('ARTWORK')
			rank:SetDrawLayer('OVERLAY')

			rank:SetFont(AS.Font, 12, 'OUTLINE') -- easier to read
		end
	end

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin('Blizzard_TalentUI', AS.Blizzard_TalentUI, 'ADDON_LOADED')
