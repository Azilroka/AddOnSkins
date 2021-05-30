local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Overachiever') then return end

function AS:Overachiever(event, addon)
	if addon == "Overachiever_Tabs" or IsAddOnLoaded("Overachiever_Tabs") then
		for i = 4, 6 do
			AS:SkinTab(_G["AchievementFrameTab"..i])
		end

		local leftFrame = _G["Overachiever_LeftFrame"]
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

		for _, name in pairs(containers) do
			local container = _G[name]
			local frameBorder, scrollFrame = container:GetChildren()
			local scrollBar = _G[scrollFrame:GetName().."ScrollBar"]
			AS:StripTextures(container)
			AS:StripTextures(frameBorder)
			AS:SkinBackdropFrame(scrollFrame)
			scrollFrame.Backdrop:SetPoint("TOPLEFT", 0, 2)
			scrollFrame.Backdrop:SetPoint("BOTTOMRIGHT", -3, -3)
			AS:SkinScrollBar(scrollBar)
		end

		AS:UnregisterSkinEvent('Overachiever', "ADDON_LOADED")
	end
end

AS:RegisterSkin('Overachiever', AS.Overachiever, "ADDON_LOADED")