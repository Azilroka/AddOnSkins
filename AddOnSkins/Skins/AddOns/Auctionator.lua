local AS, L, S, R = unpack(AddOnSkins)
local E = unpack(ElvUI)

-- Credits: Simpy
local _G = _G
local next = next
local hooksecurefunc = hooksecurefunc

local whiteTex = (E and E.Media and E.Media.Textures and E.Media.Textures.White8x8) or "Interface/Buttons/WHITE8X8.BLP"

-- Helper function to safely hook into mixin methods
local function tryPostHook(frameName, methodName, hookFunc)
    if frameName and methodName and _G[frameName] and _G[frameName][methodName] then
        hooksecurefunc(_G[frameName], methodName, function(frame, ...)
            if not frame.__AS_Skinned then
                hookFunc(frame, ...)
                frame.__AS_Skinned = true
            end
        end)
    else
        -- Silently fail instead of erroring
        return false
    end
    return true
end

-- Handle list icons
local function HandleListIcon(frame)
    if not frame.tableBuilder then
        return
    end

    for i = 1, 22 do
        local row = frame.tableBuilder.rows[i]
        if row then
            for j = 1, 5 do
                local cell = row.cells and row.cells[j]
                if cell and cell.Icon then
                    if not cell.__AS_Skinned then
                        S:HandleIcon(cell.Icon)

                        if cell.IconBorder then
                            cell.IconBorder:Kill()
                        end

                        cell.__AS_Skinned = true
                    end
                end
            end
        end
    end
end

-- Handle headers
local function HandleHeaders(frame)
    if not frame.HeaderContainer then
        return
    end

    local maxHeaders = frame.HeaderContainer:GetNumChildren()
    for i, header in next, { frame.HeaderContainer:GetChildren() } do
        if not header.__AS_Skinned then
            header:DisableDrawLayer("BACKGROUND")

            if not header.backdrop then
                S:CreateBackdrop(header)
            end

            header.__AS_Skinned = true
        end

        if header.backdrop then
            header.backdrop:SetPoint("BOTTOMRIGHT", i < maxHeaders and -5 or 0, -2)
        end
    end

    HandleListIcon(frame)
end

-- Handle tabs
local function HandleTab(tab)
    if not tab.__AS_Skinned then
        S:HandleTab(tab)
        tab.__AS_Skinned = true
    end
end

-- Buy icon name
local function buyIconName(frame)
    if not frame.__AS_Skinned then
        S:HandleIcon(frame.Icon, true)
        if frame.Icon and frame.Icon.GetNumPoints and frame.Icon:GetNumPoints() > 0 then
            local pointsCache = {}
            for i = 1, frame.Icon:GetNumPoints() do
                local point, relativeTo, relativePoint, xOfs, yOfs = frame.Icon:GetPoint(i)
                if relativePoint == "TOPLEFT" then
                    xOfs = xOfs + 2
                    yOfs = yOfs - 2
                elseif relativePoint == "BOTTOMRIGHT" then
                    xOfs = xOfs - 2
                    yOfs = yOfs + 2
                end
                pointsCache[i] = { point, relativeTo, relativePoint, xOfs, yOfs }
            end
            frame.Icon:ClearAllPoints()
            for i = 1, #pointsCache do
                local pointData = pointsCache[i]
                frame.Icon:SetPoint(pointData[1], pointData[2], pointData[3], pointData[4], pointData[5])
            end
        end

        if frame.GetHighlightTexture then
            frame:GetHighlightTexture():SetTexture(whiteTex)
            frame:GetHighlightTexture():SetVertexColor(1, 1, 1, 0.3)
        end
        if frame.IconSelectedHighlight then
            frame.IconSelectedHighlight:SetTexture(whiteTex)
            frame.IconSelectedHighlight:SetVertexColor(1, 1, 1, 0.4)
        end
        if frame.GetPushedTexture then
            frame:GetPushedTexture():SetTexture(whiteTex)
            frame:GetPushedTexture():SetVertexColor(1, 1, 0, 0.3)
        end
        if frame.QualityBorder then
            S:HandleIconBorder(frame.QualityBorder, frame.Icon.backdrop)
        end
        frame.__AS_Skinned = true
    end
end

