local AS, L, S, R = unpack(AddOnSkins)

function R:Immersion()
	S:HandleFrame(ImmersionFrame.TalkBox.BackgroundFrame, true)
	S:CreateShadow(ImmersionFrame.TalkBox.BackgroundFrame.backdrop)

	ImmersionFrame.TalkBox.BackgroundFrame.backdrop:SetPoint('TOPLEFT', ImmersionFrame.TalkBox.BackgroundFrame, 'TOPLEFT', 8, -8)
	ImmersionFrame.TalkBox.BackgroundFrame.backdrop:SetPoint('BOTTOMRIGHT', ImmersionFrame.TalkBox.BackgroundFrame, 'BOTTOMRIGHT', -8, 8)

	S:StripTextures(ImmersionFrame.TalkBox.PortraitFrame)
	S:HandleCloseButton(ImmersionFrame.TalkBox.MainFrame.CloseButton)

	S:SetTemplate(ImmersionFrame.TalkBox.Hilite)
	ImmersionFrame.TalkBox.Hilite:SetBackdropBorderColor(0, 0.44, .87, 1)
	ImmersionFrame.TalkBox.Hilite:SetBackdropColor(0, 0, 0, 0)

	ImmersionFrame.TalkBox.MainFrame.Model.ModelShadow:SetDrawLayer("OVERLAY", 7)
	ImmersionFrame.TalkBox.MainFrame.Model.ModelShadow:SetPoint("BOTTOMRIGHT", 2, -2)
	ImmersionFrame.TalkBox.MainFrame.Model.PortraitBG:Hide()

	S:HandleFrame(ImmersionFrame.TalkBox.Elements, true)
	ImmersionFrame.TalkBox.Elements.backdrop:SetPoint('TOPLEFT', ImmersionFrame.TalkBox.Elements, 'TOPLEFT', 8, -8)
	ImmersionFrame.TalkBox.Elements.backdrop:SetPoint('BOTTOMRIGHT', ImmersionFrame.TalkBox.Elements, 'BOTTOMRIGHT', -8, 8)
	S:CreateShadow(ImmersionFrame.TalkBox.Elements.backdrop)

	S:Kill(ImmersionFrame.TalkBox.MainFrame.Overlay)

	S:HandleStatusBar(ImmersionFrame.TalkBox.ReputationBar)

	ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.ItemHighlight.Icon:Hide();
	ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.ItemHighlight.Icon.Show = function() end;

	ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.ItemHighlight.NameTag:Hide();
	ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.ItemHighlight.NameTag.Show = function() end;

	ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.ItemHighlight.TextSheen:Hide();
	ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.ItemHighlight.TextSheen.Show = function() end;

	local function SkinReward(Button)
		if Button.Icon then
			S:CreateBackdrop(Button)
			AS:StripTexture(Button, [[Interface\Spellbook\Spellbook-Parts]])

			if Button.NameFrame then
				Button.NameFrame:Hide()
			end

			if Button.Border then
				Button.Border:Hide()
			end

			if Button.Mask then
				Button.Mask:Hide()
			end

			Button.backdrop:SetPoint('TOPLEFT', Button.Icon, 'TOPRIGHT', 0, 0)
			Button.backdrop:SetPoint('BOTTOMLEFT', Button.Icon, 'BOTTOMRIGHT', 0, 0)
			Button.backdrop:SetPoint('RIGHT', Button, 'RIGHT', -5, 0)

			S:HandleIcon(Button.Icon, true)

			Button.AutoCastShine = CreateFrame('Frame', '$parentShine', Button, 'AutoCastShineTemplate')
			Button.AutoCastShine:SetParent(Button.Icon.backdrop)
			Button.AutoCastShine:SetAllPoints()

			for _, sparks in pairs(Button.AutoCastShine.sparkles) do
				sparks:SetSize(sparks:GetWidth() * 2, sparks:GetHeight() * 2)
			end

			Button:SetScript("OnUpdate", function(self)
				if ImmersionFrame.TalkBox.Elements.chooseItems and ImmersionFrame.TalkBox.Elements.itemChoice == self:GetID() then
					AutoCastShine_AutoCastStart(self.AutoCastShine, 0, .44, .87 )
				else
					AutoCastShine_AutoCastStop(self.AutoCastShine)
				end
			end)
		end

		if Button.CircleBackground then
			Button.CircleBackground:SetTexture()
			Button.CircleBackgroundGlow:SetTexture()
			hooksecurefunc(Button.ValueText, "SetText", function(self, text) Button.Count:SetText('+'..text) self:Hide() end)
		end
	end

	SkinReward(ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.ArtifactXPFrame)
	SkinReward(ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.HonorFrame)
	SkinReward(ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.MoneyFrame)
	SkinReward(ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.TitleFrame)
	SkinReward(ImmersionFrame.TalkBox.Elements.Content.RewardsFrame.SkillPointFrame)

	ImmersionFrame:HookScript('OnUpdate', function(self)
		for _, Button in ipairs(self.TitleButtons.Buttons) do
			if Button and not Button.backdrop then
				S:CreateBackdrop(Button)
				Button:SetBackdrop(nil)
				Button.Overlay:Hide()
				S:CreateShadow(Button.backdrop)
				S:SetInside(Button.backdrop, Button, 4, 4)
				S:SetTemplate(Button.Hilite)
				Button.Hilite:SetBackdropBorderColor(0, 0.44, .87, 1)
				Button.Hilite:SetBackdropColor(0, 0, 0, 0)
				Button.Hilite:SetAllPoints(Button.backdrop)
				Button:SetHighlightTexture('')
			end
		end
		for _, Button in ipairs(self.TalkBox.Elements.Content.RewardsFrame.Buttons) do
			if Button and not Button.backdrop then
				SkinReward(Button)
			end
		end

		for Button in self.TalkBox.Elements.Content.RewardsFrame.spellRewardPool:EnumerateActive() do
			if Button and not Button.backdrop then
				SkinReward(Button)
				Button:SetSize(250, 54)
				Button.Icon:SetSize(52, 52)
				Button.Icon:SetPoint('TOPLEFT', 0, 0)

				Button.backdrop:SetBackdropBorderColor(.83, .69, .22)
				Button.Icon.backdrop:SetBackdropBorderColor(.83, .69, .22)
			end
		end

		for _, Button in ipairs(self.TalkBox.Elements.Progress.Buttons) do
			if Button and not Button.backdrop then
				S:CreateBackdrop(Button)
				S:HandleIcon(Button.Icon, true)
				Button.NameFrame:Hide()
				Button.Border:Hide()
				Button.Mask:Hide()

				Button.backdrop:SetPoint('TOPLEFT', Button.Icon, 'TOPRIGHT', 0, 0)
				Button.backdrop:SetPoint('BOTTOMLEFT', Button.Icon, 'BOTTOMRIGHT', 0, 0)
				Button.backdrop:SetPoint('RIGHT', Button, 'RIGHT', -5, 0)
			end
		end
	end)
end

AS:RegisterSkin('Immersion')
