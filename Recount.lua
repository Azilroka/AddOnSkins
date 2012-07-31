local SkinRecount = CreateFrame("Frame")
	SkinRecount:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinRecount:SetScript( "OnEvent", function(self)
	if not (IsAddOnLoaded("Recount") and IsAddOnLoaded("Tukui"))then return end
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c
	
local Recount = _G.Recount
if (UISkinOptions.EmbedRecount == "Enabled") then
	Recount_MainWindow:ClearAllPoints()
	Recount_MainWindow:SetPoint("TOPLEFT", EmbeddingWindow,"TOPLEFT", 0, 7)
	Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindow,"BOTTOMRIGHT", 0, 0)
	Recount.db.profile.FrameStrata = "3-MEDIUM"
	Recount.db.profile.MainWindowWidth = (EmbeddingWindow:GetWidth())
end

local function SkinFrame( frame )
	frame.bgMain = CreateFrame( "Frame", nil, frame )
	frame.bgMain:SetTemplate( "Transparent" )
	frame.bgMain:SetPoint( "BOTTOMLEFT", frame, "BOTTOMLEFT" )
	frame.bgMain:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMRIGHT" )
	frame.bgMain:SetPoint( "TOP", frame, "TOP", 0, -7 )
	frame.bgMain:SetFrameLevel( frame:GetFrameLevel() )
	frame.CloseButton:SetPoint( "TOPRIGHT", frame, "TOPRIGHT", -1, -9 )
	frame:SetBackdrop( nil )
	frame.TitleBackground = CreateFrame( "Frame", nil, frame.bgMain )
	frame.TitleBackground:SetPoint( "TOP", 0 )
	frame.TitleBackground:SetPoint( "LEFT", 0 )
	frame.TitleBackground:SetPoint( "RIGHT", 0 )
	frame.TitleBackground:SetHeight( 24 )
	frame.TitleBackground:SetTemplate( "Transparent" )
	cSkinCloseButton(frame.CloseButton)
	frame.Title:SetFont( c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE" )
	frame.Title:SetParent( frame.TitleBackground )
	frame.Title:ClearAllPoints()
	frame.Title:SetPoint( "LEFT", 4, 0 )
	frame.CloseButton:SetNormalTexture( "" )
	frame.CloseButton:SetPushedTexture( "" )
	frame.CloseButton:SetHighlightTexture( "" )
	frame.CloseButton.t = frame.CloseButton:CreateFontString( nil, "OVERLAY" )
	frame.CloseButton.t:SetFont( c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE" )
	frame.CloseButton.t:SetPoint( "CENTER", 0, 1 )
	frame.CloseButton.t:SetText( s.RGBToHex( unpack( c["media"].datatextcolor2 ) ) .. "X" )
end

Recount.UpdateBarTextures = function( self )
	for k, v in pairs( Recount.MainWindow.Rows ) do
		v.StatusBar:SetStatusBarTexture( c["media"].normTex )
		v.StatusBar:GetStatusBarTexture():SetHorizTile( false )
		v.StatusBar:GetStatusBarTexture():SetVertTile( false )
		v.LeftText:SetPoint( "LEFT", 4, 1 )
		if IsAddOnLoaded("Tukui") then v.LeftText:SetFont( c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE" ) end
		v.RightText:SetPoint( "RIGHT", -4, 1 )
		if IsAddOnLoaded("Tukui") then v.RightText:SetFont( c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE" ) end
	end
end
Recount.SetBarTextures = Recount.UpdateBarTextures

Recount.SetupBar_ = Recount.SetupBar
Recount.SetupBar = function( self, bar )
	self:SetupBar_( bar )
	bar.StatusBar:SetStatusBarTexture( c["media"].normTex )
end

Recount.CreateFrame_ = Recount.CreateFrame
Recount.CreateFrame = function( self, Name, Title, Height, Width, ShowFunc, HideFunc )
	local frame = self:CreateFrame_( Name, Title, Height, Width, ShowFunc, HideFunc )
	SkinFrame( frame )
	return frame
end

if Recount.MainWindow then SkinFrame(Recount.MainWindow) end
if Recount.ConfigWindow then SkinFrame(Recount.ConfigWindow) end
if Recount.GraphWindow then SkinFrame(Recount.GraphWindow) end
if Recount.DetailWindow then SkinFrame(Recount.DetailWindow) end
if Recount.ResetFrame then SkinFrame(Recount.ResetFrame) end
if _G["Recount_Realtime_!RAID_DAMAGE"] then SkinFrame(_G["Recount_Realtime_!RAID_DAMAGE"].Window) end
if _G["Recount_Realtime_!RAID_HEALING"] then SkinFrame(_G["Recount_Realtime_!RAID_HEALING"].Window) end
if _G["Recount_Realtime_!RAID_HEALINGTAKEN"] then SkinFrame(_G["Recount_Realtime_!RAID_HEALINGTAKEN"].Window) end
if _G["Recount_Realtime_!RAID_DAMAGETAKEN"] then SkinFrame(_G["Recount_Realtime_!RAID_DAMAGETAKEN"].Window) end
if _G["Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH"] then SkinFrame(_G["Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH"].Window) end
if _G["Recount_Realtime_FPS_FPS"] then SkinFrame(_G["Recount_Realtime_FPS_FPS"].Window) end
if _G["Recount_Realtime_Latency_LAG"] then SkinFrame(_G["Recount_Realtime_Latency_LAG"].Window) end
if _G["Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC"] then SkinFrame(_G["Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC"].Window) end
if _G["Recount_Realtime_Upstream Traffic_UP_TRAFFIC"] then SkinFrame(_G["Recount_Realtime_Upstream Traffic_UP_TRAFFIC"].Window) end

Recount:UpdateBarTextures()

cSkinScrollBar(Recount_MainWindow_ScrollBarScrollBar)
cSkinScrollBar(Recount_PieMode_Scrollbar2ScrollBar)

Recount.MainWindow.FileButton:HookScript( "OnClick", function( self ) if LibDropdownFrame0 then LibDropdownFrame0:SetTemplate() end end )

Recount.MainWindow.RightButton:SetTemplate("Transparent")
Recount.MainWindow.RightButton:SetNormalTexture("")
Recount.MainWindow.RightButton:SetPushedTexture("")
Recount.MainWindow.RightButton:SetHighlightTexture("")
Recount.MainWindow.RightButton:SetSize(16, 16)
Recount.MainWindow.RightButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
Recount.MainWindow.RightButton.text:SetText( s.RGBToHex(unpack( c["media"].datatextcolor2))..">")
Recount.MainWindow.RightButton.text:SetPoint( "CENTER", 1, 1 )
Recount.MainWindow.RightButton:ClearAllPoints()
Recount.MainWindow.RightButton:SetPoint("RIGHT", Recount.MainWindow.CloseButton, "LEFT", -2, 0)

Recount.MainWindow.LeftButton:SetTemplate("Transparent")
Recount.MainWindow.LeftButton:SetNormalTexture("")
Recount.MainWindow.LeftButton:SetPushedTexture("")	
Recount.MainWindow.LeftButton:SetHighlightTexture("")
Recount.MainWindow.LeftButton:SetSize( 16, 16 )
Recount.MainWindow.LeftButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
Recount.MainWindow.LeftButton.text:SetText(s.RGBToHex( unpack(c["media"].datatextcolor2)).."<")
Recount.MainWindow.LeftButton.text:SetPoint("CENTER", 1, 1)
Recount.MainWindow.LeftButton:SetPoint("RIGHT", Recount.MainWindow.RightButton, "LEFT", -2, 0)

Recount.MainWindow.ResetButton:SetTemplate("Transparent")
Recount.MainWindow.ResetButton:SetNormalTexture("")
Recount.MainWindow.ResetButton:SetPushedTexture("")	
Recount.MainWindow.ResetButton:SetHighlightTexture("")
Recount.MainWindow.ResetButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
Recount.MainWindow.ResetButton.text:SetText(s.RGBToHex(unpack(c["media"].datatextcolor2)).."R")
Recount.MainWindow.ResetButton.text:SetPoint("CENTER", 1, 1)
Recount.MainWindow.ResetButton:SetPoint("RIGHT", Recount.MainWindow.LeftButton, "LEFT", -2, 0 )

Recount.MainWindow.FileButton:SetTemplate("Transparent")
Recount.MainWindow.FileButton:SetNormalTexture("")
Recount.MainWindow.FileButton:SetPushedTexture("")	
Recount.MainWindow.FileButton:SetHighlightTexture("")
Recount.MainWindow.FileButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
Recount.MainWindow.FileButton.text:SetText(s.RGBToHex(unpack(c["media"].datatextcolor2)).."F")
Recount.MainWindow.FileButton.text:SetPoint("CENTER", 1, 1 )
Recount.MainWindow.FileButton:SetPoint("RIGHT", Recount.MainWindow.ResetButton, "LEFT", -2, 0)

Recount.MainWindow.ConfigButton:SetTemplate("Transparent")
Recount.MainWindow.ConfigButton:SetNormalTexture("")
Recount.MainWindow.ConfigButton:SetPushedTexture("")	
Recount.MainWindow.ConfigButton:SetHighlightTexture("")
Recount.MainWindow.ConfigButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
Recount.MainWindow.ConfigButton.text:SetText(s.RGBToHex( unpack( c["media"].datatextcolor2)).."C")
Recount.MainWindow.ConfigButton.text:SetPoint("CENTER", 1, 1 )
Recount.MainWindow.ConfigButton:SetPoint("RIGHT", Recount.MainWindow.FileButton, "LEFT", -2, 0)

Recount.MainWindow.ReportButton:SetTemplate("Transparent")
Recount.MainWindow.ReportButton:SetNormalTexture("")
Recount.MainWindow.ReportButton:SetPushedTexture("")	
Recount.MainWindow.ReportButton:SetHighlightTexture("")
Recount.MainWindow.ReportButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
Recount.MainWindow.ReportButton.text:SetText(s.RGBToHex( unpack( c["media"].datatextcolor2)).."S")
Recount.MainWindow.ReportButton.text:SetPoint("CENTER", 1, 1 )
Recount.MainWindow.ReportButton:SetPoint("RIGHT", Recount.MainWindow.ConfigButton, "LEFT", -2, 0)

Recount.DetailWindow.ReportButton:SetTemplate("Transparent")
Recount.DetailWindow.ReportButton:SetNormalTexture("")
Recount.DetailWindow.ReportButton:SetPushedTexture("")	
Recount.DetailWindow.ReportButton:SetHighlightTexture("")
Recount.DetailWindow.ReportButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
Recount.DetailWindow.ReportButton.text:SetText(s.RGBToHex( unpack( c["media"].datatextcolor2)).."R")
Recount.DetailWindow.ReportButton.text:SetPoint("CENTER", 1, 1 )

Recount.DetailWindow.RightButton:SetTemplate("Transparent")
Recount.DetailWindow.RightButton:SetNormalTexture("")
Recount.DetailWindow.RightButton:SetPushedTexture("")
Recount.DetailWindow.RightButton:SetHighlightTexture("")
Recount.DetailWindow.RightButton:SetSize(16, 16)
Recount.DetailWindow.RightButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
Recount.DetailWindow.RightButton.text:SetText( s.RGBToHex(unpack( c["media"].datatextcolor2))..">")
Recount.DetailWindow.RightButton.text:SetPoint("CENTER", 1, 1 )

Recount.DetailWindow.LeftButton:SetTemplate("Transparent")
Recount.DetailWindow.LeftButton:SetNormalTexture("")
Recount.DetailWindow.LeftButton:SetPushedTexture("")	
Recount.DetailWindow.LeftButton:SetHighlightTexture("")
Recount.DetailWindow.LeftButton:SetSize( 16, 16 )
Recount.DetailWindow.LeftButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
Recount.DetailWindow.LeftButton.text:SetText(s.RGBToHex( unpack(c["media"].datatextcolor2)).."<")
Recount.DetailWindow.LeftButton.text:SetPoint("CENTER", 1, 1 )

Recount.DetailWindow.SummaryButton:SetTemplate("Transparent")
Recount.DetailWindow.SummaryButton:SetNormalTexture("")
Recount.DetailWindow.SummaryButton:SetPushedTexture("")	
Recount.DetailWindow.SummaryButton:SetHighlightTexture("")
Recount.DetailWindow.SummaryButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
Recount.DetailWindow.SummaryButton.text:SetText(s.RGBToHex( unpack( c["media"].datatextcolor2)).."S")
Recount.DetailWindow.SummaryButton.text:SetPoint("CENTER", 1, 1 )

SLASH_RECOUNTEMBEDDED1, SLASH_RECOUNTEMBEDDED2 = '/er', '/embedrecount';
function SlashCmdList.RECOUNTEMBEDDED(msg, editbox)
	if (UISkinOptions.EmbedRecount == "Disabled") then
		UISkinOptions.EmbedRecount = "Enabled";
	else
		UISkinOptions.EmbedRecount = "Disabled";
	end
	if(UISkinOptions.EmbedRecount == "Enabled") then
	print("Recount Embedding is |cff00ff00"..UISkinOptions.EmbedRecount.."|r.");
	end
	if(UISkinOptions.EmbedRecount == "Disabled") then
	print("Recount Embedding is |cffff2020"..UISkinOptions.EmbedRecount.."|r.");
	end
	print("Please Reload the UI with /rl");	
end
end)