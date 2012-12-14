local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "RavenSkin"
local function SkinRaven(self)

	local function HookBars()
		Nest_CreateBar_ = Nest_CreateBar
		Nest_CreateBar = function(bg, name)
			bar = Nest_CreateBar_(bg, name)
			bar.frame:Show()
			bar.container:Show()
			bar.frame:CreateBackdrop("Transparent")
			bar.frame.backdrop:SetOutside(bar.frame)
			return bar
		end
	
		Nest_DeleteBar_ = Nest_DeleteBar
		Nest_DeleteBar = function(bg, bar)
			bar.frame:Hide()
			bar.container:Hide()
			Nest_DeleteBar_(bg, bar)
		end
	end

HookBars()

end

AS:RegisterSkin(name,SkinRaven)