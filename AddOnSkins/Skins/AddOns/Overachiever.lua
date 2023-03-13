local AS, L, S, R = unpack(AddOnSkins)

function R:Overachiever(_, addon)
	if addon == "Overachiever_Tabs" or IsAddOnLoaded("Overachiever_Tabs") then
		for i = 4, 6 do
			S:HandleTab(_G["AchievementFrameTab"..i])
		end

		local leftFrame = _G["Overachiever_LeftFrame"]
		for _, childFrame in pairs({leftFrame:GetChildren()}) do
			for _, component in pairs({childFrame:GetChildren()}) do
				local type = component:GetObjectType()
				if (type == "Button") then
					S:HandleButton(component)
				elseif (type == "EditBox") then
					S:HandleEditBox(component)
				elseif (type == "CheckButton") then
					S:HandleCheckBox(component)
				elseif (type == "Frame" and strfind(component:GetName(), "Drop")) then
					S:HandleDropDownBox(component)
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
			S:StripTextures(container)
			S:StripTextures(frameBorder)
			S:HandleFrame(scrollFrame, true, nil, 0, 2, -3, -3)
			S:HandleScrollBar(scrollBar)
		end

		AS:UnregisterSkinEvent('Overachiever', "ADDON_LOADED")
	end
end

AS:RegisterSkin('Overachiever', nil, "ADDON_LOADED")
