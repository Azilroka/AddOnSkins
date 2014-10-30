local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AtlasLoot') then return end

local name = 'AtlasLootSkin'
function AS:SkinAtlasLoot(event, addon)
	AS:SkinFrame(AtlasLootTooltip)
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
	end)

	local AtlasLootFrame = _G["AtlasLoot_GUI-Frame"]
	AS:SkinFrame(AtlasLootFrame)
	AS:SkinCloseButton(AtlasLootFrame.CloseButton)
	AtlasLootFrame.titleFrame:StripTextures()

	local function SkinDropDown(Frame)
		AS:SkinFrame(_G[Frame])
		AS:SkinNextPrevButton(_G[Frame..'-button'])
		local a, b, c, d, e = _G[Frame..'-button']:GetPoint()
		_G[Frame..'-button']:SetPoint(a, b, c, d - 4, 0)
		_G[Frame]:HookScript('OnUpdate', function(self)
			for i = 1, 3 do
				local Frame = _G['AtlasLoot-DropDown-CatFrame'..i]
				if Frame and not Frame.IsSkinned then
					local r, g, b = Frame:GetBackdropColor()
					AS:SkinFrame(Frame)
					Frame:SetBackdropBorderColor(r, g, b)
					Frame:SetBackdropColor(unpack(AS.BackdropColor))
					local a, f, c, d, e = Frame:GetPoint()
					Frame:SetPoint(a, f, c, d, e - 3)

					Frame:HookScript('OnShow', function(self)
						local a, f, c, d, e = Frame:GetPoint()
						Frame:SetPoint(a, f, c, d, e - 3)
						local r, g, b = Frame:GetBackdropColor()
						Frame:SetBackdropBorderColor(r, g, b)
						Frame:SetBackdropColor(unpack(AS.BackdropColor))
					end)

					Frame.IsSkinned = true
				end
			end
		end)
	end

	SkinDropDown('AtlasLoot-DropDown-1')
	SkinDropDown('AtlasLoot-DropDown-2')

	for i = 1, 3 do
		AS:SkinFrame(_G['AtlasLoot-Select-'..i])
	end

	local AtlasLootItemFrame = _G["AtlasLoot_GUI-ItemFrame"]
	AtlasLootItemFrame:CreateBackdrop()
	AS:SkinNextPrevButton(AtlasLootItemFrame.nextPageButton)		
	AS:SkinButton(AtlasLootItemFrame.modelButton)
	AS:SkinButton(AtlasLootItemFrame.soundsButton)
	AS:SkinNextPrevButton(AtlasLootItemFrame.prevPageButton)
	AS:SkinButton(AtlasLootItemFrame.itemsButton)
	AS:SkinButton(AtlasLootItemFrame.clasFilterButton)
	AtlasLootItemFrame.clasFilterButton.texture:SetInside()
	AtlasLootItemFrame.clasFilterButton:HookScript('OnUpdate', function(self)
		if self.texture:GetTexture() == "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes" then
			self.texture:SetTexCoord(CLASS_ICON_TCOORDS[AS.MyClass][1] + 0.015, CLASS_ICON_TCOORDS[AS.MyClass][2] - 0.02, CLASS_ICON_TCOORDS[AS.MyClass][3] + 0.018, CLASS_ICON_TCOORDS[AS.MyClass][4] - .02)
		else
			AS:SkinTexture(self.texture)
		end
	end)
end

AS:RegisterSkin(name, AS.SkinAtlasLoot)