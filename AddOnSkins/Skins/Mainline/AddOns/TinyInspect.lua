local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TinyInspect') then return end

function AS:TinyInspect()
	for i = 1, 9 do
		select(i, TinyInspectRaidFrame:GetRegions()):Hide()
		select(i, TinyInspectRaidFrame.panel:GetRegions()):Hide()
	end

	AS:SkinFrame(TinyInspectRaidFrame)
	AS:SkinFrame(TinyInspectRaidFrame.panel)

	PaperDollFrame:HookScript("OnShow", function(self)
		if self.inspectFrame then
			local r, g, b = self.inspectFrame:GetBackdropBorderColor()
			AS:SetTemplate(self.inspectFrame)
			self.inspectFrame:SetBackdropBorderColor(r, g, b)
		end
	end)
end

AS:RegisterSkin('TinyInspect', AS.TinyInspect)
