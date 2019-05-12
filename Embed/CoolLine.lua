local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
--WoW API / Variables
-- GLOBALS:

if AS:CheckAddOn('CoolLine') then
	function AS:Embed_CoolLine()
		if not _G.CoolLineDB.vertical then
			if AS:CheckAddOn('ElvUI') then
				_G.CoolLine:SetPoint('BOTTOMRIGHT', _G.ElvUI_Bar1, 'TOPRIGHT', 0, 4)
				_G.CoolLine:SetPoint("BOTTOMLEFT", _G.ElvUI_Bar1, "TOPLEFT", 0, 4)
			elseif AS:CheckAddOn('Tukui') then
				local function OnShow()
					_G.CoolLine:Point('BOTTOM', AS.ActionBar4, 'TOP', 0, 1)
					_G.CoolLineDB.h = _G.ActionButton1:GetHeight()
					_G.CoolLineDB.w = AS.ActionBar4:GetWidth()
					_G.CoolLine.updatelook()
				end

				local function OnHide()
					_G.CoolLine:Point('BOTTOM', AS.ActionBar1, 'TOP', 0, 1)
					_G.CoolLineDB.h = _G.ActionButton1:GetHeight()
					_G.CoolLineDB.w = AS.ActionBar1:GetWidth()
					_G.CoolLine.updatelook()
				end

				if AS.ActionBar4:IsShown() then
					OnShow()
				else
					OnHide()
				end

				AS.ActionBar4:HookScript('OnShow', OnShow)
				AS.ActionBar4:HookScript('OnHide', OnHide)
				_G.CoolLine.updatelook()
			end
		end
	end
end