-- View group
local function viewGroup(frame)
    if not frame.__AS_Skinned then
        if frame.GroupTitle then
            frame.GroupTitle:StripTextures()
            S:HandleButton(frame.GroupTitle, true)
        end
        frame.__AS_Skinned = true
    end
end

-- View item
local function viewItem(frame)
    if frame.initializationTime == nil then
        frame.initializationTime = GetTime()
    end
    if not frame.__AS_Skinned then
        if frame.Icon then
            S:HandleIcon(frame.Icon, true)
            if frame.IconBorder then
                S:HandleIconBorder(frame.IconBorder, frame.Icon.backdrop)
            end

            -- Anchor/texture fix
            if frame.Icon.GetNumPoints and frame.Icon:GetNumPoints() > 0 then
                local pointsCache = {}
                for i = 1, frame.Icon:GetNumPoints() do
                    local point, relativeTo, relativePoint, xOfs, yOfs = frame.Icon:GetPoint(i)
                    if relativePoint == "TOPLEFT" then
                        xOfs = xOfs + 2
                        yOfs = yOfs - 2
                    elseif relativePoint == "BOTTOMRIGHT" then
                        xOfs = xOfs - 2
                        yOfs = yOfs + 2
                    end
                    pointsCache[i] = { point, relativeTo, relativePoint, xOfs, yOfs }
                end
                frame.Icon:ClearAllPoints()
                for i = 1, #pointsCache do
                    local pointData = pointsCache[i]
                    frame.Icon:SetPoint(pointData[1], pointData[2], pointData[3], pointData[4], pointData[5])
                end
            end
        end

        if frame.EmptySlot then
            frame.EmptySlot:SetTexture(nil)
            frame.EmptySlot:Hide()
        end
        if frame.GetHighlightTexture then
            frame:GetHighlightTexture():SetTexture(whiteTex)
            frame:GetHighlightTexture():SetVertexColor(1, 1, 1, 0.3)
        end
        if frame.IconSelectedHighlight then
            frame.IconSelectedHighlight:SetTexture(whiteTex)
            frame.IconSelectedHighlight:SetVertexColor(1, 1, 1, 0.4)
        end
        if frame.GetPushedTexture then
            frame:GetPushedTexture():SetTexture(whiteTex)
            frame:GetPushedTexture():SetVertexColor(1, 1, 0, 0.3)
        end
        frame.__AS_Skinned = true
    end
end

-- Config radio button group
local function configRadioButtonGroup(frame)
    if not frame.__AS_Skinned then
        if frame.radioButtons then
            for _, child in pairs(frame.radioButtons) do
                if child.RadioButton then
                    S:HandleRadioButton(child.RadioButton)
                end
            end
        end
        frame.__AS_Skinned = true
    end
end

-- Config checkbox
local function configCheckbox(frame)
    if not frame.__AS_Skinned then
        if frame.CheckBox then
            S:HandleCheckBox(frame.CheckBox)
        end
        frame.__AS_Skinned = true
    end
end

-- Drop down internal
local function dropDownInternal(frame)
    if not frame.__AS_Skinned then
        if frame.DropDown then
            S:HandleButton(frame.DropDown, true)
            -- Handle dropdown arrow texture if it exists
            if frame.DropDown.Arrow then
                -- Set to a custom atlas or recolor for AddOnSkins style
                if frame.DropDown.Arrow.SetAtlas then
                    frame.DropDown.Arrow:SetAtlas("common-dropdown-arrow")
                end
                frame.DropDown.Arrow:SetVertexColor(1, 1, 1, 1)
            end
            -- Handle label if it exists
            if frame.Label then
                frame.Label:SetTextColor(1, 1, 1)
            end
        end
        -- Handle close button if it exists
        if frame.Close then
            S:HandleCloseButton(frame.Close)
        elseif frame.CloseButton then
            S:HandleCloseButton(frame.CloseButton)
        elseif frame.CloseDialog then
            S:HandleCloseButton(frame.CloseDialog)
        end
        frame.__AS_Skinned = true
    end
end

