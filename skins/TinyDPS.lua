if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("ElvUI")) or not IsAddOnLoaded("TinyDPS") then return end
local U = unpack(select(2,...))
local name = "TinyDPSSkin"
local function SkinTinyDps(self)
	local s = U.s
	local c = U.c
	local frame = tdpsFrame
	local anchor = tdpsAnchor
	local status = tdpsStatusBar
	local tdps = tdps
	local font = tdpsFont
	local position = tdpsPosition
	local template
	if U.CheckOption("EmbedTDPS") then template = "Default" else template = "Transparent" end
	frame:SetTemplate(template, true)
	if U.elv then
		if(tdps) then
			tdps.width = Minimap:GetWidth()
			tdps.spacing = 1
			tdps.barHeight = 14
			font.name = U.x.datatext_font
			font.size = 12
			font.outline = "OUTLINE"
		end
	end
	if U.tuk then
		if(tdps) then
			tdps.width = TukuiMinimap:GetWidth()
			tdps.spacing = 1
			tdps.barHeight = 14
			font.name = c["media"].pixelfont
			font.size = 12
			font.outline = "MONOCHROMEOUTLINE"
		end
	end
	if(status) then
		tdpsStatusBar:SetBackdrop( {
			bgFile = c["media"].normTex,
			edgeFile = c["media"].blank,
			tile = false,
			tileSize = 0,
			edgeSize = 1,
			insets = {
				left = 0,
				right = 0,
				top = 0,
				bottom = 0
			}
		})
		tdpsStatusBar:SetStatusBarTexture(c["media"].normTex)
	end
end
U.RegisterSkin(name,SkinTinyDps)

function EmbedTDPS()
	if not IsAddOnLoaded("TinyDPS") then U.DisableOption("EmbedTDPS") return end
	tdpsFrame.spacing = 0
	tdpsFrame.barHeight = 14
	tdpsVisibleBars = 9
	tdpsFrame:SetWidth(EmbeddingWindow:GetWidth())
	tdpsAnchor:Point("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 0)
if U.elv then
	tdpsFont.name = U.x.datatext_font
	tdpsFont.size = 12
	tdpsFont.outline = "THIN"
	tdpsFont.shadow = 0
end
if U.tuk then
	local c = U.c
	tdpsFont.name = c["media"].pixelfont
	tdpsFont.size = 12
	tdpsFont.outline = "MONOCHROMEOUTLINE"
end
--Positions Go here / Going to bed gnight

	tdpsRefresh()
	if (U.CheckOption("EmbedOoC")) then
		if (U.CheckOption("EmbedTDPS")) then
			tdpsFrame:Hide()
		end
	end
end

local TinyDPS_Embed = CreateFrame("Frame",nil)
	TinyDPS_Embed:RegisterEvent("PLAYER_ENTERING_WORLD")
	TinyDPS_Embed:SetScript("OnEvent", function(self)
		if(U.CheckOption("EmbedTDPS")) then
			EmbedTDPS()
		end
	end)