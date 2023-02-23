local AS, L, S, R = unpack(AddOnSkins)

if not AS:CheckAddOn('GlobalIgnoreList') then return end

function AS:GlobalIgnoreList()
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

			GIL.isSkinned = true
		end
	end)
end

AS:RegisterSkin('GlobalIgnoreList', AS.GlobalIgnoreList)