-- Filter key selector dropdown
local function filterKeySelectorDropdown(frame)
    if not frame.__AS_Skinned then
        if frame.DropDown then
            S:HandleButton(frame.DropDown, true)
            if frame.DropDown.Arrow then
                if frame.DropDown.Arrow.SetAtlas then
                    frame.DropDown.Arrow:SetAtlas("common-dropdown-arrow")
                end
                frame.DropDown.Arrow:SetVertexColor(1, 1, 1, 1)
            end
        end
        if frame.ResetButton then
            S:HandleButton(frame.ResetButton)
        end
        if frame.Close then
            S:HandleCloseButton(frame.Close)
        elseif frame.CloseButton then
            S:HandleCloseButton(frame.CloseButton)
        elseif frame.CloseDialog then
            S:HandleCloseButton(frame.CloseDialog)
        end
        frame.__AS_Skinned = true
    end
end

-- Key binding config
local function keyBindingConfig(frame)
    if not frame.__AS_Skinned then
        if frame.Button then
            S:HandleButton(frame.Button)
        end
        frame.__AS_Skinned = true
    end
end

-- Bag use
local function bagUse(frame)
    if not frame.__AS_Skinned then
        if frame.View then
            S:CreateBackdrop(frame.View)
            S:HandleTrimScrollBar(frame.View.ScrollBar)
        end

        for _, child in pairs({ frame:GetChildren() }) do
            if child ~= frame.View and child:IsObjectType("Button") then
                S:HandleButton(child)
            end
        end
        frame.__AS_Skinned = true
    end
end

-- Config numeric input
local function configNumericInput(frame)
    if not frame.__AS_Skinned then
        if frame.InputBox then
            S:HandleEditBox(frame.InputBox)
            frame.InputBox:SetTextInsets(0, 0, 0, 0)
        end
        frame.__AS_Skinned = true
    end
end

-- Config money input
local function configMoneyInput(frame)
    if not frame.__AS_Skinned then
        if frame.MoneyInput then
            if frame.MoneyInput.CopperBox then
                S:HandleEditBox(frame.MoneyInput.CopperBox)
                frame.MoneyInput.CopperBox:SetTextInsets(3, 0, 0, 0)
                frame.MoneyInput.CopperBox:SetHeight(24)
            end
            if frame.MoneyInput.GoldBox then
                S:HandleEditBox(frame.MoneyInput.GoldBox)
                frame.MoneyInput.GoldBox:SetTextInsets(3, 0, 0, 0)
                frame.MoneyInput.GoldBox:SetHeight(24)
            end
            if frame.MoneyInput.SilverBox then
                S:HandleEditBox(frame.MoneyInput.SilverBox)
                frame.MoneyInput.SilverBox:SetTextInsets(3, 0, 0, 0)
                frame.MoneyInput.SilverBox:SetHeight(24)
            end
        end
        frame.__AS_Skinned = true
    end
end

-- Config min max
local function configMinMax(frame)
    if not frame.__AS_Skinned then
        if frame.MinBox then
            S:HandleEditBox(frame.MinBox)
        end
        if frame.MaxBox then
            S:HandleEditBox(frame.MaxBox)
        end
        frame.__AS_Skinned = true
    end
end

-- Undercut scan
local function undercutScan(frame)
    if not frame.__AS_Skinned then
        for _, child in pairs({ frame:GetChildren() }) do
            if child:GetObjectType() == "Button" then
                S:HandleButton(child)
            end
        end
        frame.__AS_Skinned = true
    end
end

