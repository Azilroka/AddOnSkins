local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Bagnon') then return end

function AS:Bagnon(event, addon)
	for k, frame in Bagnon:IterateFrames() do
		if frame and not frame.isSkinned then
			AS:SkinFrame(frame)
			frame:HookScript('OnUpdate', function(self)
				if self and self.closeButton and not self.closeButton.isSkinned then
					AS:SkinCloseButton(self.closeButton)
					self.closeButton.isSkinned = true
				end
			end)
			frame.isSkinned = true
		end
	end
end

AS:RegisterSkin('Bagnon', AS.Bagnon, 'BANKFRAME_OPENED', 'GUILDBANKFRAME_OPENED', 'VOID_STORAGE_OPEN')