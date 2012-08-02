if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
if not IsAddOnLoaded("Poisoner") then return end
local SkinPoisoner = CreateFrame("Frame")
	SkinPoisoner:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinPoisoner:RegisterEvent("PLAYER_REGEN_ENABLED")
	SkinPoisoner:SetScript("OnEvent", function(self)
	if (UISkinOptions.PoisonerSkin == "Disabled") then return end
	local s = UIPackageSkinFuncs.s
	local c = UIPackageSkinFuncs.c

	PoisonerOptions_SettingsFrame:StripTextures(True)
	PoisonerOptions_SettingsFrame:SetTemplate("Transparent")
	cSkinButton(PoisonerOptions_MenuSortingButton)
	cSkinButton(PoisonerOptions_SettingsSave)
	cSkinButton(PoisonerOptions_SettingsClose)
	cSkinButton(PoisonerOptions_ResetFBPosition)
	cSkinCheckBox(PoisonerOptions_ChkBox_Enable)
	cSkinCheckBox(PoisonerOptions_ChkBox_MBShow)
	cSkinCheckBox(PoisonerOptions_ChkBox_FBShow)
	cSkinCheckBox(PoisonerOptions_ChkBox_FBLock)
	cSkinCheckBox(PoisonerOptions_ChkBox_PoisonWeaponChatOuput)
	cSkinCheckBox(PoisonerOptions_ChkBox_ShowOnMouseover)
	cSkinCheckBox(PoisonerOptions_ChkBox_AutoHide_inCombat)
	cSkinCheckBox(PoisonerOptions_ChkBox_MenuParentOwn)
	cSkinCheckBox(PoisonerOptions_ChkBox_MenuParentMinimap)
	cSkinCheckBox(PoisonerOptions_ChkBox_MPTopLeft)
	cSkinCheckBox(PoisonerOptions_ChkBox_MPTop)
	cSkinCheckBox(PoisonerOptions_ChkBox_MPTopRight)
	cSkinCheckBox(PoisonerOptions_ChkBox_MPLeft)
	cSkinCheckBox(PoisonerOptions_ChkBox_MPRight)
	cSkinCheckBox(PoisonerOptions_ChkBox_MPBottomLeft)
	cSkinCheckBox(PoisonerOptions_ChkBox_MPBottom)
	cSkinCheckBox(PoisonerOptions_ChkBox_MPBottomRight)
	cSkinCheckBox(PoisonerOptions_ChkBox_ToolTipFull)
	cSkinCheckBox(PoisonerOptions_ChkBox_ToolTipName)
	cSkinCheckBox(PoisonerOptions_ChkBox_OverwritePreset)
	cSkinCheckBox(PoisonerOptions_ChkBox_ShowTimer)
	cSkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_IgnoreWhileFishing)
	cSkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_OnlyInstanced)
	cSkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_MainHand)
	cSkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_OffHand)
	cSkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_ThrowWeapon)
	cSkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_Audio)
	cSkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_Chat)
	cSkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_Aura)
	cSkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_ErrorFrame)
	cSkinCheckBox(PoisonerOptions_ChkBox_TimerOutput_Aura_Lock)
	cSkinCheckBox(PoisonerOptions_ChkBox_AutoBuy)
	cSkinCheckBox(PoisonerOptions_ChkBox_AutoBuy_Prompt)
	cSkinCheckBox(PoisonerOptions_ChkBox_AutoBuy_Check)
	cSkinCheckBox(PoisonerOptions_ChkBox_QuickButton_Lock)

	PoisonerOptions_SettingsFrameTab1:Point("TOPLEFT", PoisonerOptions_SettingsFrame, "BOTTOMLEFT", 0, 2)

	for i = 1, 5 do
		cSkinTab(_G["PoisonerOptions_SettingsFrameTab"..i])
	end

