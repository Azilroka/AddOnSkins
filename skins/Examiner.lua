﻿local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "ExaminerSkin"
function AS:SkinExaminer()
	AS:SkinFrame(Examiner)
	S:HandleScrollBar(ExaminerStatsScrollScrollBar)
	S:HandleScrollBar(ExaminerFeatsScrollScrollBar)
	S:HandleScrollBar(ExaminerGearScrollScrollBar)

	for i = 1, Examiner:GetNumChildren() do
		local object = select(i, Examiner:GetChildren())
		if object:GetObjectType() == 'Button' then
			S:HandleButton(object, true)
		end
	end
end

AS:RegisterSkin(name, AS.SkinExaminer)