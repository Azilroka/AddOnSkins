if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Skada") then return end
local U = unpack(select(2,...))
local s = U.s
local c = U.c

local Skada = Skada
local barSpacing = 1
local borderWidth = 1
local barmod = Skada.displays["bar"]
local name = "SkadaSkin"

local function SkinSkada(self)
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
		bgFile = c["media"].normTex,
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

		skada:SetTexture(c["media"].normTex)
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
		if IsAddOnLoaded("Tukui") then 
			local color = win.db.title.color
			skada.button:SetBackdropColor(0, 0, 0, 0)
		end
		if IsAddOnLoaded("ElvUI") then 
			win.bargroup.button:SetBackdropColor(unpack(c["media"].backdropcolor))
		end
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
		if (not U.CheckOption("SkadaBackdrop")) then skada.backdrop:Hide() end
		if (U.CheckOption("EmbedSkada")) then
			win.bargroup.button:SetFrameStrata("MEDIUM")
			win.bargroup.button:SetFrameLevel(5)	
			win.bargroup:SetFrameStrata("MEDIUM")
		end
	end
end

U.RegisterSkin(name,SkinSkada)

local function EmbedWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
	window.db.barwidth = width
	window.db.background.height = height
	window.db.spark = false
	window.db.barslocked = true
	window.bargroup:ClearAllPoints()
	window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy)
	
	barmod.ApplySettings(barmod, window)
end

local windows = {}
function EmbedSkada()
	if(#windows == 1) then
		EmbedWindow(windows[1], EmbeddingWindow:GetWidth() - 4, (EmbeddingWindow:GetHeight() - 24), "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, -18)
	elseif(#windows == 2) then
		if U.tuk then
			EmbedWindow(windows[1], ((EmbeddingWindow:GetWidth() - 4) / 2) - (borderWidth + s.mult), EmbeddingWindow:GetHeight() - 24, "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, -18)
			EmbedWindow(windows[2], ((EmbeddingWindow:GetWidth() - 4) / 2) - (borderWidth + s.mult), EmbeddingWindow:GetHeight() - 24, "TOPLEFT", EmbeddingWindow, "TOPLEFT", 2, -18)
		end
		if U.elv then
			EmbedWindow(windows[1], ((EmbeddingWindow:GetWidth() - 4) / 2) - (borderWidth + c.mult), EmbeddingWindow:GetHeight() - 24, "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, -18)
			EmbedWindow(windows[2], ((EmbeddingWindow:GetWidth() - 4) / 2) - (borderWidth + c.mult), EmbeddingWindow:GetHeight() - 24, "TOPLEFT", EmbeddingWindow, "TOPLEFT", 2, -18)
		end
	end
end

for _, window in ipairs( Skada:GetWindows() ) do
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
	if U.CheckOption("EmbedSkada") then
		EmbedSkada()
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
	if(U.CheckOption("EmbedSkada")) then
		EmbedSkada()
	end
end

	local Skada_Skin = CreateFrame("Frame",nil)
		Skada_Skin:RegisterEvent("PLAYER_ENTERING_WORLD")
		Skada_Skin:SetScript("OnEvent", function(self)
		self:UnregisterAllEvents()
		self = nil
	if U.CheckOption("EmbedSkada") then
		EmbedSkada()
	end
	end)

StaticPopupDialogs["SKADA_RELOADUI"] = {
	text = "Reload your User Interface?",
        button1 = TEXT(ACCEPT),
        button2 = TEXT(CANCEL),
        OnAccept = function()
            ReloadUI()
        end,
        OnCancel = function(data, reason)
            if (reason == "timeout") then
                ReloadUI()
            else
                StaticPopupDialogs["SKADA_RELOADUI"].reloadAccepted = false
            end
        end,
        OnHide = function()
            if (StaticPopupDialogs["SKADA_RELOADUI"].reloadAccepted) then
                ReloadUI();
            end
        end,
        OnShow = function()
            StaticPopupDialogs["SKADA_RELOADUI"].reloadAccepted = true;
        end,
        timeout = 5,
        hideOnEscape = 1,
        exclusive = 1,
        whileDead = 1
}

SLASH_SKADAEMBEDDED1, SLASH_SKADAEMBEDDED2 = '/es', '/embedskada';
function SlashCmdList.SKADAEMBEDDED(msg, editbox)
	if(not U.CheckOption("EmbedSkada")) then
		U.EnableOption("EmbedSkada")
		EmbedSkada()
	else
		U.DisableOption("EmbedSkada")
		StaticPopup_Show("SKADA_RELOADUI")
	end
	if(U.CheckOption("EmbedSkada")) then
	print("Skada Embedding to Embed Window is |cff00ff00Enabled|r.")
	end
	if(not U.CheckOption("EmbedSkada")) then
	print("Skada Embedding to Embed Window is |cffff2020Disabled|r.")
	print("Need to Reload UI to take effect /rl ")
	end
end

SLASH_SKADABACKDROP1 = '/skadabackdrop';
function SlashCmdList.SKADABACKDROP(msg, editbox)
	if(not U.CheckOption("SkadaBackdrop")) then
		U.EnableOption("SkadaBackdrop")
	else
		U.DisableOption("SkadaBackdrop")
	end
end