function Poisoner_CheckQuickButton()
		if InCombatLockdown() then PoisonerStateHeader.needUpdate = true; return end
			if (POISONER_CONFIG.Enabled == 1) then
			if ((Poisoner_Poison16.Name ~= nil and Poisoner_Poison16.Name ~= "") and (Poisoner_Poison17.Name ~= nil and Poisoner_Poison17.Name ~= "") --[[and (Poisoner_Poison18.Name ~= nil and Poisoner_Poison18.Name ~= "")]]) then
				if (Poisoner_QuickButtonVisible == 0) then
					Poisoner_CreateQuickButton()
				elseif (Poisoner_QuickButtonVisible == 1) then
					Poisoner_UpdateQuickButton()
				end
			elseif ((Poisoner_Poison16.Name == nil or Poisoner_Poison16.Name == "") and (Poisoner_Poison17.Name == nil or Poisoner_Poison17.Name == "") --[[and (Poisoner_Poison18.Name == nil or Poisoner_Poison18.Name == "")]]) then
				Poisoner_QuickButton_Overlay:StripTextures()
				Poisoner_QuickButton:Hide();
			end
		elseif (POISONER_CONFIG.Enabled == 0) then
			Poisoner_QuickButton_Overlay:StripTextures()
			Poisoner_QuickButton:Hide();
		end
end

function Poisoner_UpdateQuickButton()
		local btn = Poisoner_QuickButton
		local icon = Poisoner_QuickButtonIcon
			if MSQ and Poisoner_Masque_Initiated == true then
				MSQ:Group("Poisoner", "QuickButton"):AddButton(btn)
				MSQ:Group("Poisoner", "QuickButton"):ReSkin()
			end
		btn:SetAttribute("type", "macro");
		btn:SetAttribute("macrotext", "/use [nomodifier,button:3] "..Poisoner_Poison18.Name.."\n/use [modifier:shift,button:3] "..Poisoner_Poison18_SHIFT.Name.."\n/use [modifier:ctrl,button:3] "..Poisoner_Poison18_CTRL.Name.."\n/use [modifier:alt,button:3] "..Poisoner_Poison18_ALT.Name.."\n/use [button:3] 18\n/use [nomodifier,button:2] "..Poisoner_Poison17.Name.."\n/use [modifier:shift,button:2] "..Poisoner_Poison17_SHIFT.Name.."\n/use [modifier:ctrl,button:2] "..Poisoner_Poison17_CTRL.Name.."\n/use [modifier:alt,button:2] "..Poisoner_Poison17_ALT.Name.."\n/use [button:2] 17\n/use [nomodifier,button:1] "..Poisoner_Poison16.Name.."\n/use [modifier:shift,button:1] "..Poisoner_Poison16_SHIFT.Name.."\n/use [modifier:ctrl,button:1] "..Poisoner_Poison16_CTRL.Name.."\n/use [modifier:alt,button:1] "..Poisoner_Poison16_ALT.Name.."\n/use [button:1] 16\n/click StaticPopup1Button1\n/run PoisonerOptions_CheckPoisons()");
		Poisoner_GetToolTipTexture()
		-- Tooltip layout
		local COLOR_GREEN = "|cff00ff00";
		local COLOR_GREY = "|cff808080";
		local COLOR_END = "|r";
		Poisoner_QuickButton_Text_MH = "|T"..Poisoner_Poison16.Texture..":0|t |T"..Poisoner_Poison16_SHIFT.Texture..":0|t |T"..Poisoner_Poison16_CTRL.Texture..":0|t |T"..Poisoner_Poison16_ALT.Texture..":0|t "
		Poisoner_QuickButton_Text_OH = "|T"..Poisoner_Poison17.Texture..":0|t |T"..Poisoner_Poison17_SHIFT.Texture..":0|t |T"..Poisoner_Poison17_CTRL.Texture..":0|t |T"..Poisoner_Poison17_ALT.Texture..":0|t "
		Poisoner_QuickButton_Text_TW = "|T"..Poisoner_Poison18.Texture..":0|t |T"..Poisoner_Poison18_SHIFT.Texture..":0|t |T"..Poisoner_Poison18_CTRL.Texture..":0|t |T"..Poisoner_Poison18_ALT.Texture..":0|t "
		Poisoner_QuickButton_Text_Slots = ""..INVTYPE_WEAPONMAINHAND..": \n"..INVTYPE_WEAPONOFFHAND..": \n"..INVTYPE_THROWN..": "
		Poisoner_QuickButton_Text_Textures = ""..Poisoner_QuickButton_Text_MH.."\n"..Poisoner_QuickButton_Text_OH.."\n"..Poisoner_QuickButton_Text_TW..""
		Poisoner_QuickButton_Overlay:SetTemplate("Transparent")
		Poisoner_QuickButton:Show();
end

end)
