local AS = unpack(AddOnSkins)

if not AS:CheckAddOn("Talented") then return end

function AS:Talented(_, addon)
    if addon ~= "Blizzard_TalentUI" then return end

    local function TalentedSkin()
        local Talented = _G['Talented']
        local pve, pvp = Talented.PvETab, Talented.PvPTab
        local pveTexture, pvpTexture = Talented.PvETexture, Talented.PvPTexture

        AS:SkinFrame(pve)
        AS:StyleButton(pve)
        pve:SetNormalTexture(pveTexture)
        AS:SetInside(pve:GetNormalTexture())
        AS:SkinTexture(pve:GetNormalTexture())
        local point, relatedTo, point2, x, y = pve:GetPoint()
        pve:SetPoint(point, relatedTo, point2, 1, y)

        AS:SkinFrame(pvp)
        AS:StyleButton(pvp)
        pvp:SetNormalTexture(pvpTexture)
        AS:SetInside(pvp:GetNormalTexture())
        AS:SkinTexture(pvp:GetNormalTexture())
        point, relatedTo, point2, x, y = pvp:GetPoint()
        pvp:SetPoint(point, relatedTo, point2, 1, y)
    end

    AS:Delay(0.02, TalentedSkin)
end

AS:RegisterSkin('Talented', AS.Talented, "ADDON_LOADED")
