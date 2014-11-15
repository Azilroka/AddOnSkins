local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Grinder') then return end

function AS:Grinder()
	AS:SkinTab(CharacterFrameTab5)
	AS:SkinButton(GrinderModuleSelectButton)
	AS:StripTextures(GrinderListScrollFrame, true)
	AS:SkinScrollBar(GrinderListScrollFrameScrollBar)
	for i = 1, 15 do
		_G['GrindBar'..i].left:Kill()
		_G['GrindBar'..i].right:Kill()
		_G['GrindBar'..i].background:Kill()
		_G['GrindBar'..i..'ProgressBar']:SetStatusBarTexture(AS.NormTex)
		AS:CreateBackdrop(_G['GrindBar'..i..'ProgressBar'])
	end
end

AS:RegisterSkin('Grinder', AS.Grinder)