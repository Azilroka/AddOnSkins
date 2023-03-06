local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('ClassicGuildFrame') then return end

function R:ClassicGuildFrame()
	for i = 1, 6 do
		S:HandleTab(_G['ClassicGuildFrameTabs']['Tabs'][i])
	end

	AS:UnregisterSkinEvent('ClassicGuildFrame', 'ADDON_LOADED')
end

AS:RegisterSkin('ClassicGuildFrame', R.ClassicGuildFrame, 'ADDON_LOADED')
