if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("RaidInviteOrganizer") then return end
local U = unpack(select(2,...))
local name = "RaidInviteOrganizerSkin"
local function SkinRIO(self)
	local s = U.s
	local c = U.c
	
	cSkinFrame(RIO_MainFrame)
	cSkinFrame(RIO_GuildMemberFrame)
	cSkinFrame(RIO_CodeWordsContainer)
	RIO_SliderContainer:StripTextures(True)

	cSkinScrollBar(RIO_GuildSlider)
	cSkinCloseButton(RIO_CloseButtonThing)
	cSkinButton(RIO_SelectAll)
	cSkinButton(RIO_SelectNone)
	cSkinButton(RIO_SendMassInvites)
	cSkinButton(RIO_SaveCodeWordList)
	cSkinButton(RIO_ToggleCodewordInvites)

	cSkinCheckBox(RIO_ShowOfflineBox)
	cSkinCheckBox(RIO_GuildMessageAtStart)
	cSkinCheckBox(RIO_NotifyWhenTimerDone)
	cSkinCheckBox(RIO_OnlyGuildMembers)
	cSkinCheckBox(RIO_AlwaysInviteListen)
	cSkinCheckBox(RIO_ShowMinimapIconConfig)
	cSkinCheckBox(RIO_AutoSet25manBox)
	cSkinCheckBox(RIO_AutoSetDifficultyBox)
	cSkinCheckBox(RIO_AutoSetMasterLooter)

	RIO_MainFrameTab1:Point("TOPLEFT", RIO_MainFrame, "BOTTOMLEFT", -5, 2)
	RIO_MainFrameTab2:Point("LEFT", RIO_MainFrameTab1, "RIGHT", -2, 0)
	RIO_MainFrameTab3:Point("LEFT", RIO_MainFrameTab2, "RIGHT", -2, 0)
 
	for i = 1, 3 do
		cSkinTab(_G["RIO_MainFrameTab"..i])
	end

	for i = 1, 10 do
		cSkinCheckBox(_G["RIO_ShowRank"..i])
	end

end

cRegisterSkin(name,SkinRIO)