local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('alDamageMeter') then return end

function AS:alDamageMeter()
	alDamageMeterFrame.bg:Kill()
	AS:SkinBackdropFrame(alDamageMeterFrame, 'Transparent')
	alDamageMeterFrame:HookScript('OnShow', function()
		if AS:CheckEmbed('alDamageMeter') then
			AS:Embed_Check()
		end
	end)
end

AS:RegisterSkin('alDamageMeter', AS.ALDamageMeter)