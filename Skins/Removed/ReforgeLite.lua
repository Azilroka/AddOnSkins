local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ReforgeLite') then return end

local name = 'ReforgeLiteSkin'
function AS:SkinReforgeLite()
	ReforgeLite:StripTextures()

	local function Reforge_OnShow(self, event, ...)
		if self.isSkinned then return end
		self.isSkinned = true
		--skin main frame
		AS:SkinFrame(ReforgeLite, 'Transparent', true)
		--skin button
		AS:SkinButton(ReforgeLiteSavePresetButton)
		AS:SkinButton(ReforgeLiteDeletePresetButton, true)
		AS:SkinButton(ReforgeLiteImportButton)
		AS:SkinButton(ReforgeLitePrioAddButton)
		AS:SkinButton(ReforgeLiteConfirmButton)
		AS:SkinButton(ReforgeLiteSaveMethodPresetButton)
		AS:SkinButton(ReforgeLiteDeleteMethodPresetButton)
		AS:SkinButton(ReforgeLiteImportMethodButton)
		AS:SkinButton(ReforgeLiteMethodShowButton)
		AS:SkinButton(ReforgeLiteMethodResetButton)
		AS:SkinButton(ReforgeLiteDebugButton)
		
		--skin scrollbar
		AS:SkinScrollBar(ReforgeLiteScrollBar)
		
		local Frame = ReforgeLite
		Frame.title:SetTextColor(23/255, 132/255, 209/255)
		Frame.title:SetPoint('RIGHT', Frame)
		AS:SkinCloseButton(Frame.close, true)

		--skin reforge frame
		ReforgeLiteMethodShowButton:HookScript('OnClick', function()
			local Frame2 = ReforgeLite.methodWindow
			AS:SkinFrame(Frame2, 'Transparent', true)
			
			Frame2.title:SetTextColor(23/255, 132/255, 209/255)
			Frame2.title:SetPoint('RIGHT', Frame2)
			AS:SkinCloseButton(Frame2.close)
			AS:SkinButton(ReforgeLiteReforgeButton)
		end)
		
		--skin debug frame
		ReforgeLiteDebugButton:HookScript('OnClick', function()
			--skin debug
			AS:SkinFrame(ReforgeLiteErrorFrame, 'Transparent', true)
			AS:SkinScrollBar(ReforgeLiteErrorFrameScrollScrollBar)
			AS:SkinButton(ReforgeLiteErrorFrameOk)
		end)
		
	end
	ReforgeLite:HookScript('OnShow', Reforge_OnShow)
end

AS:RegisterSkin(name, AS.SkinReforgeLite)