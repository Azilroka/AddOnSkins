local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Incoming') then return end

function AS:Incoming(self)
	AS:SkinFrame(LocationMessageView)

	local buttons = {
		'Incoming1',
		'Incoming2',
		'Incoming3',
		'Incoming4',
		'Incoming5',
		'AllClear',
		'Incoming',
		'SendMore',
	}

	for _, button in pairs(buttons) do
		AS:SkinButton(_G[button])
	end	

	LocationMessageView:SetWidth(99)
	LocationMessageView:SetHeight(130)
	Incoming5:SetWidth(29)

	Incoming1:SetPoint('TOPLEFT', LocationMessageView, 'TOPLEFT', 3, -3)
	Incoming2:SetPoint('TOPLEFT', LocationMessageView, 'TOPLEFT', 19, -3)
	Incoming3:SetPoint('TOPLEFT', LocationMessageView, 'TOPLEFT', 35, -3)
	Incoming4:SetPoint('TOPLEFT', LocationMessageView, 'TOPLEFT', 51, -3)
	Incoming5:SetPoint('TOPLEFT', LocationMessageView, 'TOPLEFT', 67, -3)
	AllClear:SetPoint('TOPLEFT', LocationMessageView, 'TOPLEFT', 3, -40)
	Incoming:SetPoint('TOPLEFT', LocationMessageView, 'TOPLEFT', 3, -70)
	SendMore:SetPoint('TOPLEFT', LocationMessageView, 'TOPLEFT', 3, -100)
end

AS:RegisterSkin('Incoming', AS.Incoming)