local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Capping') then return end

function AS:Capping(event)
	hooksecurefunc(Capping, "StartBar",	function(self, name)
		local bar = self:GetBar(name, true)
		if not bar.Backdrop then
			AS:CreateBackdrop(bar)
			bar.iconbackdrop = CreateFrame('Frame', nil, bar)
			AS:SetTemplate(bar.iconbackdrop)
			bar.iconbackdrop:SetOutside(bar.icon)
			AS:SkinTexture(bar.icon)
		end
	end)
end

AS:RegisterSkin('Capping', AS.Capping)