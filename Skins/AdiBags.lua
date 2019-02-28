local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('AdiBags') then return end

function AS:AdiBags(event)
	local AdiBags = LibStub('AceAddon-3.0'):GetAddon('AdiBags')

	AdiBags:HookBagFrameCreation(AdiBags, function(bag)
		local frame = bag:GetFrame()
		AS:SkinFrame(frame)
		AS:SkinCloseButton(frame.CloseButton)
		for i = 1, 5 do
			local widget = frame.HeaderRightRegion.widgets[i] and frame.HeaderRightRegion.widgets[i].widget
			if widget then
				if widget:IsObjectType('Button') then
					AS:SkinButton(widget, true)
				elseif widget:IsObjectType('EditBox') then
					AS:SkinEditBox(widget)
				end
			end
		end
		AS:SkinTexture(frame.BagSlotButton:GetNormalTexture())
	end)

	AS:RawHook(AdiBags, "CreateBagSlotPanel", function(this, ...)
		local bPanel = AS.hooks[this].CreateBagSlotPanel(this, ...)
			AS:SetTemplate(bPanel)
			for _, v in pairs(bPanel.buttons) do
				AS:SetTemplate(v)
			end
			return bPanel
		end,
	true)

	AdiBags:RegisterMessage("AdiBags_UpdateButton", function(event, btn)
		AS:SkinIconButton(btn)
		if btn.IconQuestTexture:GetBlendMode() == "ADD" then
			btn:SetBackdropBorderColor(btn.IconQuestTexture:GetVertexColor())
			btn.IconQuestTexture:Hide()
		else
			btn.IconQuestTexture:Show()
		end
	end)
end

AS:RegisterSkin('AdiBags', AS.AdiBags)