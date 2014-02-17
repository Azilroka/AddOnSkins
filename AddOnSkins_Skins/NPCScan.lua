local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('_NPCScan') then return end

local name = '_NPCScanSkin'
function AS:Skin_NPCScan()
	AS:SkinFrame(_NPCScanButton)
	_NPCScanButton:SetScale(1)
	_NPCScanButton.SetScale = AS.Noop
	AS:SkinButton(_NPCScanTest)

	AS:SkinCheckBox(_NPCScanConfigCacheWarningsCheckbox)
	AS:SkinCheckBox(_NPCScanConfigPrintTimeCheckbox)
	AS:SkinCheckBox(_NPCScanConfigUnmuteCheckbox)
	AS:SkinCheckBox(_NPCScanSearchAchievementAddFoundCheckbox)

	for i = 1, _NPCScanButton:GetNumChildren() do
		local Child = select(i, _NPCScanButton:GetChildren())
		if Child and Child:IsObjectType() == 'Button' then
			AS:SkinCloseButton(Child)
			Child:SetPoint("TOPRIGHT", 4, 4)
			Child:SetScale(1)
		end

		local Text = select(4, _NPCScanButton:GetRegions())
		Text:SetTextColor(1, 1, 0)
		Text:SetShadowOffset(1, -1)
	end
end

AS:RegisterSkin(name, AS.Skin_NPCScan)