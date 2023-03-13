local AS, L, S, R = unpack(AddOnSkins)

function R:NugRunning()
	hooksecurefunc(NugRunning, 'ActivateTimer', function(self, w, h)
		for _, timer in pairs(self.timers) do
			if not timer.isSkinned then
				timer:SetBackdrop(nil)

				local ic = timer.icon:GetParent()
				S:CreateBackdrop(ic, 'Default')

				S:CreateBackdrop(timer.bar, 'Default')
				timer.isSkinned = true
			end
		end
	end)
end

AS:RegisterSkin('NugRunning')
