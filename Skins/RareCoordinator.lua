local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RareCoordinator') then return end

local name = 'RareCoordinatorSkin'
function AS:SkinRareCoordinator()
	AS:SkinFrame(RC)
	AS:SkinFrame(RC.opt)
	AS:SkinFrame(RCnotify)
	AS:SkinFrame(RCminimized)
	AS:SkinButton(RC.opt.locked.button)
	AS:SkinDropDownBox(RC.opt.sound.dropdown)
	AS:SkinCheckBox(RC.opt.tomtom.cb)
	AS:SkinCheckBox(RC.opt.notify.cb)
	AS:SkinCheckBox(RC.opt.colorize.cb)
	AS:SkinCheckBox(RC.opt.sort.cb)
	RC.opt.sound:StripTextures()
	RC.opt.tomtom:StripTextures()
	RC.opt.notify:StripTextures()
	RC.opt.colorize:StripTextures()
	RC.opt.sort:StripTextures()
end

AS:RegisterSkin(name, AS.SkinRareCoordinator)