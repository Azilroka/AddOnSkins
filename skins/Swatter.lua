if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) or not IsAddOnLoaded("!Swatter") then return end
local U = unpack(select(2,...))
local name = "SwatterSkin"
local function SkinSwatter(self)
	for addon, _ in pairs({ '!buggrabber', '!improvederrorframe' }) do if select(4, GetAddOnInfo(addon)) then return end end
	U.SkinFrame(SwatterErrorFrame)
	U.SkinButton(Swatter.Error.Done)
	U.SkinButton(Swatter.Error.Next)
	U.SkinButton(Swatter.Error.Prev)
	U.SkinButton(Swatter.Drag)
	U.SkinScrollBar(SwatterErrorInputScrollScrollBar)
end

U.RegisterSkin(name,SkinSwatter)