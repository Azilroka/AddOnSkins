
local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')

local name = "WhollySkin"

local function SkinWhollyFrame()
   AS:SkinFrame(com_mithrandir_whollyFrame)
   AS:SkinCloseButton(com_mithrandir_whollyFrameCloseButton)
   AS:SkinScrollBar(com_mithrandir_whollyFrameScrollFrameScrollBar)
   AS:SkinDropDownBox(com_mithrandir_whollyFrameZoneButton)
   com_mithrandir_whollyFrameZoneButton:ClearAllPoints()
   com_mithrandir_whollyFrameZoneButton:Point("TOP",com_mithrandir_whollyFrame,"TOP",60,-40)
   local buttons = {
      "SwitchZoneButton",
      "PreferencesButton",
      "SortButton"
   }
   for _,button in pairs(buttons) do
      AS:SkinButton(_G["com_mithrandir_whollyFrame"..button])
   end
end

local function SkinWholly(self)
   com_mithrandir_whollyFrame:HookScript("OnShow",function(self) SkinWhollyFrame() end)
end

AS:RegisterSkin(name,SkinWholly)