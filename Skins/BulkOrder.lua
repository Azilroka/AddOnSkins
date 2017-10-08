local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BulkOrder') then return end

function AS:BulkOrder()
	AS:SkinFrame(frmBulkOrderReminder)
	frmBulkOrderReminder:SetTemplate("Transparent")
	AS:SkinButton(frmBulkOrderReminder.btn)
	AS:SkinCloseButton(frmBulkOrderReminder.btnX)
end

AS:RegisterSkin('BulkOrder', AS.BulkOrder)