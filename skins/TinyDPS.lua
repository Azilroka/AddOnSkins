local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "TinyDPSSkin"
function AS:SkinTinyDPS()
	AS:SkinFrame(tdpsFrame)
	if tdpsStatusBar then
		tdpsStatusBar:SetBackdrop({bgFile = AS.NormTex, edgeFile = AS.Blank, tile = false, tileSize = 0, edgeSize = 1})
		tdpsStatusBar:SetStatusBarTexture(AS.NormTex)
	end
	tdpsRefresh()
end

AS:RegisterSkin(name, AS.SkinTinyDPS)