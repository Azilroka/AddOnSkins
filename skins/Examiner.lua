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
			if object:GetText() ~= nil then
				AS:SkinButton(object, true)
			else
				AS:SkinCloseButton(object, true)
			end
		end
	end
end

AS:RegisterSkin(name, AS.SkinExaminer)