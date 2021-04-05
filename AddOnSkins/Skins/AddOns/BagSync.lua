local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BagSync') then return end

function AS:BagSync()
	local Frames = {
		BagSync_SearchFrame,
		BagSync_TokensFrame,
		BagSync_CraftsFrame,
		BagSync_BlackListFrame,
		BagSync_ProfilesFrame,
	}

	for _, frame in pairs(Frames) do
		AS:SkinFrame(frame)
		frame:HookScript('OnShow', function(self)
			if self.scrollbar and not self.scrollbar.isSkinned then
				AS:CreateBackdrop(self.scrollbar)
				self.scrollbar:SetThumbTexture(AS.Blank)
				self.scrollbar:GetThumbTexture():SetVertexColor(unpack(AS.BorderColor))
				self.scrollbar:HookScript('OnUpdate', function()
					for i = 1, self.scrollbar:GetNumChildren() do
						local object = select(i, self.scrollbar:GetChildren())
						if object then object:Hide() end
					end
					self.scrollbar.Backdrop:Show()
				end)
				self.scrollbar.isSkinned = true
			end
		end)
		for i = 1, frame:GetNumChildren() do
			local object = select(i, frame:GetChildren())
			if object:IsObjectType('Button') then
				if object:GetText() ~= nil then
					AS:SkinButton(object, true)
				else
					AS:SkinCloseButton(object)
				end
			end
		end
	end
	-- AS:SkinEditBox(BagSync_SearchFrameEdit1)
	-- AS:Kill(BagSync_MinimapButton)

	-- hooksecurefunc(BagSync, 'ShowMoneyTooltip', function()
		-- if not BagSyncMoneyTooltip.isSkinned then
			-- AS:SkinFrame(BagSyncMoneyTooltip)
			-- BagSyncMoneyTooltip.isSkinned = true
			-- for i = 1, BagSyncMoneyTooltip:GetNumChildren() do
				-- local object = select(i, BagSyncMoneyTooltip:GetChildren())
				-- if object:IsObjectType('Button') then AS:SkinCloseButton(object) end
			-- end
		-- end
	-- end)
end

AS:RegisterSkin('BagSync', AS.BagSync)
