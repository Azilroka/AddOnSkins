if not IsAddOnLoaded("PoMTracker") then return end

PoMOptionFrame:StripTextures()
PoMOptionFrame:SetTemplate("Transparent")
cSkinCloseButton(PoMOptionFrame_CloseButton)

pomtracker1:CreateBackdrop("Transparent")
pomtracker1:Size(85,15)

pomtracker2:StripTextures()
pomtracker2:SetTemplate("Transparent")

pomtracker3:CreateBackdrop("Transparent")
pomtracker3:ClearAllPoints()
pomtracker3:Point("TOPLEFT", pomtracker2, "BOTTOMLEFT", 5, -10)
pomtracker3:Size(150,15)

cSkinButton(pomtracker3_Button1)

pomtrackerstatusBar:ClearAllPoints()
pomtrackerstatusBar:Point("TOPLEFT", pomtracker2, "BOTTOMLEFT", 5, -2)
pomtrackerstatusBar:CreateBackdrop("Transparent")

for i = 1,6 do
	cSkinCheckBox(_G["PoMOptionFrame_CheckButton"..i])
end