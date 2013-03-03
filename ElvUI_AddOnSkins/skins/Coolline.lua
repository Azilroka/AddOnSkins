local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "CoolLineSkin"
local function SkinCoolLine(self)
	CoolLineDB.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
	CoolLineDB.border  = "None"
	CoolLine.updatelook()
	AS:SkinBackdropFrame(CoolLine)
	CoolLine.backdrop:SetAllPoints(CoolLine)
	if not E.PixelMode then CoolLine.backdrop:CreateShadow() end

	if AS:CheckOption("EmbedCoolLine") then
		if not CoolLineDB.vertical then
			CoolLineDB.w = ElvUI_Bar1:GetWidth() - (E.PixelMode and 4 or 0)
			CoolLineDB.h = ElvUI_Bar1Button1:GetHeight()
			local bar = CoolLine
			bar.updatelook()
			bar:ClearAllPoints()
	
			bar:Point('BOTTOM', ElvUI_Bar1, 'TOP', 0, 1)
		
			bar:EnableMouse(false)
			PetBattleFrame:HookScript("OnShow",function() bar:Hide() end)
			PetBattleFrame:HookScript("OnHide",function() bar:Show() end)
		else
			print("Sorry will not embed a vertical frame.")
		end
		CoolLine.updatelook()
	end
end

AS:RegisterSkin(name,SkinCoolLine)