-- Sale item
local function saleItem(frame)
    if not frame.__AS_Skinned then
        if frame.Icon then
            frame.Icon:StripTextures()
            if frame.Icon.Icon then
                S:HandleIcon(frame.Icon.Icon, true)
                -- Anchor/texture fix for frame.Icon.Icon
                local icon = frame.Icon.Icon
                if icon.GetNumPoints and icon:GetNumPoints() > 0 then
                    local pointsCache = {}
                    for i = 1, icon:GetNumPoints() do
                        local point, relativeTo, relativePoint, xOfs, yOfs = icon:GetPoint(i)
                        if relativePoint == "TOPLEFT" then
                            xOfs = xOfs + 2
                            yOfs = yOfs - 2
                        elseif relativePoint == "BOTTOMRIGHT" then
                            xOfs = xOfs - 2
                            yOfs = yOfs + 2
                        end
                        pointsCache[i] = { point, relativeTo, relativePoint, xOfs, yOfs }
                    end
                    icon:ClearAllPoints()
                    for i = 1, #pointsCache do
                        local pointData = pointsCache[i]
                        icon:SetPoint(pointData[1], pointData[2], pointData[3], pointData[4], pointData[5])
                    end
                end

                if frame.GetHighlightTexture then
                    frame:GetHighlightTexture():SetTexture(whiteTex)
                    frame:GetHighlightTexture():SetVertexColor(1, 1, 1, 0.3)
                end
                if frame.IconSelectedHighlight then
                    frame.IconSelectedHighlight:SetTexture(whiteTex)
                    frame.IconSelectedHighlight:SetVertexColor(1, 1, 1, 0.4)
                end
                if frame.GetPushedTexture then
                    frame:GetPushedTexture():SetTexture(whiteTex)
                    frame:GetPushedTexture():SetVertexColor(1, 1, 0, 0.3)
                end
            end
            if frame.Icon.IconBorder then
                S:HandleIconBorder(frame.Icon.IconBorder, frame.Icon.Icon.backdrop)
            end
        end

        if frame.MaxButton then
            S:HandleButton(frame.MaxButton)
            frame.MaxButton:ClearAllPoints()
            frame.MaxButton:SetPoint("TOPLEFT", frame.Quantity, "TOPRIGHT", 0, 0)
        end
        if frame.PostButton then
            S:HandleButton(frame.PostButton)
        end
        if frame.SkipButton then
            S:HandleButton(frame.SkipButton)
        end

        for _, child in pairs({ frame:GetChildren() }) do
            if child:IsObjectType("Button") and child.Icon then
                S:HandleButton(child)
            end
        end
        frame.__AS_Skinned = true
    end
end

-- Bottom tab buttons
local function bottomTabButtons(frame)
    if not frame.__AS_Skinned then
        if
            _G.Auctionator
            and _G.Auctionator.Tabs
            and _G.Auctionator.Tabs.State
            and _G.Auctionator.Tabs.State.knownTabs
        then
            for _, details in ipairs(_G.Auctionator.Tabs.State.knownTabs) do
                local tabButtonFrameName = "AuctionatorTabs_" .. details.name
                local tabButton = _G[tabButtonFrameName]

                if tabButton and not tabButton.__AS_Skinned then
                    S:HandleTab(tabButton)
                    tabButton.__AS_Skinned = true
                end
            end
        end
        frame.__AS_Skinned = true
    end
end

-- Selling tab prices container
local function sellingTabPricesContainer(frame)
    if not frame.__AS_Skinned then
        if frame.CurrentPricesTab then
            HandleTab(frame.CurrentPricesTab)
        end
        if frame.PriceHistoryTab then
            HandleTab(frame.PriceHistoryTab)
        end
        if frame.YourHistoryTab then
            HandleTab(frame.YourHistoryTab)
        end
        frame.__AS_Skinned = true
    end
end

-- Results listing
local function resultsListing(frame)
    if not frame.__AS_Skinned then
        if frame.ScrollArea then
            S:SetTemplate(frame.ScrollArea)
            S:HandleScrollBar(frame.ScrollArea.ScrollBar)
        end

        HandleHeaders(frame)
        hooksecurefunc(frame, "UpdateTable", HandleHeaders)
        frame.__AS_Skinned = true
    end
end

-- Shopping tab frame
local function shoppingTabFrame(frame)
    if not frame.__AS_Skinned then
        if frame.NewListButton then
            S:HandleButton(frame.NewListButton)
        end
        if frame.ImportButton then
            S:HandleButton(frame.ImportButton)
        end
        if frame.ExportButton then
            S:HandleButton(frame.ExportButton)
        end
        if frame.ExportCSV then
            S:HandleButton(frame.ExportCSV)
        end

        if frame.ShoppingResultsInset then
            frame.ShoppingResultsInset:StripTextures()
        end
        frame.__AS_Skinned = true
    end
end

-- Shopping tab search options
local function shoppingTabSearchOptions(frame)
    if not frame.__AS_Skinned then
        if frame.SearchString then
            S:HandleEditBox(frame.SearchString)
        end
        if frame.ResetSearchStringButton then
            S:HandleButton(frame.ResetSearchStringButton)
        end
        if frame.SearchButton then
            S:HandleButton(frame.SearchButton)
        end
        if frame.MoreButton then
            S:HandleButton(frame.MoreButton)
        end
        if frame.AddToListButton then
            S:HandleButton(frame.AddToListButton)
        end
        frame.__AS_Skinned = true
    end
