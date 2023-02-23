local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('TinyDPS') then return end

local ES = AS.EmbedSystem

local _G = _G

function ES:Embed_TinyDPS()
	local EmbedParent = AS:CheckOption('EmbedSystemDual') and (AS:CheckOption('EmbedRight') == 'TinyDPS' and ES.Right or ES.Left) or ES.Main

	S:SetTemplate(_G.tdpsFrame.backdrop, AS:CheckOption('EmbedBackdropTransparent') and 'Transparent')
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
