local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('Cork') then return end

function R:Cork()
	S:HandleFrame(Corkboard, true)
	Corkboard:HookScript('OnUpdate', function(frame) S:StripTextures(frame) end)
end

AS:RegisterSkin('Cork', R.Cork)
