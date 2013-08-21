local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "SwatterSkin"
function AS:SkinSwatter()
	if SwatterErrorFrame then
		AS:SkinFrame(SwatterErrorFrame)
		AS:SkinButton(Swatter.Error.Done)
		AS:SkinButton(Swatter.Error.Next)
		AS:SkinButton(Swatter.Error.Prev)
		AS:SkinButton(Swatter.Drag)
		AS:SkinScrollBar(SwatterErrorInputScrollScrollBar)
	end
end

AS:RegisterSkin(name, AS.SkinSwatter, "[!BugGrabber]", "[!ImprovedErrorFrame]")