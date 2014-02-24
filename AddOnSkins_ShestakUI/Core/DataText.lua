if not Tukui then return end
local AS = unpack(select(2, ...))
local L = AS.Locale
if tonumber(GetAddOnMetadata('Tukui', 'Version')) < 16 then return end

local DataText = AS["DataTexts"]

local OnClick = function(self, button)
	if EmbedSystem_MainWindow:IsShown() then
		EmbedSystem_MainWindow:Hide()
	else
		EmbedSystem_MainWindow:Show()
	end
end

local OnEnter = function(self)
	local Panel, Anchor, xOff, yOff = self:GetTooltipAnchor()
	GameTooltip:SetOwner(Panel, Anchor, xOff, yOff)
	GameTooltip:ClearLines()
	GameTooltip:AddLine('Left Click to Show')
	GameTooltip:AddLine('Right Click to Hide')
	GameTooltip:Show()
end

local Enable = function(self)
	if (not self.Text) then
		local Text = self:CreateFontString(nil, 'OVERLAY')
		Text:SetFont(DataText.Font, DataText.Size, DataText.Flags)
		Text:SetText(format('%s %s', L.DataText.Toggle, L.DataText.Embed))
		self.Text = Text
	end

	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:SetScript('OnMouseDown', OnClick)
	self:SetScript('OnEnter', OnEnter)
	self:SetScript('OnLeave', GameTooltip_Hide)
end

local Disable = function(self)
	self.Text:SetText('')
	self:SetScript('OnEvent', nil)
	self:UnregisterAllEvents()
end

DataText:Register('EmbedSystem', Enable, Disable, Update)