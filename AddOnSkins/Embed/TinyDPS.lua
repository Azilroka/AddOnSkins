local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('TinyDPS') then return end

-- Cache global variables
--Lua functions
local _G = _G
--WoW API / Variables
-- GLOBALS:

function AS:Embed_TinyDPS()
	local EmbedParent = _G.EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'TinyDPS' and _G.EmbedSystem_RightWindow or _G.EmbedSystem_LeftWindow end

	AS:SetTemplate(_G.tdpsFrame.Backdrop, AS:CheckOption('EmbedBackdropTransparent') and 'Transparent' or 'Default')
	_G.tdpsFrame:SetParent(EmbedParent)
	_G.tdpsFrame:SetFrameStrata(EmbedParent:GetFrameStrata())
	_G.tdpsFrame:SetFrameLevel(EmbedParent:GetFrameLevel())
	_G.tdpsAnchor:ClearAllPoints()
	_G.tdpsAnchor:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	_G.tdpsAnchor:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
	_G.tdpsFrame:SetWidth(_G.tdpsAnchor:GetWidth())

	_G.tdps.hideOOC = false
	_G.tdps.hideIC = false
	_G.tdps.hideSolo = false
	_G.tdps.hidePvP = false
	_G.tdpsRefresh()
end
