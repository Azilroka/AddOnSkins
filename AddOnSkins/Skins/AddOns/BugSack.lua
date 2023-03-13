local AS, L, S, R = unpack(AddOnSkins)

function R:BugSack()
	hooksecurefunc(BugSack, "OpenSack", function()
		if BugSackFrame.IsSkinned then return end
		S:HandleFrame(BugSackFrame)
		S:HandleTab(BugSackTabAll)
		BugSackTabAll:SetPoint("TOPLEFT", BugSackFrame, "BOTTOMLEFT", 0, 1)
		S:HandleTab(BugSackTabSession)
		S:HandleTab(BugSackTabLast)
		S:HandleButton(BugSackNextButton)
		S:HandleButton(BugSackSendButton)
		S:HandleButton(BugSackPrevButton)
		S:HandleScrollBar(BugSackScrollScrollBar)
		for _, child in pairs({BugSackFrame:GetChildren()}) do
			if (child:IsObjectType('Button') and child:GetScript('OnClick') == BugSack.CloseSack) then
				S:HandleCloseButton(child)
				break
			end
		end
		BugSackFrame.IsSkinned = true
	end)
end

AS:RegisterSkin('BugSack')
