local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('GHI') then return end

local name = 'GryphonheartItemsSkin'
function AS:SkinGryphonheartItems()
	hooksecurefunc('GHI_ButtonUI', function()
		AS:SkinIconButton(GHI_ButtonSquared)
	end)
end

AS:RegisterSkin(name, AS.SkinGryphonheartItems)