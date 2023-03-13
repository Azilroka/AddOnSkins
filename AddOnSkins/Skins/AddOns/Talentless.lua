local AS, L, S, R = unpack(AddOnSkins)

function R:Talentless()
	hooksecurefunc(Talentless, "CreateSpecButtons", function(self)
		for _, Button in pairs(self.Specs) do
			S:HandleButton(Button)
			Button:SetBackdropColor(0, 0, 0, 0)
			Button:SetCheckedTexture('')
			S:StyleButton(Button)
			if Button:GetChecked() then
				Button:SetBackdropBorderColor(.2, .5, .1)
			end
			hooksecurefunc(Button, 'SetChecked', function(self, value)
				if value == true then
					self:SetBackdropBorderColor(.2, .5, .1)
				else
					self:SetBackdropBorderColor(unpack(S.Media.borderColor))
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
			S:HandleButton(Button)
			Button:SetBackdropColor(0, 0, 0, 0)
			S:StyleButton(Button)
		end
	end)
end

AS:RegisterSkin('Talentless')
