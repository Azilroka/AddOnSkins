local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('StormEarthAndFire') then return end

function AS:StormEarthAndFire()
	for i = 1, 2 do 	
		local f = _G["StormEarthAndFireFrame"..i]
		if f then
			local color = RAID_CLASS_COLORS[AS.MyClass]
			AS:SkinFrame(f, 'Default')
			AS:SkinTexture(f.icon)
			f.icon:SetDrawLayer("BACKGROUND", 2)
			f.SetBackdropColor = function(frame, ...)
				frame:SetBackdropBorderColor(color.r, color.g, color.b)
			end
			f.ResetBackdropColor = function(frame, ...)
				frame:SetBackdropBorderColor(0, 0, 0)
			end
			f.healthBar:SetStatusBarTexture(AS.NormTex)
		end
	end
end

AS:RegisterSkin('StormEarthAndFire', AS.StormEarthAndFire)