local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "BigWigsSkin"
function AS:SkinBigWigs(event, addon)
	if event == "PLAYER_ENTERING_WORLD" then return end
	if addon == "BigWigs_Plugins" then
		local buttonsize = 20
		local freebg = {}
		local createbg = function()
			local bg = CreateFrame("Frame")
			bg:SetTemplate("Transparent")
			return bg
		end

		local function freestyle(bar)
			local bg = bar:Get("bigwigs:elvui:barbg")
			if bg then
				bg:ClearAllPoints()
				bg:SetParent(ElvUI[1].UIParent)
				bg:Hide()
				freebg[#freebg + 1] = bg
			end

			local ibg = bar:Get("bigwigs:elvui:iconbg")
			if ibg then
				ibg:ClearAllPoints()
				ibg:SetParent(ElvUI[1].UIParent)
				ibg:Hide()
				freebg[#freebg + 1] = ibg
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

		local applystyle = function(bar)
			bar:Height(buttonsize)
			local bg = nil
			if #freebg > 0 then
				bg = tremove(freebg)
			else
				bg = createbg()
			end
			bg:SetBackdropColor(unpack(AS.BackdropColor))
			bg:SetParent(bar)
			bg:SetOutside(bar)
			bg:Show()
			bar:Set("bigwigs:elvui:barbg", bg)

			local ibg = nil
			if bar.candyBarIconFrame:GetTexture() then
				if #freebg > 0 then
					ibg = tremove(freebg)
				else
					ibg = createbg()
				end
				ibg:SetParent(bar)
				ibg:SetBackdropColor(0, 0, 0, 0)
				ibg:SetOutside(bar.candyBarIconFrame)
				ibg:Show()
				bar:Set("bigwigs:elvui:iconbg", ibg)
			end

			bar.candyBarLabel:SetJustifyH("LEFT")
			bar.candyBarLabel:ClearAllPoints()
			bar.candyBarLabel:Point("LEFT", bar, "LEFT", 4, 0)

			bar.candyBarDuration:SetJustifyH("RIGHT")
			bar.candyBarDuration:ClearAllPoints()
			bar.candyBarDuration:Point("RIGHT", bar, "RIGHT", -4, 0)

			bar.candyBarBar:ClearAllPoints()
			bar.candyBarBar:SetAllPoints(bar)
			bar.candyBarBar.OldSetPoint = bar.candyBarBar.SetPoint
			bar.candyBarBar.SetPoint = AS.Noop

			bar.candyBarIconFrame.OldSetWidth = bar.candyBarIconFrame.SetWidth
			bar.candyBarIconFrame.SetWidth = AS.Noop
			bar.candyBarIconFrame:ClearAllPoints()
			bar.candyBarIconFrame:Point("BOTTOMRIGHT", bar, "BOTTOMLEFT", -(ElvUI[1].PixelMode and 1 or 5), 0)
			bar.candyBarIconFrame:SetSize(buttonsize, buttonsize)
			bar.candyBarIconFrame:SetTexCoord(unpack(AS.TexCoords))
		end

		local BigWigsBars = BigWigs:GetPlugin('Bars')
		local BigWigsProximity = BigWigs:GetPlugin('Proximity')
		BigWigsBars:RegisterBarStyle("ElvUI", {
			apiVersion = 1,
			version = 1,
			GetSpacing = function(bar) return 8 end,
			ApplyStyle = applystyle,
			BarStopped = freestyle,
			GetStyleName = function() return "ElvUI" end,
		})
		hooksecurefunc(BigWigsProximity, 'RestyleWindow', function()
			if BigWigs.pluginCore.modules.Bars.db.profile.barStyle == 'ElvUI' then
				BigWigsProximityAnchor:SetTemplate('Transparent')
			end
		end)
		AS:UnregisterEvent(name, event)
	end
end

AS:RegisterSkin(name, AS.SkinBigWigs, "ADDON_LOADED")