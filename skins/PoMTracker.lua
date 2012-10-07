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

	pomtracker2:ClearAllPoints()
	pomtracker2:Point("TOP", pomtracker1, "BOTTOM", 0, -5)
	pomtracker2:StripTextures(True)
	pomtracker2:CreateBackdrop("Transparent")

	pomtracker3:CreateBackdrop("Transparent")
	pomtracker3:ClearAllPoints()
	pomtracker3:Point("TOP", pomtrackerstatusBar, "BOTTOM", 0, -5)
	pomtracker3:Height(15)

	U.SkinButton(pomtracker3_Button1)

	pomtrackerstatusBar:ClearAllPoints()
	pomtrackerstatusBar:Point("TOP", pomtracker2, "BOTTOM", 0, -5)
	pomtrackerstatusBar:CreateBackdrop("Transparent")
	pomtrackerstatusBar:SetStatusBarTexture(c["media"].normTex)

	for i = 1,6 do
		U.SkinCheckBox(_G["PoMOptionFrame_CheckButton"..i])
	end
	pomtracker2:HookScript("OnUpdate", function() pomtrackerstatusBar:Width(pomtracker2:GetWidth()+1) pomtracker3:Width(pomtracker2:GetWidth()+1) end)
end

U.RegisterSkin(name,SkinPoMTracker)