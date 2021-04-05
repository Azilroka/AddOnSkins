local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('OrderHallCommander') then return end

function AS:OrderHallCommander(event, addon)
	if (event == "ADDON_LOADED" and addon == 'OrderHallCommander') or event == 'PLAYER_ENTERING_WORLD' and IsAddOnLoaded('OrderHallCommander') then
		local OHC = LibStub('LibInit'):GetAddon('OrderHallCommander')
		local OHCCache = OHC:GetCacheModule()
		local TroopFrame = OHCCache:GetTroopsFrame()
		AS:SkinFrame(TroopFrame)
		TroopFrame:ClearAllPoints()
		TroopFrame:SetPoint("BOTTOM", OrderHallMissionFrame, "TOP", 0, 0)
		TroopFrame:SetWidth(OrderHallMissionFrame:GetWidth()+2)

		OrderHallMissionFrameMissions:HookScript('OnShow', function(self)
			AS:Delay(0.5, function()
				local frame = LibInitCheckbox00001 and LibInitCheckbox00001:GetParent():GetParent() or nil
				if not frame then return end
				if frame.IsSkinned then return end

				frame.IsSkinned = true

				AS:StripTextures(frame)
				AS:SetTemplate(frame)
				AS:SkinCloseButton(frame.Close)

				for j = 1, 99 do
					local i = j
					if (j < 10) then i = "0"..j end
					if _G["LibInitCheckbox0000"..i] ~= nil then
						AS:SkinCheckBox(_G["LibInitCheckbox0000"..i])
					elseif _G["LibInitSlider000"..i] ~= nil then
						AS:SkinSlideBar(_G["LibInitSlider000"..i])
					elseif _G["LibInitCheckbox000"..i] ~= nil then
						AS:SkinCheckBox(_G["LibInitCheckbox000"..i])
					elseif _G["LibInitDropdown000"..i] ~= nil then
						AS:SkinDropDownBox(_G["LibInitDropdown000"..i])
					elseif _G["LibInitCheckbox000"..i] ~= nil then
						AS:SkinCheckBox(_G["LibInitCheckbox000"..i])
					elseif _G["LibInitButton000"..i] ~= nil then
						AS:SkinButton(_G["LibInitButton000"..i])
					end
				end

				frame = {self.CompleteDialog.BorderFrame.ViewButton:GetChildren()}
				AS:SkinButton(frame[1])
			end)
		end)
		AS:UnregisterSkinEvent('OrderHallCommander', event)
	elseif OHCGUIContainer1 and event == "GARRISON_MISSION_COMPLETE_RESPONSE" then
		if OHCGUIContainer1.IsSkinned then return end
		AS:UnregisterSkinEvent('OrderHallCommander', event)

		AS:Delay(0.3, function()
			AS:SkinFrame(OHCGUIContainer1)
			AS:SkinCloseButton(OHCGUIContainer1.Close)
		end)
	end
end

AS:RegisterSkin('OrderHallCommander', AS.OrderHallCommander, 'ADDON_LOADED', 'GARRISON_MISSION_COMPLETE_RESPONSE')
