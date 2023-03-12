local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('TinyDPS') then return end

local ES = AS.EmbedSystem

function R:TinyDPS()
	S:HandleFrame(tdpsFrame)
	tdpsFrame.backdrop:SetAllPoints()

	tdpsFrame:HookScript('OnShow', function()
		if AS:CheckEmbed('TinyDPS') then
			ES.Main:Show()
		end
	end)

	if tdpsStatusBar then
		S:HandleStatusBar(tdpsStatusBar)
	end

	tdpsRefresh()
end

AS:RegisterSkin('TinyDPS', R.TinyDPS)
