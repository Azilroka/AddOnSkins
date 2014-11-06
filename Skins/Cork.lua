local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Cork') then return end

function AS:Cork()
	AS:SkinBackdropFrame(Corkboard)
	Corkboard:HookScript('OnUpdate', function(frame) frame:StripTextures() end)
end

AS:RegisterSkin('Cork', AS.Cork)