local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Overachiever_Tabs') then return end

local name = 'OverachieverSkin'
function AS:SkinOverachiever(event, addon)
	if addon ~= "Overachiever_Tabs" then return end

	for i = 4, 6 do
		local tab = _G["AchievementFrameTab"..i]
		AS:SkinTab(tab);
		tab:SetFrameLevel(tab:GetFrameLevel() + 2);
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
			button:StripTextures(true)
			_G[button:GetName().."Highlight"]:Kill()

			if not ElvUI[1].PixelMode then
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

			_G[button:GetName().."Description"]:SetTextColor(0.6, 0.6, 0.6);
			hooksecurefunc(_G[button:GetName().."Description"], "SetTextColor", function(self, r, g, b)
				if r ~= 0.6 or g ~= 0.6 or b ~= 0.6 then
					self:SetTextColor(0.6, 0.6, 0.6)
				end
			end);

			_G[button:GetName().."HiddenDescription"]:SetTextColor(1, 1, 1)
			hooksecurefunc(_G[button:GetName().."HiddenDescription"], "SetTextColor", function(self, r, g, b)
				if r ~= 1 or g ~= 1 or b ~= 1 then
					self:SetTextColor(1, 1, 1)
				end
			end);

			_G[button:GetName().."IconBling"]:Kill()
			_G[button:GetName().."IconOverlay"]:Kill()
			_G[button:GetName().."Icon"]:SetTemplate('Default')
			_G[button:GetName().."Icon"]:Height(_G[button:GetName().."Icon"]:GetHeight() - 14)
			_G[button:GetName().."Icon"]:Width(_G[button:GetName().."Icon"]:GetWidth() - 14)
			_G[button:GetName().."Icon"]:ClearAllPoints()
			_G[button:GetName().."Icon"]:Point("LEFT", 6, 0)
			_G[button:GetName().."IconTexture"]:SetTexCoord(unpack(AS.TexCoords))
			_G[button:GetName().."IconTexture"]:SetInside()

			_G[button:GetName().."Tracked"]:StripTextures()
			_G[button:GetName().."Tracked"]:SetTemplate("Default")
			_G[button:GetName().."Tracked"]:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
			_G[button:GetName().."Tracked"]:Size(12, 12)
			_G[button:GetName().."Tracked"]:GetCheckedTexture():Point("TOPLEFT", -4, 4)
			_G[button:GetName().."Tracked"]:GetCheckedTexture():Point("BOTTOMRIGHT", 4, -4)

			_G[button:GetName().."Tracked"]:ClearAllPoints()
			_G[button:GetName().."Tracked"]:Point("BOTTOMLEFT", button, "BOTTOMLEFT", 5, 5)

			hooksecurefunc(_G[button:GetName().."Tracked"], "SetPoint", function(self, point, attachTo, anchorPoint, xOffset, yOffset)
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
		container:StripTextures()
		frameBorder:StripTextures()
		scrollFrame:CreateBackdrop("Default")
		local backdrop = scrollFrame.backdrop or scrollFrame.Backdrop
		backdrop:Point("TOPLEFT", 0, 2)
		backdrop:Point("BOTTOMRIGHT", -3, -3)
		AS:SkinScrollBar(scrollBar)
		skinAchievementButtons(scrollFrame)
	end

	AS:UnregisterSkinEvent(name, event)
end

AS:RegisterSkin(name, AS.SkinOverachiever, "ADDON_LOADED")