local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local EmbeddingWindow = CreateFrame("Frame", "EmbeddingWindow", UIParent)
EmbeddingWindow:SetTemplate("Transparent")
EmbeddingWindow:SetFrameStrata("HIGH")
EmbeddingWindow:Hide()

function AS:EmbedWindowResize()
	if not E.db.datatexts.rightChatPanel then
		RDTS = 22
	else
		RDTS = 0
	end

	if not self.sle then
		if E.PixelMode then
			EmbeddingWindow:SetPoint("TOP", RightChatPanel, "TOP", 0, -3) EmbeddingWindow:Size((RightChatPanel:GetWidth() - 6),(RightChatPanel:GetHeight() - (28 - RDTS)))
		else
			EmbeddingWindow:SetPoint("TOP", RightChatPanel, "TOP", 0, -5) EmbeddingWindow:Size((RightChatPanel:GetWidth() - 10),(RightChatPanel:GetHeight() - (32 - RDTS)))
		end
	else
		EmbeddingWindow:SetPoint("TOP", RightChatPanel, "TOP", 0, 0) EmbeddingWindow:Size((RightChatPanel:GetWidth() - 1),RightChatPanel:GetHeight() - 1)
	end
	
	if (self.CheckOption("EmbedRO","Recount","Omen")) then self:EmbedRecountOmenResize() end
	if (self.CheckOption("EmbedTDPS","TinyDPS")) then self:EmbedTDPSResize() end
	if (self.CheckOption("EmbedRecount","Recount")) then self:EmbedRecountResize() end
end

function AS:EmbedRecountOmen()
	if not (self:CheckOption("EmbedRO","Recount","Omen")) then self:DisableOption("EmbedRO") return end
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
	if RightChatPanel then
		OmenBarList:SetParent(RightChatPanel)
		Recount_MainWindow:SetParent(RightChatPanel)
	end
	
	Recount_MainWindow:SetFrameStrata("HIGH")
	OmenBarList:SetFrameStrata("HIGH")
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

function AS:EmbedInit()
	self:EmbedWindowResize()
	hooksecurefunc(RightChatPanel, "SetSize", function(self, width, height) AS:EmbedWindowResize() end)

	RightChatToggleButton:SetScript("OnClick", function(self, btn)
			if btn == 'RightButton' then
			if (AS:CheckOption("EmbedRecount","Recount")) or (AS:CheckOption("EmbedRO")) then
				ToggleFrame(Recount_MainWindow)
			end
			if (AS:CheckOption("EmbedSkada","Skada")) then
				Skada:ToggleWindow()
			end
			if (AS:CheckOption("EmbedOmen","Omen")) or (AS:CheckOption("EmbedRO")) then
				if OmenBarList:IsShown() then
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

	RightChatToggleButton:SetScript("OnEnter", function(self, ...)
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
	
--Embed Check
	if not IsAddOnLoaded("Omen") then self:DisableOption("EmbedRO") self:DisableOption("EmbedOmen") end
	if not IsAddOnLoaded("Recount") then self:DisableOption("EmbedRO") end
	if self:CheckOption("EmbedRO") then self:EmbedRecountOmen() end
	if self:CheckOption("EmbedOmen") then self:EmbedOmen() end
--Embed Check Finished
end

function AS:EmbedEnterCombat()
	--	print("Entering Combat")
	if (self:CheckOption("EmbedOoC")) then
		ChatFrame3Tab:Hide()
		if (self:CheckOption("EmbedRecount","Recount"))  then
			Recount_MainWindow:Show()
		end
		if (self:CheckOption("EmbedSkada","Skada"))  then
			if Skada.db.profile.hidesolo then return end
			if Skada.db.profile.hidecombat then return end
			for _, window in ipairs(Skada:GetWindows()) do
				window:Show()
			end
		end
		if (self:CheckOption("EmbedRO","Recount","Omen")) then
			Recount_MainWindow:Show()
			OmenBarList:Show()
		end
		if (self:CheckOption("EmbedOmen","Omen"))  then
			OmenBarList:Show()
		end
		if (self:CheckOption("EmbedTDPS","TinyDPS")) then
			tdpsFrame:Show()
		end
	end
end

function AS:EmbedExitCombat()
	--	print("Exiting Combat")
	if (self:CheckOption("EmbedOoC")) then
		ChatFrame3Tab:Show()
		if (self:CheckOption("EmbedRecount","Recount")) then
			Recount_MainWindow:Hide()
		end
		if (self:CheckOption("EmbedSkada","Skada")) then
			for _, window in ipairs(Skada:GetWindows()) do
				window:Hide()
			end
		end
		if (self:CheckOption("EmbedRO","Recount","Omen")) then
			Recount_MainWindow:Hide()
			OmenBarList:Hide()
		end
		if (self:CheckOption("EmbedOmen","Omen"))  then
			OmenBarList:Hide()
		end
		if (self:CheckOption("EmbedTDPS","TinyDPS")) then
			tdpsFrame:Hide()
		end
	end
end
