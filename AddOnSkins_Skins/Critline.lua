local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Critline') then return end

local name = 'CritlineSkin'
function AS:SkinCritline()
	AS:SkinBackdropFrame(Critline.display)
	local Backdrop = Critline.display.backdrop or Critline.display.Backdrop
	Backdrop:SetFrameStrata('BACKGROUND')
end

AS:RegisterSkin(name, AS.SkinCritline)