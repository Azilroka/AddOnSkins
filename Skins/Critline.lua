local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Critline') then return end

local name = 'CritlineSkin'
function AS:SkinCritline()
	local CritLineDisplay = Critline:GetModule('Display')
	AS:SkinFrame(CritLineDisplay)
	for i = 1, CritLineDisplay:GetNumChildren() do
		local object = select(i, CritLineDisplay:GetChildren())
		if object and object:IsObjectType('Frame') then
			object:SetFrameStrata('MEDIUM')
			object:SetBackdrop(nil)
			AS:SkinTexture(object.icon)
		end
	end
end

AS:RegisterSkin(name, AS.SkinCritline)