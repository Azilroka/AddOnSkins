local AS, L, S, R = unpack(AddOnSkins)

function R:Capping()
	CappingFrame:HookScript('OnUpdate', function(s)
		for bar in pairs(s.bars) do
			if not bar.backdrop then
				S:CreateBackdrop(bar)
			end
		end
	end)
end

AS:RegisterSkin('Capping')
