local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('alDamageMeter') then return end

local _G = _G

local floor = floor

function AS:Embed_alDamageMeter()
	local EmbedParent = _G.EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'alDamageMeter' and _G.EmbedSystem_RightWindow or _G.EmbedSystem_LeftWindow end
	EmbedParent.FrameName = "alDamageMeterFrame"

	dmconf.barheight = floor((EmbedParent:GetHeight() / dmconf.maxbars) - dmconf.spacing)
	dmconf.width = EmbedParent:GetWidth()

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
