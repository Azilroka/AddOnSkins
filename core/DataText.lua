local AS, DT = ElvUI[1]:GetModule('AddOnSkins'), ElvUI[1]:GetModule('DataTexts')

local function OnClick(self, button)
	if button == 'LeftButton' then
		AS:EmbedEnterCombat(true)
	elseif button == 'RightButton' then
		AS:EmbedExitCombat(true)
	end
end

local function OnEnter(self)
	DT:SetupTooltip(self)
	DT.tooltip:AddLine('Left Click to Show')
	DT.tooltip:AddLine('Right Click to Hide')
	DT.tooltip:Show()
end

local function OnEvent(self, event)
	local Text = ''
	if AS:CheckOption('EmbedRecount', 'Recount') then Text = 'Recount' end
	if AS:CheckOption('EmbedRO', 'Recount', 'Omen') then Text = 'Recount/Omen' end
	if AS:CheckOption('EmbedSkada', 'Skada') then Text = 'Skada' end
	if AS:CheckOption('EmbedOmen', 'Omen') then Text = 'Omen' end
	if AS:CheckOption('EmbedTDPS', 'TinyDPS') then Text = 'TinyDPS' end
	if Text == '' then
		self.text:SetText(format('%s %s', 'AddOnSkins', AS.Version))
	else
		self.text:SetText(format('%s %s', 'Toggle', Text))
	end
end

DT:RegisterDatatext('AddOnSkins', { 'PLAYER_ENTERING_WORLD' }, OnEvent, nil, OnClick, OnEnter)