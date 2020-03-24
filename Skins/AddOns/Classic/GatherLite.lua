local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('GatherLite') then return end

function AS:GatherLite()
	if GatherLiteTooltip then
		GatherLiteTooltip:SetScript("OnShow", function()
			AS:SkinTooltip(GatherLiteTooltip)
		end)
	end
end

AS:RegisterSkin('GatherLite', AS.GatherLite)
