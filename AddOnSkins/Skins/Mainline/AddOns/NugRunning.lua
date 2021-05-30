local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('NugRunning') then return end

function AS:NugRunning()
	hooksecurefunc(NugRunning, 'ActivateTimer', function(self, w, h)
		for _, timer in pairs(self.timers) do
			if not timer.isSkinned then
				timer:SetBackdrop(nil)

				local ic = timer.icon:GetParent()
				AS:CreateBackdrop(ic, 'Default')

				AS:CreateBackdrop(timer.bar, 'Default')
				timer.isSkinned = true
			end
		end
	end)
end

AS:RegisterSkin('NugRunning', AS.NugRunning)