local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('WorldBossStatus') then return end

function AS:WorldBossStatus()
	hooksecurefunc(WorldBossStatus, 'ShowToolTip', function(self)
		AS:SkinFrame(self.tooltip, nil, true)
	end)
	hooksecurefunc(WorldBossStatus, 'ShowSubTooltip', function(self)
		AS:SkinFrame(self.subTooltip, nil, true)
	end)
end

AS:RegisterSkin('WorldBossStatus', AS.WorldBossStatus)