
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "TradeSkillDWSkin"
local function SkinTradeSkillDW(self)

TradeSkillFrame:StripTextures(True)
AS:SkinFrame(TradeSkillFrame)
TradeSkillListScrollFrame:StripTextures()
TradeSkillDetailScrollFrame:StripTextures()
TradeSkillFrameInset:StripTextures(True)
TradeSkillExpandButtonFrame:StripTextures()
TradeSkillDetailScrollChildFrame:StripTextures()
TradeSkillListScrollFrame:StripTextures(True)

AS:SkinFrame(TradeSkillGuildFrame)
AS:SkinFrame(TradeSkillGuildFrameContainer)

TradeSkillGuildFrame:Point("BOTTOMLEFT", TradeSkillFrame, "BOTTOMRIGHT", 3, 19)
AS:SkinCloseButton(TradeSkillGuildFrameCloseButton)
TradeSkillFrame:HookScript("OnShow", function() AS:SkinFrame(TradeSkillFrame) TradeSkillListScrollFrame:StripTextures() if not TradeSkillDWExpandButton then return end if not TradeSkillDWExpandButton.skinned then AS:SkinNextPrevButton(TradeSkillDWExpandButton) TradeSkillDWExpandButton.skinned = true end end)
TradeSkillFrame:Height(TradeSkillFrame:GetHeight() + 12)
AS:SkinStatusBar(TradeSkillRankFrame)

TradeSkillCreateButton:StripTextures(True)
TradeSkillCancelButton:StripTextures(True)
TradeSkillFilterButton:StripTextures(True)
TradeSkillCreateAllButton:StripTextures(True)
TradeSkillViewGuildCraftersButton:StripTextures(True)
AS:SkinButton(TradeSkillCreateButton)
AS:SkinButton(TradeSkillCancelButton)
AS:SkinButton(TradeSkillFilterButton)
AS:SkinButton(TradeSkillCreateAllButton)
AS:SkinButton(TradeSkillViewGuildCraftersButton)

TradeSkillLinkButton:GetNormalTexture():SetTexCoord(0.25, 0.7, 0.37, 0.75)
TradeSkillLinkButton:GetPushedTexture():SetTexCoord(0.25, 0.7, 0.45, 0.8)
TradeSkillLinkButton:GetHighlightTexture():Kill()
TradeSkillLinkButton:CreateBackdrop("Default")
TradeSkillLinkButton:Size(17, 14)
TradeSkillLinkButton:Point("LEFT", TradeSkillLinkFrame, "LEFT", 5, -1)
AS:SkinEditBox(TradeSkillFrameSearchBox)
AS:SkinEditBox(TradeSkillInputBox)
AS:SkinNextPrevButton(TradeSkillDecrementButton)
AS:SkinNextPrevButton(TradeSkillIncrementButton)
TradeSkillIncrementButton:Point("RIGHT", TradeSkillCreateButton, "LEFT", -13, 0)

AS:SkinCloseButton(TradeSkillFrameCloseButton)
AS:SkinScrollBar(TradeSkillDetailScrollFrameScrollBar)
AS:SkinScrollBar(TradeSkillListScrollFrameScrollBar)

local once = false
hooksecurefunc("TradeSkillFrame_SetSelection", function(id)
      TradeSkillSkillIcon:StyleButton()
      if TradeSkillSkillIcon:GetNormalTexture() then
         TradeSkillSkillIcon:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
         TradeSkillSkillIcon:GetNormalTexture():ClearAllPoints()
         TradeSkillSkillIcon:GetNormalTexture():Point("TOPLEFT", 2, -2)
         TradeSkillSkillIcon:GetNormalTexture():Point("BOTTOMRIGHT", -2, 2)
      end
      TradeSkillSkillIcon:SetTemplate("Default")
      
      for i=1, MAX_TRADE_SKILL_REAGENTS do
         local button = _G["TradeSkillReagent"..i]
         local icon = _G["TradeSkillReagent"..i.."IconTexture"]
         local count = _G["TradeSkillReagent"..i.."Count"]
         
         icon:SetTexCoord(.08, .92, .08, .92)
         icon:SetDrawLayer("OVERLAY")
         if not icon.backdrop then
            icon.backdrop = CreateFrame("Frame", nil, button)
            icon.backdrop:SetFrameLevel(button:GetFrameLevel() - 1)
            icon.backdrop:SetTemplate("Default")
            icon.backdrop:Point("TOPLEFT", icon, "TOPLEFT", -2, 2)
            icon.backdrop:Point("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 2, -2)
         end
         
         icon:SetParent(icon.backdrop)
         count:SetParent(icon.backdrop)
         count:SetDrawLayer("OVERLAY")
         
         if i > 2 and once == false then
            local point, anchoredto, point2, x, y = button:GetPoint()
            button:ClearAllPoints()
            button:Point(point, anchoredto, point2, x, y - 3)
            once = true
         end
         
         _G["TradeSkillReagent"..i.."NameFrame"]:Kill()
      end
end)

TradeSkillDW_QueueFrame:HookScript("OnShow", function() AS:SkinFrame(TradeSkillDW_QueueFrame) end)
AS:SkinCloseButton(TradeSkillDW_QueueFrameCloseButton)
TradeSkillDW_QueueFrameInset:StripTextures()
TradeSkillDW_QueueFrameClear:StripTextures()
TradeSkillDW_QueueFrameDown:StripTextures()
TradeSkillDW_QueueFrameUp:StripTextures()
TradeSkillDW_QueueFrameDo:StripTextures()
AS:SkinButton(TradeSkillDW_QueueFrameClear)
AS:SkinButton(TradeSkillDW_QueueFrameDown)
AS:SkinButton(TradeSkillDW_QueueFrameUp)
AS:SkinButton(TradeSkillDW_QueueFrameDo)
TradeSkillDW_QueueFrameDetailScrollFrame:StripTextures()
TradeSkillDW_QueueFrameDetailScrollFrameChildFrame:StripTextures()
TradeSkillDW_QueueFrameDetailScrollFrameChildFrameReagent1:StripTextures()
TradeSkillDW_QueueFrameDetailScrollFrameChildFrameReagent2:StripTextures()
TradeSkillDW_QueueFrameDetailScrollFrameChildFrameReagent3:StripTextures()
TradeSkillDW_QueueFrameDetailScrollFrameChildFrameReagent4:StripTextures()
TradeSkillDW_QueueFrameDetailScrollFrameChildFrameReagent5:StripTextures()
TradeSkillDW_QueueFrameDetailScrollFrameChildFrameReagent6:StripTextures()
TradeSkillDW_QueueFrameDetailScrollFrameChildFrameReagent7:StripTextures()
TradeSkillDW_QueueFrameDetailScrollFrameChildFrameReagent8:StripTextures()
AS:SkinScrollBar(TradeSkillDW_QueueFrameDetailScrollFrameScrollBar)
end

AS:RegisterSkin(name,SkinTradeSkillDW)