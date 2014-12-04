local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TradeSkillDW') then return end

function AS:TradeSkillDW()
	local function SkinTabs(self)
		for i = 1, self:GetNumChildren() do
			local Child = select(i, self:GetChildren())
			if Child:IsObjectType('CheckButton') and not Child.IsSkinned then
				Child:DisableDrawLayer('BACKGROUND')
				AS:SetTemplate(Child)
				AS:SkinTexture(Child:GetNormalTexture())
				Child:GetNormalTexture():SetInside()
				Child:GetNormalTexture().SetPoint = AS.Noop
				Child:GetNormalTexture().SetTexCoord = AS.Noop
				AS:StyleButton(Child)
				local a,b,c,d,e = Child:GetPoint()
				if a == 'TOPLEFT' and b:GetName() == 'TradeSkillFrame' and c == 'TOPRIGHT' and d == 0 then
					Child:SetPoint("TOPLEFT", TradeSkillFrame, "TOPRIGHT", 2, -30)
				elseif a == "BOTTOMLEFT" and b:GetName() == 'TradeSkillFrame' and c == "BOTTOMRIGHT" and d == 0 then
					Child:SetPoint("BOTTOMLEFT", TradeSkillFrame, "BOTTOMRIGHT", 2, 30)
				end
				Child.SetPoint = AS.Noop
				Child.IsSkinned = true
			end
		end
	end

	TradeSkillFrame:HookScript('OnUpdate', function(self)
		if not TradeSkillDWExpandButton then return end
		if self.isSkinned then return end
		AS:SkinButton(TradeSkillDWExpandButton)
		TradeSkillDWExpandButton.Text = TradeSkillDWExpandButton:CreateFontString(nil, 'OVERLAY')
		TradeSkillDWExpandButton.Text:SetFont(AS.LSM:Fetch('font', 'Arial Narrow'), 24)
		TradeSkillDWExpandButton.SetNormalTexture = AS.Noop
		TradeSkillDWExpandButton.SetPushedTexture = AS.Noop
		TradeSkillDWExpandButton:HookScript('OnUpdate', function(self)
			if self.expanded then
				self.Text:SetText('◄')
				self.Text:SetPoint('CENTER', -2, 0)
			else
				self.Text:SetText('►')
				self.Text:SetPoint('CENTER', -1, 0)
			end
		end)
		SkinTabs(self)
		AS:StripTextures(TradeSkillListScrollFrame, true)
		self.isSkinned = true
	end)
end

AS:RegisterSkin('TradeSkillDW', AS.TradeSkillDW)