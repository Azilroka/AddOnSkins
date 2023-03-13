local AS, L, S, R = unpack(AddOnSkins)

function R:AzerothAutoPilot()
	for Key, Child in pairs(AAP.QuestList) do
		if Key ~= 0 and Child and Child.IsObjectType then
			if Child:IsObjectType('CheckButton') then
				S:HandleCheckBox(Child)
			elseif Child:IsObjectType('Button') then
				S:HandleButton(Child)
			elseif Child:IsObjectType('Frame') then
				S:HandleFrame(Child, true)
				S:SetInside(Child.backdrop)
			end
		end
	end

	for Key, Child in pairs(AAP.QuestList.QuestFrames) do
		if Key ~= 0 and Child and Child.IsObjectType then
			if Child:IsObjectType('CheckButton') then
				S:HandleCheckBox(Child)
			elseif Child:IsObjectType('Button') then
				S:HandleButton(Child)
			elseif Child:IsObjectType('Frame') then
				S:HandleFrame(Child, true)
				S:SetInside(Child.backdrop)
			end
		end
	end

	AAP.QuestList.ListFrame.backdrop:Hide()

	AAP.QuestList.Greetings2FS1:SetWidth(500)
	AAP.QuestList.Greetings:SetHeight(175)
end

AS:RegisterSkin('AAP-Core', R.AzerothAutoPilot)
