local AS, DT = ElvUI[1]:GetModule('AddOnSkins'), ElvUI[1]:GetModule('DataTexts')

local function OnClick(self, button)
	if EmbedSystem_MainWindow:IsShown() then
		EmbedSystem_MainWindow:Hide()
	else
		EmbedSystem_MainWindow:Show()
	end
end

local function OnEnter(self)
	DT:SetupTooltip(self)
	DT.tooltip:AddLine('Left Click to Show')
	DT.tooltip:AddLine('Right Click to Hide')
	DT.tooltip:Show()
end

local function OnEvent(self, event)
	self.text:SetText('Toggle Embed')
end

DT:RegisterDatatext('AddOnSkins', { 'PLAYER_ENTERING_WORLD' }, OnEvent, nil, OnClick, OnEnter)