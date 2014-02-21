local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('_NPCScan') then return end

local name = '_NPCScanSkin'
function AS:Skin_NPCScan()
	AS:SkinFrame(_NPCScanButton)
	_NPCScanButton:SetScale(1)
	_NPCScanButton.SetScale = AS.Noop

	for i = 1, _NPCScanButton:GetNumChildren() do
		local Child = select(i, _NPCScanButton:GetChildren())
		if Child and Child:IsObjectType('Button') then
			AS:SkinCloseButton(Child)
			Child:SetPoint("TOPRIGHT", 4, 4)
			Child:SetScale(1)
		end
	end

	local NPCFoundText = select(5, _NPCScanButton:GetRegions())
	NPCFoundText:SetTextColor(1, 1, 1, 1)
	NPCFoundText:SetShadowOffset(1, -1)
	_NPCScanButton:HookScript('OnLeave', function(self) self:SetBackdropBorderColor(unpack(AS.BorderColor)) end)
end

AS:RegisterSkin(name, AS.Skin_NPCScan)