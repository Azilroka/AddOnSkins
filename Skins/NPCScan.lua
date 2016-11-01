local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('_NPCScan') then return end

function AS:_NPCScan()
	AS:SkinFrame(_NPCScanButton)
	_NPCScanButton:SetScale(1)
	_NPCScanButton.SetScale = AS.Noop

	for i = 1, _NPCScanButton:GetNumChildren() do
		local Child = select(i, _NPCScanButton:GetChildren())
		if Child and Child:IsObjectType('Button') then
			AS:SkinBackdropFrame(Child)
			Child.Backdrop:SetPoint('TOPLEFT', 7, -8)
			Child.Backdrop:SetPoint('BOTTOMRIGHT', -8, 8)
			Child.Text = Child:CreateFontString(nil, 'OVERLAY')
			Child.Text:SetFont(AS.Font, 16, 'OUTLINE')
			Child.Text:SetText('x')
			Child.Text:SetJustifyH('CENTER')
			Child.Text:SetPoint('CENTER', Child, 'CENTER')
			Child:ClearAllPoints()
			Child:SetFrameLevel(_NPCScanButton:GetFrameLevel() + 2)
			Child:SetPoint("TOPRIGHT", _NPCScanButton, 'TOPRIGHT', 4, 4)
			Child:SetScale(1)
			Child:HookScript("OnEnter", function(self)
				self.Text:SetTextColor(1, .2, .2)
				self.Backdrop:SetBackdropBorderColor(1, .2, .2)
			end)

			Child:HookScript("OnLeave", function(self)
				self.Text:SetTextColor(1, 1, 1)
				self.Backdrop:SetBackdropBorderColor(unpack(AS.BorderColor))
			end)
		end
	end

	local NPCFoundText = select(5, _NPCScanButton:GetRegions())
	NPCFoundText:SetTextColor(1, 1, 1, 1)
	NPCFoundText:SetShadowOffset(1, -1)
	_NPCScanButton:HookScript('OnLeave', function(self) self:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
end

AS:RegisterSkin('_NPCScan', AS._NPCScan)