end

-- Shopping tab container
local function shoppingTabContainer(frame)
    if not frame.__AS_Skinned then
        if frame.Inset then
            frame.Inset:StripTextures()
            S:SetTemplate(frame.Inset)
        end
        if frame.ScrollBar then
            S:HandleScrollBar(frame.ScrollBar)
        end
        frame.__AS_Skinned = true
    end
end

-- Shopping tab container tabs
local function shoppingTabContainerTabs(frame)
    if not frame.__AS_Skinned then
        if frame.ListsTab then
            HandleTab(frame.ListsTab)
        end
        if frame.RecentsTab then
            HandleTab(frame.RecentsTab)
        end
        frame.__AS_Skinned = true
    end
end

-- Selling tab
local function sellingTab(frame)
    if not frame.__AS_Skinned then
        if frame.BagInset then
            frame.BagInset:StripTextures()
        end
        if frame.HistoricalPriceInset then
            frame.HistoricalPriceInset:StripTextures()
        end
        -- Skin all direct child buttons
        for _, child in pairs({ frame:GetChildren() }) do
            if child:IsObjectType("Button") then
                S:HandleButton(child)
            end
            -- Handle up/down increment buttons if present
            if child.IncrementButton then
                S:HandleNextPrevButton(child.IncrementButton, "up")
            end
            if child.DecrementButton then
                S:HandleNextPrevButton(child.DecrementButton, "down")
            end
        end
        -- Explicitly handle known buttons if present
        if frame.PostButton then
            S:HandleButton(frame.PostButton)
        end
        if frame.HistoryButton then
            S:HandleButton(frame.HistoryButton)
        end
        if frame.RefreshButton then
            S:HandleButton(frame.RefreshButton)
        end
        if frame.BuyButton then
            S:HandleButton(frame.BuyButton)
        end
        if frame.CancelAuctionButton then
            S:HandleButton(frame.CancelAuctionButton)
        end
        if frame.MaxButton then
            S:HandleButton(frame.MaxButton)
        end
        frame.__AS_Skinned = true
    end
end

-- Cancelling frame
local function cancellingFrame(frame)
    if not frame.__AS_Skinned then
        if frame.SearchFilter then
            S:HandleEditBox(frame.SearchFilter)
        end

        for _, child in pairs({ frame:GetChildren() }) do
            if child:IsObjectType("Button") and child.Icon then
                S:HandleButton(child)
            end
        end

        if frame.HistoricalPriceInset then
            frame.HistoricalPriceInset:StripTextures()
            S:SetTemplate(frame.HistoricalPriceInset)
        end
        frame.__AS_Skinned = true
    end
end

-- Config tab
local function configTab(frame)
    if not frame.__AS_Skinned then
        if frame.Bg then
            frame.Bg:SetTexture(nil)
        end
        if frame.NineSlice then
            S:SetTemplate(frame.NineSlice)
        end

        if frame.OptionsButton then
            S:HandleButton(frame.OptionsButton)
        end
        if frame.ScanButton then
            S:HandleButton(frame.ScanButton)
        end

        if frame.ContributeLink and frame.ContributeLink.InputBox then
            S:HandleEditBox(frame.ContributeLink.InputBox)
        end
        if frame.DiscordLink and frame.DiscordLink.InputBox then
            S:HandleEditBox(frame.DiscordLink.InputBox)
        end
        if frame.BugReportLink and frame.BugReportLink.InputBox then
            S:HandleEditBox(frame.BugReportLink.InputBox)
        end
        frame.__AS_Skinned = true
    end
end

-- Shopping item
local function shoppingItem(frame)
    if not frame.__AS_Skinned then
        frame:StripTextures()
        S:SetTemplate(frame)

        if frame.SearchContainer and frame.SearchContainer.SearchString then
            S:HandleEditBox(frame.SearchContainer.SearchString)
        end
        if frame.SearchContainer and frame.SearchContainer.IsExact then
            S:HandleCheckBox(frame.SearchContainer.IsExact)
        end

        if frame.Finished then
            S:HandleButton(frame.Finished)
        end
        if frame.Cancel then
            S:HandleButton(frame.Cancel)
        end
        if frame.ResetAllButton then
            S:HandleButton(frame.ResetAllButton)
        end
        frame.__AS_Skinned = true
    end
