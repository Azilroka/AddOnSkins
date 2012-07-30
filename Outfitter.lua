if not (IsAddOnLoaded( "ElvUI" ) or IsAddOnLoaded("Tukui")) then return end
if IsAddOnLoaded("ElvUI_SLE") then return end --Repooc and Darth Predator has a modified skin to fit the UI
if not IsAddOnLoaded("Outfitter") then return end
local SkinOutfitter = CreateFrame("Frame")
	SkinOutfitter:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	SkinOutfitter:SetScript( "OnEvent", function(self)
	if (UISkinOptions.OutfitterSkin == "Disabled") then return end
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

CharacterFrame:HookScript("OnShow", function( self ) PaperDollSidebarTabs:SetPoint("BOTTOMRIGHT", CharacterFrameInsetRight, "TOPRIGHT", -14, 0) end)
OutfitterFrame:HookScript("OnShow", function( self ) 
	self:StripTextures(true)
	self:SetTemplate("Transparent")
	OutfitterFrameTab1:Size(60,25)
	OutfitterFrameTab2:Size(60,25)
	OutfitterFrameTab3:Size(60,25)
	for i = 0,13 do
		if _G["OutfitterItem"..i.."OutfitMenu"] then 
			cSkinNextPrevButton(_G["OutfitterItem"..i.."OutfitMenu"])
			_G["OutfitterItem"..i.."OutfitMenu"]:Size(16)
		end
		if _G["OutfitterItem"..i.."OutfitSelected"] then 
			cSkinButton(_G["OutfitterItem"..i.."OutfitSelected"])
			_G["OutfitterItem"..i.."OutfitSelected"]:ClearAllPoints()
			_G["OutfitterItem"..i.."OutfitSelected"]:Size(16)
			_G["OutfitterItem"..i.."OutfitSelected"]:Point("LEFT", _G["OutfitterItem"..i.."Outfit"], "LEFT", 8, 0)
		end
	end
		Outfitter.NameOutfitDialog:StripTextures(true)
		Outfitter.NameOutfitDialog.DoneButton:StripTextures(true)
		Outfitter.NameOutfitDialog.CancelButton:StripTextures(true)
		Outfitter.NameOutfitDialog:SetTemplate("Transparent")
		Outfitter.NameOutfitDialog.InfoSection:SetTemplate("Transparent")
		Outfitter.NameOutfitDialog.BuildSection:SetTemplate("Transparent")
		Outfitter.NameOutfitDialog.StatsSection:SetTemplate("Transparent")
		cSkinButton(Outfitter.NameOutfitDialog.EmptyOutfitCheckButton)
		cSkinButton(Outfitter.NameOutfitDialog.ExistingOutfitCheckButton)
		cSkinButton(Outfitter.NameOutfitDialog.GenerateOutfitCheckButton)
		cSkinButton(Outfitter.NameOutfitDialog.DoneButton)
		cSkinButton(Outfitter.NameOutfitDialog.CancelButton)
		Outfitter.RebuildOutfitDialog:StripTextures(true)
		Outfitter.RebuildOutfitDialog:SetTemplate("Transparent")
		Outfitter.RebuildOutfitDialog.StatsSection:SetTemplate("Transparent")
		Outfitter.RebuildOutfitDialog.DoneButton:StripTextures(true)
		Outfitter.RebuildOutfitDialog.CancelButton:StripTextures(true)
		cSkinButton(Outfitter.RebuildOutfitDialog.DoneButton)
		cSkinButton(Outfitter.RebuildOutfitDialog.CancelButton)
	end)


OutfitterMainFrameScrollbarTrench:StripTextures(true)
OutfitterFrameTab1:StripTextures(true)
OutfitterFrameTab2:StripTextures(true)
OutfitterFrameTab3:StripTextures(true)
OutfitterFrameTab1:ClearAllPoints()
OutfitterFrameTab2:ClearAllPoints()
OutfitterFrameTab3:ClearAllPoints()
OutfitterFrameTab1:Point("TOPLEFT", OutfitterFrame, "BOTTOMRIGHT", -65, -2)
OutfitterFrameTab2:Point("LEFT", OutfitterFrameTab1, "LEFT", -65, 0)
OutfitterFrameTab3:Point("LEFT", OutfitterFrameTab2, "LEFT", -65, 0)
cSkinButton(OutfitterFrameTab1)
cSkinButton(OutfitterFrameTab2)
cSkinButton(OutfitterFrameTab3)

cSkinScrollBar(OutfitterMainFrameScrollFrameScrollBar)
cSkinCloseButton(OutfitterCloseButton)
cSkinButton(OutfitterNewButton)
cSkinButton(OutfitterEnableNone)
cSkinButton(OutfitterEnableAll)

cDesaturate(OutfitterButton)
OutfitterButton:ClearAllPoints()
OutfitterButton:SetPoint("RIGHT", PaperDollSidebarTabs, "RIGHT", 26, -2)
OutfitterButton:SetHighlightTexture(nil)

local CheckBoxButtons = {
	"OutfitterEnableHeadSlot",
	"OutfitterEnableNeckSlot",
	"OutfitterEnableShoulderSlot",
	"OutfitterEnableBackSlot",
	"OutfitterEnableChestSlot",
	"OutfitterEnableShirtSlot",
	"OutfitterEnableTabardSlot",
	"OutfitterEnableWristSlot",
	"OutfitterEnableMainHandSlot",
	"OutfitterEnableSecondaryHandSlot",
	"OutfitterEnableRangedSlot",
	"OutfitterEnableHandsSlot",
	"OutfitterEnableWaistSlot",
	"OutfitterEnableLegsSlot",
	"OutfitterEnableFeetSlot",
	"OutfitterEnableFinger0Slot",
	"OutfitterEnableFinger1Slot",
	"OutfitterEnableTrinket0Slot",
	"OutfitterEnableTrinket1Slot",
	}

	for _, object in pairs(CheckBoxButtons) do
		cSkinCheckBox(_G[object])
		_G[object]:SetFrameStrata("HIGH")
		_G[object]:SetFrameLevel(5)
	end

local BoxButtons = {
		"OutfitterItemComparisons",
		"OutfitterTooltipInfo",
		"OutfitterShowHotkeyMessages",
		"OutfitterShowMinimapButton",
		"OutfitterShowOutfitBar",
		"OutfitterAutoSwitch",
	}
	for _, object in pairs(BoxButtons) do
		cSkinButton(_G[object])
		_G[object]:Size(20)
	end
	OutfitterShowOutfitBar:Point("TOPLEFT", OutfitterAutoSwitch, "BOTTOMLEFT", 0, -5)

	cSkinButton(OutfitterEditScriptDialogDoneButton)
	cSkinButton(OutfitterEditScriptDialogCancelButton)
	cSkinScrollBar(OutfitterEditScriptDialogSourceScriptScrollBar)
	OutfitterEditScriptDialogSourceScript:CreateBackdrop()
	OutfitterEditScriptDialog:StripTextures(true)
	OutfitterEditScriptDialog:SetTemplate("Transparent")
	cSkinCloseButton(OutfitterEditScriptDialog.CloseButton)
	cSkinTab(OutfitterEditScriptDialogTab1)
	cSkinTab(OutfitterEditScriptDialogTab2)
	cSkinDropDownBox(OutfitterEditScriptDialogPresetScript)

end)
