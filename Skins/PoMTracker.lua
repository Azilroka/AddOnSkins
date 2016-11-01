local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('PoMTracker') then return end

function AS:PoMTracker()
	AS:SkinFrame(PoMOptionFrame)
	AS:SkinCloseButton(PoMOptionFrame_CloseButton)
	AS:SkinBackdropFrame(pomtracker1)
	pomtracker1:SetSize(85,15)
	pomtracker2:ClearAllPoints()
	pomtracker2:SetPoint('TOP', pomtracker1, 'BOTTOM', 0, -5)
	AS:SkinBackdropFrame(pomtracker2)
	AS:SkinBackdropFrame(pomtracker3)
	pomtracker3:ClearAllPoints()
	pomtracker3:SetPoint('TOP', pomtrackerstatusBar, 'BOTTOM', 0, -5)
	pomtracker3:SetHeight(15)
	AS:SkinButton(pomtracker3_Button1)
	pomtrackerstatusBar:ClearAllPoints()
	pomtrackerstatusBar:SetPoint('TOP', pomtracker2, 'BOTTOM', 0, -5)
	AS:SkinStatusBar(pomtrackerstatusBar)

	for i = 1,6 do
		AS:SkinCheckBox(_G['PoMOptionFrame_CheckButton'..i])
	end
	pomtracker2:HookScript('OnUpdate', function() pomtrackerstatusBar:SetWidth(pomtracker2:GetWidth()) pomtracker3:SetWidth(pomtracker2:GetWidth()) end)
end

AS:RegisterSkin('PoMTracker', AS.PoMTracker)