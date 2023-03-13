local AS, L, S, R = unpack(AddOnSkins)

function R:WorldBossStatus()
	hooksecurefunc(WorldBossStatus, 'ShowToolTip', function(s)
		S:HandleFrame(s.tooltip, nil, true)
	end)
	hooksecurefunc(WorldBossStatus, 'ShowSubTooltip', function(s)
		S:HandleFrame(s.subTooltip, nil, true)
	end)
end

AS:RegisterSkin('WorldBossStatus')