end

-- Export text frame
local function exportTextFrame(frame)
    if not frame.__AS_Skinned then
        frame:StripTextures()
        S:SetTemplate(frame)

        if frame.Close then
            S:HandleButton(frame.Close)
        end
        if frame.ScrollBar then
            S:HandleScrollBar(frame.ScrollBar)
        end
        frame.__AS_Skinned = true
    end
end

-- List export frame
local function listExportFrame(frame)
    if not frame.__AS_Skinned then
        frame:StripTextures()
        S:SetTemplate(frame)

        if frame.SelectAll then
            S:HandleButton(frame.SelectAll)
        end
        if frame.UnselectAll then
            S:HandleButton(frame.UnselectAll)
        end
        if frame.Export then
            S:HandleButton(frame.Export)
        end
        if frame.CloseDialog then
            S:HandleCloseButton(frame.CloseDialog)
        end
        if frame.ScrollBar then
            S:HandleScrollBar(frame.ScrollBar)
        end
        frame.__AS_Skinned = true
    end
end

-- List import frame
local function listImportFrame(frame)
    if not frame.__AS_Skinned then
        frame:StripTextures()
        S:SetTemplate(frame)

        if frame.Import then
            S:HandleButton(frame.Import)
        end
        if frame.CloseDialog then
            S:HandleCloseButton(frame.CloseDialog)
        end
        if frame.ScrollBar then
            S:HandleScrollBar(frame.ScrollBar)
        end
        frame.__AS_Skinned = true
    end
end

-- Splash frame
local function splashFrame(frame)
    if not frame.__AS_Skinned then
        frame:StripTextures()
        S:SetTemplate(frame)

        if frame.Close then
            S:HandleCloseButton(frame.Close)
        end
        if frame.HideCheckbox and frame.HideCheckbox.CheckBox then
            S:HandleCheckBox(frame.HideCheckbox.CheckBox)
        end
        if frame.ScrollBar then
            S:HandleScrollBar(frame.ScrollBar)
        end
        frame.__AS_Skinned = true
    end
end

-- Item history frame
local function itemHistoryFrame(frame)
    if not frame.__AS_Skinned then
        frame:StripTextures()
        S:SetTemplate(frame)

        if frame.Close then
            S:HandleButton(frame.Close)
        end
        if frame.Dock then
            S:HandleButton(frame.Dock)
        end
        frame.__AS_Skinned = true
    end
end

-- Config selling frame
local function configSellingFrame(frame)
    if not frame.__AS_Skinned then
        if frame.UnhideAll then
            S:HandleButton(frame.UnhideAll)
        end
        frame.__AS_Skinned = true
    end
end

-- Crafting info objective tracker frame
local function craftingInfoObjectiveTrackerFrame(frame)
    if not frame.__AS_Skinned then
        if frame.SearchButton then
            S:HandleButton(frame.SearchButton)
        end
        frame.__AS_Skinned = true
    end
end

-- Crafting info professions frame
local function craftingInfoProfessionsFrame(frame)
    if not frame.__AS_Skinned then
        if frame.SearchButton then
            S:HandleButton(frame.SearchButton)
        end
        frame.__AS_Skinned = true
    end
end

-- Buy commodity
local function buyCommodity(frame)
    if not frame.__AS_Skinned then
        if frame.BackButton then
            S:HandleButton(frame.BackButton)
        end
        frame:StripTextures()

        local container = frame.DetailsContainer
        if container then
            if container.BuyButton then
                S:HandleButton(container.BuyButton)
            end
            if container.Quantity then
                S:HandleEditBox(container.Quantity)
                container.Quantity:SetTextInsets(0, 0, 0, 0)
            end
        end

        for _, child in pairs({ frame:GetChildren() }) do
            if child:IsObjectType("Button") and child.iconAtlas and child.iconAtlas == "UI-RefreshButton" then
                S:HandleButton(child)
                break
            end
        end
        frame.__AS_Skinned = true
    end
end

