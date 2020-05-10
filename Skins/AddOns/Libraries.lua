local AS = unpack(AddOnSkins)

local _G = _G
local select = select

local function SkinDewdrop2()
	local frame
	local i = 1

	while _G["Dewdrop20Level" .. i] do
		frame = _G["Dewdrop20Level" .. i]

		if not frame.isSkinned then
			AS:SetTemplate(frame)

			select(1, frame:GetChildren()):Hide()
			frame.SetBackdropColor = AS.Noop
			frame.SetBackdropBorderColor = AS.Noop

			frame.isSkinned = true
		end

		i = i + 1
	end

	i = 1

	local dewdropEditBoxFrame
	local dewdropSliderFrame
	while _G["Dewdrop20Button" .. i] do
		if not _G["Dewdrop20Button" .. i].isHook then
			_G["Dewdrop20Button" .. i]:HookScript("OnEnter", function(self)
				if not self.disabled and self.hasArrow then
					if not dewdropEditBoxFrame and self.hasEditBox then
						dewdropEditBoxFrame = AS:FindFrameBySizeChild({"EditBox"}, 200, 40)

						if dewdropEditBoxFrame then
							AS:SetTemplate(dewdropEditBoxFrame)
							AS:SkinEditBox(dewdropEditBoxFrame.editBox)
							dewdropEditBoxFrame.editBox:DisableDrawLayer("BACKGROUND")
						end
					end
					if not dewdropSliderFrame and self.hasSlider then
						dewdropSliderFrame = AS:FindFrameBySizeChild({"Slider", "EditBox"}, 100, 170)

						if dewdropSliderFrame then
							AS:SetTemplate(dewdropSliderFrame)
							AS:SkinSlideBar(dewdropSliderFrame.slider)
							AS:SkinEditBox(dewdropSliderFrame.currentText)
							dewdropSliderFrame.currentText:DisableDrawLayer("BACKGROUND")
						end
					end

					SkinDewdrop2()
				end
			end)
			_G["Dewdrop20Button" .. i].isHook = true
		end

		i = i + 1
	end
end

local function SkinTablet2(lib)
	local function SkinDetachedFrame(self, fakeParent, parent)
		if not parent then
			parent = fakeParent
		end
		if self.registry[parent].data.detached then
			local frame
			local i = 1

			while _G["Tablet20DetachedFrame" .. i] do
				frame = _G["Tablet20DetachedFrame" .. i]

				if not frame.isSkinned then
					AS:SetTemplate(frame, "Transparent")
					AS:SkinSlideBar(frame.slider)

					frame.isSkinned = true
				end

				i = i + 1
			end
		end
	end

	if not AS:IsHooked(lib, "Open") then
		AS:SecureHook(lib, "Open", function(self, fakeParent, parent)
			AS:SetTemplate(_G["Tablet20Frame"], "Transparent")
			SkinDetachedFrame(self, fakeParent, parent)
		end)
	end

	if not AS:IsHooked(lib, "Detach") then
		AS:SecureHook(lib, "Detach", function(self, parent)
			SkinDetachedFrame(self, parent)
		end)
	end
end

local function SkinRockConfig(lib)
	local function SkinMainFrame(self)
		if self.base.isSkinned then return end

		AS:SetTemplate(self.base, "Transparent")
		AS:StripTextures(self.base.header)
		AS:SkinCloseButton(self.base.closeButton, self.base)

		AS:SetTemplate(self.base.treeView)
		AS:SkinScrollBar(self.base.treeView.scrollBar)
		AS:SkinDropDownBox(self.base.addonChooser)

		self.base.addonChooser.text:SetHeight(20)
		AS:SetTemplate(self.base.addonChooser.text)
		AS:SkinArrowButton(self.base.addonChooser.button)

		local pullout = _G[self.base.mainPane:GetName().."_ChoicePullout"]
		if pullout then
			AS:SetTemplate(pullout)
		else
			AS:SecureHookScript(self.base.addonChooser.button, "OnClick", function(self)
				AS:SetTemplate(_G[lib.base.mainPane:GetName().."_ChoicePullout"])
				AS:Unhook(self, "OnClick")
			end)
		end

		AS:SetTemplate(self.base.mainPane)
		AS:ScrollBar(self.base.mainPane.scrollBar)

		AS:SetTemplate(self.base.treeView.sizer)

		self.base.isSkinned = true
	end

	AS:SecureHook(lib, "OpenConfigMenu", function(self)
		SkinMainFrame(self)
		AS:Unhook(self, "OpenConfigMenu")
	end)

	local LR = LibStub("LibRock-1.0", true)
	if LR then
		for object in LR:IterateMixinObjects("LibRockConfig-1.0") do
			if not AS:IsHooked(object, "OpenConfigMenu") then
				AS:SecureHook(object, "OpenConfigMenu", function(self)
					SkinMainFrame(lib)
					AS:Unhook(self, "OpenConfigMenu")
				end)
			end
		end
	end
