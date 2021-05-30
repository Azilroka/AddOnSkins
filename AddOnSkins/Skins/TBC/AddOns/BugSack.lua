local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BugSack') then return end

function AS:BugSack(event, addon)

	hooksecurefunc(BugSack, "OpenSack", function()
		if BugSackFrame.IsSkinned then return end
		AS:SkinFrame(BugSackFrame)
		AS:SkinTab(BugSackTabAll)
		BugSackTabAll:SetPoint("TOPLEFT", BugSackFrame, "BOTTOMLEFT", 0, 1)
		AS:SkinTab(BugSackTabSession)
		AS:SkinTab(BugSackTabLast)
		AS:SkinButton(BugSackNextButton)
		AS:SkinButton(BugSackSendButton)
		AS:SkinButton(BugSackPrevButton)
		AS:SkinScrollBar(BugSackScrollScrollBar)
		for _, child in pairs({BugSackFrame:GetChildren()}) do
			if (child:IsObjectType('Button') and child:GetScript('OnClick') == BugSack.CloseSack) then
				AS:SkinCloseButton(child)
			end
		end
		BugSackFrame.IsSkinned = true
	end)
end

AS:RegisterSkin('BugSack', AS.BugSack)