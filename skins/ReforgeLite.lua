local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "ReforgeLiteSkin"
function AS:SkinReforgeLite()
	ReforgeLite:StripTextures()

	local function Reforge_OnShow(self, event, ...)
		if self.isSkinned then return end
		self.isSkinned = true
		--skin main frame
		AS:SkinFrame(ReforgeLite, "Transparent", true)
		--skin button
		S:HandleButton(ReforgeLiteSavePresetButton)
		S:HandleButton(ReforgeLiteDeletePresetButton, true)
		S:HandleButton(ReforgeLiteImportButton)
		S:HandleButton(ReforgeLitePrioAddButton)
		S:HandleButton(ReforgeLiteConfirmButton)
		S:HandleButton(ReforgeLiteSaveMethodPresetButton)
		S:HandleButton(ReforgeLiteDeleteMethodPresetButton)
		S:HandleButton(ReforgeLiteImportMethodButton)
		S:HandleButton(ReforgeLiteMethodShowButton)
		S:HandleButton(ReforgeLiteMethodResetButton)
		S:HandleButton(ReforgeLiteDebugButton)
		
		--skin scrollbar
		S:HandleScrollBar(ReforgeLiteScrollBar)
		
		local Frame = ReforgeLite
		Frame.title:SetTextColor(23/255, 132/255, 209/255)
		Frame.title:SetPoint("RIGHT", Frame)
		S:HandleCloseButton(Frame.close, true)

		--skin reforge frame
		ReforgeLiteMethodShowButton:HookScript("OnClick", function()
			local Frame2 = ReforgeLite.methodWindow
			AS:SkinFrame(Frame2, "Transparent", true)
			
			Frame2.title:SetTextColor(23/255, 132/255, 209/255)
			Frame2.title:SetPoint("RIGHT", Frame2)
			S:HandleCloseButton(Frame2.close)
			S:HandleButton(ReforgeLiteReforgeButton)
		end)
		
		--skin debug frame
		ReforgeLiteDebugButton:HookScript("OnClick", function()
			--skin debug
			AS:SkinFrame(ReforgeLiteErrorFrame, "Transparent", true)
			S:HandleScrollBar(ReforgeLiteErrorFrameScrollScrollBar)
			S:HandleButton(ReforgeLiteErrorFrameOk)
		end)
		
	end
	ReforgeLite:HookScript("OnShow", Reforge_OnShow)
end

AS:RegisterSkin(name, AS.SkinReforgeLite)