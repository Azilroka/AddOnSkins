if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("Wholly") then return end

local U = unpack(select(2,...))

local name = "WhollySkin"

local function SkinWhollyFrame()
   U.SkinFrame(com_mithrandir_whollyFrame)
   U.SkinCloseButton(com_mithrandir_whollyFrameCloseButton)
   U.SkinScrollBar(com_mithrandir_whollyFrameScrollBar)
   local buttons = {
      "SwitchZoneButton",
      "PreferencesButton",
      "SortButton"
   }
   for button,_ in pairs(buttons) do
      U.SkinButton(_G["com_mithrandir_whollyFrame"..button])
   end
end

local function SkinWholly(self)
   com_mithrandir_whollyFrame:HookScript("OnShow",function(self) SkinWhollyFrame() end)
end

U.RegisterSkin(name,SkinWholly)