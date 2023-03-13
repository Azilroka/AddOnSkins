local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local LibStub = LibStub

local select = select
local EnumerateFrames = EnumerateFrames

function AS:FindFrameBySizeChild(childTypes, width, height)
	local obj = EnumerateFrames()

	width, height = AS:Round(width), AS:Round(height)

	while obj do
		if obj.IsObjectType and obj:IsObjectType('Frame') then
			if not (obj:GetName() and obj:GetParent()) then
				if AS:Round(obj:GetWidth()) == width and AS:Round(obj:GetHeight()) == height then
					local childs = {}
					for _, child in pairs({obj:GetChildren()}) do
						childs[#childs + 1] = child:GetObjectType()
					end

					local matched = 0
					for _, cType in pairs(childTypes) do
						for _, type in pairs(childs) do
							if cType == type then
								matched = matched + 1
							end
						end
					end

					if matched == #childTypes then
						return obj
					end
				end
			end
		end

		obj = EnumerateFrames(obj)
	end
end

local function SkinDewdrop2()
	local frame
	local i = 1

	while _G["Dewdrop20Level" .. i] do
		frame = _G["Dewdrop20Level" .. i]

		if not frame.isSkinned then
			S:SetTemplate(frame)

			select(1, frame:GetChildren()):Hide()
			frame.SetBackdropColor = S.noop
			frame.SetBackdropBorderColor = S.noop

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
							S:SetTemplate(dewdropEditBoxFrame)
							S:HandleEditBox(dewdropEditBoxFrame.editBox)
							dewdropEditBoxFrame.editBox:DisableDrawLayer("BACKGROUND")
						end
					end
					if not dewdropSliderFrame and self.hasSlider then
						dewdropSliderFrame = AS:FindFrameBySizeChild({"Slider", "EditBox"}, 100, 170)

						if dewdropSliderFrame then
							S:SetTemplate(dewdropSliderFrame)
							S:HandleSliderFrame(dewdropSliderFrame.slider)
							S:SkinEditBox(dewdropSliderFrame.currentText)
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
					S:SetTemplate(frame, "Transparent")
					S:HandleSliderFrame(frame.slider)

					frame.isSkinned = true
				end

				i = i + 1
			end
		end
	end

	if not S:IsHooked(lib, "Open") then
		S:SecureHook(lib, "Open", function(self, fakeParent, parent)
			S:SetTemplate(_G["Tablet20Frame"], "Transparent")
			SkinDetachedFrame(self, fakeParent, parent)
		end)
	end

	if not S:IsHooked(lib, "Detach") then
		S:SecureHook(lib, "Detach", function(self, parent)
			SkinDetachedFrame(self, parent)
		end)
	end
end

local function SkinRockConfig(lib)
	local function SkinMainFrame(self)
		if self.base.isSkinned then return end

		S:SetTemplate(self.base, "Transparent")
		S:StripTextures(self.base.header)
		S:HandleCloseButton(self.base.closeButton, self.base)

		S:SetTemplate(self.base.treeView)
		S:HandleScrollBar(self.base.treeView.scrollBar)
		S:HandleDropDownBox(self.base.addonChooser)

		self.base.addonChooser.text:SetHeight(20)
		S:SetTemplate(self.base.addonChooser.text)
		S:HandleNextPrevButton(self.base.addonChooser.button)

		local pullout = _G[self.base.mainPane:GetName().."_ChoicePullout"]
		if pullout then
			S:SetTemplate(pullout)
		else
			S:SecureHookScript(self.base.addonChooser.button, "OnClick", function(self)
				S:SetTemplate(_G[lib.base.mainPane:GetName().."_ChoicePullout"])
				S:Unhook(self, "OnClick")
			end)
		end

		S:SetTemplate(self.base.mainPane)
		S:HandleScrollBar(self.base.mainPane.scrollBar)

		S:SetTemplate(self.base.treeView.sizer)

		self.base.isSkinned = true
	end

	S:SecureHook(lib, "OpenConfigMenu", function(self)
		SkinMainFrame(self)
		S:Unhook(self, "OpenConfigMenu")
	end)

	local LR = LibStub("LibRock-1.0", true)
	if LR then
		for object in LR:IterateMixinObjects("LibRockConfig-1.0") do
			if not S:IsHooked(object, "OpenConfigMenu") then
				S:SecureHook(object, "OpenConfigMenu", function(self)
					SkinMainFrame(lib)
					S:Unhook(self, "OpenConfigMenu")
				end)
			end
		end
	end
end

function R:Libraries()
	local Dewdrop = LibStub("Dewdrop-2.0", true)
	if Dewdrop and not S:IsHooked(Dewdrop, "Open") then
		S:SecureHook(Dewdrop, "Open", SkinDewdrop2)
	end

	local Tablet = LibStub("Tablet-2.0", true)
	if Tablet then
		SkinTablet2(Tablet)
	end

	local LRC = LibStub("LibRockConfig-1.0", true)
	if LRC then
		SkinRockConfig(LRC)
	end

	local LZF = LibStub("ZFrame-1.0", true)
	if LZF and not S:IsHooked(LZF, "Create") then
		S:RawHook(LZF, "Create", function(self, ...)
			local frame = AS.hooks[self].Create(self, ...)
			S:SetTemplate(frame.ZMain)
			frame.ZMain.close:SetSize(32, 32)
			S:HandleCloseButton(frame.ZMain.close, frame.ZMain)
			return frame
		end, true)
	end

	local Poncho = LibStub('Poncho-1.0', true)
	if Poncho then
		if SushiDropFrame then
			S:SecureHook(SushiDropFrame, 'SetMenu', function(self)
				if not self.bg.backdrop then
					self.bg:SetBackdrop(nil)
					self.bg.SetBackdrop = function() end
					S:CreateBackdrop(self.bg)
				end
			end)
		end
	end

	local DBIcon = LibStub("LibDBIcon-1.0", true)
	if DBIcon and DBIcon.tooltip and DBIcon.tooltip:IsObjectType('GameTooltip') then
		S:HandleTooltip(DBIcon.tooltip, nil, true)
	end

	local LSF = LibStub("LibSimpleFrame-Mod-1.0", true)
	if LSF then
		for _, frame in pairs(LSF.registry) do
			S:SetTemplate(frame)
			frame.SetBackdropColor = S.noop
			frame.SetBackdropBorderColor = S.noop
		end
	end

	local LET = LibStub('LibExtraTip-1', true)
	if LET then
		LET:AddCallback(function(tip,_,_,_,_,quality)
			local extraTip = LET:GetExtraTip(tip)
			if extraTip then
				S:SetTemplate(extraTip)
				if quality and quality > 1 then
					local color = _G.BAG_ITEM_QUALITY_COLORS[quality]
					extraTip:SetBackdropBorderColor(color.r, color.g, color.b)
				end
			end
		end, 0)
		S:SecureHook(LET, "GetFreeExtraTipObject", function(tip)
			local tooltip = S.hooks[tip].GetFreeExtraTipObject(tip)

			if not tooltip.isSkinned then
				S:SetTemplate(tooltip)
				tooltip.isSkinned = true
			end

			return tooltip
		end)
	end

	local LQT = LibStub("LibQTip-1.0", true)
	if LQT then
		S:SecureHook(LQT, 'Acquire', function()
			for _, tooltip in LQT:IterateTooltips() do
				if not tooltip.isSkinned then
					S:HandleTooltip(tooltip)
					tooltip.isSkinned = true
				end
			end
		end)
	end

	local LQTRS = LibStub("LibQTip-1.0RS", true)
	if LQTRS then
		S:SecureHook(LQTRS, 'Acquire', function()
			for _, tooltip in LQTRS:IterateTooltips() do
				if not tooltip.isSkinned then
					S:HandleTooltip(tooltip)
					tooltip.isSkinned = true
				end
			end
		end)
	end
end

AS:RegisterSkin('Libraries')
