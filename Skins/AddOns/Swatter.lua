local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('!Swatter') then return end

function AS:Swatter()
	if SwatterErrorFrame then
		AS:SkinFrame(SwatterErrorFrame)
		SwatterErrorEditBox:SetFrameLevel(2)
		AS:SkinButton(Swatter.Error.Done)
		AS:SkinButton(Swatter.Error.Next)
		AS:SkinButton(Swatter.Error.Prev)
		AS:SkinButton(Swatter.Drag)
		AS:SkinScrollBar(SwatterErrorInputScrollScrollBar)
	end
end

AS:RegisterSkin('Swatter', AS.Swatter, '[!BugGrabber]', '[!ImprovedErrorFrame]')