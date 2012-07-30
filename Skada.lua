local SkinSkada = CreateFrame("Frame")
	SkinSkada:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinSkada:SetScript( "OnEvent", function(self)
	if (UISkinOptions.SkadaSkin == "Disabled") then return end
	if IsAddOnLoaded("ElvUI") then SkadaSkinButton:Disable() SkadaSkinButton.text:SetText("|cFF808080Skada Skin Disabled for ElvUI|r") return end
	if not (IsAddOnLoaded("Skada") and IsAddOnLoaded("Tukui")) then return end
TukuiSkinsDB = {}

SLASH_SKADAEMBEDDED1, SLASH_SKADAEMBEDDED2 = '/es', '/embedskada';
function SlashCmdList.SKADAEMBEDDED(msg, editbox)
	if(TukuiSkinsDB.skadaembedded == "Disabled") then
		TukuiSkinsDB.skadaembedded = "Enabled";
	else
		TukuiSkinsDB.skadaembedded = "Disabled";
	end
	if(TukuiSkinsDB.skadaembedded == "Enabled") then
	print("Skada Embedding to Embed Window is |cff00ff00"..TukuiSkinsDB.skadaembedded.."|r.");
	end
	if(TukuiSkinsDB.skadaembedded == "Disabled") then
	print("Skada Embedding to Embed Window is |cffff2020"..TukuiSkinsDB.skadaembedded.."|r.");
	end
	print("Please Reload the UI with /rl");	
end

local Skada = Skada

local Skada = Skada
local barSpacing = s.Scale( 1, 1 )
local borderWidth = s.Scale( 2, 2 )

local barmod = Skada.displays["bar"]

local function StripOptions( options )
	options.baroptions.args.barspacing = nil
	options.titleoptions.args.texture = nil
	options.titleoptions.args.bordertexture = nil
	options.titleoptions.args.thickness = nil
	options.titleoptions.args.margin = nil
	options.titleoptions.args.color = nil
	options.windowoptions = nil
	options.baroptions.args.barfont = nil
	options.titleoptions.args.font = nil
end

local barmod = Skada.displays["bar"]
barmod.AddDisplayOptions_ = barmod.AddDisplayOptions
barmod.AddDisplayOptions = function( self, win, options )
	self:AddDisplayOptions_( win, options )
	StripOptions( options )
end

for k, options in pairs( Skada.options.args.windows.args ) do
	if( options.type == "group" ) then
		StripOptions( options.args )
	end
end

local titleBG = {
	bgFile = c["media"].normTex,
	tile = false,
	tileSize = 0
}

barmod.ApplySettings_ = barmod.ApplySettings
barmod.ApplySettings = function( self, win )
	barmod.ApplySettings_( self, win )

	local skada = win.bargroup

	if( win.db.enabletitle ) then
		skada.button:SetBackdrop( titleBG )
	end

	skada:SetTexture( c["media"].normTex )
	skada:SetSpacing( barSpacing )
	skada:SetFont( c["media"].pixelfont, c["datatext"].fontsize, "" )
	skada:SetFrameLevel( 5 )
	
	if not skada.TitleBackGround then
		skada.TitleBackGround = CreateFrame( "Frame", nil, skada.button )
		skada.TitleBackGround:SetPoint( "TOP" )
		skada.TitleBackGround:SetPoint( "LEFT" )
		skada.TitleBackGround:SetPoint( "RIGHT" )
		skada.TitleBackGround:SetPoint( "BOTTOM", 0, 1 )
		skada.TitleBackGround:SetTemplate( "Default" )
		skada.TitleBackGround:SetFrameLevel( skada.button:GetFrameLevel() -1 )
	end
	
	local titlefont = CreateFont( "TitleFont" .. win.db.name )
	titlefont:SetFont( c.media.pixelfont, 12, "MONOCHROMEOUTLINE" )
	skada.button:SetNormalFontObject( titlefont )

	local color = win.db.title.color
	skada.button:SetBackdropColor( 0, 0, 0, 0 )

	skada:SetBackdrop( nil )
	if not skada.backdrop then
		skada:CreateBackdrop( "Default" )
	end
	skada.backdrop:ClearAllPoints()
	if( win.db.enabletitle ) then
		skada.backdrop:Point( "TOPLEFT", skada.button, "TOPLEFT", -2, 2 )
	else
		skada.backdrop:Point( "TOPLEFT", skada, "TOPLEFT", -2, 2 )
	end
	skada.backdrop:Point( "BOTTOMRIGHT", skada, "BOTTOMRIGHT", 2, -2 )
	if( TukuiSkinsDB.skadaembedded == "Enabled" ) then
		win.bargroup.button:SetFrameStrata( "MEDIUM" )
		win.bargroup.button:SetFrameLevel( 5 )	
		win.bargroup:SetFrameStrata( "MEDIUM" )
	end
end

local function EmbedWindow( window, width, barheight, height, point, relativeFrame, relativePoint, ofsx, ofsy )
	window.db.barwidth = width
	window.db.barheight = barheight
	if( window.db.enabletitle ) then 
		height = height - barheight
	end
	window.db.background.height = height
	window.db.spark = false
	window.db.barslocked = true
	window.bargroup:ClearAllPoints()
	window.bargroup:SetPoint( point, relativeFrame, relativePoint, ofsx, ofsy )
	
	barmod.ApplySettings( barmod, window )
end

local windows = {}
function EmbedSkada()
	if( #windows == 1 ) then
		EmbedWindow( windows[1], EmbeddingWindow:GetWidth() - 4,   ( EmbeddingWindow:GetHeight() - 2 - ( barSpacing * 4 ) ) / 10, ( EmbeddingWindow:GetHeight() - 6), "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, -17 )
	elseif( #windows == 2 ) then
		EmbedWindow( windows[1], ( ( EmbeddingWindow:GetWidth() - 4 ) / 2 ) - ( borderWidth + s.mult ), ( EmbeddingWindow:GetHeight() - 2 - ( barSpacing * 4 ) ) / 10, EmbeddingWindow:GetHeight() - 6, "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, -17 )
		EmbedWindow( windows[2], ( ( EmbeddingWindow:GetWidth() - 4 ) / 2 ) - ( borderWidth + s.mult ), ( EmbeddingWindow:GetHeight() - 2 - ( barSpacing * 4 ) ) / 10, EmbeddingWindow:GetHeight() - 6, "TOPLEFT", EmbeddingWindow, "TOPLEFT", 2, -17 )
	end
end

for _, window in ipairs( Skada:GetWindows() ) do
	window:UpdateDisplay()
end

Skada.CreateWindow_ = Skada.CreateWindow
	function Skada:CreateWindow( name, db )
		Skada:CreateWindow_( name, db )

		windows = {}
		for _, window in ipairs( Skada:GetWindows() ) do
			tinsert( windows, window )
		end	
	if(TukuiSkinsDB.skadaembedded == "Enabled") then
		EmbedSkada()
	end
end

Skada.DeleteWindow_ = Skada.DeleteWindow
	function Skada:DeleteWindow( name )
		Skada:DeleteWindow_( name )
		windows = {}
		for _, window in ipairs( Skada:GetWindows() ) do
			tinsert( windows, window )
		end	
	if(TukuiSkinsDB.skadaembedded == "Enabled") then
		EmbedSkada()
	end
end

local Skada_Skin = CreateFrame( "Frame" )
	Skada_Skin:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	Skada_Skin:SetScript( "OnEvent", function( self )
		self:UnregisterAllEvents()
		self = nil
	if(TukuiSkinsDB.skadaembedded == "Enabled") then
		EmbedSkada()
	end
end )

end)
