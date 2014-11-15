local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('CLCInfo') then return end

function AS:CLCInfo(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		local function ApplyIconSkin(self)
			local Font, FontSize = NumberFontNormal:GetFont()
			local xScale = self.db.width / 36
			local yScale = self.db.height / 36
			local texMain = self.elements.texMain
			local texNormal = self.elements.texNormal
			local texHighlight = self.elements.texHighlight
			local texGloss = self.elements.texGloss
			local cooldown = self.elements.cooldown
			local count = self.elements.count

			texMain:ClearAllPoints()
			texMain:SetInside(self)
			AS:SkinTexture(texMain)

			texNormal:Hide()
			texHighlight:Hide()
			texGloss:Hide()

			if not self.elements.backdropFrame then
				local bg = CreateFrame('Frame', nil, self.elements)
				AS:SetTemplate(bg, 'Default')
				bg:SetOutside(self)
				bg:SetFrameLevel(self:GetFrameLevel() - 1)
				bg:Show()
				self.elements.backdropFrame = bg
			else
				self.elements.backdropFrame:Show()
			end
			count:ClearAllPoints()
			count:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 4, 0)
			count:SetFont(Font, FontSize, 'OUTLINE')
		end

		local function ApplyBarSkin(self)
			local opt = self.db
			local bar = self.elements

			if not bar.backdropFrame then
				local bg = CreateFrame('Frame', nil, bar)
				AS:SetTemplate(bg, 'Default')
				bg:SetOutside(self)
				bg:SetFrameLevel(self:GetFrameLevel() - 1)
				bg:Show()
				bar.backdropFrame = bg
			else
				bar.backdropFrame:Show()
			end

			AS:SetTemplate(bar.iconFrame)
		end

		local function TryGridPositioning(self)
			if self.db.gridId <= 0 then return end

			local f = clcInfo.display.grids.active[self.db.gridId]
			if not f then return end

			local g = f.db

			self.db.width = g.cellWidth * self.db.sizeX + g.spacingX * (self.db.sizeX - 1) 
			self.db.height = g.cellHeight * self.db.sizeY + g.spacingY * (self.db.sizeY - 1)
			self:ClearAllPoints()
			self:SetWidth(self.db.width)
			self:SetHeight(self.db.height)

			local x = g.cellWidth * (self.db.gridX - 1) + g.spacingX * (self.db.gridX - 1)
			local y = g.cellHeight * (self.db.gridY - 1) + g.spacingY * (self.db.gridY - 1)
			self:SetPoint('BOTTOMLEFT', f, 'BOTTOMLEFT', x, y)

			return true
		end

		local function UpdateIconLayout(self)
			local onGrid = TryGridPositioning(self)
			local skinType, g
			if onGrid and self.db.skinSource == 'Grid' then
				g = clcInfo.display.grids.active[self.db.gridId].db.skinOptions.icons
			elseif self.db.skinSource == 'Template' then
				g = clcInfo.activeTemplate.skinOptions.icons
			else
				g = self.db.skin
			end
			skinType = g.skinType

			if skinType == 'AddOnSkins' then
				ApplyIconSkin(self)
			elseif self.elements.backdropFrame then
				self.elements.backdropFrame:Hide()
			end
		end

		local function UpdateBarLayout(self)
			local onGrid = TryGridPositioning(self)
			local skinType, g
			if onGrid and self.db.skinSource == 'Grid' then
				g = clcInfo.display.grids.active[self.db.gridId].db.skinOptions.icons
			elseif self.db.skinSource == 'Template' then
				g = clcInfo.activeTemplate.skinOptions.icons
			else
				g = self.db.skin
			end
			skinType = g.skinType

			if skinType == 'AddOnSkins' then
				ApplyBarSkin(self)
			elseif self.elements.backdropFrame then
				self.elements.backdropFrame:Hide()
			end
		end

		local function NewIcon(self, index)
			local icon = self.active[index]
			if icon then
				hooksecurefunc(icon, 'UpdateLayout', UpdateIconLayout)
				icon:UpdateLayout()
			end
		end

		local function NewBar(self, index)
			local bar = self.active[index]
			if bar then
				hooksecurefunc(bar, 'UpdateLayout', UpdateBarLayout)
				bar:UpdateLayout()
			end
		end

		hooksecurefunc(clcInfo.display['icons'], 'New', NewIcon)
		hooksecurefunc(clcInfo.display['bars'], 'New', NewBar)
	end
	if addon == 'clcInfo_Options' then
		local function GetSkinTypeList()
			local list = { ['Default'] = 'Default', ["BareBone"] = "BareBone", ['AddOnSkins'] = 'AddOnSkins' }
			if clcInfo.MSQ then list["Masque"] = "Masque" end
			return list
		end
		hooksecurefunc(clcInfo_Options, 'LoadActiveTemplate', function(self)
			local options = clcInfo_Options.options
			if not clcInfo.activeTemplate then return end
			options.args.activeTemplate.args.skins.args.icons.args.selectType.args.skinType.values = GetSkinTypeList()
			options.args.activeTemplate.args.skins.args.micons.args.selectType.args.skinType.values = GetSkinTypeList()
		end)
		hooksecurefunc(clcInfo_Options, 'UpdateGridList', function(self)
			local db = clcInfo.display.grids.active
			local optionsGrids = self.options.args.activeTemplate.args.grids
			for i = 1, #db do
				local options = optionsGrids.args[tostring(i)].args.tabSkins.args
				options.icons.args.selectType.args.skinType.values = GetSkinTypeList()
				options.micons.args.selectType.args.skinType.values = GetSkinTypeList()
			end
		end)
		hooksecurefunc(clcInfo_Options, 'UpdateIconList', function(self)
			local db = clcInfo.display.icons.active
			local optionsIcons = self.options.args.activeTemplate.args.icons
			for i = 1, #db do
				local options = optionsIcons.args[tostring(i)].args.tabSkin.args
				options.selectType.args.skinType.values = GetSkinTypeList()
			end
		end)
		hooksecurefunc(clcInfo_Options, 'UpdateMIconList', function(self)
			local db = clcInfo.display.micons.active
			local optionsMIcons = self.options.args.activeTemplate.args.micons
			for i = 1, #db do
				local options = optionsMIcons.args[tostring(i)].args.tabSkin.args
				options.selectType.args.skinType.values = GetSkinTypeList()
			end
		end)
		AS:UnregisterSkinEvent('CLCInfo', 'ADDON_LOADED')
	end
end

AS:RegisterSkin('CLCInfo', AS.CLCInfo, 'ADDON_LOADED')