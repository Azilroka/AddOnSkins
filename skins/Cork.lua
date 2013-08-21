local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "CorkSkin"
function AS:SkinCork()
	AS:SkinBackdropFrame(Corkboard)
	Corkboard:HookScript("OnUpdate", function(frame) frame:StripTextures() end)
end

AS:RegisterSkin(name, AS.SkinCork)