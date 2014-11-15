local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RareCoordinator') then return end

function AS:RareCoordinator()
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
	AS:StripTextures(RC.opt.sound)
	AS:StripTextures(RC.opt.tomtom)
	AS:StripTextures(RC.opt.notify)
	AS:StripTextures(RC.opt.colorize)
	AS:StripTextures(RC.opt.sort)
end

AS:RegisterSkin('RareCoordinator', AS.RareCoordinator)