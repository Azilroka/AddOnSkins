local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Examiner') then return end

function AS:Examiner()
	AS:SkinFrame(Examiner)
	AS:SkinScrollBar(ExaminerStatsScrollScrollBar)
	AS:SkinScrollBar(ExaminerFeatsScrollScrollBar)
	AS:SkinScrollBar(ExaminerGearScrollScrollBar)
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
end

AS:RegisterSkin('Examiner', AS.Examiner)