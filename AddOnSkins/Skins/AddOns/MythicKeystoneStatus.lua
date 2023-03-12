local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('MythicKeystoneStatus') then return end

function R:MythicKeystoneStatus()
	hooksecurefunc(MythicKeystoneStatus, 'ShowToolTip', function(self)
		S:HandleFrame(self.tooltip, nil, true)
	end)
	hooksecurefunc(MythicKeystoneStatus, 'ShowSubTooltip', function(self)
		S:HandleFrame(self.subTooltip, nil, true)
	end)
end

AS:RegisterSkin('MythicKeystoneStatus', R.MythicKeystoneStatus)
