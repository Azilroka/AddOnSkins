
if IsAddOnLoaded("!BugGrabber") then return end
if IsAddOnLoaded("!ImprovedErrorFrame") then return end
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "SwatterSkin"
local function SkinSwatter(self)
	AS:SkinFrame(SwatterErrorFrame)
	AS:SkinButton(Swatter.Error.Done)
	AS:SkinButton(Swatter.Error.Next)
	AS:SkinButton(Swatter.Error.Prev)
	AS:SkinButton(Swatter.Drag)
	AS:SkinScrollBar(SwatterErrorInputScrollScrollBar)
end

AS:RegisterSkin(name,SkinSwatter)