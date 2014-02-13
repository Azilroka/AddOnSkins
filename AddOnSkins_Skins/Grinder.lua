local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Grinder') then return end

local name = "GrinderSkin"
function AS:SkinGrinder()
	AS:SkinTab(CharacterFrameTab5)
	AS:SkinButton(GrinderModuleSelectButton)
	GrinderListScrollFrame:StripTextures(true)
	AS:SkinScrollBar(GrinderListScrollFrameScrollBar)
	for i = 1, 15 do
		_G['GrindBar'..i].left:Kill()
		_G['GrindBar'..i].right:Kill()
		_G['GrindBar'..i].background:Kill()
		_G['GrindBar'..i..'ProgressBar']:SetStatusBarTexture(AS.NormTex)
		_G['GrindBar'..i..'ProgressBar']:CreateBackdrop()
	end
end

AS:RegisterSkin(name, AS.SkinGrinder)