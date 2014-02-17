local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('PallyPower') then return end

local name = 'PallyPowerSkin'
function AS:SkinPallyPower()
	self.db = LibStub("AceDB-3.0"):New("PallyPowerDB", PallyPower.defaults, "Default")
	local settings = self.db.profile
	settings.buffscale = 1
	settings.display.buttonWidth = 103
	settings.display.buttonHeight = 37

	local _applyskin = PallyPower.ApplySkin
	function PallyPower:ApplySkin(skinname)
		local needSkinning = {PallyPowerAutoBtn, PallyPowerRFBtn, PallyPowerAuraBtn}

		for _, frame in pairs(needSkinning) do

			frame:SetBackdrop({
				bgFile = AS.Blank,
				insets = {left = 2, right = 2, top = 2, bottom = 2}
			})

			if not frame.bg then
				frame.bg = CreateFrame("Frame", nil, frame)
				frame.bg:SetAllPoints(frame)
				frame.bg:SetFrameLevel(frame:GetFrameLevel() - 1)
				frame.bg:SetTemplate("Transparent")
			end

			local fname = frame:GetName()
			for _, fontstring in pairs({"Time", "Text", "TimeSeal"}) do
				local fs = _G[fname..fontstring]
				if fs then
					local _, size = fs:GetFont()
					fs:SetFont(AS.PixelFont, 8, 'MONOCHROMEOUTLINE')
					if not fname:find("PowerC%d+P%d+$") then
						if fontstring == "Text" then
							fs:ClearAllPoints()
							fs:SetJustifyH("LEFT")
							fs:SetWidth(999)
							fs:SetPoint("TOPLEFT", 33, 0)
						else
							fs:ClearAllPoints()
							fs:SetWidth(999)
							fs:SetJustifyH("RIGHT")
							fs:SetPoint("RIGHT", frame, "RIGHT", -4, 0)
						end
					end
				end
			end
			for _, tex in pairs({"Icon", "IconAura", "BuffIcon", "IconSeal", "IconRF"}) do
				if _G[fname..tex] and not _G[fname.."New"..tex] then
					local oldicon = _G[fname..tex]
					oldicon:SetAlpha(0)
					oldicon:ClearAllPoints()

					if fname == "PallyPowerAuraBtn" then
						if tex == "IconSeal" then
							oldicon:SetPoint("LEFT", 4, 0)
						else
							oldicon:SetPoint("LEFT", 34, 0)
						end
					elseif fname:find("(Au[rt][ao])$") then
						oldicon:SetPoint("LEFT", 4, 0)
					else
						oldicon:SetPoint("TOPLEFT", 4, -4)
					end

					local panel = CreateFrame("Frame", fname.."New"..tex, frame)
					panel:SetAllPoints(oldicon)
					panel:SetTemplate("Default")

					local icon = panel:CreateTexture()
					panel.icon = panel

					icon:SetPoint("TOPLEFT", panel, 2, -2)
					icon:SetPoint("BOTTOMRIGHT", panel, -2, 2)
					icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
					icon:SetTexture(oldicon:GetTexture())

					oldicon.SetTexture = function(tex, texstring)
						icon:SetTexture(texstring)
						if not texstring then
							panel:SetAlpha(0)
						else
							panel:SetAlpha(1)
						end
					end

					oldicon.SetVertexColor = function(self, ...)
						icon:SetVertexColor(...)
					end
				end
			end
		end
	end

	local _updatelayout = PallyPower.UpdateLayout
	function PallyPower:UpdateLayout()
		_updatelayout(self)

		for _, button in pairs({PallyPowerAutoBtn, PallyPowerRFBtn, PallyPowerAuraBtn}) do
			if not UnitAffectingCombat('player') then
				local a, p, b, x, y = button:GetPoint()
				button:SetPoint(a, p, b, x, y + 3)
			end
		end
	end

	PallyPower:ApplySkin()
	PallyPower:UpdateLayout()
end

AS:RegisterSkin(name, AS.SkinPallyPower)