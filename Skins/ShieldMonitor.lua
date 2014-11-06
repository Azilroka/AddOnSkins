local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ShieldMonitor') then return end

function AS:ShieldMonitor()
	AS:SkinFrame(shieldmonitor_Frame,'Default')
	shieldmonitor_Frame:HookScript('OnShow', function(self)	AS:SkinFrame(self, 'Default', true) end)
	shieldmonitor_Frame:RegisterEvent('UNIT_AURA')
	shieldmonitor_Frame:HookScript('OnEvent', function(self) AS:SkinFrame(self, 'Default', true)	end)
	shieldmonitor_Frame:SetSize(209, 20)
	shieldmonitor_Bar:SetStatusBarTexture(AS.NormTex)
	shieldmonitor_Bar:ClearAllPoints()
	shieldmonitor_Bar:SetInside()

	local IconBorder = CreateFrame('Frame', 'ShieldIconBorder', shieldmonitor_Frame)
	AS:SkinFrame(IconBorder,'Default')
	IconBorder:SetSize(20, 20)
	IconBorder:SetPoint('RIGHT', shieldmonitor_Frame, 'LEFT', -3, 0)
	AS:SkinTexture(shieldmonitor_FrameIcon1)
	shieldmonitor_FrameIcon1:ClearAllPoints()
	shieldmonitor_FrameIcon1:SetParent(IconBorder)
	shieldmonitor_FrameIcon1:SetInside()
	shieldmonitor_BarText:SetFont(AS.Font, 12, 'OUTLINE')
	shieldmonitor_BarText:SetPoint('CENTER', shieldmonitor_Bar, 'CENTER', 0, 0)
	shieldmonitor_FrameDuration:SetFont(AS.Font, 12, 'OUTLINE')
	shieldmonitor_FrameDuration:SetParent(shieldmonitor_Bar)
	shieldmonitor_FrameDuration:ClearAllPoints()
	shieldmonitor_FrameDuration:SetPoint('RIGHT', shieldmonitor_Frame, 'RIGHT', -2, 0)
end

AS:RegisterSkin('ShieldMonitor', AS.ShieldMonitor)