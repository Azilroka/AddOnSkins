local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BalancePowerTracker') then return end

local name = 'BPTSkin'
function AS:SkinBPT()
	if AS.MyClass ~= 'DRUID' then return end
	local BPT = BalancePowerTracker.modules.eclipse_bar
	BalancePowerTracker_Options.global.enabled = true
	BalancePowerTracker.CheckAll()
	hooksecurefunc(BPT, "ReDraw", function()
		if BPT.UIcreated then
			AS:SkinBackdropFrame(BPT.frame, 'Default', true, false, true)
			AS:SkinFrame(BPT.lframe, 'Default', true)
			AS:SkinFrame(BPT.sframe, 'Default', true)
			AS:SkinTexture(BPT.lframetexture)
			AS:SkinTexture(BPT.sframetexture)
			BPT.lframetexture:SetInside()
			BPT.sframetexture:SetInside()
		end
	end)
	BPT:ReDraw()
end

AS:RegisterSkin(name, AS.SkinBPT)