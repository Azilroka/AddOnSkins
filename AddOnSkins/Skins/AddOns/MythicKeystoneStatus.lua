local AS, L, S, R = unpack(AddOnSkins)

function R:MythicKeystoneStatus()
	hooksecurefunc(MythicKeystoneStatus, 'ShowToolTip', function(self)
		S:HandleFrame(self.tooltip, nil, true)
	end)
	hooksecurefunc(MythicKeystoneStatus, 'ShowSubTooltip', function(self)
		S:HandleFrame(self.subTooltip, nil, true)
	end)
end

AS:RegisterSkin('MythicKeystoneStatus')