function R:Auctionator()
    -- Hook into mixin methods for widgets
    tryPostHook("AuctionatorBuyIconNameTemplateMixin", "SetItem", buyIconName)
    tryPostHook("AuctionatorGroupsViewGroupMixin", "SetName", viewGroup)
    tryPostHook("AuctionatorGroupsViewItemMixin", "SetItemInfo", viewItem)
    tryPostHook("AuctionatorConfigCheckboxMixin", "OnLoad", configCheckbox)
    tryPostHook("AuctionatorConfigHorizontalRadioButtonGroupMixin", "SetupRadioButtons", configRadioButtonGroup)
    tryPostHook("AuctionatorConfigMinMaxMixin", "OnLoad", configMinMax)
    tryPostHook("AuctionatorConfigMoneyInputMixin", "OnLoad", configMoneyInput)
    tryPostHook("AuctionatorConfigNumericInputMixin", "OnLoad", configNumericInput)
    tryPostHook("AuctionatorConfigRadioButtonGroupMixin", "SetupRadioButtons", configRadioButtonGroup)
    tryPostHook("AuctionatorKeyBindingConfigMixin", "OnLoad", keyBindingConfig)
    tryPostHook("AuctionatorResultsListingMixin", "OnShow", resultsListing)
    tryPostHook("AuctionatorSaleItemMixin", "OnLoad", saleItem)
    tryPostHook("AuctionatorShoppingTabFrameMixin", "OnLoad", shoppingTabFrame)
    tryPostHook("AuctionatorShoppingTabSearchOptionsMixin", "OnLoad", shoppingTabSearchOptions)
    tryPostHook("AuctionatorShoppingTabListsContainerMixin", "OnLoad", shoppingTabContainer)
    tryPostHook("AuctionatorShoppingTabRecentsContainerMixin", "OnLoad", shoppingTabContainer)
    tryPostHook("AuctionatorShoppingTabContainerTabsMixin", "OnLoad", shoppingTabContainerTabs)
    tryPostHook("AuctionatorBagUseMixin", "OnLoad", bagUse)
    tryPostHook("AuctionatorSellingTabPricesContainerMixin", "OnLoad", sellingTabPricesContainer)
    tryPostHook("AuctionatorTabContainerMixin", "OnLoad", bottomTabButtons)
    tryPostHook("AuctionatorUndercutScanMixin", "OnLoad", undercutScan)

    -- Hook into mixin methods for tab frames
    tryPostHook("AuctionatorCancellingFrameMixin", "OnLoad", cancellingFrame)
    tryPostHook("AuctionatorConfigTabMixin", "OnLoad", configTab)
    tryPostHook("AuctionatorSellingTabMixin", "OnLoad", sellingTab)

    -- Hook into mixin methods for frames
    tryPostHook("AuctionatorConfigSellingFrameMixin", "OnLoad", configSellingFrame)
    tryPostHook("AuctionatorExportTextFrameMixin", "OnLoad", exportTextFrame)
    tryPostHook("AuctionatorListExportFrameMixin", "OnLoad", listExportFrame)
    tryPostHook("AuctionatorListImportFrameMixin", "OnLoad", listImportFrame)
    tryPostHook("AuctionatorItemHistoryFrameMixin", "Init", itemHistoryFrame)
    tryPostHook("AuctionatorCraftingInfoObjectiveTrackerFrameMixin", "OnLoad", craftingInfoObjectiveTrackerFrame)
    tryPostHook("AuctionatorCraftingInfoProfessionsFrameMixin", "OnLoad", craftingInfoProfessionsFrame)
    tryPostHook("AuctionatorShoppingItemMixin", "OnLoad", shoppingItem)
    tryPostHook("AuctionatorSplashScreenMixin", "OnLoad", splashFrame)
    tryPostHook("AuctionatorBuyCommodityFrameTemplateMixin", "OnLoad", buyCommodity)
    tryPostHook("AuctionatorDropDownMixin", "OnLoad", dropDownInternal)
    tryPostHook("AuctionatorFilterKeySelectorMixin", "OnLoad", filterKeySelectorDropdown)
end

local isEra = AS.Classic or AS.TBC or AS.Wrath
if isEra then
    AS:RegisterSkin("Auctionator", nil, "PLAYER_ENTERING_WORLD", "ADDON_LOADED")
else
    AS:RegisterSkin("Auctionator", nil, "AUCTION_HOUSE_SHOW", "PLAYER_ENTERING_WORLD")
end
