
<!-- saved from url=(0050)http://www.sdinicolantonio.com/distro/MrTrader.lua -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;">local AS = ElvUI[1]:GetModule('AddOnSkins')
local E = ElvUI[1]

if not AS:CheckAddOn('MrTrader') then return end


---
-- Selection border color
-- (Taken from ACHIEVEMENTUI_BLUEBORDER_*)
local SELECTION_BORDER_COLOR = {
	0.129,
	0.671,
	0.875
};


---
-- Skins a given skill button.
-- @param button (Frame) The button to skin
local function skinSkillButton(button)
	button:StripTextures(true)

	--Initiate fucked up method of creating a backdrop
	if not E.PixelMode then
		button.bg1 = button:CreateTexture(nil, "BACKGROUND")
		button.bg1:SetDrawLayer("BACKGROUND", 4)
		button.bg1:SetTexture(E["media"].normTex) --Default TukUI users this is normTex, normTex doesn't exist
		button.bg1:SetVertexColor(unpack(E['media'].backdropcolor))
		button.bg1:Point("TOPLEFT", E.mult*4, -E.mult*4)
		button.bg1:Point("BOTTOMRIGHT", -E.mult*4, E.mult*4)

		button.bg2 = button:CreateTexture(nil, "BACKGROUND")
		button.bg2:SetDrawLayer("BACKGROUND", 3)
		button.bg2:SetTexture(0,0,0)
		button.bg2:Point("TOPLEFT", E.mult*3, -E.mult*3)
		button.bg2:Point("BOTTOMRIGHT", -E.mult*3, E.mult*3)

		button.bg3 = button:CreateTexture(nil, "BACKGROUND")
		button.bg3:SetDrawLayer("BACKGROUND", 2)
		button.bg3:SetTexture(unpack(E['media'].bordercolor))
		button.bg3:Point("TOPLEFT", E.mult*2, -E.mult*2)
		button.bg3:Point("BOTTOMRIGHT", -E.mult*2, E.mult*2)

		button.bg4 = button:CreateTexture(nil, "BACKGROUND")
		button.bg4:SetDrawLayer("BACKGROUND", 1)
		button.bg4:SetTexture(0,0,0)
		button.bg4:Point("TOPLEFT", E.mult, -E.mult)
		button.bg4:Point("BOTTOMRIGHT", -E.mult, E.mult)
	else
		button.bg1 = button:CreateTexture(nil, "BACKGROUND")
		button.bg1:SetDrawLayer("BACKGROUND", 4)
		button.bg1:SetTexture(E["media"].normTex) --Default TukUI users this is normTex, normTex doesn't exist
		button.bg1:SetVertexColor(unpack(E['media'].backdropcolor))
		button.bg1:Point("TOPLEFT", E.mult, -E.mult)
		button.bg1:Point("BOTTOMRIGHT", -E.mult, E.mult)

		button.bg3 = button:CreateTexture(nil, "BACKGROUND")
		button.bg3:SetDrawLayer("BACKGROUND", 2)
		button.bg3:SetTexture(unpack(E['media'].bordercolor))
		button.bg3:SetOutside(E.mult)
	end
end


