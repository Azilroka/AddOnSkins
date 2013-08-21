local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "AraBrokerTradeskillsSkin"
function AS:SkinAraTradeskills()
	AraSkills:HookScript("OnUpdate", function(f) AS:SkinFrame(f) end)
end

AS:RegisterSkin(name, AS.SkinAraTradeskills)