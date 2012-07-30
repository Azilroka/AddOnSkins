-- Gnosis Cast Bar Background
local GnosisTest = CreateFrame("Frame", "GnosisCastBarBackgroundTest", UIParent)
GnosisTest:CreatePanel("Default", 1, 25, "BOTTOM", InvTukuiActionBarBackground, "TOP", 0, 5)
GnosisTest:SetWidth((T.buttonsize * 12) + (T.buttonspacing * 13))
GnosisTest:SetFrameLevel(1)
GnosisTest:SetFrameStrata("BACKGROUND")
GnosisTest:SetScript("OnLoad", function(self) if( PlayerCastbar ) then
   PlayerCastbar:SetScript( "OnShow", function() self:Show(); end );
   PlayerCastbar:SetScript( "OnHide", function() self:Hide(); end );
   if( PlayerCastbar:IsVisible() ) then self:Show(); else self:Hide(); end
   hooksecurefunc( PlayerCastbar, "SetAlpha", function(this,val) self:SetAlpha( val ); end );
end
end)