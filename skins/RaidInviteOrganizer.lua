local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "RaidInviteOrganizerSkin"
function AS:SkinRaidInviteOrganizer()
	AS:SkinFrame(RIO_MainFrame)
	AS:SkinFrame(RIO_GuildMemberFrame)
	AS:SkinFrame(RIO_CodeWordsContainer)
	RIO_SliderContainer:StripTextures(True)
	AS:SkinScrollBar(RIO_GuildSlider)
	AS:SkinCloseButton(RIO_CloseButtonThing)
	AS:SkinButton(RIO_SelectAll)
	AS:SkinButton(RIO_SelectNone)
	AS:SkinButton(RIO_SendMassInvites)
	AS:SkinButton(RIO_SaveCodeWordList)
	AS:SkinButton(RIO_ToggleCodewordInvites)
	AS:SkinCheckBox(RIO_ShowOfflineBox)
	AS:SkinCheckBox(RIO_GuildMessageAtStart)
	AS:SkinCheckBox(RIO_NotifyWhenTimerDone)
	AS:SkinCheckBox(RIO_OnlyGuildMembers)
	AS:SkinCheckBox(RIO_AlwaysInviteListen)
	AS:SkinCheckBox(RIO_ShowMinimapIconConfig)
	AS:SkinCheckBox(RIO_AutoSet25manBox)
	AS:SkinCheckBox(RIO_AutoSetDifficultyBox)
	AS:SkinCheckBox(RIO_AutoSetMasterLooter)

	RIO_MainFrameTab1:Point("TOPLEFT", RIO_MainFrame, "BOTTOMLEFT", -5, 2)
	RIO_MainFrameTab2:Point("LEFT", RIO_MainFrameTab1, "RIGHT", -2, 0)
	RIO_MainFrameTab3:Point("LEFT", RIO_MainFrameTab2, "RIGHT", -2, 0)

	for i = 1, 3 do
		AS:SkinTab(_G["RIO_MainFrameTab"..i])
	end

	for i = 1, 10 do
		AS:SkinCheckBox(_G["RIO_ShowRank"..i])
	end
end

AS:RegisterSkin(name, AS.SkinRaidInviteOrganizer)