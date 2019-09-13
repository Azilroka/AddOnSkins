local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Ovale') then return end

function AS:Ovale()
    hooksecurefunc(LibStub:GetLibrary("ovale/Icon").OvaleIcon, 'OvaleIcon_OnLoad', function(self)
		AS:StripTextures(self.parent.frame)
        
        if not self.frame.Backdrop then
            AS:SkinBackdropFrame(self.frame, true)
            self.frame.Backdrop:SetFrameLevel(0)
            self.frame.Backdrop:SetAllPoints()
            self.frame.Backdrop:SetScale(AS.UIScale)
        end
        if self.shortcut then
            self.shortcut:ClearAllPoints()
            self.shortcut:SetPoint('TOPLEFT', self.frame, 'TOPLEFT', -1, -3)
        end
        if self.icone then
            self.icone:SetDrawLayer("ARTWORK")
            AS:SkinTexture(self.icone)
            self.icone:SetInside(self.Backdrop)
        end
	end)
end

AS:RegisterSkin('Ovale', AS.Ovale)
