local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local EmbeddingWindow = CreateFrame("Frame", "EmbeddingWindow", UIParent)
EmbeddingWindow:SetTemplate("Transparent")
EmbeddingWindow:SetFrameStrata("HIGH")
EmbeddingWindow:Hide()

function AS:EmbedWindowResize()
	local RDTS
	if (AS:CheckOption("EmbedRight") and not E.db.datatexts.rightChatPanel) or (not AS:CheckOption("EmbedRight") and not E.db.datatexts.leftChatPanel) then
		RDTS = 22
	else
		RDTS = 0
	end

	if not self.sle then
		if E.PixelMode then
			EmbeddingWindow:SetPoint("TOP", (AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel), "TOP", 0, -3) EmbeddingWindow:Size(((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel):GetWidth() - 6),((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel):GetHeight() - (28 - RDTS)))
		else
			EmbeddingWindow:SetPoint("TOP", (AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel), "TOP", 0, -5) EmbeddingWindow:Size(((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel):GetWidth() - 10),((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel):GetHeight() - (32 - RDTS)))
		end
	else
		EmbeddingWindow:SetPoint("TOP", (AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel), "TOP", 0, 0) EmbeddingWindow:Size(((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel):GetWidth() - 1),(AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel):GetHeight() - 1)
	end
	
	local OrigHeight, OrigWidth
	if OrigHeight == nil then OrigHeight = EmbeddingWindow:GetHeight() end
	if OrigWidth == nil then OrigWidth = EmbeddingWindow:GetWidth() end
	if EmbeddingWindow:GetHeight() == OrigHeight and EmbeddingWindow:GetWidth() == OrigWidth then return end
	OrigHeight = EmbeddingWindow:GetHeight()
	OrigWidth = EmbeddingWindow:GetWidth()
	
	if (self:CheckOption("EmbedRO","Recount","Omen")) then self:EmbedRecountOmenResize() end
	if (self:CheckOption("EmbedTDPS","TinyDPS")) then self:EmbedTDPSResize() end
	if (self:CheckOption("EmbedRecount","Recount")) then self:EmbedRecountResize() end
	if (self:CheckOption("EmbedOmen","Omen")) then self:EmbedOmenResize() end
	if (self:CheckOption("EmbedSkada","Skada")) then self:EmbedSkada() end
end

function AS:EmbedRecount()
	local Recount = _G.Recount

	if (self:CheckOption("EmbedOoC")) then
		if (self:CheckOption("EmbedRecount")) then
			Recount_MainWindow:Hide()
		end
	end
	Recount:LockWindows(true)
	Recount_MainWindow:ClearAllPoints()
	self:EmbedRecountResize()
	if (self:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel) then Recount_MainWindow:SetParent((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel)) end
	Recount.MainWindow:SetFrameStrata("LOW")
end

function AS:EmbedRecountResize()
	Recount_MainWindow:SetPoint("TOPLEFT", EmbeddingWindow,"TOPLEFT", 0, 7)
	Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindow,"BOTTOMRIGHT", 0, 2)
end

function AS:EmbedOmen()
	if (AS:CheckOption("EmbedOoC")) then
		if (AS:CheckOption("EmbedOmen")) then
			OmenBarList:Hide()
		end
	end
	Omen.db.profile.Locked = true
	Omen:UpdateGrips()
	Omen.UpdateGrips = function(...)
		local db = Omen.db.profile
		Omen.VGrip1:ClearAllPoints()
		Omen.VGrip1:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip1, 0)
		Omen.VGrip1:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip1, 0)
		Omen.VGrip2:ClearAllPoints()
		Omen.VGrip2:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip2, 0)
		Omen.VGrip2:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip2, 0)
		Omen.Grip:Hide()
		if db.Locked then
			Omen.VGrip1:Hide()
			Omen.VGrip2:Hide()
		else
			Omen.VGrip1:Show()
			if db.Bar.ShowTPS then
				Omen.VGrip2:Show()
			else
				Omen.VGrip2:Hide()
			end
		end
	end
	OmenTitle:Kill()
	OmenBarList:StripTextures()
	OmenBarList:SetTemplate("Transparent")
	self:EmbedOmenResize()
	if RightChatPanel then OmenBarList:SetParent(RightChatPanel) end
	OmenBarList:SetFrameStrata("LOW")
end