local name = "MrTraderSkin"
function AS:SkinMrTrader()

	-- Get handles to MrTrader frames
	local window = _G["MRTSkillWindow"];
	local frame = _G["MRTSkillFrame"];
	local inset = _G["MRTSkillFrameInset"];

	local listButtonsContainer = _G["MRTSkillButtons"];
	local listScrollFrame = _G["MRTSkillListScrollFrame"];
	local listScrollChildFrame = _G["MRTSkillListScrollFrameScrollChildFrame"];
	local listScrollBar = _G["MRTSkillListScrollFrameScrollBar"];

	local filterButtonsContainer = _G["MRTSkillFilterButtons"];
	local filterScrollFrame = _G["MRTSkillFilterScrollFrame"];
	local filterScrollChildFrame = _G["MRTSkillFilterScrollFrameScrollChildFrame"];
	local filterScrollBar = _G["MRTSkillFilterScrollFrameScrollBar"];
	local rankFrame = _G["MRTSkillRankFrame"];



	-- Skin main frame
	frame:StripTextures(true);
	frame:SetTemplate("Transparent");
	inset:StripTextures();


	-- Skin list frames
	listButtonsContainer:StripTextures();
	listScrollFrame:StripTextures();
	listScrollChildFrame:StripTextures();
	AS:SkinScrollBar(listScrollBar);


	-- Skin filter frames
	filterButtonsContainer:StripTextures();
	filterButtonsContainer:CreateBackdrop("Default");
	filterButtonsContainer.backdrop:Point("TOPLEFT", 0, 2);
	filterButtonsContainer.backdrop:Point("BOTTOMRIGHT", -3, -3);
	filterButtonsContainer:SetWidth(160);
	filterButtonsContainer:SetHeight(filterButtonsContainer:GetHeight() - 2);
	filterScrollFrame:StripTextures();
	filterScrollChildFrame:StripTextures();
	AS:SkinScrollBar(filterScrollBar);


	-- Skin filter buttons
	-- We need to reskin every time MrTrader redraws them
	hooksecurefunc(window, "DrawFilters", function()
		for i=1, 22 do
			-- Get handles to components
			local button = _G["MRTSkillFilterButton"..i];
			local lastButton = _G["MRTSkillFilterButton"..i-1];
			local checkbox = _G["MRTSkillFilterButton"..i.."Checkbox"];

			-- Skin the button
			button:StripTextures();
			button.hover = nil;
			button.pushed = nil;
			button.checked = nil;
			button:StyleButton();
			button.hover:SetInside(nil, 5, 0);

			-- Fix button width when scroll bar visible
			if (filterScrollBar:IsVisible()) then
				button:SetWidth(139);
			end

			-- Skin checkbox
			if (checkbox) then
				AS:SkinCheckBox(checkbox);
			end

			-- Add '+' to "New Favorite group" button
			if (not button:IsVisible() and lastButton) then
				lastButton:SetText("+ New Favorite Group");
			end
		end
	end);


	-- Skin rank frame
	rankFrame:StripTextures()
	rankFrame:CreateBackdrop("Default")
	rankFrame:SetStatusBarTexture(E["media"].normTex)
	rankFrame:SetHeight(13);
	rankFrame:SetWidth(158);
	local point = {rankFrame:GetPoint()};
	point[5] = point[5] - 2;
	point[4] = point[4] + 1;
	rankFrame:ClearAllPoints();
	rankFrame:SetPoint(unpack(point));


	-- Skin skill buttons
	_G["MRTSkillHighlightFrame"]:Kill();
	for i=1, 10 do
		_G["MRTSkillButton"..i.."Border"]:Kill();
		skinSkillButton(_G["MRTSkillButton"..i]);
	end


	-- Hook MrTrader's SelectSkill() function to apply heighlight as needed
	hooksecurefunc(window, "SelectSkill", function(window, selectedButton, skillID)
		for i=1, 10 do
			local button = _G["MRTSkillButton"..i];
			if (button == selectedButton) then
				button.bg1:SetVertexColor(1, 1, 1, 0.5)
			else
				local r, g, b = unpack(E['media'].backdropcolor);
				button.bg1:SetVertexColor(r, g, b, 1)
			end
		end
	end);


	-- Skin expand/collapse button
	-- This button is adjusted and retextured by MrTraderevery time its clicked.
	-- We'll need to hook that function to reskin it every time
	hooksecurefunc(window, "AdjustWindow", function()
		local expandButton = _G["MRTSkillFrameFilterExpandButton"]
		local width, height = expandButton:GetSize();

		-- Clrea icon so ElvUI will remake it
		expandButton.icon = nil;

		-- If the tradeskill window isn't expanded temporarily change the
		-- button's name, so ElvUI applies the proper texture
		local originalName = expandButton:GetName();

		-- Skin the button
		AS:SkinNextPrevButton(expandButton);

		-- Set the appropriate direction based on the state of the skill window
		if (_G["MRTSkillWindow"].isExpanded) then
			SquareButton_SetIcon(expandButton, 'LEFT');
		else
			SquareButton_SetIcon(expandButton, 'RIGHT');
		end

		-- Reposition next to the sort dropdown
		expandButton:ClearAllPoints();
		expandButton:SetPoint("RIGHT", "MRTSkillFrameSortDropDown", "LEFT", 10, 4);
		expandButton:SetSize(22, 22);
	end)


	-- Skin other components
	AS:SkinDropDownBox(_G["MRTSkillFrameSortDropDown"]);
	AS:SkinEditBox(_G["MRTSkillFrameSearchBox"]);
	AS:SkinButton(_G["MRTSkillCreateButton"], true);
	AS:SkinButton(_G["MRTSkillCreateAllButton"], true);
	AS:SkinNextPrevButton(_G["MRTSkillDecrementButton"]);
	AS:SkinNextPrevButton(_G["MRTSkillIncrementButton"]);
	local buttonHeight = _G["MRTSkillCreateButton"]:GetHeight();
	_G["MRTSkillDecrementButton"]:SetSize(buttonHeight, buttonHeight);
	_G["MRTSkillIncrementButton"]:SetSize(buttonHeight, buttonHeight);
	AS:SkinEditBox(_G["MRTSkillInputBox"]);
	AS:SkinCloseButton(_G["MRTSkillFrameCloseButton"])


	-- Skin the new category frame
	local newCategoryFrame = _G["MRTNewCategoryFrame"];
	newCategoryFrame:StripTextures(true);
	newCategoryFrame:SetTemplate("Transparent");
	AS:SkinCloseButton(_G["MRTNewCategoryFrameDetailCloseButton"]);
	AS:SkinEditBox(_G["MRTNewCategoryFrameCategoryName"]);
	AS:SkinButton(_G["MRTNewCategoryFrameOkayButton"]);
	AS:SkinButton(_G["MRTNewCategoryFrameCancelButton"]);
end

AS:RegisterSkin(name, AS.SkinMrTrader)</pre></body></html>