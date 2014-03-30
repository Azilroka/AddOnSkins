local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BigWigs') then return end

local Loaded
local name = "BigWigsSkin"
function AS:SkinBigWigs(event, addon)
	if event == 'LFG_PROPOSAL_SHOW' or event == 'PLAYER_ENTERING_WORLD' then
		if LFGDungeonReadyPopup then
			LFGDungeonReadyPopup:HookScript('OnUpdate', function(self)
				for i = 1, self:GetNumChildren() do
					local object = select(i, self:GetChildren())
					if object:GetObjectType() == 'StatusBar' and not object.IsSkinned then
						AS:SkinStatusBar(object)
						object:ClearAllPoints()
						object:SetPoint('TOP', self, 'BOTTOM', 0, -2)
						object:SetHeight(16)
						object.IsSkinned = true
					end
				end
			end)
			AS:UnregisterSkinEvent(name, event)
		end
	end

	if event == 'LFG_PROPOSAL_SHOW' then return end

	local ButtonSize = 20
	local FreeBG = {}

	local function freestyle(bar)
		local bg = bar:Get("bigwigs:elvui:barbg")
		if bg then
			bg:ClearAllPoints()
			bg:SetParent(ElvUI[1].UIParent)
			bg:Hide()
			FreeBG[#FreeBG + 1] = bg
		end

		local ibg = bar:Get("bigwigs:elvui:iconbg")
		if ibg then
			ibg:ClearAllPoints()
			ibg:SetParent(ElvUI[1].UIParent)
			ibg:Hide()
			FreeBG[#FreeBG + 1] = ibg
		end

		bar.candyBarIconFrame.SetWidth = bar.candyBarIconFrame.OldSetWidth
		bar.candyBarBar.SetPoint = bar.candyBarBar.OldSetPoint
		bar.candyBarIconFrame:ClearAllPoints()
		bar.candyBarIconFrame:SetPoint("TOPLEFT")
		bar.candyBarIconFrame:SetPoint("BOTTOMLEFT")
		bar.candyBarIconFrame:SetTexCoord(unpack(AS.TexCoords))
		bar.candyBarBar:ClearAllPoints()
		bar.candyBarBar:SetPoint("TOPRIGHT")
		bar.candyBarBar:SetPoint("BOTTOMRIGHT")
		bar.candyBarBackground:SetAllPoints()
		bar.candyBarDuration:ClearAllPoints()
		bar.candyBarDuration:SetPoint("RIGHT", bar.candyBarBar, "RIGHT", -2, 0)
		bar.candyBarLabel:ClearAllPoints()
		bar.candyBarLabel:SetPoint("LEFT", bar.candyBarBar, "LEFT", 2, 0)
		bar.candyBarLabel:SetPoint("RIGHT", bar.candyBarBar, "RIGHT", -2, 0)
	end

	local function applystyle(bar)
		if AS:CheckOption('BigWigsHalfBar') then
			bar:Height(ButtonSize/3)
		else
			bar:Height(ButtonSize)
		end
		local bg = nil
		if #FreeBG > 0 then
			bg = tremove(FreeBG)
		else
			bg = CreateFrame("Frame")
		end
		bg:SetTemplate('Transparent', true)
		bg:SetParent(bar)
		bg:SetOutside(bar)
		bg:SetFrameLevel(bar:GetFrameLevel() - 1)
		bg:SetFrameStrata(bar:GetFrameStrata())
		bg:Show()
		bar:Set("bigwigs:elvui:barbg", bg)

		local ibg = nil
		if bar.candyBarIconFrame:GetTexture() then
			if #FreeBG > 0 then
				ibg = tremove(FreeBG)
			else
				ibg = CreateFrame("Frame")
			end
			ibg:SetParent(bar)
			ibg:SetTemplate('Transparent', true)
			ibg:SetBackdropColor(0, 0, 0, 0)
			ibg:SetOutside(bar.candyBarIconFrame)
			ibg:SetFrameLevel(bar:GetFrameLevel() - 1)
			ibg:SetFrameStrata(bar:GetFrameStrata())
			ibg:Show()
			bar:Set("bigwigs:elvui:iconbg", ibg)
		end

		bar.candyBarLabel:SetJustifyH("LEFT")
		bar.candyBarLabel:ClearAllPoints()
		bar.candyBarDuration:SetJustifyH("RIGHT")
		bar.candyBarDuration:ClearAllPoints()
		if AS:CheckOption('BigWigsHalfBar') then
			bar.candyBarLabel:Point('BOTTOMLEFT', bar, 'TOPLEFT', 0, 4)
			bar.candyBarDuration:Point('BOTTOMRIGHT', bar, 'TOPRIGHT', -1, 2)
		else
			bar.candyBarLabel:Point("LEFT", bar, "LEFT", 4, 0)
			bar.candyBarDuration:Point("RIGHT", bar, "RIGHT", -4, 0)
		end
		bar.candyBarBar:ClearAllPoints()
		bar.candyBarBar:SetAllPoints(bar)
		bar.candyBarBar.OldSetPoint = bar.candyBarBar.SetPoint
		bar.candyBarBar.SetPoint = AS.Noop
		bar.candyBarIconFrame.OldSetWidth = bar.candyBarIconFrame.SetWidth
		bar.candyBarIconFrame.SetWidth = AS.Noop
		bar.candyBarIconFrame:ClearAllPoints()
		bar.candyBarIconFrame:Point("BOTTOMRIGHT", bar, "BOTTOMLEFT", -(ElvUI[1].PixelMode and 1 or 5), 0)
		bar.candyBarIconFrame:SetSize(ButtonSize, ButtonSize)
		bar.candyBarIconFrame:SetTexCoord(unpack(AS.TexCoords))
	end

	if (IsAddOnLoaded('BigWigs_Plugins') or event == "ADDON_LOADED" and addon == 'BigWigs_Plugins') then
		local BigWigsBars = BigWigs:GetPlugin('Bars')
		if Loaded then return end
		Loaded = true
		BigWigsBars:RegisterBarStyle("ElvUI", {
			apiVersion = 1,
			version = 6,
			GetSpacing = function(bar)
				local Spacing = 0
				if AS:CheckOption('BigWigsHalfBar') then
					Spacing = (ElvUI[1].PixelMode and 16 or 20)
				else
					Spacing = (ElvUI[1].PixelMode and 4 or 8)
				end
				return Spacing
			end,
			ApplyStyle = applystyle,
			BarStopped = freestyle,
			GetStyleName = function() return "ElvUI" end,
		})
		BigWigsBars:SetBarStyle("ElvUI")
		AS:UnregisterSkinEvent(name, "ADDON_LOADED")
		AS:UnregisterSkinEvent(name, "PLAYER_ENTERING_WORLD")
	end
end

AS:RegisterSkin(name, AS.SkinBigWigs, "ADDON_LOADED", 'LFG_PROPOSAL_SHOW')