function AS:EmbedOmenResize()
	OmenBarList:ClearAllPoints()
	OmenBarList:SetPoint("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 0)
	OmenBarList:SetPoint("BOTTOMRIGHT", EmbeddingWindow, "BOTTOMRIGHT", 0, 2)
end

function AS:EmbedRecountOmen()
	if (self:CheckOption("EmbedOoC")) then
		if (self:CheckOption("EmbedRO")) then
			Recount_MainWindow:Hide()
			OmenBarList:Hide()
		end
	end

	OmenTitle:Kill()
	Omen.db.profile.Locked = true
	Omen:UpdateGrips()
	Omen.UpdateGrips = function(...)
		local db = Omen.db.profile
		Omen.VGrip1:ClearAllPoints()
		Omen.VGrip1:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip1, 0)
		Omen.VGrip1:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip1, 0)
		Omen.VGrip2:ClearAllPoints()
		Omen.VGrip2:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip2, 0)
		Omen.VGrip2:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip2, 0)
		Omen.Grip:Hide()
		if db.Locked then
			Omen.VGrip1:Hide()
			Omen.VGrip2:Hide()
		else
			Omen.VGrip1:Show()
			if db.Bar.ShowTPS then
				Omen.VGrip2:Show()
			else
				Omen.VGrip2:Hide()
			end
		end
	end

	OmenBarList:StripTextures()
	OmenBarList:SetTemplate("Default")
	OmenAnchor:ClearAllPoints()
	Recount:LockWindows(true)
	Recount_MainWindow:ClearAllPoints()
	if (AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel) then
		OmenBarList:SetParent((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel))
		Recount_MainWindow:SetParent((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel))
	end
	
	Recount_MainWindow:SetFrameStrata("LOW")
	OmenBarList:SetFrameStrata("LOW")
	self:EmbedRecountOmenResize()
end

function AS:EmbedRecountOmenResize()
	if E.PixelMode then
		OmenAnchor:SetWidth((EmbeddingWindow:GetWidth() / 3))
		OmenAnchor:SetHeight((EmbeddingWindow:GetHeight() + 21))
		OmenAnchor:SetPoint("BOTTOMLEFT", EmbeddingWindow, "BOTTOMLEFT", 0, 0)
		Recount_MainWindow:SetWidth((EmbeddingWindow:GetWidth() / 3) + (EmbeddingWindow:GetWidth() / 3))
		Recount_MainWindow:SetHeight((EmbeddingWindow:GetHeight()+7))
		Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindow,"BOTTOMRIGHT", 0, 0)
	else
		OmenAnchor:SetWidth((EmbeddingWindow:GetWidth() / 3) - 1)
		OmenAnchor:SetHeight((EmbeddingWindow:GetHeight() + 21))
		OmenAnchor:SetPoint("BOTTOMLEFT", EmbeddingWindow, "BOTTOMLEFT", 0, 1)
		Recount_MainWindow:SetWidth((EmbeddingWindow:GetWidth() / 3) + (EmbeddingWindow:GetWidth() / 3))
		Recount_MainWindow:SetHeight((EmbeddingWindow:GetHeight()+7))
		Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindow,"BOTTOMRIGHT", 0, 1)
	end
end
	
