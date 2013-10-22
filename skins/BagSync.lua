local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'BagSyncSkin'
function AS:SkinBagSync()
	local Frames = {
		BagSync_SearchFrame,
		BagSync_TokensFrame,
		BagSync_CraftsFrame,
		BagSync_BlackListFrame,
	}

	for _, frame in pairs(Frames) do
		AS:SkinFrame(frame)
		frame:HookScript('OnShow', function(self)
			if self.scrollbar and not self.scrollbar.isSkinned then
				self.scrollbar:CreateBackdrop()
				self.scrollbar:SetThumbTexture(AS.Blank)
				self.scrollbar:GetThumbTexture():SetVertexColor(unpack(AS.BorderColor))
				self.scrollbar:HookScript('OnUpdate', function()
					for i = 1, self.scrollbar:GetNumChildren() do
						local object = select(i, self.scrollbar:GetChildren())
						if object then object:Hide() end
					end
					local Backdrop = self.scrollbar.backdrop or self.scrollbar.Backdrop
					Backdrop:Show()
				end)
				self.scrollbar.isSkinned = true
			end
		end)
		for i = 1, frame:GetNumChildren() do
			local object = select(i, frame:GetChildren())
			if object:GetObjectType() == 'Button' then
				if object:GetText() ~= nil then
					AS:SkinButton(object, true)
				else
					AS:SkinCloseButton(object, true)
				end
			end
		end
	end
	AS:SkinEditBox(BagSync_SearchFrameEdit1)

	hooksecurefunc(BagSync, 'ShowMoneyTooltip', function()
		if not BagSyncMoneyTooltip.isSkinned then
			AS:SkinFrame(BagSyncMoneyTooltip)
			BagSyncMoneyTooltip.isSkinned = true
			for i = 1, BagSyncMoneyTooltip:GetNumChildren() do
				local object = select(i, BagSyncMoneyTooltip:GetChildren())
				if object:GetObjectType() == "Button" then AS:SkinCloseButton(object) end
			end
		end
	end)
end

AS:RegisterSkin(name, AS.SkinBagSync)