local E, L, V, P, G, _ = unpack(ElvUI)
local AS, DT = E:GetModule('AddOnSkins'), E:GetModule('DataTexts')

local function OnClick(self, button)
	if button == 'LeftButton' then
		AS:EmbedEnterCombat(true)
	elseif button == 'RightButton' then
		AS:EmbedExitCombat(true)
	end
end

local function OnEnter(self)
	DT:SetupTooltip(self)
	DT.tooltip:AddLine('Left Click to Show')
	DT.tooltip:AddLine('Right Click to Hide')
	DT.tooltip:Show()
end

local function OnEvent(self, event)
	local Text = ''
	if AS:CheckOption("EmbedRecount", "Recount") then Text = 'Recount' end
	if AS:CheckOption("EmbedRO", "Recount", "Omen") then Text = 'Recount/Omen' end
	if AS:CheckOption("EmbedSkada", "Skada") then Text = 'Skada' end
	if AS:CheckOption("EmbedOmen", "Omen") then Text = 'Omen' end
	if AS:CheckOption("EmbedTDPS", "TinyDPS") then Text = 'TinyDPS' end
	self.text:SetText(format('%s %s', 'Toggle', Text))
end

DT:RegisterDatatext('AddOnSkins', { "PLAYER_ENTERING_WORLD" }, OnEvent, nil, OnClick, OnEnter)

local EmbeddingWindow = CreateFrame("Frame", "EmbeddingWindow", UIParent)
--EmbeddingWindow:SetTemplate("ClassColor")
--EmbeddingWindow:Hide()
EmbeddingWindow:SetFrameStrata("HIGH")
local OrigHeight, OrigWidth

function AS:EmbedWindowResize()
	local RDTS
	if (AS:CheckOption("EmbedRight") and not E.db.datatexts.rightChatPanel) or (not AS:CheckOption("EmbedRight") and not E.db.datatexts.leftChatPanel) then
		RDTS = 22
	else
		RDTS = 0
	end

	local Panel = AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel

	if not AS.SLE then
		local Offset = E.PixelMode and -3 or -5
		local Height = E.PixelMode and 28 or 32
		local Width = E.PixelMode and 6 or 10
		EmbeddingWindow:SetPoint("TOP", Panel, "TOP", 0, Offset)
		EmbeddingWindow:Width(Panel:GetWidth() - Width)
		EmbeddingWindow:Height(Panel:GetHeight() - (Height - RDTS))
	else
		EmbeddingWindow:SetPoint("TOP", Panel, "TOP", 0, 0)
		EmbeddingWindow:Width(Panel:GetWidth() - 1)
		EmbeddingWindow:Height(Panel:GetHeight() - 1)
	end

	AS:EmbedCheck()
end

function AS:EmbedCheck()
	if AS:CheckOption("EmbedRO", "Recount", "Omen") then AS:EmbedRecountOmenResize() end
	if AS:CheckOption("EmbedTDPS", "TinyDPS") then AS:EmbedTDPSResize() end
	if AS:CheckOption("EmbedRecount", "Recount") then AS:EmbedRecountResize() end
	if AS:CheckOption("EmbedOmen", "Omen") then AS:EmbedOmenResize() end

	if OrigHeight == nil then OrigHeight = EmbeddingWindow:GetHeight() end
	if OrigWidth == nil then OrigWidth = EmbeddingWindow:GetWidth() end
	if EmbeddingWindow:GetHeight() == OrigHeight and EmbeddingWindow:GetWidth() == OrigWidth then return end
	OrigHeight = EmbeddingWindow:GetHeight()
	OrigWidth = EmbeddingWindow:GetWidth()
	if AS:CheckOption("EmbedSkada", "Skada") then AS:EmbedSkada() end
end

function AS:EmbedRecount()
	Recount:LockWindows(true)
	AS:EmbedRecountResize()
	Recount_MainWindow:SetParent((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel))
	Recount_MainWindow:SetFrameStrata("LOW")
end

function AS:EmbedRecountResize()
	Recount_MainWindow:ClearAllPoints()
	Recount_MainWindow:SetPoint("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 7)
	Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindow, "BOTTOMRIGHT", 0, 2)
end

function AS:EmbedOmen()
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
	OmenBarList:SetTemplate(AS:CheckOption("TransparentEmbed") and "Transparent" or "Default")
	OmenBarList:SetParent(AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel)
	OmenBarList:SetFrameStrata("LOW")
	AS:EmbedOmenResize()
end

function AS:EmbedOmenResize()
	OmenBarList:ClearAllPoints()
	OmenBarList:SetPoint("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 0)
	OmenBarList:SetPoint("BOTTOMRIGHT", EmbeddingWindow, "BOTTOMRIGHT", 0, 2)
end

function AS:EmbedRecountOmen()
	AS:EmbedOmen()
	AS:EmbedRecount()
	AS:EmbedRecountOmenResize()
end

function AS:EmbedRecountOmenResize()
	OmenBarList:ClearAllPoints()
	Recount_MainWindow:ClearAllPoints()
	local Offset = E.PixelMode and 0 or 1
	OmenBarList:SetWidth((EmbeddingWindow:GetWidth() / 3) - Offset)
	OmenBarList:SetHeight(EmbeddingWindow:GetHeight())
	OmenBarList:SetPoint("BOTTOMLEFT", EmbeddingWindow, "BOTTOMLEFT", 0, Offset)
	Recount_MainWindow:SetWidth((EmbeddingWindow:GetWidth() / 3) + (EmbeddingWindow:GetWidth() / 3))
	Recount_MainWindow:SetHeight((EmbeddingWindow:GetHeight() + 7))
	Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindow, "BOTTOMRIGHT", 0, Offset)
