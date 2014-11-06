local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Ara_Broker_Tradeskills') then return end

function AS:AraTradeskills()
	AraSkills:HookScript('OnUpdate', function(f) AS:SkinFrame(f) end)
end

AS:RegisterSkin('AraBrokerTradeskills', AS.AraTradeskills)