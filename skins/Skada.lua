local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "SkadaSkin"
local windows = {}

local function SkinSkada(self)
	local Skada = Skada
	local barSpacing = 1
	local borderWidth = 1
	local barmod = Skada.displays["bar"]

	local function StripOptions(options)
		options.baroptions.args.barspacing = nil
		options.titleoptions.args.texture = nil
		options.titleoptions.args.bordertexture = nil
		options.titleoptions.args.thickness = nil
		options.titleoptions.args.margin = nil
		options.titleoptions.args.color = nil
		options.windowoptions = nil
	--	options.baroptions.args.barfont = nil
	--	options.titleoptions.args.font = nil
	end

	local barmod = Skada.displays["bar"]
	barmod.AddDisplayOptions_ = barmod.AddDisplayOptions
	barmod.AddDisplayOptions = function(self, win, options)
		self:AddDisplayOptions_(win, options)
		StripOptions(options)
	end

	for k, options in pairs(Skada.options.args.windows.args) do
		if(options.type == "group") then
			StripOptions(options.args)
		end
	end

	local titleBG = {
		bgFile = E["media"].normTex,
		tile = false,
		tileSize = 0
	}

	barmod.ApplySettings_ = barmod.ApplySettings
	barmod.ApplySettings = function(self, win)
		barmod.ApplySettings_(self, win)

		local skada = win.bargroup

		if(win.db.enabletitle) then
			skada.button:SetBackdrop(titleBG)
		end

		skada:SetTexture(AS.LSM:Fetch("statusbar",E.private.general.normTex))
		skada:SetSpacing(barSpacing)
		skada:SetFrameLevel(5)
		
		if not skada.TitleBackGround then
			skada.TitleBackGround = CreateFrame("Frame", nil, skada.button)
			skada.TitleBackGround:SetPoint("TOP")
			skada.TitleBackGround:SetPoint("LEFT")
			skada.TitleBackGround:SetPoint("RIGHT")
			skada.TitleBackGround:SetPoint("BOTTOM", 0, 1)
			skada.TitleBackGround:SetTemplate("Default")
			skada.TitleBackGround:SetFrameLevel(skada.button:GetFrameLevel() -1)
		end
		
		local titlefont = CreateFont("TitleFont" .. win.db.name)
		skada.button:SetNormalFontObject(titlefont)
		win.bargroup.button:SetBackdropColor(unpack(E["media"].backdropcolor))
		skada:SetBackdrop(nil)
		if not skada.backdrop then
			skada:CreateBackdrop("Default")
		end
		skada.backdrop:ClearAllPoints()
		if(win.db.enabletitle) then
			skada.backdrop:Point("TOPLEFT", skada.button, "TOPLEFT", -2, 2)
		else
			skada.backdrop:Point("TOPLEFT", skada, "TOPLEFT", -2, 2)
		end
		skada.backdrop:Point("BOTTOMRIGHT", skada, "BOTTOMRIGHT", 2, -2)
		if (not AS:CheckOption("SkadaBackdrop")) then skada.backdrop:Hide() end
		if (AS:CheckOption("EmbedSkada")) then
			win.bargroup.button:SetFrameStrata("HIGH")
			win.bargroup.button:SetFrameLevel(5)	
			win.bargroup:SetFrameStrata("HIGH")
			if (AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel) then win.bargroup:SetParent((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel)) end
		end
	end

	for _, window in ipairs( Skada:GetWindows() ) do
		tinsert(windows, window)
		window:UpdateDisplay()
	end

	Skada.CreateWindow_ = Skada.CreateWindow
	function Skada:CreateWindow(name, db)
		Skada:CreateWindow_(name, db)

		windows = {}
		for _, window in ipairs(Skada:GetWindows()) do
			tinsert(windows, window)
		end
		hooksecurefunc(Skada, "CreateWindow", function()	
			if AS:CheckOption("EmbedSkada") then
				AS:EmbedSkada()
			end
		end)
	end

	Skada.DeleteWindow_ = Skada.DeleteWindow
	function Skada:DeleteWindow( name )
		Skada:DeleteWindow_( name )
		windows = {}
		for _, window in ipairs( Skada:GetWindows() ) do
			tinsert( windows, window )
		end	
		if(AS:CheckOption("EmbedSkada")) then
			AS:EmbedSkada()
		end
	end

	if(AS:CheckOption("EmbedSkada")) then
		hooksecurefunc((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel), "SetSize", function(self, width, height) AS:EmbedSkada() end)
		AS:EmbedSkada()
	end
end

AS:RegisterSkin(name,SkinSkada)

local function EmbedWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
	local Skada = Skada
	local barmod = Skada.displays["bar"]

	window.db.barwidth = width
	window.db.background.height = height
	window.db.spark = false
	window.db.barslocked = true
	window.bargroup:ClearAllPoints()
	window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy)
	
	barmod.ApplySettings(barmod, window)
end

function AS:EmbedSkada()
	if(#windows == 1) then
		if E.PixelMode then
			EmbedWindow(windows[1], EmbeddingWindow:GetWidth() - 4, (EmbeddingWindow:GetHeight() - 18), "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, -17)
		else
			EmbedWindow(windows[1], EmbeddingWindow:GetWidth() - 4, (EmbeddingWindow:GetHeight() - 20), "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, -17)
		end
	elseif(#windows == 2) then
		local borderWidth = 1
		local borderWidth = 1
		if E.PixelMode then
			EmbedWindow(windows[1], ((EmbeddingWindow:GetWidth() - 4) / 2) - (borderWidth + E.mult), EmbeddingWindow:GetHeight() - 18, "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, -17)
			EmbedWindow(windows[2], ((EmbeddingWindow:GetWidth() - 4) / 2) - (borderWidth + E.mult), EmbeddingWindow:GetHeight() - 18, "TOPLEFT", EmbeddingWindow, "TOPLEFT", 2, -17)
		else
			EmbedWindow(windows[1], ((EmbeddingWindow:GetWidth() - 4) / 2) - (borderWidth + E.mult), EmbeddingWindow:GetHeight() - 20, "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, -17)
			EmbedWindow(windows[2], ((EmbeddingWindow:GetWidth() - 4) / 2) - (borderWidth + E.mult), EmbeddingWindow:GetHeight() - 20, "TOPLEFT", EmbeddingWindow, "TOPLEFT", 2, -17)
		end
	end
end
