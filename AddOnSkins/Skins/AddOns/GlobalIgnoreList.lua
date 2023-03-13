local AS, L, S, R = unpack(AddOnSkins)

function R:GlobalIgnoreList()
	FriendsFrame:HookScript("OnShow", function()
		if GIL and not GIL.isSkinned then
			S:HandleFrame(GIL)
			S:HandleCloseButton(GIL.CloseButton)

			for i = 1, 3 do
				S:HandleTab(_G['GILTab'..i])
				S:HandleFrame(_G['GILFrame'..i])
				for j = 1, 6 do
					if _G['GILFrame'..i..'Header'..j] then
						S:HandleFrame(_G['GILFrame'..i..'Header'..j])
					end
				end
			end

			S:HandleButton(GILFrame1IgnoreButton)

			S:HandleButton(GILFrame2RemoveButton)
			S:HandleButton(GILFrame2CreateButton)
			S:HandleButton(GILFrame2ResetButton)

			S:HandleFrame(GILFrame2Edit)
			S:HandleButton(GILFrame2EditSaveButton)
			S:HandleButton(GILFrame2EditCancelButton)

			S:HandleCheckBox(GILFrame2Active)

			S:HandleEditBox(GILFrame2EditDescField)

			S:StripTextures(GILFrame2EditFilterField)
			S:HandleEditBox(GILFrame2EditFilterField)
			S:HandleButton(GILFrame2EditFilterHelp)

			S:StripTextures(GILFrame2EditTestField)
			S:HandleEditBox(GILFrame2EditTestField)
			S:HandleButton(GILFrame2EditTestHelp)
			S:HandleButton(GILFrame2EditTestTest)

			S:HandleEditBox(GILFrame2EditLinkField)
			S:HandleButton(GILFrame2EditLinkHelp)

			local checkBoxes = {
				GILFrame3AskNote,
				GILFrame3OpenUI,
				GILFrame3SameServer,
				GILFrame3TrackChanges,
				GILFrame3EnableFilter,
				GILFrame3InvertFilter,
				GILFrame3UpdateFilter,
				GILFrame3SkipGuild,
				GILFrame3SkipParty,
				GILFrame3SkipPrivate
			}
			for _, checkbox in next, checkBoxes do
				if checkbox then
					S:HandleCheckBox(checkbox)
				end
			end

			S:HandleEditBox(GILFrame3Exp)

			GIL.isSkinned = true
		end
	end)
end

AS:RegisterSkin('GlobalIgnoreList')
