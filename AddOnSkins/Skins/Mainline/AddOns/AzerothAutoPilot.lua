local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AAP-Core') then return end

function AS:AzerothAutoPilot()
	for Key, Child in pairs(AAP.QuestList) do
		if Key ~= 0 and Child and Child.IsObjectType then
			if Child:IsObjectType('CheckButton') then
				AS:SkinCheckBox(Child)
			elseif Child:IsObjectType('Button') then
				AS:SkinButton(Child)
			elseif Child:IsObjectType('Frame') then
				AS:SkinBackdropFrame(Child)
				AS:SetInside(Child.Backdrop)
			end
		end
	end

	for Key, Child in pairs(AAP.QuestList.QuestFrames) do
		if Key ~= 0 and Child and Child.IsObjectType then
			if Child:IsObjectType('CheckButton') then
				AS:SkinCheckBox(Child)
			elseif Child:IsObjectType('Button') then
				AS:SkinButton(Child)
			elseif Child:IsObjectType('Frame') then
				AS:SkinBackdropFrame(Child)
				AS:SetInside(Child.Backdrop)
			end
		end
	end

	AAP.QuestList.ListFrame.Backdrop:Hide()

	AAP.QuestList.Greetings2FS1:SetWidth(500)
	AAP.QuestList.Greetings:SetHeight(175)
end

AS:RegisterSkin('AAP-Core', AS.AzerothAutoPilot)
