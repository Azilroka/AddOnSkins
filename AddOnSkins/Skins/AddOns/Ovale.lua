local AS, L, S, R = unpack(AddOnSkins)

function R:Ovale()
	hooksecurefunc(LibStub:GetLibrary("ovale/Icon").OvaleIcon, 'Update', function(self)
		S:StripTextures(self.parent.frame)

		if not self.frame.backdrop then
			S:HandleFrame(self.frame, true)
			self.frame.backdrop:SetFrameLevel(0)
			self.frame.backdrop:SetAllPoints()
			self.frame.backdrop:SetScale(AS.UIScale)
		end
		if self.shortcut then
			self.shortcut:ClearAllPoints()
			self.shortcut:SetPoint('TOPLEFT', self.frame, 'TOPLEFT', -1, -3)
		end
		if self.icone then
			S:HandleIcon(self.icone)
			S:SetInside(self.icone)
		end
	end)
end

AS:RegisterSkin('Ovale')
