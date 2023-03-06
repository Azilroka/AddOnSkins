local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('Critline') then return end

function R:Critline()
	local CritLineDisplay = Critline:GetModule('Display')
	S:HandleFrame(CritLineDisplay)
	for i = 1, CritLineDisplay:GetNumChildren() do
		local object = select(i, CritLineDisplay:GetChildren())
		if object and object:IsObjectType('Frame') then
			object:SetFrameStrata('MEDIUM')
			object:SetBackdrop(nil)
			S:HandleIcon(object.icon)
		end
	end
end

AS:RegisterSkin('Critline', R.Critline)
