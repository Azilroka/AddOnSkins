local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BigWigs') then return end

local Loaded
function AS:BigWigs(event, addon)
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
			AS:UnregisterSkinEvent('BigWigs', event)
		end
	end

	if event == 'LFG_PROPOSAL_SHOW' then return end

	local buttonsize = 19
	local FreeBackgrounds = {}

	local CreateBG = function()
		local BG = CreateFrame('Frame')
		BG:SetTemplate('Transparent')
		return BG
	end

	local function FreeStyle(bar)
		local bg = bar:Get('bigwigs:AddOnSkins:bg')
		if bg then
			bg:ClearAllPoints()
			bg:SetParent(UIParent)
			bg:Hide()
			FreeBackgrounds[#FreeBackgrounds + 1] = bg
		end

		local ibg = bar:Get('bigwigs:AddOnSkins:ibg')
		if ibg then
			ibg:ClearAllPoints()
			ibg:SetParent(UIParent)
			ibg:Hide()
			FreeBackgrounds[#FreeBackgrounds + 1] = ibg
		end

		bar.candyBarIconFrame:ClearAllPoints()
		bar.candyBarIconFrame.SetWidth = nil
		bar.candyBarIconFrame:SetPoint('TOPLEFT')
		bar.candyBarIconFrame:SetPoint('BOTTOMLEFT')

		bar.candyBarBar:ClearAllPoints()
		bar.candyBarBar.SetPoint = nil
		bar.candyBarBar:SetPoint('TOPRIGHT')
		bar.candyBarBar:SetPoint('BOTTOMRIGHT')
	end

	local function ApplyStyle(bar)
		bar:SetHeight(buttonsize)

		local bg
		if #FreeBackgrounds > 0 then
			bg = tremove(FreeBackgrounds)
		else
			bg = CreateBG()
		end

		bg:SetParent(bar)
		bg:SetFrameStrata(bar:GetFrameStrata())
		bg:SetFrameLevel(bar:GetFrameLevel() - 1)
		bg:ClearAllPoints()
		bg:SetOutside(bar)
		bg:SetTemplate('Transparent')
		bg:Show()
		bar:Set('bigwigs:AddOnSkins:bg', bg)

		if bar.candyBarIconFrame:GetTexture() then
			local ibg
			if #FreeBackgrounds > 0 then
				ibg = tremove(FreeBackgrounds)
			else
				ibg = CreateBG()
			end
			ibg:SetParent(bar)
			ibg:SetFrameStrata(bar:GetFrameStrata())
			ibg:SetFrameLevel(bar:GetFrameLevel() - 1)
			ibg:ClearAllPoints()
			ibg:SetOutside(bar.candyBarIconFrame)
			ibg:SetBackdropColor(0, 0, 0, 0)
			ibg:Show()
			bar:Set('bigwigs:AddOnSkins:ibg', ibg)
		end

		bar.candyBarBar:ClearAllPoints()
		bar.candyBarBar:SetAllPoints(bar)
		bar.candyBarBar.SetPoint = AS.Noop
		bar.candyBarBar:SetStatusBarTexture(AS.NormTex)

		bar.candyBarBackground:SetTexture(unpack(AS.BackdropColor))

		bar.candyBarIconFrame:ClearAllPoints()
		bar.candyBarIconFrame:Point('BOTTOMRIGHT', bar, 'BOTTOMLEFT', -7, 0)
		bar.candyBarIconFrame:SetSize(buttonsize, buttonsize)
		bar.candyBarIconFrame.SetWidth = AS.Noop

		AS:SkinTexture(bar.candyBarIconFrame)
	end

	local function ApplyStyleHalfBar(bar)
		local bg
		if #FreeBackgrounds > 0 then
			bg = tremove(FreeBackgrounds)
		else
			bg = CreateBG()
		end

		bg:SetParent(bar)
		bg:SetFrameStrata(bar:GetFrameStrata())
		bg:SetFrameLevel(bar:GetFrameLevel() - 1)
		bg:ClearAllPoints()
		bg:SetOutside(bar)
		bg:SetTemplate('Transparent')
		bg:Show()
		bar:Set('bigwigs:AddOnSkins:bg', bg)

		if bar.candyBarIconFrame:GetTexture() then
			local ibg
			if #FreeBackgrounds > 0 then
				ibg = tremove(FreeBackgrounds)
			else
				ibg = CreateBG()
			end
			ibg:SetParent(bar)
			ibg:SetFrameStrata(bar:GetFrameStrata())
			ibg:SetFrameLevel(bar:GetFrameLevel() - 1)
			ibg:ClearAllPoints()
			ibg:SetOutside(bar.candyBarIconFrame)
			ibg:SetBackdropColor(0, 0, 0, 0)
			ibg:Show()
			bar:Set('bigwigs:AddOnSkins:ibg', ibg)
		end

		bar:SetHeight(buttonsize / 2)

		bar.candyBarBar:ClearAllPoints()
		bar.candyBarBar:SetAllPoints(bar)
		bar.candyBarBar.SetPoint = AS.Noop
		bar.candyBarBar:SetStatusBarTexture(AS.NormTex)

		bar.candyBarBackground:SetTexture(unpack(AS.BackdropColor))

		bar.candyBarIconFrame:ClearAllPoints()
		bar.candyBarIconFrame:Point('BOTTOMRIGHT', bar, 'BOTTOMLEFT', -7, 0)
		bar.candyBarIconFrame:SetSize(buttonsize, buttonsize)
		bar.candyBarIconFrame.SetWidth = AS.Noop

		AS:SkinTexture(bar.candyBarIconFrame)
	end

	if (IsAddOnLoaded('BigWigs_Plugins') or event == "ADDON_LOADED" and addon == 'BigWigs_Plugins') then
		if Loaded then return end
		Loaded = true
		local BigWigsBars = BigWigs:GetPlugin('Bars')
		BigWigsBars:RegisterBarStyle('AddOnSkins', {
			apiVersion = 1,
			version = 1,
			GetSpacing = function() return 8 end,
			ApplyStyle = ApplyStyle,
			BarStopped = FreeStyle,
			GetStyleName = function() return 'AddOnSkins' end,
		})
		BigWigsBars:RegisterBarStyle('AddOnSkins Half-Bar', {
			apiVersion = 1,
			version = 1,
			GetSpacing = function() return 20 end,
			ApplyStyle = ApplyStyleHalfBar,
			BarStopped = FreeStyle,
			GetStyleName = function() return 'AddOnSkins Half-Bar' end,
		})
		AS:UnregisterSkinEvent('BigWigs', "ADDON_LOADED")
	end
end

AS:RegisterSkin('BigWigs', AS.BigWigs, 'ADDON_LOADED', 'LFG_PROPOSAL_SHOW')