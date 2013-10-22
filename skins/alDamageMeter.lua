local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = "alDamageMeterSkin"
function AS:SkinALDamageMeter()
	alDamageMeterFrame.bg:Kill()
	AS:SkinBackdropFrame(alDamageMeterFrame, 'Transparent')
	alDamageMeterFrame:HookScript('OnShow', function()
		if AS:CheckOption('EmbedalDamageMeter') then
			EmbedSystem_MainWindow:Show()
		end
	end)
end

AS:RegisterSkin(name, AS.SkinALDamageMeter)