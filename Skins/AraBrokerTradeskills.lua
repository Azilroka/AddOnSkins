local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Ara_Broker_Tradeskills') then return end

local name = 'AraBrokerTradeskillsSkin'
function AS:SkinAraTradeskills()
	AraSkills:HookScript('OnUpdate', function(f) AS:SkinFrame(f) end)
end

AS:RegisterSkin(name, AS.SkinAraTradeskills)