local AS, L, S, R = unpack(AddOnSkins)

function R:BagSync()
	local Frames = {
		BagSync_SearchFrame,
		BagSync_TokensFrame,
		BagSync_CraftsFrame,
		BagSync_BlackListFrame,
		BagSync_ProfilesFrame,
	}

	for _, frame in pairs(Frames) do
		S:HandleFrame(frame)
		frame:HookScript('OnShow', function(self)
			if self.scrollbar and not self.scrollbar.isSkinned then
				S:CreateBackdrop(self.scrollbar)
				self.scrollbar:SetThumbTexture(AS.Blank)
				self.scrollbar:GetThumbTexture():SetVertexColor(unpack(AS.BorderColor))
				self.scrollbar:HookScript('OnUpdate', function()
					for i = 1, self.scrollbar:GetNumChildren() do
						local object = select(i, self.scrollbar:GetChildren())
						if object then object:Hide() end
					end
					self.scrollbar.backdrop:Show()
				end)
				self.scrollbar.isSkinned = true
			end
		end)
		for _, object in pairs({frame:GetChildren()}) do
			if object:IsObjectType('Button') then
				if object:GetText() ~= nil then
					S:HandleButton(object, true)
				else
					S:HandleCloseButton(object)
				end
			end
		end
	end
	-- S:HandleEditBox(BagSync_SearchFrameEdit1)
	-- S:Kill(BagSync_MinimapButton)

	-- hooksecurefunc(BagSync, 'ShowMoneyTooltip', function()
		-- if not BagSyncMoneyTooltip.isSkinned then
			-- S:HandleFrame(BagSyncMoneyTooltip)
			-- BagSyncMoneyTooltip.isSkinned = true
			-- for i = 1, BagSyncMoneyTooltip:GetNumChildren() do
				-- local object = select(i, BagSyncMoneyTooltip:GetChildren())
				-- if object:IsObjectType('Button') then S:HandleCloseButton(object) end
			-- end
		-- end
	-- end)
end

AS:RegisterSkin('BagSync')
