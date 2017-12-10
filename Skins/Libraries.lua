local AS = unpack(AddOnSkins)

local _G = _G
local select = select

local function SkinDewdrop2()
	local frame
	local i = 1

	while _G["Dewdrop20Level" .. i] do
		frame = _G["Dewdrop20Level" .. i]

		if not frame.isSkinned then
			frame:SetTemplate("Transparent")

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
							dewdropEditBoxFrame:SetTemplate("Transparent")
							AS:SkinEditBox(dewdropEditBoxFrame.editBox)
							dewdropEditBoxFrame.editBox:DisableDrawLayer("BACKGROUND")
						end
					end
					if not dewdropSliderFrame and self.hasSlider then
						dewdropSliderFrame = AS:FindFrameBySizeChild({"Slider", "EditBox"}, 100, 170)

						if dewdropSliderFrame then
							dewdropSliderFrame:SetTemplate("Transparent")
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
		self.base.header:StripTextures()
		AS:SkinCloseButton(self.base.closeButton, self.base)

		self.base.treeView:SetTemplate("Transparent")
		AS:SkinScrollBar(self.base.treeView.scrollBar)
		AS:SkinDropDownBox(self.base.addonChooser)

		self.base.addonChooser.text:Height(20)
		self.base.addonChooser.text:SetTemplate("Transparent")
		AS:SkinNextPrevButton(self.base.addonChooser.button, true)

		local pullout = _G[self.base.mainPane:GetName().."_ChoicePullout"]
		if pullout then
			pullout:SetTemplate("Transparent")
		else
			AS:SecureHookScript(self.base.addonChooser.button, "OnClick", function(self)
				_G[lib.base.mainPane:GetName().."_ChoicePullout"]:SetTemplate("Transparent")
				AS:Unhook(self, "OnClick")
			end)
		end

		self.base.mainPane:SetTemplate("Transparent")
		AS:ScrollBar(self.base.mainPane.scrollBar)

		self.base.treeView.sizer:SetTemplate("Transparent")

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
				AS:SetTemplate(tooltip, "Transparent")
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
			frame.ZMain:SetTemplate("Transparent")
			frame.ZMain.close:Size(32)
			AS:SkinCloseButton(frame.ZMain.close, frame.ZMain)
			return frame
		end, true)
	end
end

AS:RegisterSkin('Libraries', AS.SkinLibraries)