local AS, L, S, R = unpack(AddOnSkins)

function R:TinyInspect()
	for i = 1, 9 do
		select(i, TinyInspectRaidFrame:GetRegions()):Hide()
		select(i, TinyInspectRaidFrame.panel:GetRegions()):Hide()
	end

	S:HandleFrame(TinyInspectRaidFrame)
	S:HandleFrame(TinyInspectRaidFrame.panel)

	PaperDollFrame:HookScript("OnShow", function(self)
		if self.inspectFrame then
			local r, g, b = self.inspectFrame:GetBackdropBorderColor()
			S:SetTemplate(self.inspectFrame)
			self.inspectFrame:SetBackdropBorderColor(r, g, b)
		end
	end)
end

AS:RegisterSkin('TinyInspect')
