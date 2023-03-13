local AS, L, S, R = unpack(AddOnSkins)

function R:AtlasLoot(event, addon)
	S:HandleFrame(AtlasLootTooltip)
	AtlasLootTooltip:HookScript('OnShow', function(self)
		local Link = select(2, self:GetItem())
		local Quality = Link and select(3, GetItemInfo(Link))
		if (Quality and Quality >= 2) then
			R, G, B = GetItemQualityColor(Quality)
			self:SetBackdropBorderColor(R, G, B)
		else
			self:SetBackdropBorderColor(unpack(AS.BorderColor))
		end
		self:SetBackdropColor(unpack(AS.BackdropColor))
		if _G["AtlasLoot-MountToolTip"] then
			S:HandleFrame(_G["AtlasLoot-MountToolTip"], nil, true)
			S:HandleIcon(_G["AtlasLoot-MountToolTip"].icon)
			_G["AtlasLoot-MountToolTip"]:SetBackdropBorderColor(self:GetBackdropBorderColor())
		end
		if _G["AtlasLoot-PetToolTip"] then
			S:HandleFrame(_G["AtlasLoot-PetToolTip"], nil, true)
			S:HandleIcon(_G["AtlasLoot-PetToolTip"].icon)
			_G["AtlasLoot-PetToolTip"]:SetBackdropBorderColor(self:GetBackdropBorderColor())
		end
		if _G["AtlasLoot-FactionToolTip"] then
			S:HandleFrame(_G["AtlasLoot-FactionToolTip"], nil, true)
			S:HandleIcon(_G["AtlasLoot-FactionToolTip"].icon)
			_G["AtlasLoot-FactionToolTip"]:SetBackdropBorderColor(self:GetBackdropBorderColor())
		end
	end)


	local AtlasLootFrame = _G["AtlasLoot_GUI-Frame"]
	S:HandleFrame(AtlasLootFrame)
	S:HandleCloseButton(AtlasLootFrame.CloseButton)
	S:StripTextures(AtlasLootFrame.titleFrame)

	local function SkinDropDown(Frame)
		S:HandleFrame(_G[Frame])
		S:HandleNextPrevButton(_G[Frame..'-button'])
		local a, b, c, d, e = _G[Frame..'-button']:GetPoint()
		_G[Frame..'-button']:SetPoint(a, b, c, d - 4, 0)
		_G[Frame]:HookScript('OnUpdate', function(self)
			for i = 1, 3 do
				local CatFrame = _G['AtlasLoot-DropDown-CatFrame'..i]
				if CatFrame and not CatFrame.IsSkinned then
					local r, g, b = CatFrame:GetBackdropColor()
					S:HandleFrame(CatFrame)
					CatFrame:SetBackdropColor(r, g, b)

					CatFrame:HookScript('OnShow', function(self)
						local a, f, c, d, e = self:GetPoint()
						self:SetPoint(a, f, c, d, e - 3)
					end)

					CatFrame:GetScript('OnShow')(CatFrame)
					CatFrame.IsSkinned = true
				end
			end
		end)
	end

	SkinDropDown('AtlasLoot-DropDown-1')
	SkinDropDown('AtlasLoot-DropDown-2')

	for i = 1, 3 do
		S:HandleFrame(_G['AtlasLoot-Select-'..i])
	end

	local AtlasLootItemFrame = _G["AtlasLoot_GUI-ItemFrame"]
	S:CreateBackdrop(AtlasLootItemFrame)
	S:HandleNextPrevButton(AtlasLootItemFrame.nextPageButton)
	S:HandleButton(AtlasLootItemFrame.modelButton)
	S:HandleButton(AtlasLootItemFrame.soundsButton)
	S:HandleNextPrevButton(AtlasLootItemFrame.prevPageButton)
	S:HandleButton(AtlasLootItemFrame.itemsButton)
	S:HandleButton(AtlasLootItemFrame.clasFilterButton)
	S:SetInside(AtlasLootItemFrame.clasFilterButton.texture)
	AtlasLootItemFrame.clasFilterButton:HookScript('OnUpdate', function(self)
		if self.texture:GetTexture() == "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes" then
			self.texture:SetTexCoord(CLASS_ICON_TCOORDS[AS.MyClass][1] + 0.015, CLASS_ICON_TCOORDS[AS.MyClass][2] - 0.02, CLASS_ICON_TCOORDS[AS.MyClass][3] + 0.018, CLASS_ICON_TCOORDS[AS.MyClass][4] - .02)
		else
			S:HandleIcon(self.texture)
		end
	end)
end

AS:RegisterSkin('AtlasLoot')
