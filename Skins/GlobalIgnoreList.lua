local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('GlobalIgnoreList') then return end

function AS:GlobalIgnoreList()
	FriendsFrame:HookScript("OnShow", function()
		if GIL and not GIL.isSkinned then
			AS:SkinFrame(GIL)
			AS:SkinCloseButton(GIL.CloseButton)

			for i = 1, 3 do
				AS:SkinTab(_G['GILTab'..i])
				AS:SkinFrame(_G['GILFrame'..i])
				for j = 1, 6 do
					if _G['GILFrame'..i..'Header'..j] then
						AS:SkinFrame(_G['GILFrame'..i..'Header'..j])
					end
				end
			end

			AS:SkinButton(GILFrame1IgnoreButton)

			AS:SkinButton(GILFrame2RemoveButton)
			AS:SkinButton(GILFrame2CreateButton)
			AS:SkinButton(GILFrame2ResetButton)

			AS:SkinFrame(GILFrame2Edit)
			AS:SkinButton(GILFrame2EditSaveButton)
			AS:SkinButton(GILFrame2EditCancelButton)

			AS:SkinCheckBox(GILFrame2Active)

			AS:SkinEditBox(GILFrame2EditDescField)

			AS:StripTextures(GILFrame2EditFilterField)
			AS:SkinEditBox(GILFrame2EditFilterField)
			AS:SkinButton(GILFrame2EditFilterHelp)

			AS:StripTextures(GILFrame2EditTestField)
			AS:SkinEditBox(GILFrame2EditTestField)
			AS:SkinButton(GILFrame2EditTestHelp)
			AS:SkinButton(GILFrame2EditTestTest)

			AS:SkinEditBox(GILFrame2EditLinkField)
			AS:SkinButton(GILFrame2EditLinkHelp)

			GIL.isSkinned = true
		end
	end)
end

AS:RegisterSkin('GlobalIgnoreList', AS.GlobalIgnoreList)