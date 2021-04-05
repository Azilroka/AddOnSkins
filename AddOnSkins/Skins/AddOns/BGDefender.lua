local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BGDefender') then return end

function AS:BGDefender()
	local function OnEnter(f)
		local text
		if f:GetName() == 'Button9' then
			text = 'Close'
		elseif f:GetName() == 'Button10' then
			text = 'Options'
		elseif f:GetName() == 'Button11' then
			text = 'Lock or Make Moveable'
		end
		GameTooltip:SetOwner(f, 'ANCHOR_CURSOR')
		GameTooltip:AddLine(text, 1, 1, 1)
		GameTooltip:Show()
	end

	local function OnLeave()
		GameTooltip:Hide()
	end

	AS:SkinFrame(BGDefenderFrame)

	local StripAllTextures = {
		'Button9',
		'Button10',
		'Button11',
	}

	local buttons = {
		'Button1',
		'Button2',
		'Button3',
		'Button4',
		'Button5',
		'Button6',
		'Button7',
		'Button8',
		'Button9',
		'Button10',
		'Button11',
	}

	for _, object in pairs(StripAllTextures) do
		AS:StripTextures(_G[object])
	end	

	for _, button in pairs(buttons) do
		AS:SkinButton(_G[button])
		_G[button]:SetText('|cFFFFFFFF'.._G[button]:GetText())
	end	

	BGDefenderFrame:SetWidth(160)
	BGDefenderFrame:SetHeight(72)
	Button9:SetWidth(16)
	Button9:SetHeight(16)
	Button10:SetWidth(16)
	Button10:SetHeight(16)
	Button11:SetWidth(16)
	Button11:SetHeight(16)

	Text1:SetPoint('TOPLEFT', BGDefenderFrame, 'TOPLEFT', 5, -3)
	Button1:SetPoint('TOPLEFT', BGDefenderFrame, 'TOPLEFT', 5, -25)
	Button2:SetPoint('TOPLEFT', BGDefenderFrame, 'TOPLEFT', 30, -25)
	Button3:SetPoint('TOPLEFT', BGDefenderFrame, 'TOPLEFT', 55, -25)
	Button4:SetPoint('TOPLEFT', BGDefenderFrame, 'TOPLEFT', 80, -25)
	Button5:SetPoint('TOPLEFT', BGDefenderFrame, 'TOPLEFT', 105, -25)
	Button6:SetPoint('TOPLEFT', BGDefenderFrame, 'TOPLEFT', 130, -25)
	Button7:SetPoint('TOPLEFT', BGDefenderFrame, 'TOPLEFT', 5, -48)
	Button8:SetPoint('TOPLEFT', BGDefenderFrame, 'TOPLEFT', 97, -48)

	AS:SkinDropDownBox(DropDown1)
	AS:SkinDropDownBox(DropDown2)
	AS:SkinDropDownBox(DropDown3)
	AS:SkinCheckBox(BGDefenderPrefaceButton)
	Text1:SetTextColor(23/255, 132/255, 209/255)
	Button9:SetScript('OnEnter', OnEnter)
	Button9:SetScript('OnLeave', OnLeave)
	Button10:SetScript('OnEnter', OnEnter)
	Button10:SetScript('OnLeave', OnLeave)
	Button11:SetScript('OnEnter', OnEnter)
	Button11:SetScript('OnLeave', OnLeave)
end

AS:RegisterSkin('BGDefender', AS.BGDefender)
