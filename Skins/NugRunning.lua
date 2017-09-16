local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('NugRunning') then return end

function AS:NugRunning()
	hooksecurefunc(NugRunning, 'ActivateTimer', function(self, w, h)
		for _, timer in pairs(self.timers) do
			if not timer.isSkinned then
				timer:SetBackdrop(nil)

				local ic = timer.icon:GetParent()
				AS:CreateBackdrop(ic, 'Default')
				ic:ClearAllPoints()
				ic:SetPoint("TOPLEFT", timer, 1, -1)
				ic:SetPoint("BOTTOMLEFT", timer, 1, 0)

				AS:CreateBackdrop(timer.bar, 'Default')
				timer.bar:ClearAllPoints()
				timer.bar:SetPoint("TOPRIGHT", timer, -1, -1)
				timer.bar:SetPoint("BOTTOMRIGHT", timer, -1, 0)
				timer.bar:SetPoint("LEFT", ic, "RIGHT", 5, 0)

				timer.bar:SetStatusBarTexture(AS.NormTex)
				timer.bar:GetStatusBarTexture():SetDrawLayer("ARTWORK")
				timer.bar.bg:SetTexture(AS.NormTex)
				timer.bar.bg:SetAlpha(0.3)

				timer.timeText:SetFont(AS.PixelFont, 12, "MONOCHROMEOUTLINE")
				timer.timeText:SetJustifyH("RIGHT")
				timer.timeText:ClearAllPoints()
				timer.timeText:SetPoint("RIGHT", 1, 0)

				timer.spellText:SetFont(AS.PixelFont, 12, "MONOCHROMEOUTLINE")
				timer.spellText:SetJustifyH("LEFT")
				timer.spellText:ClearAllPoints()
				timer.spellText:SetPoint("LEFT", 2, 0)
				timer.spellText:SetWidth(timer.bar:GetWidth() - 10)

				timer.stacktext:SetFont(AS.PixelFont, 12, "MONOCHROMEOUTLINE")
				timer.isSkinned = true
			end
		end
	end)
end

AS:RegisterSkin('NugRunning', AS.NugRunning)