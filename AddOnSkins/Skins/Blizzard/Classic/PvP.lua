if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

function AS:Blizzard_BattlefieldMap(event, addon)
	if addon ~= 'Blizzard_BattlefieldMap' then return end

	local function GetOpacity()
		return 1 - (BattlefieldMapOptions and BattlefieldMapOptions.opacity or 1)
	end

	local oldAlpha = GetOpacity()

	AS:SkinBackdropFrame(BattlefieldMapFrame)
	AS:SetOutside(BattlefieldMapFrame.Backdrop, BattlefieldMapFrame.ScrollContainer)
	BattlefieldMapFrame.Backdrop:SetBackdropColor(0, 0, 0, oldAlpha)

	BattlefieldMapFrame:SetClampedToScreen(true)
	BattlefieldMapFrame:EnableMouse(true)
	BattlefieldMapFrame:SetMovable(true)
	BattlefieldMapFrame:SetFrameStrata('LOW')

	BattlefieldMapFrame.BorderFrame.CloseButton:SetFrameLevel(BattlefieldMapFrame.BorderFrame.CloseButton:GetFrameLevel()+1)
	AS:SkinCloseButton(BattlefieldMapFrame.BorderFrame.CloseButton)
	AS:Kill(BattlefieldMapTab)

	local function InitializeOptionsDropDown()
		BattlefieldMapTab:InitializeOptionsDropDown()
	end

	BattlefieldMapFrame.ScrollContainer:HookScript("OnMouseUp", function(_, btn)
		if btn == "LeftButton" then
			BattlefieldMapTab:StopMovingOrSizing()
			BattlefieldMapTab:SetUserPlaced(true)
		elseif btn == "RightButton" then
			UIDropDownMenu_Initialize(BattlefieldMapTab.OptionsDropDown, InitializeOptionsDropDown, "MENU")
			ToggleDropDownMenu(1, nil, BattlefieldMapTab.OptionsDropDown, BattlefieldMapFrame:GetName(), 0, -4)
		end

		if OpacityFrame:IsShown() then
			OpacityFrame:Hide()
		end
	end)

	BattlefieldMapFrame.ScrollContainer:HookScript("OnMouseDown", function(_, btn)
		if btn == "LeftButton" and (BattlefieldMapOptions and not BattlefieldMapOptions.locked) then
			BattlefieldMapTab:StartMoving()
		end
	end)

	local function setBackdropAlpha()
		if BattlefieldMapFrame.Backdrop then
			BattlefieldMapFrame.Backdrop:SetBackdropColor(0, 0, 0, GetOpacity())
		end
	end

	hooksecurefunc(BattlefieldMapFrame, "SetGlobalAlpha", setBackdropAlpha)
	hooksecurefunc(BattlefieldMapFrame, "RefreshAlpha", function()
		oldAlpha = GetOpacity()
	end)

	local function setOldAlpha()
		if oldAlpha then
			BattlefieldMapFrame:SetGlobalAlpha(oldAlpha)
			oldAlpha = nil
		end
	end

	local function setRealAlpha()
		oldAlpha = GetOpacity()
		BattlefieldMapFrame:SetGlobalAlpha(1)
	end

	BattlefieldMapFrame:HookScript('OnShow', setBackdropAlpha)
	BattlefieldMapFrame.ScrollContainer:HookScript('OnLeave', setOldAlpha)
	BattlefieldMapFrame.ScrollContainer:HookScript('OnEnter', setRealAlpha)
	BattlefieldMapFrame.BorderFrame.CloseButton:HookScript('OnLeave', setOldAlpha)
	BattlefieldMapFrame.BorderFrame.CloseButton:HookScript('OnEnter', setRealAlpha)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_BattlefieldMap", AS.Blizzard_BattlefieldMap, 'ADDON_LOADED')