end

function AS:SkinLibraries()
	local Dewdrop = LibStub("Dewdrop-2.0", true)
	if Dewdrop and not AS:IsHooked(Dewdrop, "Open") then
		AS:SecureHook(Dewdrop, "Open", SkinDewdrop2)
	end

	local Tablet = LibStub("Tablet-2.0", true)
	if Tablet then
		SkinTablet2(Tablet)
	end

	local LibExtraTip = LibStub("LibExtraTip-1", true)
	if LibExtraTip and not AS:IsHooked(LibExtraTip, "GetFreeExtraTipObject") then
		AS:RawHook(LibExtraTip, "GetFreeExtraTipObject", function(self)
			local tooltip = AS.hooks[self].GetFreeExtraTipObject(self)

			if not tooltip.isSkinned then
				AS:SetTemplate(tooltip)
				tooltip.isSkinned = true
			end

			return tooltip
		end)
	end

	local LRC = LibStub("LibRockConfig-1.0", true)
	if LRC then
		SkinRockConfig(LRC)
	end

	local LZF = LibStub("ZFrame-1.0", true)
	if LZF and not AS:IsHooked(LZF, "Create") then
		AS:RawHook(LZF, "Create", function(self, ...)
			local frame = AS.hooks[self].Create(self, ...)
			AS:SetTemplate(frame.ZMain)
			frame.ZMain.close:SetSize(32, 32)
			AS:SkinCloseButton(frame.ZMain.close, frame.ZMain)
			return frame
		end, true)
	end

	local Poncho = LibStub('Poncho-1.0', true)
	if Poncho then
		if SushiDropFrame then
			hooksecurefunc(SushiDropFrame, 'SetMenu', function(self)
				if not self.bg.Backdrop then
					self.bg:SetBackdrop(nil)
					self.bg.SetBackdrop = function() end
					AS:CreateBackdrop(self.bg)
				end
			end)
		end
	end

	local DBIcon = LibStub("LibDBIcon-1.0", true)
	if DBIcon and DBIcon.tooltip and DBIcon.tooltip:IsObjectType('GameTooltip') then
		DBIcon.tooltip:HookScript("OnShow", function(self) AS:SetTemplate(self) end)
	end

	local LET = LibStub('LibExtraTip-1', true)
	if LET then
		LET:AddCallback(function(tip,_,_,_,_,quality)
			local extraTip = LET:GetExtraTip(tip)
			if extraTip then
				AS:SetTemplate(extraTip)
				if quality and quality > 1 then
					local color = BAG_ITEM_QUALITY_COLORS[quality]
					extraTip:SetBackdropBorderColor(color.r, color.g, color.b)
				end
			end
		end, 0)
	end

	local LSF = LibStub("LibSimpleFrame-Mod-1.0", true)
	if LSF then
		for name, frame in pairs(LSF.registry) do
			AS:SetTemplate(frame)
			frame.SetBackdropColor = AS.Noop
			frame.SetBackdropBorderColor = AS.Noop
		end
	end

	local LQT = LibStub("LibQTip-1.0", true)
	if LQT then
		hooksecurefunc(LQT, 'Acquire', function()
			for _, Tooltip in LQT:IterateTooltips() do
				if not Tooltip.isSkinned then
					AS:SkinFrame(Tooltip)
					Tooltip.isSkinned = true
				end
			end
		end)
	end

	local LQTRS = LibStub("LibQTip-1.0RS", true)
	if LQTRS then
		hooksecurefunc(LQTRS, 'Acquire', function()
			for _, Tooltip in LQTRS:IterateTooltips() do
				if not Tooltip.isSkinned then
					AS:SkinFrame(Tooltip)
					Tooltip.isSkinned = true
				end
			end
		end)
	end
end

AS:RegisterSkin('Libraries', AS.SkinLibraries)
