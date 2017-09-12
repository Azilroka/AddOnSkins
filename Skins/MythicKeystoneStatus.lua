local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MythicKeystoneStatus') then return end

function AS:MythicKeystoneStatus()
	hooksecurefunc(MythicKeystoneStatus, 'ShowToolTip', function(self)
		AS:SkinFrame(self.tooltip, nil, true)
	end)
	hooksecurefunc(MythicKeystoneStatus, 'ShowSubTooltip', function(self)
		AS:SkinFrame(self.subTooltip, nil, true)
	end)
end

AS:RegisterSkin('MythicKeystoneStatus', AS.MythicKeystoneStatus)
