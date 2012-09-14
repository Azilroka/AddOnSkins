if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Recount") then return end
local U = unpack(select(2,...))
local Recount = _G.Recount
local s = U.s
local c = U.c

local name = "RecountSkin"
local function SkinRecount(self)
	
	local function SkinFrame(frame)
		frame.bgMain = CreateFrame("Frame", nil, frame)
		frame.bgMain:SetTemplate("Transparent")
		frame.bgMain:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT")
		frame.bgMain:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
		frame.bgMain:SetPoint("TOP", frame, "TOP", 0, -7)
		frame.bgMain:SetFrameLevel(frame:GetFrameLevel())
		frame.CloseButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -9)
		frame:SetBackdrop(nil)
		frame.TitleBackground = CreateFrame("Frame", nil, frame.bgMain)
		frame.TitleBackground:SetPoint("TOP", 0)
		frame.TitleBackground:SetPoint("LEFT", 0)
		frame.TitleBackground:SetPoint("RIGHT", 0)
		frame.TitleBackground:SetHeight(24)
		frame.TitleBackground:SetTemplate("Transparent")
		frame.Title:SetParent(frame.TitleBackground)
		frame.Title:ClearAllPoints()
		frame.Title:SetPoint("LEFT", 4, 0)
		if IsAddOnLoaded("Tukui") then
			frame.Title:SetFont(c["media"].font, c["datatext"].fontsize, "OUTLINE")
			frame.CloseButton:SetNormalTexture("")
			frame.CloseButton:SetPushedTexture("")
			frame.CloseButton:SetHighlightTexture("")
			frame.CloseButton:SetSize(16, 16)
			frame.CloseButton.t = frame.CloseButton:CreateFontString(nil, "OVERLAY")
			frame.CloseButton.t:SetFont(c["media"].pixelfont, c["datatext"].fontsize, "OUTLINE")
			frame.CloseButton.t:SetPoint("CENTER", 1, 1)
			frame.CloseButton.t:SetText("X")
		end
		if IsAddOnLoaded("ElvUI") then if not Recount_MainWindow then U.SkinCloseButton(frame.CloseButton) end end
	end

	local function SkinMainFrame(frame)
		frame.bgMain = CreateFrame("Frame", nil, frame)
		frame.bgMain:SetTemplate("Default")
		frame.bgMain:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT")
		frame.bgMain:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
		frame.bgMain:SetPoint("TOP", frame, "TOP", 0, -7)
		frame.bgMain:SetFrameLevel(frame:GetFrameLevel())
		if (not U.CheckOption("RecountBackdrop")) then frame.bgMain:Hide() end
		frame.CloseButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -9)
		frame:SetBackdrop(nil)
		frame.TitleBackground = CreateFrame("Frame", nil, frame)
		frame.TitleBackground:SetPoint("TOP", frame, "TOP", 0, -7)
		frame.TitleBackground:SetPoint("LEFT", 0)
		frame.TitleBackground:SetPoint("RIGHT", 0)
		frame.TitleBackground:SetHeight(24)
		frame.TitleBackground:SetTemplate("Transparent")
		frame.Title:SetParent(frame.TitleBackground)
		frame.Title:ClearAllPoints()
		frame.Title:SetPoint("LEFT", 4, 0)
		if IsAddOnLoaded("Tukui") then
			frame.Title:SetFont(c["media"].font, c["datatext"].fontsize, "OUTLINE")
			frame.CloseButton:SetNormalTexture("")
			frame.CloseButton:SetPushedTexture("")
			frame.CloseButton:SetHighlightTexture("")
			frame.CloseButton:SetSize(16, 16)
			frame.CloseButton.t = frame.CloseButton:CreateFontString(nil, "OVERLAY")
			frame.CloseButton.t:SetFont(c["media"].pixelfont, c["datatext"].fontsize, "OUTLINE")
			frame.CloseButton.t:SetPoint("CENTER", 1, 1)
			frame.CloseButton.t:SetText("X")
		end
		if IsAddOnLoaded("ElvUI") then if not Recount_MainWindow then U.SkinCloseButton(frame.CloseButton) end end
	end

	Recount.UpdateBarTextures = function(self)
		for k, v in pairs(Recount.MainWindow.Rows) do
			v.StatusBar:SetStatusBarTexture(c["media"].normTex)
			v.StatusBar:GetStatusBarTexture():SetHorizTile(false)
			v.StatusBar:GetStatusBarTexture():SetVertTile(false)
			if IsAddOnLoaded("Tukui") then
				v.LeftText:SetPoint("LEFT", 4, 0)
				v.RightText:SetPoint("RIGHT", -4, 0)
				v.LeftText:SetFont(c["media"].font, c["datatext"].fontsize)
				v.RightText:SetFont(c["media"].font, c["datatext"].fontsize)
			end
		end
	end
	Recount.SetBarTextures = Recount.UpdateBarTextures

	Recount.SetupBar_ = Recount.SetupBar
	Recount.SetupBar = function(self, bar)
		self:SetupBar_(bar)
		bar.StatusBar:SetStatusBarTexture(c["media"].normTex)
	end

	Recount.CreateFrame_ = Recount.CreateFrame
	Recount.CreateFrame = function(self, Name, Title, Height, Width, ShowFunc, HideFunc)
		local frame = self:CreateFrame_(Name, Title, Height, Width, ShowFunc, HideFunc)
		SkinFrame(frame)
		return frame
	end

		if Recount.MainWindow then SkinMainFrame(Recount.MainWindow) Recount.MainWindow:SetFrameStrata("MEDIUM") end
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

	U.SkinScrollBar(Recount_MainWindow_ScrollBarScrollBar)
	hooksecurefunc(Recount,"RefreshMainWindow",function(self,datarefresh)
	 	if not Recount.db.profile.MainWindow.ShowScrollbar then
			Recount_MainWindow_ScrollBarScrollBar:Hide()
		else
			Recount_MainWindow_ScrollBarScrollBar:Show()
		end
	end)

	Recount.MainWindow.FileButton:HookScript("OnClick", function(self) if LibDropdownFrame0 then LibDropdownFrame0:SetTemplate() end end)

	if IsAddOnLoaded("ElvUI") then
		local MWbuttons = {
			Recount.MainWindow.CloseButton,
			Recount.MainWindow.RightButton,
			Recount.MainWindow.LeftButton,
			Recount.MainWindow.ResetButton,
			Recount.MainWindow.FileButton,
			Recount.MainWindow.ConfigButton,
			Recount.MainWindow.ReportButton,
		}
		for i = 1, getn(MWbuttons) do
			local button = MWbuttons[i]
			if button then
				button:GetNormalTexture():SetDesaturated(true)
				button:GetHighlightTexture():SetDesaturated(true)
			end
		end
		U.Desaturate(Recount.DetailWindow.RightButton)
		U.Desaturate(Recount.DetailWindow.LeftButton)
		U.Desaturate(Recount.DetailWindow.ReportButton)
		U.Desaturate(Recount.DetailWindow.SummaryButton)
	end

	if IsAddOnLoaded("Tukui") then

	Recount.MainWindow.CloseButton:ClearAllPoints()
	Recount.MainWindow.CloseButton:Point("TOPRIGHT", Recount.MainWindow.TitleBackground, "TOPRIGHT", -3, -3)
	Recount.MainWindow.CloseButton:SetTemplate()

	Recount.MainWindow.RightButton:SetTemplate("Transparent")
	Recount.MainWindow.RightButton:SetNormalTexture("")
	Recount.MainWindow.RightButton:SetPushedTexture("")	
	Recount.MainWindow.RightButton:SetHighlightTexture("")
	Recount.MainWindow.RightButton:SetSize(16, 16)
	Recount.MainWindow.RightButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
	Recount.MainWindow.RightButton.text:SetText(s.RGBToHex(unpack(c["media"].datatextcolor2))..">")
	Recount.MainWindow.RightButton.text:SetPoint("CENTER", 1, 1 )
	Recount.MainWindow.RightButton:ClearAllPoints()
	Recount.MainWindow.RightButton:SetPoint("RIGHT", Recount.MainWindow.CloseButton, "LEFT", -2, 0 )

	Recount.MainWindow.LeftButton:SetTemplate("Transparent")
	Recount.MainWindow.LeftButton:SetNormalTexture("")
	Recount.MainWindow.LeftButton:SetPushedTexture("")	
	Recount.MainWindow.LeftButton:SetHighlightTexture("")
	Recount.MainWindow.LeftButton:SetSize( 16, 16 )
	Recount.MainWindow.LeftButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
	Recount.MainWindow.LeftButton.text:SetText(s.RGBToHex(unpack(c["media"].datatextcolor2)).."<")
	Recount.MainWindow.LeftButton.text:SetPoint("CENTER", 1, 1 )
	Recount.MainWindow.LeftButton:SetPoint("RIGHT", Recount.MainWindow.RightButton, "LEFT", -2, 0)

	Recount.MainWindow.ResetButton:SetTemplate("Transparent")
	Recount.MainWindow.ResetButton:SetNormalTexture("")
	Recount.MainWindow.ResetButton:SetPushedTexture("")	
	Recount.MainWindow.ResetButton:SetHighlightTexture("")
	Recount.MainWindow.ResetButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
	Recount.MainWindow.ResetButton.text:SetText(s.RGBToHex(unpack(c["media"].datatextcolor2)).."R")
	Recount.MainWindow.ResetButton.text:SetPoint("CENTER", 1, 1 )
	Recount.MainWindow.ResetButton:SetPoint("RIGHT", Recount.MainWindow.LeftButton, "LEFT", -2, 0)

	Recount.MainWindow.FileButton:SetTemplate("Transparent")
	Recount.MainWindow.FileButton:SetNormalTexture("")
	Recount.MainWindow.FileButton:SetPushedTexture("")	
	Recount.MainWindow.FileButton:SetHighlightTexture("")
	Recount.MainWindow.FileButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
	Recount.MainWindow.FileButton.text:SetText(s.RGBToHex(unpack(c["media"].datatextcolor2)).."F")
	Recount.MainWindow.FileButton.text:SetPoint("CENTER", 1, 1)
	Recount.MainWindow.FileButton:SetPoint("RIGHT", Recount.MainWindow.ResetButton, "LEFT", -2, 0)

	Recount.MainWindow.ConfigButton:SetTemplate("Transparent")
	Recount.MainWindow.ConfigButton:SetNormalTexture("")
	Recount.MainWindow.ConfigButton:SetPushedTexture("")	
	Recount.MainWindow.ConfigButton:SetHighlightTexture("")
	Recount.MainWindow.ConfigButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
	Recount.MainWindow.ConfigButton.text:SetText(s.RGBToHex(unpack(c["media"].datatextcolor2)).."C")
	Recount.MainWindow.ConfigButton.text:SetPoint("CENTER", 1, 1)
	Recount.MainWindow.ConfigButton:SetPoint("RIGHT", Recount.MainWindow.FileButton, "LEFT", -2, 0)

	Recount.MainWindow.ReportButton:SetTemplate("Transparent")
	Recount.MainWindow.ReportButton:SetNormalTexture("")
	Recount.MainWindow.ReportButton:SetPushedTexture("")	
	Recount.MainWindow.ReportButton:SetHighlightTexture("")
	Recount.MainWindow.ReportButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
	Recount.MainWindow.ReportButton.text:SetText(s.RGBToHex(unpack(c["media"].datatextcolor2)).."S")
	Recount.MainWindow.ReportButton.text:SetPoint("CENTER", 1, 1)
	Recount.MainWindow.ReportButton:SetPoint("RIGHT", Recount.MainWindow.ConfigButton, "LEFT", -2, 0)

	Recount.DetailWindow.ReportButton:SetTemplate("Transparent")
	Recount.DetailWindow.ReportButton:SetNormalTexture("")
	Recount.DetailWindow.ReportButton:SetPushedTexture("")	
	Recount.DetailWindow.ReportButton:SetHighlightTexture("")
	Recount.DetailWindow.ReportButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
	Recount.DetailWindow.ReportButton.text:SetText(s.RGBToHex(unpack(c["media"].datatextcolor2)).."S")
	Recount.DetailWindow.ReportButton.text:SetPoint("CENTER", 1, 1)

	end

	if U.CheckOption("EmbedRecount") then EmbedRecount() end
