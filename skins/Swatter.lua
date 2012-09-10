if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) or not IsAddOnLoaded("!Swatter") then return end
local name = "SwatterSkin"
local function SkinSwatter(self)
	cSkinFrame(SwatterErrorFrame)
	cSkinButton(Swatter.Error.Done)
	cSkinButton(Swatter.Error.Next)
	cSkinButton(Swatter.Error.Prev)
	cSkinButton(Swatter.Drag)
	cSkinScrollBar(SwatterErrorInputScrollScrollBar)
end

cRegisterSkin(name,SkinSwatter)