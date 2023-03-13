local AS, L, S, R = unpack(AddOnSkins)

function R:Examiner()
	S:HandleFrame(Examiner)
	S:HandleScrollBar(ExaminerStatsScrollScrollBar)
	S:HandleScrollBar(ExaminerFeatsScrollScrollBar)
	S:HandleScrollBar(ExaminerGearScrollScrollBar)

	local Slots = {
		'Head',
		'Neck',
		'Shoulder',
		'Back',
		'Chest',
		'Shirt',
		'Tabard',
		'Wrist',
		'Hands',
		'Waist',
		'Legs',
		'Feet',
		'Finger0',
		'Finger1',
		'Trinket0',
		'Trinket1',
		'MainHand',
		'SecondaryHand',
	}

	for _, Slot in pairs(Slots) do
		local Button = _G['ExaminerItemButton'..Slot..'Slot']
		S:HandleIcon(Button.texture)
		S:HandleFrame(Button)
		S:SetInside(Button.texture)
		Button.border:SetAlpha(0)
		Button:SetFrameLevel(Button:GetFrameLevel() + 2)
		hooksecurefunc(Button.border, 'SetVertexColor', function(self, r, g, b)
			Button:SetBackdropBorderColor(r, g, b)
		end)
		hooksecurefunc(Button.border, 'Hide', function(self)
			Button:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)
		S:StyleButton(Button)
	end

	for _, object in pairs({Examiner:GetChildren()}) do
		if object:IsObjectType('Button') then
			if object:GetText() ~= nil then
				S:HandleButton(object, true)
			else
				S:HandleCloseButton(object, true)
			end
		end
	end

	S:Kill(Examiner.portrait)
	S:Kill(Examiner.bgBottomLeft)
	S:Kill(Examiner.dlgBottomLeft)
	S:Kill(Examiner.bgTopLeft)
	S:Kill(Examiner.dlgTopLeft)
	S:Kill(Examiner.bgBottomRight)
	S:Kill(Examiner.dlgBottomRight)
	S:Kill(Examiner.bgTopRight)
	S:Kill(Examiner.dlgTopRight)

	Examiner:SetSize(360, 464)

	Examiner.model:ClearAllPoints()
	Examiner.model:SetPoint('BOTTOMLEFT', Examiner, 'BOTTOMLEFT', 22, 22)
end

AS:RegisterSkin('Examiner')
