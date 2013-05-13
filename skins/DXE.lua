local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

LoadAddOn("DXE")
local name = "DXESkin"
function AS:SkinDXE()

	local function SkinDXEBar(bar)
		bar:SetTemplate("Transparent")
		bar.bg:SetTexture(nil)
		bar.border.Show = function() end
		bar.border:Hide()
		bar.statusbar:SetStatusBarTexture(E["media"].normTex)
		bar.statusbar:ClearAllPoints()
		bar.statusbar:SetInside()
		
		bar.righticon:SetTemplate("Default")
		bar.righticon.border.Show = function() end
		bar.righticon.border:Hide()
		bar.righticon:ClearAllPoints()
		bar.righticon:SetPoint("LEFT", bar, "RIGHT", 2, 0)
		bar.righticon.t:SetTexCoord(.09,.91,.09,.91)
		bar.righticon.t:ClearAllPoints()
		bar.righticon.t:SetInside()
		bar.righticon.t:SetDrawLayer("ARTWORK")
		
		bar.lefticon:SetTemplate("Default")
		bar.lefticon.border.Show = function() end
		bar.lefticon.border:Hide()
		bar.lefticon:ClearAllPoints()
		bar.lefticon:SetPoint("RIGHT", bar, "LEFT", -2, 0)
		bar.lefticon.t:SetTexCoord(.09,.91,.09,.91)
		bar.lefticon.t:ClearAllPoints()
		bar.lefticon.t:SetInside()
		bar.lefticon.t:SetDrawLayer("ARTWORK")
	end

	DXE.LayoutHealthWatchers_ = DXE.LayoutHealthWatchers
	DXE.LayoutHealthWatchers = function(self)
		DXE:LayoutHealthWatchers_()
		for i, hw in ipairs(self.HW) do
			if hw:IsShown() then
				hw:SetTemplate("Transparent")
				hw.border.Show = function() end
				hw.border:Hide()
				hw.healthbar:SetStatusBarTexture(E["media"].normTex)
			end
		end
	end

	local function RefreshDXEBars(self)
		if self.refreshing then return end
		self.refreshing = true
		local i = 1
		while _G["DXEAlertBar"..i] do
			local bar = _G["DXEAlertBar"..i]
			if not bar.skinned then
				bar:SetScale(1)
				bar.SetScale = function() return end
				SkinDXEBar(bar)
				bar.skinned = true
			end
			i = i + 1
		end
		self.refreshing = false
	end

	local DXEAlerts = DXE:GetModule("Alerts")
	
	local frame = CreateFrame("Frame")
	frame.elapsed = 1
	frame:SetScript("OnUpdate", function(self,elapsed)
		self.elapsed = self.elapsed + elapsed
		if(self.elapsed >= 1) then
			RefreshDXEBars(DXEAlerts)
			self.elapsed = 0
		end
	end)

	hooksecurefunc(DXEAlerts, "Simple", RefreshDXEBars)
	hooksecurefunc(DXEAlerts, "RefreshBars", RefreshDXEBars)

	DXE:LayoutHealthWatchers()
	DXE.Alerts:RefreshBars()

	if not DXEDB then DXEDB = {} end
	if not DXEDB["profiles"] then DXEDB["profiles"] = {} end
	if not DXEDB["profiles"][E.myname.." - "..E.myrealm] then DXEDB["profiles"][E.myname.." - "..E.myrealm] = {} end
	if not DXEDB["profiles"][E.myname.." - "..E.myrealm]["Globals"] then DXEDB["profiles"][E.myname.." - "..E.myrealm]["Globals"] = {} end
	DXEDB["profiles"][E.myname.." - "..E.myrealm]["Globals"]["BackgroundTexture"] = E["media"].blank
	DXEDB["profiles"][E.myname.." - "..E.myrealm]["Globals"]["BarTexture"] = E["media"].normTex
	DXEDB["profiles"][E.myname.." - "..E.myrealm]["Globals"]["Border"] = "None"
	DXEDB["profiles"][E.myname.." - "..E.myrealm]["Globals"]["Font"] = AS.font
	DXEDB["profiles"][E.myname.." - "..E.myrealm]["Globals"]["TimerFont"] = AS.font
end

AS:RegisterSkin(name, AS.SkinDXE)