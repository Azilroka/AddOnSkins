LoadAddOn("stAddonmanager")
if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("stAddonmanager") then return end
local U = unpack(select(2,...))
local name = "stAddonManagerSkin"
local function SkinstAddonmanager(self)
	stAddonManager:LoadWindow()
	stAddonManager:CreateBackdrop()
	stAddonManager_ScrollBackground:CreateBackdrop()
	stAddonManager_ScrollBackground.backdrop:SetBackdropColor(0,0,0,0)
	U.SkinEditBox(stAddonManager_SearchBar)
	stAddonManager.reloadButton:CreateBackdrop()
	stAddonManager.profileButton:CreateBackdrop()
	stAddonManager_ScrollFrameScrollBar.thumbbg:CreateBackdrop()
	stAddonManager:Hide()
end

U.RegisterSkin(name,SkinstAddonmanager)