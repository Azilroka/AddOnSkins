local AS, L, S, R = unpack(AddOnSkins)

function R:Swatter()
	if SwatterErrorFrame then
		S:HandleFrame(SwatterErrorFrame)
		SwatterErrorEditBox:SetFrameLevel(2)
		S:HandleButton(Swatter.Error.Done)
		S:HandleButton(Swatter.Error.Next)
		S:HandleButton(Swatter.Error.Prev)
		S:HandleButton(Swatter.Drag)
		S:HandleScrollBar(SwatterErrorInputScrollScrollBar)
	end
end

AS:RegisterSkin('!Swatter', R.Swatter, '[!BugGrabber]', '[!ImprovedErrorFrame]')
