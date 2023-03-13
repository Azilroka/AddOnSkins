local AS, L, S, R = unpack(AddOnSkins)

function R:Talented(_, addon)
    if addon ~= "Blizzard_TalentUI" then return end

    local function TalentedSkin()
        local Talented = _G['Talented']
        local pve, pvp = Talented.PvETab, Talented.PvPTab
        local pveTexture, pvpTexture = Talented.PvETexture, Talented.PvPTexture

        S:HandleFrame(pve)
        S:StyleButton(pve)
        pve:SetNormalTexture(pveTexture)
        S:SetInside(pve:GetNormalTexture())
        S:HandleIcon(pve:GetNormalTexture())
        local point, relatedTo, point2, x, y = pve:GetPoint()
        pve:SetPoint(point, relatedTo, point2, 1, y)

        S:HandleFrame(pvp)
        S:StyleButton(pvp)
        pvp:SetNormalTexture(pvpTexture)
        S:SetInside(pvp:GetNormalTexture())
        S:HandleIcon(pvp:GetNormalTexture())
        point, relatedTo, point2, x, y = pvp:GetPoint()
        pvp:SetPoint(point, relatedTo, point2, 1, y)
    end

    AS:Delay(0.02, TalentedSkin)
end

AS:RegisterSkin('Talented', nil, "ADDON_LOADED")
