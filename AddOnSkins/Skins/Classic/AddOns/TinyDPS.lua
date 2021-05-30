local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('TinyDPS') then return end

function AS:TinyDPS()
	AS:SkinBackdropFrame(tdpsFrame)
	tdpsFrame.Backdrop:SetAllPoints()

	tdpsFrame:HookScript('OnShow', function()
		if AS:CheckEmbed('TinyDPS') then
			EmbedSystem_MainWindow:Show()
		end
	end)

	if tdpsStatusBar then
		tdpsStatusBar:SetBackdrop({bgFile = AS.NormTex, edgeFile = AS.Blank, tile = false, tileSize = 0, edgeSize = 1})
		tdpsStatusBar:SetStatusBarTexture(AS.NormTex)
	end

	tdpsRefresh()
end

AS:RegisterSkin('TinyDPS', AS.TinyDPS)
