if not IsAddOnLoaded("Tukui") then return end
if not IsAddOnLoaded("DXE") then return end
local skin = CreateFrame("Frame")
skin:RegisterEvent("ADDON_LOADED")
skin:SetScript("OnEvent", function(self, event, addon)
	if addon ~= "DXE" then return end
	if (UISkinOptions.DXESkin == "Disabled") then return end
	local s = U.s
	local c = U.c
	local DXE = DXE
	local _G = getfenv(0)
	local barSpacing = s.Scale(2, 2)
	local borderWidth = s.Scale(2, 2)
	local buttonZoom = {.09,.91,.09,.91}

	local function SkinDXEBar(bar)
		-- The main bar
		bar:SetTemplate("Transparent")
		bar.bg:SetTexture(nil)
		bar.border:Kill()
		bar.statusbar:SetStatusBarTexture(c["media"].normTex)
		bar.statusbar:ClearAllPoints()
		bar.statusbar:SetPoint("TOPLEFT",borderWidth, -borderWidth)
		bar.statusbar:SetPoint("BOTTOMRIGHT",-borderWidth, borderWidth)
		
		-- Right Icon
		bar.righticon:SetTemplate("Default")
		bar.righticon.border:Kill()
		bar.righticon:ClearAllPoints()
		bar.righticon:SetPoint("LEFT", bar, "RIGHT", 2, 0)
		bar.righticon.t:SetTexCoord(unpack(buttonZoom))
		bar.righticon.t:ClearAllPoints()
		bar.righticon.t:SetPoint("TOPLEFT", borderWidth, -borderWidth)
		bar.righticon.t:SetPoint("BOTTOMRIGHT", -borderWidth, borderWidth)
		bar.righticon.t:SetDrawLayer("ARTWORK")
		
		-- Left Icon
		bar.lefticon:SetTemplate("Default")
		bar.lefticon.border:Kill()
		bar.lefticon:ClearAllPoints()
		bar.lefticon:SetPoint("RIGHT", bar, "LEFT", -2, 0)
		bar.lefticon.t:SetTexCoord(unpack(buttonZoom))
		bar.lefticon.t:ClearAllPoints()
		bar.lefticon.t:SetPoint("TOPLEFT",borderWidth, -borderWidth)
		bar.lefticon.t:SetPoint("BOTTOMRIGHT",-borderWidth, borderWidth)
		bar.lefticon.t:SetDrawLayer("ARTWORK")
	end

	-- Hook Health frames (Skin & spacing)
	DXE.LayoutHealthWatchers_ = DXE.LayoutHealthWatchers
	DXE.LayoutHealthWatchers = function(self)
		for i,hw in ipairs(self.HW) do
			if hw:IsShown() then
				hw:SetTemplate("Transparent")
				hw.border:Kill()
				hw.healthbar:SetStatusBarTexture(c["media"].normTex)
			end
		end
	end

	DXE.Alerts.RefreshBars_ = DXE.Alerts.RefreshBars
	DXE.Alerts.RefreshBars = function(self)
		if self.refreshing then return end
		self.refreshing = true
		self:RefreshBars_()
		local i = 1
		while _G["DXEAlertBar"..i] do
			local bar = _G["DXEAlertBar"..i]
			bar:SetScale(1)
			bar.SetScale = s.dummy
			SkinDXEBar(bar)
			i = i + 1
		end
		self.refreshing = false
	end

	DXE.Alerts.Simple_ = DXE.Alerts.Simple
	DXE.Alerts.Simple = function(self,...)
		self:Simple_(...)
		self:RefreshBars()
	end

	-- Force some updates
	DXE:LayoutHealthWatchers()
	DXE.Alerts:RefreshBars()

	--Force some default profile options
	if not DXEDB then DXEDB = {} end
	if not DXEDB["profiles"] then DXEDB["profiles"] = {} end
	if not DXEDB["profiles"][s.myname.." - "..GetRealmName()] then DXEDB["profiles"][s.myname.." - "..s.myrealm] = {} end
	if not DXEDB["profiles"][s.myname.." - "..GetRealmName()]["Globals"] then DXEDB["profiles"][s.myname.." - "..s.myrealm]["Globals"] = {} end
	DXEDB["profiles"][s.myname.." - "..s.myrealm]["Globals"]["BackgroundTexture"] = c.media.blank
	DXEDB["profiles"][s.myname.." - "..s.myrealm]["Globals"]["BarTexture"] = c.media.normTex
	DXEDB["profiles"][s.myname.." - "..s.myrealm]["Globals"]["Border"] = "None"
	DXEDB["profiles"][s.myname.." - "..s.myrealm]["Globals"]["Font"] = c.media.font
	DXEDB["profiles"][s.myname.." - "..s.myrealm]["Globals"]["TimerFont"] = c.media.font
end)