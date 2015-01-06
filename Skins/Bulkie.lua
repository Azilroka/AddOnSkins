local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Bulkie') then return end

function AS:Bulkie()
	AS:SkinFrame(BulkieFrame)
	BulkieFrame:HookScript('OnShow', function(self)
		self:ClearAllPoints()
		self:SetWidth(GarrisonCapacitiveDisplayFrame:GetWidth() + (AS.PixelPerfect and 2 or 4))
		self:SetPoint('TOP', GarrisonCapacitiveDisplayFrame, 'BOTTOM', 0, -(AS.PixelPerfect and 0 or 3))
	end)

	AS:SkinButton(BulkieBulkButton)
end

AS:RegisterSkin('Bulkie', AS.Bulkie)