local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('TomeOfTeleportation') then return end

local name = "TomeOfTeleportationSkin"
function AS:SkinTomeOfTeleportation()
	local function SkinFrame()
		AS:SkinFrame(TeleporterFrame)
		for i = 0, 15 do
			if _G['TeleporterFrameTeleporterB'..i] then
				AS:SkinButton(_G['TeleporterFrameTeleporterB'..i])
			end
		end
		AS:SkinButton(TeleporterCloseButton)
		for i = 1, TeleporterFrame:GetNumChildren() do
			local Region = select(i, TeleporterFrame:GetChildren())
			if Region and Region:GetObjectType() == 'Frame' and not Region.IsSkinned then
				AS:SkinFrame(Region)
				Region:SetSize(TeleporterFrame:GetWidth(), 18)
				Region:ClearAllPoints()
				Region:SetPoint('CENTER', TeleporterFrame, 'TOP', 0, -2)
				Region:SetFrameLevel(TeleporterFrame:GetFrameLevel() + 1)
				Region.IsSkinned = true
			end
		end
	end
	hooksecurefunc(_G, "TeleporterOpenFrame", SkinFrame)

	TeleporterTooltip:HookScript('OnShow', function(self) self:SetTemplate('Transparent') end)
end

AS:RegisterSkin(name, AS.SkinTomeOfTeleportation)