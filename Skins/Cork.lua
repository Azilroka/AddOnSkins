local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Cork') then return end

local name = 'CorkSkin'
function AS:SkinCork()
	AS:SkinBackdropFrame(Corkboard)
	Corkboard:HookScript('OnUpdate', function(frame) frame:StripTextures() end)
end

AS:RegisterSkin(name, AS.SkinCork)