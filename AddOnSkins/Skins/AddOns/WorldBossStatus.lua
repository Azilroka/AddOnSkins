local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('WorldBossStatus') then return end

function AS:WorldBossStatus()
	hooksecurefunc(WorldBossStatus, 'ShowToolTip', function(self)
		S:HandleFrame(self.tooltip, nil, true)
	end)
	hooksecurefunc(WorldBossStatus, 'ShowSubTooltip', function(self)
		S:HandleFrame(self.subTooltip, nil, true)
	end)
end

AS:RegisterSkin('WorldBossStatus', AS.WorldBossStatus)
