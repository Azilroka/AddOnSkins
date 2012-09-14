if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("PoMTracker") then return end
local U = unpack(select(2,...))
local name = "PoMTrackerSkin"
local function SkinPoMTracker(self)
	local s = U.s
	local c = U.c

	U.SkinFrame(PoMOptionFrame)
	U.SkinCloseButton(PoMOptionFrame_CloseButton)

	pomtracker1:CreateBackdrop("Transparent")
	pomtracker1:Size(85,15)

	U.SkinFrame(pomtracker2)

	pomtracker3:CreateBackdrop("Transparent")
	pomtracker3:ClearAllPoints()
	pomtracker3:Point("TOPLEFT", pomtracker2, "BOTTOMLEFT", 5, -10)
	pomtracker3:Size(150,15)

	U.SkinButton(pomtracker3_Button1)

	pomtrackerstatusBar:ClearAllPoints()
	pomtrackerstatusBar:Point("TOPLEFT", pomtracker2, "BOTTOMLEFT", 5, -2)
	pomtrackerstatusBar:CreateBackdrop("Transparent")

	for i = 1,6 do
		U.SkinCheckBox(_G["PoMOptionFrame_CheckButton"..i])
	end

end

U.RegisterSkin(name,SkinPoMTracker)