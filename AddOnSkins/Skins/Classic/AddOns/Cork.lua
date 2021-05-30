local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Cork') then return end

function AS:Cork()
	AS:SkinBackdropFrame(Corkboard)
	Corkboard:HookScript('OnUpdate', function(frame) AS:StripTextures(frame) end)
end

AS:RegisterSkin('Cork', AS.Cork)