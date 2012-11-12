if not IsAddOnLoaded("Wholly") then return end
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "WhollySkin"

local function SkinWhollyFrame()
   AS:SkinFrame(com_mithrandir_whollyFrame)
   AS:SkinCloseButton(com_mithrandir_whollyFrameCloseButton)
   AS:SkinScrollBar(com_mithrandir_whollyFrameScrollBar)
   local buttons = {
      "SwitchZoneButton",
      "PreferencesButton",
      "SortButton"
   }
   for button,_ in pairs(buttons) do
      AS:SkinButton(_G["com_mithrandir_whollyFrame"..button])
   end
end

local function SkinWholly(self)
   com_mithrandir_whollyFrame:HookScript("OnShow",function(self) SkinWhollyFrame() end)
end

AS:RegisterSkin(name,SkinWholly)