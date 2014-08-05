if not (AsphyxiaUI or DuffedUI) then return end
local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BloodShieldTracker') then return end

local name = 'BloodShieldTrackerSkin'
function AS:SkinBloodShieldTracker()
	local Bars = {
		BloodShieldTracker_AMSBar,
		BloodShieldTracker_BloodChargeBar,
		BloodShieldTracker_EstimateBar,
		BloodShieldTracker_HealthBar,
		BloodShieldTracker_IllumBar,
		BloodShieldTracker_PurgatoryBar,
		BloodShieldTracker_PWSBar,
		BloodShieldTracker_ShieldBar,
		BloodShieldTracker_TotalAbsorbsBar,
	}

	for _, bar in pairs(Bars) do
		AS:SkinStatusBar(bar)
	end
end

AS:RegisterSkin(name, AS.SkinBloodShieldTracker)