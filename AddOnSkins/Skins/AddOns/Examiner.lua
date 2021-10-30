local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Examiner') then return end

function AS:Examiner()
	AS:SkinFrame(Examiner)
	AS:SkinScrollBar(ExaminerStatsScrollScrollBar)
	AS:SkinScrollBar(ExaminerFeatsScrollScrollBar)
	AS:SkinScrollBar(ExaminerGearScrollScrollBar)

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
		AS:SkinTexture(Button.texture)
		AS:SkinFrame(Button)
		AS:SetInside(Button.texture)
		Button.border:SetAlpha(0)
		Button:SetFrameLevel(Button:GetFrameLevel() + 2)
		hooksecurefunc(Button.border, 'SetVertexColor', function(self, r, g, b)
			Button:SetBackdropBorderColor(r, g, b)
		end)
		hooksecurefunc(Button.border, 'Hide', function(self)
			Button:SetBackdropBorderColor(unpack(AS.BorderColor))
		end)
		AS:StyleButton(Button)
	end

	for i = 1, Examiner:GetNumChildren() do
		local object = select(i, Examiner:GetChildren())
		if object:IsObjectType('Button') then
			if object:GetText() ~= nil then
				AS:SkinButton(object, true)
			else
				AS:SkinCloseButton(object, true)
			end
		end
	end

	AS:Kill(Examiner.portrait)
	AS:Kill(Examiner.bgBottomLeft)
	AS:Kill(Examiner.dlgBottomLeft)
	AS:Kill(Examiner.bgTopLeft)
	AS:Kill(Examiner.dlgTopLeft)
	AS:Kill(Examiner.bgBottomRight)
	AS:Kill(Examiner.dlgBottomRight)
	AS:Kill(Examiner.bgTopRight)
	AS:Kill(Examiner.dlgTopRight)

	Examiner:SetSize(360, 464)

	Examiner.model:ClearAllPoints()
	Examiner.model:SetPoint('BOTTOMLEFT', Examiner, 'BOTTOMLEFT', 22, 22)
end

AS:RegisterSkin('Examiner', AS.Examiner)
