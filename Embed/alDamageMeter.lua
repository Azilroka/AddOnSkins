local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('alDamageMeter') then return end

local _G = _G

local floor = floor

function AS:Embed_alDamageMeter()
	local EmbedParent = _G.EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = strlower(AS:CheckOption('EmbedRight')) == 'aldamagemeter' and _G.EmbedSystem_RightWindow or _G.EmbedSystem_LeftWindow end

	_G.dmconf.barheight = floor((EmbedParent:GetHeight() / _G.dmconf.maxbars) - _G.dmconf.spacing)
	_G.dmconf.width = EmbedParent:GetWidth()

	if AS:CheckOption('TinyDPS') then
		_G.alDamageMeterFrame.Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
		_G.alDamageMeterFrame.bg:Kill()
	end

	_G.alDamageMeterFrame:ClearAllPoints()
	_G.alDamageMeterFrame:SetInside(EmbedParent, 2, 2)
	_G.alDamageMeterFrame:SetParent(EmbedParent)
	_G.alDamageMeterFrame:SetFrameStrata(EmbedParent:GetFrameStrata())
	_G.alDamageMeterFrame:SetFrameLevel(EmbedParent:GetFrameLevel())
end
