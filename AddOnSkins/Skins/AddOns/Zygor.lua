-- Zygor Guides skin for AddOnSkins (TBC Anniversary: ZygorGuidesViewerClassicTBCAnniv)
-- Zygor uses a fully custom widget system (UI:Create / SkinData), so we avoid
-- stripping or restyling internal content frames - doing so breaks Zygor's own
-- theme rendering. Instead we only override the outer frame border colours and
-- skin the standard Blizzard-template elements (close button, search backdrop).

local AS = unpack(AddOnSkins)

-- Guide Browser
-- ZygorGuidesViewer_GuideMenu is the guide-browser window (Home/Featured/…).
-- Its outer frame uses BackdropTemplate + Zygor's SkinData colours. We just
-- override the border colour so it matches the ElvUI theme colour, and skin the
-- close button and search edit back-frame.

local guideMenuSkinned = false
local function SkinGuideMenuFrame()
	if guideMenuSkinned then return end
	local MF = _G['ZygorGuidesViewer_GuideMenu']
	if not MF then return end
	guideMenuSkinned = true

	-- Only override the BORDER colour - leave background/texture alone so
	-- Zygor's own theme (Stealth, Starlight, …) is not broken.
	MF:SetBackdropBorderColor(unpack(AS.BorderColor))

	-- Close button (standard Blizzard ButtonTemplate child)
	if MF.Header and MF.Header.CloseButton then
		AS:SkinCloseButton(MF.Header.CloseButton)
	end

	-- Search edit box: Zygor EditBox keeps its backdrop in a child .back frame
	local search = MF.MenuGuides and MF.MenuGuides.SearchEdit
	if search and search.back then
		AS:StripTextures(search.back)
		AS:SetTemplate(search.back)
		search:SetTextColor(1, 1, 1)
	end
end

-- Step Viewer
-- ZygorGuidesViewerFrame is the visual skin frame (child of FrameMaster).
-- Its ApplySkin() sets backdrop colours from SkinData. We hook it to override
-- just the border colour with the ElvUI value without breaking anything else.

local stepViewerHooked = false
local function HookStepViewer()
	if stepViewerHooked then return end
	local ZGV = _G['ZygorGuidesViewer']
	if not ZGV or not ZGV.Frame then return end
	stepViewerHooked = true

	local f = ZGV.Frame
	local function ApplyElvUIBorder()
		if f.Border then
			f.Border:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
	end

	if f.ApplySkin then
		hooksecurefunc(f, 'ApplySkin', ApplyElvUIBorder)
	end
	ApplyElvUIBorder()
end

-- Entry point
function AS:Zygor(event, addon)
	local loaded = (C_AddOns and C_AddOns.IsAddOnLoaded and (
			C_AddOns.IsAddOnLoaded('ZygorGuidesViewer') or
			C_AddOns.IsAddOnLoaded('ZygorGuidesViewerClassic') or
			C_AddOns.IsAddOnLoaded('ZygorGuidesViewerClassicTBCAnniv')))
		or (_G.IsAddOnLoaded and (
			_G.IsAddOnLoaded('ZygorGuidesViewer') or
			_G.IsAddOnLoaded('ZygorGuidesViewerClassic') or
			_G.IsAddOnLoaded('ZygorGuidesViewerClassicTBCAnniv')))
	if not loaded then return end

	C_Timer.After(0.5, function()
		HookStepViewer()
		SkinGuideMenuFrame()

		-- Guide browser may be opened before our timer; also hook Open so we
		-- catch it if it is first shown after our timer runs.
		local ZGV = _G['ZygorGuidesViewer']
		if ZGV and ZGV.GuideMenu and ZGV.GuideMenu.Open then
			hooksecurefunc(ZGV.GuideMenu, 'Open', function()
				C_Timer.After(0, SkinGuideMenuFrame)
			end)
		end
	end)
end

AS:RegisterSkin('Zygor', AS.Zygor)
