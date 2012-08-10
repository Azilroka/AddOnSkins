if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
if IsAddOnLoaded("TomTom") then TomTomBlock:SetTemplate("Transparent") end
GeneralDockManagerOverflowButtonList:SetTemplate()
cSkinCloseButton(TokenFramePopupCloseButton)
cSkinCloseButton(RolePollPopupCloseButton)
cSkinCheckBox(TokenFramePopupInactiveCheckBox)
cSkinCheckBox(TokenFramePopupBackpackCheckBox)