end
	
function AS:EmbedSkada()
	windows = {}
	for _, window in ipairs(Skada:GetWindows()) do
		tinsert(windows, window)
	end

	local borderWidth = 1
	local height = AS:CheckOption("SkadaBelowTop") and 43 or E.PixelMode and 20 or 21
	local notitleheight = height - 15
	local yoffset = AS:CheckOption("SkadaBelowTop") and -40 or -17
	local notitleoffset = yoffset + 15

	local function EmbedWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
		local barmod = Skada.displays["bar"]
		window.db.barwidth = width
		window.db.background.height = height
		window.db.spark = false
		window.db.barslocked = true
		window.bargroup:ClearAllPoints()
		window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy)
		window.bargroup:SetParent((AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel))
		window.bargroup:SetFrameStrata('LOW')
		barmod.ApplySettings(barmod, window)
	end

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
end

function AS:EmbedTDPS()
	tdpsFrame:SetTemplate(AS:CheckOption("TransparentEmbed") and "Transparent" or "Default")
	tdpsFrame:SetParent(AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel)
	tdpsFrame:SetFrameStrata("LOW")
	AS:EmbedTDPSResize()
	tdpsAnchor:Point("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 0)
	tdpsRefresh()
end

function AS:EmbedTDPSResize()
	tdpsFrame:SetWidth(EmbeddingWindow:GetWidth())
	tdpsRefresh()
end

function AS:ToggleFrame(Frame)
	if Frame:IsShown() then
		Frame:Hide()
	else
		Frame:Show()
	end
end

function AS:EmbedInit()
	local ChatPanel = AS:CheckOption("EmbedRight") and RightChatPanel or LeftChatPanel
	local ChatToggle = AS:CheckOption("EmbedRight") and RightChatToggleButton or LeftChatToggleButton

	self:EmbedWindowResize()
	hooksecurefunc(ChatPanel, "SetSize", AS.EmbedWindowResize)

	ChatToggle:SetScript("OnClick", function(self, btn)
		if btn == 'RightButton' then
			if AS:CheckOption("EmbedRecount", "Recount") or AS:CheckOption("EmbedRO", "Recount", "Omen") then
				AS:ToggleFrame(Recount_MainWindow)
			end
			if AS:CheckOption("EmbedSkada", "Skada") then
				for _, window in ipairs(Skada:GetWindows()) do
					AS:ToggleFrame(window)
				end
			end
			if AS:CheckOption("EmbedOmen", "Omen") or AS:CheckOption("EmbedRO", "Recount", "Omen") then
				AS:ToggleFrame(OmenBarList)
			end
			if AS:CheckOption("EmbedTDPS", "TinyDPS") then
				AS:ToggleFrame(tdpsFrame)
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

	ChatToggle:SetScript("OnEnter", function(self, ...)
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

	if AS:CheckOption("EmbedRO", "Recount", "Omen") then
		AS:EmbedRecountOmen()
		AS:EmbedExitCombat(true)
	end
	if AS:CheckOption("EmbedOmen", "Omen") then AS:EmbedOmen() end
	if AS:CheckOption("EmbedSkada", "Skada") then
		AS:EmbedSkada()
		hooksecurefunc(Skada, "CreateWindow", AS.EmbedSkada)
		hooksecurefunc(Skada, "DeleteWindow", AS.EmbedSkada)
	end
	if AS:CheckOption("EmbedTDPS", "TinyDPS") then AS:EmbedTDPS() end
	if AS:CheckOption("EmbedRecount", "Recount") then AS:EmbedRecount() end
end

function AS:EmbedEnterCombat(event)
	if AS:CheckOption("EmbedOoC") or event == true then
		if AS:CheckOption("EmbedRecount", "Recount") or AS:CheckOption("EmbedRO", "Recount", "Omen") then
			Recount_MainWindow:Show()
		end
		if AS:CheckOption("EmbedSkada", "Skada")  then
			if Skada.db.profile.hidesolo then return end
			if Skada.db.profile.hidecombat then return end
			for _, window in ipairs(Skada:GetWindows()) do
				window:Show()
			end
		end
		if AS:CheckOption("EmbedOmen", "Omen") or AS:CheckOption("EmbedRO", "Recount", "Omen") then
			OmenBarList:Show()
		end
		if AS:CheckOption("EmbedTDPS", "TinyDPS") then
			tdpsFrame:Show()
		end
	end
end

function AS:EmbedExitCombat(event)
	if AS:CheckOption("EmbedOoC") or event == true then
		if AS:CheckOption("EmbedRecount", "Recount") or AS:CheckOption("EmbedRO", "Recount", "Omen") then
			Recount_MainWindow:Hide()
		end
		if AS:CheckOption("EmbedSkada", "Skada") then
			for _, window in ipairs(Skada:GetWindows()) do
				window:Hide()
			end
		end
		if AS:CheckOption("EmbedOmen", "Omen") or AS:CheckOption("EmbedRO", "Recount", "Omen") then
			OmenBarList:Hide()
		end
		if AS:CheckOption("EmbedTDPS", "TinyDPS") then
			tdpsFrame:Hide()
		end
	end
end