local function EmbedWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
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
	if self.embeddingskada then return end
	self.embeddingskada = true
	windows = {}
	for _, window in ipairs(Skada:GetWindows()) do
		tinsert(windows, window)
	end
	local borderWidth = 1
	local height = AS:CheckOption("SkadaBelowTop") and 43 or E.PixelMode and 20 or 18
	local notitleheight = height - 15
	local yoffset = AS:CheckOption("SkadaBelowTop") and -40 or -17
	local notitleoffset = yoffset + 15

	if(#windows == 1) then
		EmbedWindow(windows[1], EmbeddingWindow:GetWidth() - 4, (EmbeddingWindow:GetHeight() - height), "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, yoffset)
	elseif(#windows >= 2) then
		local w2height = windows[2].db.enabletitle and height or notitleheight
		local w2yoffset = windows[2].db.enabletitle and yoffset or notitleoffset
		if AS:CheckOption("SkadaTwoThirds") then
			EmbedWindow(windows[1], (((EmbeddingWindow:GetWidth() - 4) / 3) * 2) - (borderWidth*1.5 + E.mult), EmbeddingWindow:GetHeight() - height, "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, yoffset)
			EmbedWindow(windows[2], ((EmbeddingWindow:GetWidth() - 4) / 3) - (borderWidth*1.5 + E.mult), EmbeddingWindow:GetHeight() - w2height, "TOPLEFT", EmbeddingWindow, "TOPLEFT", 2, w2yoffset)
		else
			EmbedWindow(windows[1], ((EmbeddingWindow:GetWidth() - 4) / 2) - (borderWidth + E.mult), EmbeddingWindow:GetHeight() - height, "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, yoffset)
			EmbedWindow(windows[2], ((EmbeddingWindow:GetWidth() - 4) / 2) - (borderWidth + E.mult), EmbeddingWindow:GetHeight() - w2height, "TOPLEFT", EmbeddingWindow, "TOPLEFT", 2, w2yoffset)
		end
	end
	self.embeddingskada = false
end

function AS:EmbedTDPS()
	tdpsFrame:SetParent((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel))
	tdpsFrame:SetFrameStrata("LOW")
	tdpsFrame.spacing = 0
	tdpsFrame.barHeight = 14
	tdpsVisibleBars = 9
	AS:EmbedTDPSResize()
	tdpsAnchor:Point("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 0)

	tdpsRefresh()
	if (AS:CheckOption("EmbedOoC")) then
		if (AS:CheckOption("EmbedTDPS")) then
			tdpsFrame:Hide()
		end
	end
end

function AS:EmbedTDPSResize()
	tdpsFrame:SetWidth(EmbeddingWindow:GetWidth())
	tdpsRefresh()
end

function AS:EmbedInit()
	self:EmbedWindowResize()
	hooksecurefunc((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel), "SetSize", function(self, width, height) AS:EmbedWindowResize() end)

	local button = AS:CheckOption("EmbedRight") and RightChatToggleButton or LeftChatToggleButton
	button:SetScript("OnClick", function(self, btn)
		if btn == 'RightButton' then
			if (AS:CheckOption("EmbedRecount","Recount")) or (AS:CheckOption("EmbedRO","Recount","Omen")) then
				if Recount_MainWindow:IsShown() then
					Recount_MainWindow:Hide()
				else
					Recount_MainWindow:Show()
				end
			end
			if (AS:CheckOption("EmbedSkada","Skada")) then
				for _, window in ipairs(Skada:GetWindows()) do
					if window:IsShown() then
						window:Hide()
					else
						window:Show()
					end
				end
			end
			if (AS:CheckOption("EmbedOmen","Omen")) or (AS:CheckOption("EmbedRO","Recount","Omen")) then
				if OmenBarList:IsVisible() then
					OmenBarList:Hide()
				else
					OmenBarList:Show()
				end
			end
			if (AS:CheckOption("EmbedTDPS","TinyDPS")) then
				if tdpsFrame:IsShown() then
					tdpsFrame:Hide()
				else
					tdpsFrame:Show()
				end
			end
		else
			if E.db[self.parent:GetName()..'Faded'] then
				E.db[self.parent:GetName()..'Faded'] = nil
				UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
				UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
			else
				E.db[self.parent:GetName()..'Faded'] = true
				UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
				UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
				self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
			end
		end
	end)

	button:SetScript("OnEnter", function(self, ...)
		if E.db[self.parent:GetName()..'Faded'] then
			self.parent:Show()
			UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
			UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
		end
		GameTooltip:SetOwner(self, 'ANCHOR_TOPRIGHT', 0, 4)
		GameTooltip:ClearLines()
		GameTooltip:AddDoubleLine(L['Left Click:'], L['Toggle Chat Frame'], 1, 1, 1)
		GameTooltip:AddDoubleLine(L['Right Click:'], L['Toggle Embedded Addon'], 1, 1, 1)
		GameTooltip:Show()
	end)

	if (self:CheckOption("EmbedRO","Recount","Omen")) then self:EmbedRecountOmen() end
	if (self:CheckOption("EmbedOmen","Omen")) then self:EmbedOmen() end
	if (self:CheckOption("EmbedSkada","Skada")) then
		self:EmbedSkada()
		hooksecurefunc(Skada, "CreateWindow", self.EmbedSkada)
		hooksecurefunc(Skada, "DeleteWindow", self.EmbedSkada)
	end
	if (self:CheckOption("EmbedTDPS","TinyDPS")) then self:EmbedTDPS() end
	if (self:CheckOption("EmbedRecount","Recount")) then self:EmbedRecount() end
end

function AS:EmbedEnterCombat()
	if (self:CheckOption("EmbedOoC")) then
		if (self:CheckOption("EmbedRecount","Recount")) or (self:CheckOption("EmbedRO","Recount","Omen")) then
			Recount_MainWindow:Show()
		end
		if (self:CheckOption("EmbedSkada","Skada"))  then
			if Skada.db.profile.hidesolo then return end
			if Skada.db.profile.hidecombat then return end
			for _, window in ipairs(Skada:GetWindows()) do
				window:Show()
			end
		end
		if (self:CheckOption("EmbedOmen","Omen")) or (self:CheckOption("EmbedRO","Recount","Omen")) then
			OmenBarList:Show()
		end
		if (self:CheckOption("EmbedTDPS","TinyDPS")) then
			tdpsFrame:Show()
		end
	end
end

function AS:EmbedExitCombat()
	if (self:CheckOption("EmbedOoC")) then
		if (self:CheckOption("EmbedRecount","Recount")) or (self:CheckOption("EmbedRO","Recount","Omen")) then
			Recount_MainWindow:Hide()
		end
		if (self:CheckOption("EmbedSkada","Skada")) then
			for _, window in ipairs(Skada:GetWindows()) do
				window:Hide()
			end
		end
		if (self:CheckOption("EmbedOmen","Omen")) or (self:CheckOption("EmbedRO","Recount","Omen")) then
			OmenBarList:Hide()
		end
		if (self:CheckOption("EmbedTDPS","TinyDPS")) then
			tdpsFrame:Hide()
		end
	end
end
