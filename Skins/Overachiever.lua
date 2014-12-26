local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Overachiever_Tabs') then return end

function AS:Overachiever(event, addon)
	if addon == "Overachiever_Tabs" or IsAddOnLoaded("Overachiever_Tabs") then
		for i = 4, 6 do
			AS:SkinTab(_G["AchievementFrameTab"..i])
		end

		local leftFrame = _G["Overachiever_LeftFrame"];
		for _, childFrame in pairs({leftFrame:GetChildren()}) do
			for _, component in pairs({childFrame:GetChildren()}) do
				local type = component:GetObjectType()
				if (type == "Button") then
					AS:SkinButton(component)
				elseif (type == "EditBox") then
					AS:SkinEditBox(component)
				elseif (type == "CheckButton") then
					AS:SkinCheckBox(component)
				elseif (type == "Frame" and strfind(component:GetName(), "Drop")) then
					AS:SkinDropDownBox(component)
				end
			end
		end

		local containers = {
			"Overachiever_SearchFrame",
			"Overachiever_SuggestionsFrame",
			"Overachiever_WatchFrame"
		}

		local function skinAchievementButtons(container)
			for i = 1, 7 do
				local button = _G[container:GetName().."Button"..i]
				local ButtonName = button:GetName()
				AS:StripTextures(button, true)
				_G[ButtonName.."Highlight"]:Kill()

				if not AS.PixelPerfect then
					button.bg1 = button:CreateTexture(nil, "BACKGROUND")
					button.bg1:SetDrawLayer("BACKGROUND", 4)
					button.bg1:SetTexture(AS.NormTex)
					button.bg1:SetVertexColor(unpack(AS.BackdropColor))
					button.bg1:Point("TOPLEFT", AS.Mult*4, -AS.Mult*4)
					button.bg1:Point("BOTTOMRIGHT", -AS.Mult*4, AS.Mult*4)

					button.bg2 = button:CreateTexture(nil, "BACKGROUND")
					button.bg2:SetDrawLayer("BACKGROUND", 3)
					button.bg2:SetTexture(0,0,0)
					button.bg2:Point("TOPLEFT", AS.Mult*3, -AS.Mult*3)
					button.bg2:Point("BOTTOMRIGHT", -AS.Mult*3, AS.Mult*3)

					button.bg3 = button:CreateTexture(nil, "BACKGROUND")
					button.bg3:SetDrawLayer("BACKGROUND", 2)
					button.bg3:SetTexture(unpack(AS.BackdropColor))
					button.bg3:Point("TOPLEFT", AS.Mult*2, -AS.Mult*2);
					button.bg3:Point("BOTTOMRIGHT", -AS.Mult*2, AS.Mult*2)

					button.bg4 = button:CreateTexture(nil, "BACKGROUND")
					button.bg4:SetDrawLayer("BACKGROUND", 1)
					button.bg4:SetTexture(0,0,0)
					button.bg4:Point("TOPLEFT", AS.Mult, -AS.Mult)
					button.bg4:Point("BOTTOMRIGHT", -AS.Mult, AS.Mult)
				else
					button.bg1 = button:CreateTexture(nil, "BACKGROUND")
					button.bg1:SetDrawLayer("BACKGROUND", 4)
					button.bg1:SetTexture(AS.NormTex)
					button.bg1:SetVertexColor(unpack(AS.BackdropColor))
					button.bg1:Point("TOPLEFT", AS.Mult, -AS.Mult)
					button.bg1:Point("BOTTOMRIGHT", -AS.Mult, AS.Mult)

					button.bg3 = button:CreateTexture(nil, "BACKGROUND")
					button.bg3:SetDrawLayer("BACKGROUND", 2)
					button.bg3:SetTexture(unpack(AS.BorderColor))
					button.bg3:SetOutside(AS.Mult)
				end

				_G[ButtonName.."Description"]:SetTextColor(0.6, 0.6, 0.6);
				hooksecurefunc(_G[ButtonName.."Description"], "SetTextColor", function(self, r, g, b)
					if r ~= 0.6 or g ~= 0.6 or b ~= 0.6 then
						self:SetTextColor(0.6, 0.6, 0.6)
					end
				end);

				_G[ButtonName.."HiddenDescription"]:SetTextColor(1, 1, 1)
				hooksecurefunc(_G[ButtonName.."HiddenDescription"], "SetTextColor", function(self, r, g, b)
					if r ~= 1 or g ~= 1 or b ~= 1 then
						self:SetTextColor(1, 1, 1)
					end
				end);

				_G[ButtonName.."IconBling"]:Kill()
				_G[ButtonName.."IconOverlay"]:Kill()
				AS:SetTemplate(_G[ButtonName.."Icon"], 'Default')
				_G[ButtonName.."Icon"]:Height(_G[ButtonName.."Icon"]:GetHeight() - 14)
				_G[ButtonName.."Icon"]:Width(_G[ButtonName.."Icon"]:GetWidth() - 14)
				_G[ButtonName.."Icon"]:ClearAllPoints()
				_G[ButtonName.."Icon"]:Point("LEFT", 6, 0)
				AS:SkinTexture(_G[ButtonName.."IconTexture"])
				_G[ButtonName.."IconTexture"]:SetInside()

				AS:StripTextures(_G[ButtonName.."Tracked"])
				AS:SetTemplate(_G[ButtonName.."Tracked"], 'Default')
				_G[ButtonName.."Tracked"]:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
				_G[ButtonName.."Tracked"]:Size(12, 12)
				_G[ButtonName.."Tracked"]:GetCheckedTexture():Point("TOPLEFT", -4, 4)
				_G[ButtonName.."Tracked"]:GetCheckedTexture():Point("BOTTOMRIGHT", 4, -4)

				_G[ButtonName.."Tracked"]:ClearAllPoints()
				_G[ButtonName.."Tracked"]:Point("BOTTOMLEFT", button, "BOTTOMLEFT", 5, 5)

				hooksecurefunc(_G[ButtonName.."Tracked"], "SetPoint", function(self, point, attachTo, anchorPoint, xOffset, yOffset)
					if point ~= "BOTTOMLEFT" or attachTo ~= button or anchorPoint ~= "BOTTOMLEFT" or xOffset ~= 5 or yOffset ~= 5 then
						self:ClearAllPoints()
						self:Point("BOTTOMLEFT", button, "BOTTOMLEFT", 5, 5)
					end
				end)

				button:HookScript("OnUpdate", function()
					if button.accountWide and button.bg3 then
						button.bg3:SetTexture(ACHIEVEMENTUI_BLUEBORDER_R, ACHIEVEMENTUI_BLUEBORDER_G, ACHIEVEMENTUI_BLUEBORDER_B)
					elseif button.bg3 then
						button.bg3:SetTexture(unpack(AS.BorderColor))
					end
				end)
			end
		end

		for _, name in pairs(containers) do
			local container = _G[name]
			local frameBorder, scrollFrame = container:GetChildren()
			local scrollBar = _G[scrollFrame:GetName().."ScrollBar"]
			AS:StripTextures(container)
			AS:StripTextures(frameBorder)
			AS:CreateBackdrop(scrollFrame, 'Default')
			scrollFrame.Backdrop:Point("TOPLEFT", 0, 2)
			scrollFrame.Backdrop:Point("BOTTOMRIGHT", -3, -3)
			AS:SkinScrollBar(scrollBar)
			skinAchievementButtons(scrollFrame)
		end

		AS:UnregisterSkinEvent('Overachiever', "ADDON_LOADED")
	end
end

AS:RegisterSkin('Overachiever', AS.Overachiever, "ADDON_LOADED")