end

U.RegisterSkin(name,SkinRecount)

StaticPopupDialogs["RECOUNT_RELOADUI"] = {
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
                StaticPopupDialogs["RECOUNT_RELOADUI"].reloadAccepted = false
            end
        end,
        OnHide = function()
            if (StaticPopupDialogs["RECOUNT_RELOADUI"].reloadAccepted) then
                ReloadUI();
            end
        end,
        OnShow = function()
            StaticPopupDialogs["RECOUNT_RELOADUI"].reloadAccepted = true;
        end,
        timeout = 5,
        hideOnEscape = 1,
        exclusive = 1,
        whileDead = 1
}

function EmbedRecount()
	U.EnableOption("EmbedRecount")
	if (U.CheckOption("EmbedOoC")) then
		if (U.CheckOption("EmbedRecount")) then
			Recount_MainWindow:Hide()
		end
	end
	Recount:LockWindows(true)
	Recount_MainWindow:ClearAllPoints()
	Recount_MainWindow:SetPoint("TOPLEFT", EmbeddingWindow,"TOPLEFT", 0, 6)
	Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindow,"BOTTOMRIGHT", 0, 5)
	Recount_MainWindow:SetFrameStrata("MEDIUM")
end

SLASH_RECOUNTEMBEDDED1, SLASH_RECOUNTEMBEDDED2 = '/er', '/embedrecount';
function SlashCmdList.RECOUNTEMBEDDED(msg, editbox)
	if (not U.CheckOption("EmbedRecount")) then
		U.EnableOption("EmbedRecount")
		EmbedRecount()
	else
		U.DisableOption("EmbedRecount")
		Recount:LockWindows(false)
	end
	if(U.CheckOption("EmbedRecount")) then
	print("Recount Embedding is |cff00ff00Enabled|r.");
	end
	if(not U.CheckOption("EmbedRecount")) then
	print("Recount Embedding is |cffff2020Disabled|r.");
	end
end
SLASH_RECOUNTBACKDROP1 = '/recountbackdrop';
function SlashCmdList.RECOUNTBACKDROP(msg, editbox)
	if(not U.CheckOption("EmbedRecount")) then
		print("You must have the Recount Skin enabled to use this feature.")
		return
	end
	if(not U.CheckOption("RecountBackdrop")) then
		U.EnableOption("RecountBackdrop")
		print("Recount Backdrop |cff00ff00Enabled|r")
	else
		U.DisableOption("RecountBackdrop")
		print("Recount Backdrop |cffff2020Disabled|r")
	end
	print("You must reload your interface for this change.")
	StaticPopup_Show("RECOUNT_RELOADUI")
end
