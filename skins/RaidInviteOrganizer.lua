if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("RaidInviteOrganizer") then return end
local U = unpack(select(2,...))
local name = "RaidInviteOrganizerSkin"
local function SkinRIO(self)
	local s = U.s
	local c = U.c
	
	U.SkinFrame(RIO_MainFrame)
	U.SkinFrame(RIO_GuildMemberFrame)
	U.SkinFrame(RIO_CodeWordsContainer)
	RIO_SliderContainer:StripTextures(True)

	U.SkinScrollBar(RIO_GuildSlider)
	U.SkinCloseButton(RIO_CloseButtonThing)
	U.SkinButton(RIO_SelectAll)
	U.SkinButton(RIO_SelectNone)
	U.SkinButton(RIO_SendMassInvites)
	U.SkinButton(RIO_SaveCodeWordList)
	U.SkinButton(RIO_ToggleCodewordInvites)

	U.SkinCheckBox(RIO_ShowOfflineBox)
	U.SkinCheckBox(RIO_GuildMessageAtStart)
	U.SkinCheckBox(RIO_NotifyWhenTimerDone)
	U.SkinCheckBox(RIO_OnlyGuildMembers)
	U.SkinCheckBox(RIO_AlwaysInviteListen)
	U.SkinCheckBox(RIO_ShowMinimapIconConfig)
	U.SkinCheckBox(RIO_AutoSet25manBox)
	U.SkinCheckBox(RIO_AutoSetDifficultyBox)
	U.SkinCheckBox(RIO_AutoSetMasterLooter)

	RIO_MainFrameTab1:Point("TOPLEFT", RIO_MainFrame, "BOTTOMLEFT", -5, 2)
	RIO_MainFrameTab2:Point("LEFT", RIO_MainFrameTab1, "RIGHT", -2, 0)
	RIO_MainFrameTab3:Point("LEFT", RIO_MainFrameTab2, "RIGHT", -2, 0)
 
	for i = 1, 3 do
		U.SkinTab(_G["RIO_MainFrameTab"..i])
	end

	for i = 1, 10 do
		U.SkinCheckBox(_G["RIO_ShowRank"..i])
	end

end

U.RegisterSkin(name,SkinRIO)