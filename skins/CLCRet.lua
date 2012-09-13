if not IsAddOnLoaded("ElvUI") then return end
local U = unpack(select(2,...))
local s = U.s
local c = U.c

local function UpdateButtonLayout(self, button, opt)
	button:Size(opt.size)
	button:ClearAllPoints()
	button:SetPoint(opt.point, clcretFrame, opt.pointParent, opt.x, opt.y)
	button:SetAlpha(opt.alpha)

	button.stack:ClearAllPoints()
	button.stack:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 4, 0)	
end

local function CreateButton(self, name, size, point, parent, pointParent, offsetx, offsety, bfGroup, isChecked)
	local db = self.db.profile
	clcretFrame:SetScale(1)
	clcretFrame.SetScale = c.noop
	
	name = "clcret" .. name
	local button
	if isChecked then
		button = CreateFrame("CheckButton", name , parent)
		button:CreateBackdrop("Default")
		button:StyleButton(true)
	else
		button = CreateFrame("Button", name , parent)
		button:CreateBackdrop("Default")
	end
	
	button.backdrop:SetAllPoints()
	
	button:EnableMouse(false)
	
	button:Size(size)
	
	button.texture = button:CreateTexture("$parentIcon", "OVERLAY")
	button.texture:Point("TOPLEFT", 2, -2)
	button.texture:Point("BOTTOMRIGHT", -2, 2)
	button.texture:SetTexture(BGTEX)
	button.texture:SetTexCoord(unpack(c.TexCoords))
	button.texture.SetTexCoord = c.noop
	
	button.texture.OldSetTexture = button.texture.SetTexture
	button.texture.SetTexture = function(self, tex, ...)
		button.texture.OldSetTexture(self, tex, ...)
		
		if tex ~= nil then
			button.backdrop:Show();
		else
			button.backdrop:Hide()
		end
	end
	
	button.border = button:CreateTexture(nil, "BORDER")
	button.border:Kill()
	
	button.cooldown = CreateFrame("Cooldown", "$parentCooldown", button)
	button.cooldown:Point("TOPLEFT", 2, -2)
	button.cooldown:Point("BOTTOMRIGHT", -2, 2)
	
	button.stack = button:CreateFontString("$parentCount", "OVERLAY", "TextStatusBarText")
	
	local fontFace, _, fontFlags = button.stack:GetFont()
	button.stack:SetFont(fontFace, 30, fontFlags)
	button.stack:SetJustifyH("RIGHT")
	button.stack:ClearAllPoints()
	button.stack:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 4, 0)
	
	button.defaultSize = button:GetWidth()
	
	button.SetScale = c.noop
	button:ClearAllPoints()
	button:SetPoint(point, parent, pointParent, offsetx, offsety)
	
	if self.LBF then
		self.LBF:Group("clcret", bfGroup):AddButton(button)
	end
		
	button:Hide()
	return button
end
local function LoadSkin()
if (select(2, UnitClass("player")) ~= "PALADIN") then
	return
end
	local name = "CLCRetSkin"
	local function SkinCLCRet(self)
		local clcret = LibStub("AceAddon-3.0"):GetAddon("clcret")
		clcret.CreateButton = CreateButton
		clcret.UpdateButtonLayout = UpdateButtonLayout
	end
end
s:RegisterSkin('CLCRet', LoadSkin)