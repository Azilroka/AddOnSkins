local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('RaresTip') then return end

function AS:RaresTip()
	AS:SkinTooltip(RaresTip)
	AS:SkinTooltip(RaresTipSecondary)
	RaresTip:HookScript('OnUpdate', function(self)
		if _G['RaresTipTextLeft1']:GetText() and strfind(_G['RaresTipTextLeft1']:GetText(), '|T') then
			_G['RaresTipTextLeft1']:SetText(gsub(_G['RaresTipTextLeft1']:GetText(),'(:0|t)',':24:24:0:0:64:64:5:59:5:59|t'))
		end
	end)
end

AS:RegisterSkin('RaresTip', AS.RaresTip)