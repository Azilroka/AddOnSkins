local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('Capping') then return end

function AS:Capping()
	CappingFrame:HookScript('OnUpdate', function(self)
		for bar in pairs(self.bars) do
			if not bar.backdrop then
				S:CreateBackdrop(bar)
			end
		end
	end)
end

AS:RegisterSkin('Capping', AS.Capping)
