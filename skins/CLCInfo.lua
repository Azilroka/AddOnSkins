local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'CLCInfoSkin'
function AS:SkinCLCInfo(event, addon)
	if event == 'PLAYER_ENTERING_WORLD' then
		local function ApplyIconSkin(self)
			local xScale = self.db.width / 36
			local yScale = self.db.height / 36

			local t = self.elements.texMain
			t:ClearAllPoints()
			t:SetInside(self)
			t:SetTexCoord(unpack(AS.TexCoords))

			t = self.elements.texNormal
			t:Hide()

			t = self.elements.texHighlight
			t:SetTexture("Interface\\AddOns\\clcInfo\\textures\\IconHighlight")
			t:SetSize(self.db.width, self.db.height)
			t:ClearAllPoints()
			t:SetPoint("CENTER", self.elements, "CENTER", 0, 0)
			t:SetVertexColor(1, 1, 1, 1)

			t = self.elements.texGloss
			t:Hide()

			t = self.elements.cooldown
			if not t.isRegistered then
				ElvUI[1]:RegisterCooldown(t)
				t.isRegistered = true
			end

			if not self.elements.backdropFrame then
				local bg = CreateFrame('Frame', nil, self.elements)
				bg:SetTemplate('Default')
				bg:SetOutside(self)
				bg:SetFrameLevel(self:GetFrameLevel() - 1)
				bg:Show()
				self.elements.backdropFrame = bg
			else
				self.elements.backdropFrame:Show()
			end

			t.OldSetTexture = t.SetTexture
			t.SetTexture = function(self, tex, ...)
				t.OldSetTexture(self, tex, ...)
				
				if tex ~= nil then
					self.elements.backdropFrame:Show();
				else
					self.elements.backdropFrame:Hide()
				end
			end

			local count = self.elements.count
			count:SetSize(40 * xScale, 10 * yScale)
			count:ClearAllPoints()
			count:SetPoint("CENTER", self.elements, "CENTER", -2 * xScale, -8 * yScale)
			count:FontTemplate()
		end

		local function ApplyBarSkin(self)
			local opt = self.db
			local bar = self.elements
			bar:CreateBackdrop('Transparent')
			bar.iconFrame:SetTemplate()
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
			self:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", x, y)

			return true
		end

		local function UpdateIconLayout(self)
			local onGrid = TryGridPositioning(self)
			local skinType, g
			if onGrid and self.db.skinSource == "Grid" then
				g = clcInfo.display.grids.active[self.db.gridId].db.skinOptions.icons
			elseif self.db.skinSource == "Template" then
				g = clcInfo.activeTemplate.skinOptions.icons
			else
				g = self.db.skin
			end
			skinType = g.skinType

			if skinType == "ElvUI" then
				ApplyIconSkin(self)
			elseif self.elements.backdropFrame then
				self.elements.backdropFrame:Hide()
			end
		end

		local function UpdateBarLayout(self)
			local onGrid = TryGridPositioning(self)
			local skinType, g
			if onGrid and self.db.skinSource == "Grid" then
				g = clcInfo.display.grids.active[self.db.gridId].db.skinOptions.bars
			elseif self.db.skinSource == "Template" then
				g = clcInfo.activeTemplate.skinOptions.bars
			else
				g = self.db.skin
			end
			skinType = g.skinType
			ApplyBarSkin(self)
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
		local function LoadActiveTemplate(self)
			local options = clcInfo_Options.options
			if not clcInfo.activeTemplate then return end
			options.args.activeTemplate.args.skins.args.icons.args.selectType.args.skinType.values = options.args.activeTemplate.args.skins.args.icons.args.selectType.args.skinType.values()
			options.args.activeTemplate.args.skins.args.icons.args.selectType.args.skinType.values['ElvUI'] = 'ElvUI'

			options.args.activeTemplate.args.skins.args.micons.args.selectType.args.skinType.values = options.args.activeTemplate.args.skins.args.micons.args.selectType.args.skinType.values()
			options.args.activeTemplate.args.skins.args.micons.args.selectType.args.skinType.values['ElvUI'] = 'ElvUI'	
		end

		local function UpdateGridList(self)
			local db = clcInfo.display.grids.active
			local optionsGrids = self.options.args.activeTemplate.args.grids
			for i = 1, #db do
				local options = optionsGrids.args[tostring(i)].args.tabSkins.args
				options.icons.args.selectType.args.skinType.values = options.icons.args.selectType.args.skinType.values()
				options.icons.args.selectType.args.skinType.values['ElvUI'] = 'ElvUI'
				options.micons.args.selectType.args.skinType.values = options.micons.args.selectType.args.skinType.values()
				options.micons.args.selectType.args.skinType.values['ElvUI'] = 'ElvUI'		
			end
		end

		local function UpdateIconList(self)
			local db = clcInfo.display.icons.active
			local optionsIcons = self.options.args.activeTemplate.args.icons
			for i = 1, #db do
				local options = optionsIcons.args[tostring(i)].args.tabSkin.args
				options.selectType.args.skinType.values = options.selectType.args.skinType.values()
				options.selectType.args.skinType.values['ElvUI'] = 'ElvUI'
			end
		end

		local function UpdateMIconList(self)
			local db = clcInfo.display.micons.active
			local optionsMIcons = self.options.args.activeTemplate.args.micons
			for i = 1, #db do
				local options = optionsMIcons.args[tostring(i)].args.tabSkin.args
				options.selectType.args.skinType.values = options.selectType.args.skinType.values()
				options.selectType.args.skinType.values['ElvUI'] = 'ElvUI'
			end
		end

		hooksecurefunc(clcInfo_Options, 'LoadActiveTemplate', LoadActiveTemplate)
		hooksecurefunc(clcInfo_Options, 'UpdateGridList', UpdateGridList)
		hooksecurefunc(clcInfo_Options, 'UpdateIconList', UpdateIconList)
		hooksecurefunc(clcInfo_Options, 'UpdateMIconList', UpdateMIconList)
		AS:UnregisterEvent(name, "ADDON_LOADED")
	end
end

AS:RegisterSkin(name, AS.SkinCLCInfo, "ADDON_LOADED")