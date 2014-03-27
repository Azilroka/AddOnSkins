local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('alDamageMeter') then return end

local name = 'alDamageMeterSkin'
function AS:SkinALDamageMeter()
	alDamageMeterFrame.bg:Kill()
	AS:SkinBackdropFrame(alDamageMeterFrame, 'Transparent')
	alDamageMeterFrame:HookScript('OnShow', function()
		if AS:CheckEmbed('alDamageMeter') then
			EmbedSystem_MainWindow:Show()
		end
	end)
end

AS:RegisterSkin(name, AS.SkinALDamageMeter)