local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ClassicGuildFrame') then return end

function AS:ClassicGuildFrame()
	for i = 1, 6 do
		AS:SkinTab(_G['ClassicGuildFrameTabs']['Tabs'][i])
	end

	AS:UnregisterSkinEvent('ClassicGuildFrame', 'ADDON_LOADED')
end

AS:RegisterSkin('ClassicGuildFrame', AS.ClassicGuildFrame, 'ADDON_LOADED')