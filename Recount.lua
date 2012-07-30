local SkinRecount = CreateFrame("Frame")
	SkinRecount:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinRecount:SetScript( "OnEvent", function(self)
	if (UISkinOptions.RecountSkin == "Disabled") then return end
	if IsAddOnLoaded("ElvUI") then RecountSkinButton:Disable() RecountSkinButton.text:SetText("|cFF808080Recount Skin Disabled for ElvUI|r") return end
	if not (IsAddOnLoaded("Recount") and IsAddOnLoaded("Tukui"))then return end
TukuiSkinsDB = {}
local Recount = _G.Recount

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
		v.LeftText:SetFont( c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE" )
		v.RightText:SetPoint( "RIGHT", -4, 1 )
		v.RightText:SetFont( c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE" )
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

local elements = {
	Recount.MainWindow,
	Recount.ConfigWindow,
	Recount.GraphWindow,
	Recount.DetailWindow,
	Recount.ResetFrame,
}

for i = 1, getn( elements ) do
	local frame = elements[i]
	if frame then
		SkinFrame( frame )
	end
end

Recount:UpdateBarTextures()

Recount_MainWindow_ScrollBarScrollBar:SkinScrollBar()

Recount.MainWindow.FileButton:HookScript( "OnClick", function( self ) if LibDropdownFrame0 then LibDropdownFrame0:SetTemplate() end end )

Recount.MainWindow.RightButton:SetTemplate( "Transparent" )
Recount.MainWindow.RightButton:SetNormalTexture( "" )
Recount.MainWindow.RightButton:SetPushedTexture( "" )	
Recount.MainWindow.RightButton:SetHighlightTexture( "" )
Recount.MainWindow.RightButton:SetSize( 16, 16 )
Recount.MainWindow.RightButton:FontString( "text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE" )
Recount.MainWindow.RightButton.text:SetText( s.RGBToHex( unpack( c["media"].datatextcolor2 ) ) .. ">" )
Recount.MainWindow.RightButton.text:SetPoint( "CENTER", 1, 1 )
Recount.MainWindow.RightButton:ClearAllPoints()
Recount.MainWindow.RightButton:SetPoint( "RIGHT", Recount.MainWindow.CloseButton, "LEFT", -2, 0 )

Recount.MainWindow.LeftButton:SetTemplate( "Transparent" )
Recount.MainWindow.LeftButton:SetNormalTexture( "" )
Recount.MainWindow.LeftButton:SetPushedTexture( "" )	
Recount.MainWindow.LeftButton:SetHighlightTexture( "" )
Recount.MainWindow.LeftButton:SetSize( 16, 16 )
Recount.MainWindow.LeftButton:FontString( "text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE" )
Recount.MainWindow.LeftButton.text:SetText( s.RGBToHex( unpack( c["media"].datatextcolor2 ) ) .. "<" )
Recount.MainWindow.LeftButton.text:SetPoint( "CENTER", 1, 1 )
Recount.MainWindow.LeftButton:SetPoint( "RIGHT", Recount.MainWindow.RightButton, "LEFT", -2, 0 )

Recount.MainWindow.ResetButton:SetTemplate( "Transparent" )
Recount.MainWindow.ResetButton:SetNormalTexture( "" )
Recount.MainWindow.ResetButton:SetPushedTexture( "" )	
Recount.MainWindow.ResetButton:SetHighlightTexture( "" )
Recount.MainWindow.ResetButton:FontString( "text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE" )
Recount.MainWindow.ResetButton.text:SetText( s.RGBToHex( unpack( c["media"].datatextcolor2 ) ) .. "R" )
Recount.MainWindow.ResetButton.text:SetPoint( "CENTER", 1, 1 )
Recount.MainWindow.ResetButton:SetPoint( "RIGHT", Recount.MainWindow.LeftButton, "LEFT", -2, 0 )

Recount.MainWindow.FileButton:SetTemplate( "Transparent" )
Recount.MainWindow.FileButton:SetNormalTexture( "" )
Recount.MainWindow.FileButton:SetPushedTexture( "" )	
Recount.MainWindow.FileButton:SetHighlightTexture( "" )
Recount.MainWindow.FileButton:FontString( "text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE" )
Recount.MainWindow.FileButton.text:SetText( s.RGBToHex( unpack( c["media"].datatextcolor2 ) ) .. "F" )
Recount.MainWindow.FileButton.text:SetPoint( "CENTER", 1, 1 )
Recount.MainWindow.FileButton:SetPoint( "RIGHT", Recount.MainWindow.ResetButton, "LEFT", -2, 0 )

Recount.MainWindow.ConfigButton:SetTemplate( "Transparent" )
Recount.MainWindow.ConfigButton:SetNormalTexture( "" )
Recount.MainWindow.ConfigButton:SetPushedTexture( "" )	
Recount.MainWindow.ConfigButton:SetHighlightTexture( "" )
Recount.MainWindow.ConfigButton:FontString( "text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE" )
Recount.MainWindow.ConfigButton.text:SetText( s.RGBToHex( unpack( c["media"].datatextcolor2 ) ) .. "C" )
Recount.MainWindow.ConfigButton.text:SetPoint( "CENTER", 1, 1 )
Recount.MainWindow.ConfigButton:SetPoint( "RIGHT", Recount.MainWindow.FileButton, "LEFT", -2, 0 )

Recount.MainWindow.ReportButton:SetTemplate( "Transparent" )
Recount.MainWindow.ReportButton:SetNormalTexture( "" )
Recount.MainWindow.ReportButton:SetPushedTexture( "" )	
Recount.MainWindow.ReportButton:SetHighlightTexture( "" )
Recount.MainWindow.ReportButton:FontString( "text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE" )
Recount.MainWindow.ReportButton.text:SetText( s.RGBToHex( unpack( c["media"].datatextcolor2 ) ) .. "S" )
Recount.MainWindow.ReportButton.text:SetPoint( "CENTER", 1, 1 )
Recount.MainWindow.ReportButton:SetPoint( "RIGHT", Recount.MainWindow.ConfigButton, "LEFT", -2, 0 )

local Recount_Skin = CreateFrame( "Frame" )
	Recount_Skin:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	Recount_Skin:SetScript( "OnEvent", function( self )
		self:UnregisterAllEvents()
		self = nil
		if (TukuiSkinsDB.recountembedded == "Enabled") then
			Recount_MainWindow:ClearAllPoints()
			Recount_MainWindow:SetPoint( "TOPLEFT", EmbeddingWindow,"TOPLEFT", 0, 7 )
			Recount_MainWindow:SetPoint( "BOTTOMRIGHT", EmbeddingWindow,"BOTTOMRIGHT", 0, 0 )
			Recount.db.profile.FrameStrata = "3-MEDIUM"
			Recount.db.profile.MainWindowWidth = ( EmbeddingWindow:GetWidth() )
		end
	end )

SLASH_RECOUNTEMBEDDED1, SLASH_RECOUNTEMBEDDED2 = '/er', '/embedrecount';
function SlashCmdList.RECOUNTEMBEDDED(msg, editbox)
	if (TukuiSkinsDB.recountembedded == "Disabled") then
		TukuiSkinsDB.recountembedded = "Enabled";
	else
		TukuiSkinsDB.recountembedded = "Disabled";
	end
	if(TukuiSkinsDB.recountembedded == "Enabled") then
	print("Recount Embedding is |cff00ff00"..TukuiSkinsDB.recountembedded.."|r.");
	end
	if(TukuiSkinsDB.recountembedded == "Disabled") then
	print("Recount Embedding is |cffff2020"..TukuiSkinsDB.recountembedded.."|r.");
	end
	print("Please Reload the UI with /rl");	
end
end)