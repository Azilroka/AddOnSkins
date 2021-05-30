local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Talentless') then return end

function AS:Talentless()
	hooksecurefunc(Talentless, "CreateSpecButtons", function(self)
		for _, Button in pairs(self.Specs) do
			AS:SkinButton(Button)
			Button:SetBackdropColor(0, 0, 0, 0)
			Button:SetCheckedTexture('')
			AS:StyleButton(Button)
			if Button:GetChecked() then
				Button:SetBackdropBorderColor(.2, .5, .1)
			end
			hooksecurefunc(Button, 'SetChecked', function(self, value)
				if value == true then
					self:SetBackdropBorderColor(.2, .5, .1)
				else
					self:SetBackdropBorderColor(unpack(AS.BorderColor))
				end
			end)
			Button:HookScript("OnLeave", function(self)
				if self:GetChecked() then
					self:SetBackdropBorderColor(.2, .5, .1)
				end
			end)
		end
	end)

	hooksecurefunc(Talentless, "CreateSpecButtons", function(self)
		for _, Button in pairs(self.Items) do
			AS:SkinButton(Button)
			Button:SetBackdropColor(0, 0, 0, 0)
			AS:StyleButton(Button)
		end
	end)
end

AS:RegisterSkin('Talentless', AS.Talentless)
