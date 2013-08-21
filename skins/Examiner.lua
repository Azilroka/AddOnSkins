local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "ExaminerSkin"
function AS:SkinExaminer()
	AS:SkinFrame(Examiner)
	AS:SkinScrollBar(ExaminerStatsScrollScrollBar)
	AS:SkinScrollBar(ExaminerFeatsScrollScrollBar)
	AS:SkinScrollBar(ExaminerGearScrollScrollBar)
	for i = 1, Examiner:GetNumChildren() do
		local object = select(i, Examiner:GetChildren())
		if object:GetObjectType() == 'Button' then
			AS:SkinButton(object, true)
		end
	end
end

AS:RegisterSkin(name, AS.SkinExaminer)